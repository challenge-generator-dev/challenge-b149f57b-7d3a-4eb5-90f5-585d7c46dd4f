#!/bin/bash

set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
readonly TERRAFORM_DIR="$PROJECT_ROOT/terraform"
readonly ENVIRONMENTS_DIR="$PROJECT_ROOT/environments"

readonly COLOR_RED='\033[0;31m'
readonly COLOR_GREEN='\033[0;32m'
readonly COLOR_YELLOW='\033[1;33m'
readonly COLOR_BLUE='\033[0;34m'
readonly COLOR_NC='\033[0m'

log_info() {
    echo -e "${COLOR_BLUE}[INFO]${COLOR_NC} $1"
}

log_success() {
    echo -e "${COLOR_GREEN}[OK]${COLOR_NC} $1"
}

log_warning() {
    echo -e "${COLOR_YELLOW}[WARN]${COLOR_NC} $1"
}

log_error() {
    echo -e "${COLOR_RED}[ERROR]${COLOR_NC} $1"
}

check_terraform_installed() {
    log_info "Verificando instalación de Terraform..."
    
    if ! command -v terraform &> /dev/null; then
        log_error "Terraform no está instalado"
        return 1
    fi
    
    local tf_version
    tf_version=$(terraform version -json 2>/dev/null | grep -o '"version": "[^"]*"' | cut -d'"' -f4)
    
    if [[ -z "$tf_version" ]]; then
        log_warning "No se pudo determinar la versión de Terraform"
        return 0
    fi
    
    log_success "Terraform instalado: $tf_version"
    return 0
}

check_terraform_files() {
    log_info "Verificando archivos de configuración de Terraform..."
    
    local required_files=(
        "$TERRAFORM_DIR/providers.tf"
        "$TERRAFORM_DIR/variables.tf"
        "$TERRAFORM_DIR/main.tf"
        "$TERRAFORM_DIR/outputs.tf"
    )
    
    local missing_files=0
    
    for file in "${required_files[@]}"; do
        if [[ ! -f "$file" ]]; then
            log_error "Archivo requerido no encontrado: $file"
            ((missing_files++))
        else
            log_success "Archivo encontrado: $file"
        fi
    done
    
    if [[ $missing_files -gt 0 ]]; then
        log_error "Faltan $missing_files archivos requeridos"
        return 1
    fi
    
    return 0
}

check_terraform_modules() {
    log_info "Verificando módulos de Terraform..."
    
    local modules=(
        "$TERRAFORM_DIR/modules/network"
        "$TERRAFORM_DIR/modules/compute"
    )
    
    for module in "${modules[@]}"; do
        if [[ ! -d "$module" ]]; then
            log_error "Módulo no encontrado: $module"
            return 1
        fi
        
        if [[ ! -f "$module/main.tf" ]]; then
            log_error "main.tf no encontrado en módulo: $module"
            return 1
        fi
        
        log_success "Módulo verificado: $module"
    done
    
    return 0
}

check_environments() {
    log_info "Verificando configuración de ambientes..."
    
    if [[ ! -d "$ENVIRONMENTS_DIR" ]]; then
        log_error "Directorio de ambientes no encontrado: $ENVIRONMENTS_DIR"
        return 1
    fi
    
    local envs=("dev" "prod")
    
    for env in "${envs[@]}"; do
        local env_dir="$ENVIRONMENTS_DIR/$env"
        
        if [[ ! -d "$env_dir" ]]; then
            log_warning "Ambiente no configurado: $env"
            continue
        fi
        
        local tfvars="$env_dir/terraform.tfvars"
        
        if [[ ! -f "$tfvars" ]]; then
            log_warning "terraform.tfvars no encontrado para: $env"
            continue
        fi
        
        log_success "Ambiente configurado: $env ($tfvars)"
    done
    
    return 0
}

validate_terraform_syntax() {
    local environment="${1:-dev}"
    log_info "Validando sintaxis de Terraform para ambiente: $environment..."
    
    local env_dir="$ENVIRONMENTS_DIR/$environment"
    
    if [[ ! -d "$env_dir" ]]; then
        log_error "Directorio de ambiente no encontrado: $env_dir"
        return 1
    fi
    
    cd "$TERRAFORM_DIR"
    
    if ! terraform init -backend=false &>/dev/null; then
        log_error "Falló terraform init"
        return 1
    fi
    
    if ! terraform validate &>/dev/null; then
        log_error "Falló terraform validate"
        return 1
    fi
    
    log_success "Sintaxis de Terraform válida"
    return 0
}

check_aws_credentials() {
    log_info "Verificando credenciales de AWS..."
    
    if ! command -v aws &> /dev/null; then
        log_warning "AWS CLI no está instalado"
        return 0
    fi
    
    if ! aws sts get-caller-identity &>/dev/null; then
        log_error "Credenciales de AWS no configuradas o inválidas"
        return 1
    fi
    
    local account_id
    account_id=$(aws sts get-caller-identity --query 'Account' --output text 2>/dev/null)
    local identity_arn
    identity_arn=$(aws sts get-caller-identity --query 'Arn' --output text 2>/dev/null)
    
    log_success "Credenciales AWS configuradas - Cuenta: $account_id"
    log_info "Identidad: $identity_arn"
    
    return 0
}

check_infrastructure_state() {
    local environment="${1:-dev}"
    log_info "Consultando estado de la infraestructura para: $environment..."
    
    cd "$TERRAFORM_DIR"
    
    if [[ ! -f ".terraform/terraform.tfstate" ]]; then
        log_warning "Estado de Terraform no encontrado (primera ejecución esperada)"
        return 0
    fi
    
    local resources_count
    resources_count=$(terraform state list 2>/dev/null | wc -l)
    
    if [[ $resources_count -gt 0 ]]; then
        log_success "Recursos desplegados: $resources_count"
        
        terraform state list 2>/dev/null | while read -r resource; do
            log_info "  - $resource"
        done
    else
        log_warning "No hay recursos en el estado"
    fi
    
    return 0
}

generate_health_report() {
    local environment="${1:-dev}"
    log_info "Generando reporte de salud de infraestructura..."
    
    local report_file="$PROJECT_ROOT/healthcheck_$environment_$(date +%Y%m%d_%H%M%S).report"
    
    {
        echo "=== REPORTE DE SALUD DE INFRAESTRUCTURA ==="
        echo "Fecha: $(date)"
        echo "Ambiente: $environment"
        echo ""
        echo "--- Verificaciones ---"
    } > "$report_file"
    
    check_terraform_installed >> "$report_file" 2>&1 || true
    echo "" >> "$report_file"
    
    check_terraform_files >> "$report_file" 2>&1 || true
    echo "" >> "$report_file"
    
    check_terraform_modules >> "$report_file" 2>&1 || true
    echo "" >> "$report_file"
    
    check_environments >> "$report_file" 2>&1 || true
    echo "" >> "$report_file"
    
    validate_terraform_syntax "$environment" >> "$report_file" 2>&1 || true
    echo "" >> "$report_file"
    
    check_aws_credentials >> "$report_file" 2>&1 || true
    echo "" >> "$report_file"
    
    check_infrastructure_state "$environment" >> "$report_file" 2>&1 || true
    
    log_success "Reporte generado: $report_file"
}

print_usage() {
    cat << EOF
Uso: $0 [OPCIONES]

Opciones:
  -e, --environment ENV    Ambiente a verificar (dev|prod) [default: dev]
  -r, --report            Generar reporte de salud
  -h, --help              Mostrar esta ayuda

Ejemplos:
  $0                      # Verificar entorno dev
  $0 -e prod              # Verificar entorno prod
  $0 -e dev -r            # Verificar dev y generar reporte
EOF
}

main() {
    local environment="dev"
    local generate_report=false
    
    while [[ $# -gt 0 ]]; do
        case $1 in
            -e|--environment)
                environment="$2"
                shift 2
                ;;
            -r|--report)
                generate_report=true
                shift
                ;;
            -h|--help)
                print_usage
                exit 0
                ;;
            *)
                log_error "Opción desconocida: $1"
                print_usage
                exit 1
                ;;
        esac
    done
    
    if [[ "$environment" != "dev" && "$environment" != "prod" ]]; then
        log_error "Ambiente inválido: $environment (debe ser dev o prod)"
        exit 1
    fi
    
    echo ""
    log_info "=========================================="
    log_info "  HEALTHCHECK INFRAESTRUCTURA TERRAFORM"
    log_info "  Ambiente: $environment"
    log_info "=========================================="
    echo ""
    
    local all_checks_passed=true
    
    check_terraform_installed || all_checks_passed=false
    echo ""
    
    check_terraform_files || all_checks_passed=false
    echo ""
    
    check_terraform_modules || all_checks_passed=false
    echo ""
    
    check_environments || all_checks_passed=false
    echo ""
    
    validate_terraform_syntax "$environment" || all_checks_passed=false
    echo ""
    
    check_aws_credentials || all_checks_passed=false
    echo ""
    
    check_infrastructure_state "$environment" || all_checks_passed=false
    echo ""
    
    if [[ "$generate_report" == true ]]; then
        generate_health_report "$environment"
        echo ""
    fi
    
    echo ""
    log_info "=========================================="
    if [[ "$all_checks_passed" == true ]]; then
        log_success "Healthcheck completado exitosamente"
        log_info "=========================================="
        exit 0
    else
        log_error "Healthcheck completado con errores"
        log_info "=========================================="
        exit 1
    fi
}

main "$@"