# Prompt para Mejorar el Codigo Base

Copia y pega el contenido del bloque de abajo en un asistente de IA (Claude, ChatGPT)
para obtener el proyecto completo y arrancable. Guarda los archivos que te devuelva en la
carpeta del repo, respetando exactamente las rutas.

Si preferis trabajar en tu editor con un agente local (Claude Code, Cursor, Copilot), usa `AGENTS.md` en vez de este archivo: dice lo mismo pero para que escriba los archivos en disco.

## Las dos reglas que no se negocian

1. **Completa el boilerplate.** Todo lo que el proyecto necesita para compilar y arrancar: manifiesto de dependencias, punto de entrada, configuracion, capa de interfaz, y las capas del patron arquitectonico declarado. Eso es andamiaje y es tu trabajo.
2. **NO resuelvas el reto.** Los entregables de las fases son el trabajo de la persona. El hueco pedagogico se deja como esta: el proyecto arranca, pero lo que el reto pide implementar NO esta implementado.

Dicho de otra forma: si algo impide compilar, arreglalo. Si algo es logica de negocio incompleta, validaciones ausentes, un secreto hardcodeado o un patron mejorable, dejalo exactamente como esta — es lo que la persona tiene que encontrar.

## Superficie de practica — NO resuelvas

Estos archivos SON el ejercicio de la persona. No los implementes; deja stubs.

- `main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/network/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/main.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/variables.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.
- `modules/compute/outputs.tf` — El topic pide escribir Terraform: este .tf es el ejercicio, no scaffolding.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Como saber que terminaste

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

Ese comando corriendo sin errores es la definicion de "listo".

---

```
## Briefing del reto (autoridad)
Este bloque manda sobre los archivos adjuntos. El stack y el rol salen de AQUÍ, no de un topic genérico ni de markdown placeholder.

### Perfil
Chapter DevOps, Especialidad Ingenieria, Tecnología Terraform, Advanced L2

### Brecha de conocimiento
Aprovisionar infraestructura con Terraform (corrida e2e 20261106160222034), Aprovisiona con Terraform la red y el computo del servicio de notificaciones

### Misión / candidato
Versionar la infraestructura del servicio de notificaciones

### Reto
- Tema: Infraestructura como codigo con Terraform
- Seniority: advanced-l2
- Tipo: practical
- Título: Versionado de Infraestructura con Terraform
- Tiempo estimado: 8 horas

### Fases (trabajo del HUMANO — PROHIBIDO completarlas)
No implementes estos entregables. Dejalos como hueco pedagógico. El asistente solo materializa el proyecto arrancable para que el participante pueda trabajar.
- Fase 1: Exploración y Configuración Inicial — objetivo: Configurar el entorno de Terraform y explorar la infraestructura existente. — entregable (NO resolver): Documentación de la infraestructura existente y configuración inicial de Terraform.
- Fase 2: Definición y Aprovisionamiento de la Infraestructura — objetivo: Definir y aprovisionar la infraestructura del servicio de notificaciones usando Terraform. — entregable (NO resolver): Archivos de Terraform que definen y aprovisionan la infraestructura del servicio de notificaciones.
- Fase 3: Versionado y Despliegue — objetivo: Versionar la infraestructura y realizar un despliegue controlado. — entregable (NO resolver): Infraestructura versionada y documentación del proceso de despliegue.

Eres un asistente experto en análisis, corrección y generación de archivos de cualquier tipo:
código fuente, documentación, hojas de cálculo, documentos Word, configuraciones, entre otros.
Voy a enviarte una cadena de texto que contiene uno o más archivos. Cada archivo está delimitado por un marcador con el siguiente formato:
// === ARCHIVO: ruta/del/archivo.extension ===
o también puede aparecer como:
## === ARCHIVO: ruta/del/archivo.extension ===
Lo que sigue al marcador puede ser:

El contenido real del archivo (código, texto, YAML, etc.)
Una descripción en lenguaje natural de lo que debe contener el archivo


TU TAREA
PASO 0 — ¿Esto es un proyecto o una carcasa?
Antes de extraer archivos, leé el Briefing (si está) y diagnosticá el adjunto.

Es CARCASA si ocurre CUALQUIERA de estas:
- No hay manifiesto de dependencias del stack del briefing (manifest.json de VTEX IO / package.json / pom.xml / build.gradle / requirements.txt / go.mod / *.tf / *.csproj, según corresponda)
- Hay un "binario" que en realidad es un comentario ("no puede ser mostrado como texto plano", placeholder .fig/.docx vacío)
- Los markdowns ya completan entregables de fases posteriores ("se implementó fade-in", lista de áreas ya resuelta)

Si es CARCASA:
- MATERIALIZÁ un proyecto que arranca en el stack del briefing (VTEX IO Store Framework, Angular, Terraform, pytest, Nest, etc.). Incluí manifiesto, punto de entrada y capa de interfaz reales.
- NO copies los markdowns de "solución" como si fueran el producto. Son ruido de generación.
- NO resuelvas las fases del briefing (están marcadas PROHIBIDO). Dejá el hueco pedagógico: el flujo existe, las microinteracciones/calidad/infra que el reto pide NO están hechas.
- Después seguí al PASO 5 (entrega de archivos).

Si es un proyecto REAL (manifiesto + código que compila o arranca):
- Seguí PASO 1 en adelante. 🔴 compilación sí. 🟡 pedagógico no.

PASO 1 — Detección y extracción
Identifica todos los archivos presentes en la cadena. Para cada archivo extrae:

Su ruta completa (ej: src/main/java/com/pragma/Service.java)
Su contenido o descripción

PASO 2 — Clasificación por tipo
Clasifica cada archivo en una de estas categorías:
A) Código fuente (Java, Python, TypeScript, JavaScript, Kotlin, etc.)
B) Configuración / documentación (YAML, properties, Markdown, JSON, txt, etc.)
C) Excel (.xlsx, .xls, .csv)
D) Word (.docx, .doc)
E) Otro tipo de archivo binario o especial
PASO 3 — Clasificación de errores en código fuente

Objetivo prioritario: que el proyecto compile. No corrijas flujo de negocio ni lógica funcional.

Antes de modificar cualquier archivo de código fuente, clasifica cada problema encontrado en una de estas dos categorías:
🔴 ERROR DE COMPILACIÓN — corregir siempre
Son errores que impiden que el proyecto arranque, sin valor pedagógico:

Import faltante o incorrecto
Clase, método o variable referenciada que no existe en ningún archivo del proyecto
Error de sintaxis
Anotación con atributos inválidos
Dependencia ausente en pom.xml, package.json, etc.
Archivo referenciado que no existe y debe ser creado con implementación mínima

→ CORREGIR estos errores.
🟡 PROBLEMA FUNCIONAL O DE CALIDAD — preservar siempre
Son problemas que no impiden compilar. Pueden ser intencionales para el aprendizaje:

Clave secreta hardcodeada ("secret", "password123")
API deprecada que funciona pero tiene reemplazo moderno
Lógica de negocio incorrecta o incompleta
Código redundante o de baja legibilidad
Falta de validaciones en flujo de negocio
Patrones de diseño incorrectos pero funcionales
Concurrencia no segura
Configuración funcional pero no óptima

→ PRESERVAR tal cual. No corregir, no mejorar, no comentar.
PASO 4 — Procesamiento según tipo de archivo
Tipo A — Código fuente
Aplica únicamente las correcciones clasificadas como 🔴 ERROR DE COMPILACIÓN.
No alteres ningún elemento clasificado como 🟡 PROBLEMA FUNCIONAL O DE CALIDAD.
Si falta un archivo referenciado, créalo con la implementación mínima necesaria para compilar.
Tipo B — Configuración / documentación
Extrae el contenido tal cual, sin modificaciones salvo errores evidentes de sintaxis
(ej: YAML mal indentado).
Tipo C — Excel (.xlsx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un archivo Excel funcional con:

Fila de encabezados en negrita con color de fondo distintivo
Columnas con ancho ajustado al contenido
Tipos de dato correctos por columna
Validaciones si la descripción lo indica
Hojas nombradas descriptivamente si hay más de una
Filas de ejemplo si no hay datos reales

Tipo D — Word (.docx)
Si viene con contenido real, genera el archivo respetando ese contenido.
Si viene con descripción en lenguaje natural, genera un documento Word funcional con:

Estilos de título (Título 1, Título 2) para jerarquía de secciones
Fuente legible (Calibri o equivalente), tamaño 11-12pt para cuerpo
Márgenes estándar
Tabla de contenido si tiene múltiples secciones
Tablas con encabezados en negrita si aplica

Tipo E — Otro
Genera el archivo con el contenido o estructura más apropiada según la descripción.
PASO 5 — Entrega de archivos
Entregá cada archivo con su ruta completa, respetando exactamente la estructura de rutas
indicada por los marcadores: un bloque por archivo, precedido por su ruta. No generes ZIPs
ni archivos adjuntos.
La entrega debe incluir:

Archivos de código con únicamente los errores de compilación corregidos
Archivos de configuración y documentación sin cambios
Archivos nuevos creados para resolver dependencias de compilación faltantes
Archivos Excel y Word generados desde descripción

IMPORTANTE: Entregá los archivos completos al finalizar. No preguntes si el usuario
quiere recibirlos. Simplemente entregalos; No debes desplegar en el chat el resumen de lo que arreglaste, solo entregá los archivos.

REGLAS IMPORTANTES

No omitas ningún archivo aunque no tenga errores ni modificaciones
Respeta los nombres y rutas exactas indicadas por los marcadores
Si un archivo no tiene marcador claro, infiere el nombre desde su contenido
Si la cadena contiene solo documentación, placeholders o binarios fake, NO la reproduzcas:
aplicá PASO 0 (materializar el proyecto del briefing). Reproducir la carcasa es un fallo.
No agregues texto después del último archivo entregado
No preguntes si el usuario quiere los archivos: simplemente entregalos siempre
Si detectas que falta un archivo de configuración necesario para compilar
(pom.xml, package.json, requirements.txt, build.gradle, etc.), créalo e inclúyelo
inferiendo su contenido desde los imports y frameworks detectados en el código
Nunca corrijas problemas 🟡 aunque parezcan obvios o fáciles de mejorar.
El participante que recibirá este proyecto los debe encontrar y resolver él mismo.


INPUT
Aquí está la cadena con los archivos:

// === ARCHIVO: providers.tf ===
# providers.tf - Configuración del proveedor AWS y restricción de versión de Terraform
# Este archivo declara el proveedor AWS y establece la versión mínima de Terraform
# requerida para el proyecto. La versión de Terraform se especifica como rango
# para permitir actualizaciones menores sin romper la compatibilidad.

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configuración del proveedor AWS
# Se define la región por defecto y se habilita el uso de tags para todos los recursos.
# Los tags son esenciales para la organización y seguimiento de los recursos en AWS.
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = var.environment
      Project     = "notificaciones"
      ManagedBy   = "Terraform"
    }
  }
}

# Variables globales utilizadas en el proveedor
# Estas variables permiten parametrizar la configuración del proveedor AWS
# para diferentes entornos (dev, prod, etc.).
variable "environment" {
  description = "Entorno en el que se desplegará la infraestructura (dev, prod, etc.)"
  type        = string
  default     = "dev"
}

// === ARCHIVO: variables.tf ===
# variables.tf - Declaración de variables globales para parametrizar la infraestructura
# Este archivo define las variables que se utilizarán en los módulos de red y cómputo.
# Las variables permiten que la infraestructura sea reutilizable y configurable por ambiente.

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC del servicio de notificaciones"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Número deseado de instancias en el Auto Scaling Group"
  type        = number
}

// === ARCHIVO: modules/network/variables.tf ===
# modules/network/variables.tf - Variables específicas para el módulo de red
# Este archivo define las variables necesarias para configurar la red del servicio
# de notificaciones, incluyendo VPC, subredes y puertas de enlace.

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC del servicio de notificaciones"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes privadas"
  type        = list(string)
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad donde se desplegarán las subredes"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

// === ARCHIVO: modules/compute/variables.tf ===
# modules/compute/variables.tf - Variables específicas para el módulo de cómputo
# Este archivo define las variables necesarias para configurar el cómputo del servicio
# de notificaciones, incluyendo instancias EC2, Auto Scaling Groups y balanceadores.

variable "environment" {
  description = "Entorno de despliegue (dev, prod, etc.)"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2 para el servicio de notificaciones"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para las instancias EC2"
  type        = string
}

variable "min_size" {
  description = "Número mínimo de instancias en el Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Número máximo de instancias en el Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Número deseado de instancias en el Auto Scaling Group"
  type        = number
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegarán las instancias"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes donde se desplegarán las instancias"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Lista de IDs de grupos de seguridad para las instancias"
  type        = list(string)
}


// === ARCHIVO: main.tf ===
# ==============================================================================
# MÓDULO PRINCIPAL DE INFRAESTRUCTURA - SERVICIO DE NOTIFICACIONES
# ==============================================================================
# Este archivo orquesta la creación de los recursos de infraestructura
# utilizando los módulos de red y cómputo.

# Módulo de red: VPC, subnets, tablas de enrutamiento, security groups
module "network" {
  source = "./modules/network"

  environment = var.environment
  project     = var.project_name
  vpc_cidr    = var.vpc_cidr

  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

# Módulo de cómputo: EC2, Auto Scaling, Load Balancer
module "compute" {
  source = "./modules/compute"

  environment           = var.environment
  project               = var.project_name
  vpc_id                = module.network.vpc_id
  subnet_ids            = module.network.private_subnet_ids
  security_group_ids    = [module.network.default_security_group_id]
  instance_type         = var.instance_type
  min_size              = var.min_size
  max_size              = var.max_size
  desired_capacity      = var.desired_capacity
  ami_id                = var.ami_id
}

// === ARCHIVO: outputs.tf ===
# ==============================================================================
# SALIDAS DE LA INFRAESTRUCTURA
# ==============================================================================
# Exposición de información relevante para otros módulos o ambientes

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = module.network.vpc_id
}

output "vpc_cidr" {
  description = "Bloque CIDR de la VPC"
  value       = module.network.vpc_cidr
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = module.network.private_subnet_ids
}

output "default_security_group_id" {
  description = "ID del security group por defecto"
  value       = module.network.default_security_group_id
}

output "asg_name" {
  description = "Nombre del Auto Scaling Group"
  value       = module.compute.asg_name
}

output "asg_arn" {
  description = "ARN del Auto Scaling Group"
  value       = module.compute.asg_arn
}

output "lb_dns_name" {
  description = "Nombre DNS del Load Balancer"
  value       = module.compute.lb_dns_name
}

output "lb_arn" {
  description = "ARN del Load Balancer"
  value       = module.compute.lb_arn
}

// === ARCHIVO: README.md ===
# Infraestructura como Código - Servicio de Notificaciones

## Descripción del Proyecto

Este proyecto define la infraestructura del servicio de notificaciones utilizando Terraform. La infraestructura incluye recursos de red (VPC, subnets, tablas de enrutamiento, security groups) y cómputo (instancias EC2, Auto Scaling Group, Application Load Balancer).

## Estructura de Directorios

```
.
├── environments/
│   ├── dev/
│   │   └── terraform.tfvars
│   └── prod/
│       └── terraform.tfvars
├── modules/
│   ├── network/
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   └── variables.tf
│   └── compute/
│       ├── main.tf
│       ├── outputs.tf
│       └── variables.tf
├── scripts/
│   └── healthcheck.sh
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── README.md
```

## Requisitos Previos

- Terraform >= 1.5 instalado
- Credenciales de AWS configuradas (AWS CLI o variables de entorno)
- Acceso a un bucket de S3 para almacenar el estado remoto

## Configuración Inicial

### 1. Configurar credenciales de AWS

```bash
aws configure
```

O exportar variables de entorno:

```bash
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_REGION="us-east-1"
```

### 2. Inicializar Terraform

```bash
terraform init
```

Este comando descarga los providers necesarios y configura el backend.

### 3. Seleccionar el entorno

Para desarrollo:

```bash
cd environments/dev
terraform init -backend=false
terraform plan
```

Para producción:

```bash
cd environments/prod
terraform init -backend=false
terraform plan
```

## Comandos de Ejecución

### Validar la configuración

```bash
terraform validate
```

### Planificar cambios

```bash
terraform plan -out=tfplan
```

### Aplicar cambios

```bash
terraform apply tfplan
```

### Destruir infraestructura

```bash
terraform destroy
```

### Ver estado actual

```bash
terraform show
```

## Variables Principales

| Variable | Descripción | Valor por defecto |
|----------|-------------|-------------------|
| `environment` | Entorno de despliegue (dev, prod) | - |
| `project_name` | Nombre del proyecto | "notificaciones" |
| `vpc_cidr` | Bloque CIDR de la VPC | "10.0.0.0/16" |
| `instance_type` | Tipo de instancia EC2 | "t3.medium" |
| `min_size` | Tamaño mínimo del ASG | 2 |
| `max_size` | Tamaño máximo del ASG | 4 |
| `desired_capacity` | Capacidad deseada del ASG | 2 |

## Arquitectura de Red

- **VPC**: 10.0.0.0/16
- **Subnets públicas**: 10.0.1.0/24, 10.0.2.0/24 (una por AZ)
- **Subnets privadas**: 10.0.11.0/24, 10.0.12.0/24 (una por AZ)
- **Internet Gateway**: Conectividad hacia internet
- **NAT Gateway**: Para tráfico saliente desde subnets privadas

## Arquitectura de Cómputo

- **Auto Scaling Group**: Gestiona instancias EC2 en múltiples AZ
- **Application Load Balancer**: Distribuye tráfico entre instancias
- **Security Groups**: Controlan tráfico de entrada y salida

## Notas de Seguridad

- Los secretos nunca deben incluirse en el repositorio
- Usar AWS Secrets Manager para almacenar credenciales
- Habilitar el cifrado en reposo para todos los recursos
- Revisar regularmente los security groups

## Recursos Adicionales

- [Documentación de Terraform](https://www.terraform.io/docs/)
- [Documentación de AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Best Practices de AWS](https://aws.amazon.com/architecture/well-architected/)


// === ARCHIVO: modules/network/main.tf ===
# Módulo de red para el servicio de notificaciones
# Superficie de práctica: el estudiante definirá los recursos de red

resource "aws_vpc" "notificaciones" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "vpc_notificaciones_${var.environment}"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_internet_gateway" "notificaciones" {
  vpc_id = aws_vpc.notificaciones.id
  tags = {
    Name        = "igw_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_subnet" "publica" {
  count                   = length(var.availability_zones)
  vpc_id                  = aws_vpc.notificaciones.id
  cidr_block              = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name        = "subnet_publica_notificaciones_${var.environment}_${count.index + 1}"
    Environment = var.environment
    Type        = "publica"
  }
}

resource "aws_subnet" "privada" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.notificaciones.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name        = "subnet_privada_notificaciones_${var.environment}_${count.index + 1}"
    Environment = var.environment
    Type        = "privada"
  }
}

resource "aws_route_table" "publica" {
  vpc_id = aws_vpc.notificaciones.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.notificaciones.id
  }
  tags = {
    Name        = "rt_publica_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_route_table_association" "publica" {
  count          = length(aws_subnet.publica.*.id)
  subnet_id      = aws_subnet.publica[count.index].id
  route_table_id = aws_route_table.publica.id
}

resource "aws_security_group" "notificaciones" {
  name        = "sg_notificaciones_${var.environment}"
  description = "Security group para el servicio de notificaciones"
  vpc_id      = aws_vpc.notificaciones.id
  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Salida completa"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name        = "sg_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

// === ARCHIVO: modules/network/outputs.tf ===
# Outputs del módulo de red
# Superficie de práctica: el estudiante definirá las salidas necesarias

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.notificaciones.id
}

output "vpc_cidr" {
  description = "CIDR de la VPC"
  value       = aws_vpc.notificaciones.cidr_block
}

output "public_subnet_ids" {
  description = "IDs de las subnets públicas"
  value       = aws_subnet.publica[*].id
}

output "private_subnet_ids" {
  description = "IDs de las subnets privadas"
  value       = aws_subnet.privada[*].id
}

output "security_group_id" {
  description = "ID del security group"
  value       = aws_security_group.notificaciones.id
}

output "internet_gateway_id" {
  description = "ID del Internet Gateway"
  value       = aws_internet_gateway.notificaciones.id
}

// === ARCHIVO: modules/compute/main.tf ===
# Módulo de compute para el servicio de notificaciones
# Superficie de práctica: el estudiante definirá los recursos de cómputo

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "notificaciones" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  user_data     = base64encode(templatefile("${path.module}/user_data.sh", {
    environment = var.environment
  }))
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name        = "ec2_notificaciones_${var.environment}"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}

resource "aws_ecs_cluster" "notificaciones" {
  name = "cluster_notificaciones_${var.environment}"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = {
    Name        = "cluster_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_ecs_task_definition" "notificaciones" {
  family                   = "notificaciones_${var.environment}"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([{
    name      = "notificaciones"
    image     = "${var.ecr_repository_url}:${var.image_tag}"
    essential = true
    portMappings = [{
      containerPort = var.container_port
      protocol      = "tcp"
    }]
    environment = [
      {
        name  = "ENVIRONMENT"
        value = var.environment
      }
    ]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "/ecs/notificaciones_${var.environment}"
        "awslogs-region"        = var.aws_region
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])
  tags = {
    Name        = "task_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_iam_role" "ecs_execution_role" {
  name = "ecs_execution_role_notificaciones_${var.environment}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role" "ecs_task_role" {
  name = "ecs_task_role_notificaciones_${var.environment}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ecs-tasks.amazonaws.com"
      }
    }]
  })
}

resource "aws_lb" "notificaciones" {
  name               = "alb_notificaciones_${var.environment}"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.public_subnet_ids
  enable_deletion_protection = false
  tags = {
    Name        = "alb_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_lb_target_group" "notificaciones" {
  name     = "tg_notificaciones_${var.environment}"
  port     = var.container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200"
    path                = "/health"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
  tags = {
    Name        = "tg_notificaciones_${var.environment}"
    Environment = var.environment
  }
}

resource "aws_lb_listener" "notificaciones" {
  load_balancer_arn = aws_lb.notificaciones.arn
  port              = var.container_port
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.notificaciones.arn
  }
}


// === ARCHIVO: modules/compute/outputs.tf ===
output "instance_arns" {
  description = "ARNs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notifications_server[*].arn
}

output "instance_ids" {
  description = "IDs de las instancias EC2 aprovisionadas"
  value       = aws_instance.notifications_server[*].id
}

output "instance_private_ips" {
  description = "Direcciones IP privadas de las instancias"
  value       = aws_instance.notifications_server[*].private_ip
}

output "instance_public_ips" {
  description = "Direcciones IP públicas de las instancias"
  value       = aws_instance.notifications_server[*].public_ip
}

output "security_group_id" {
  description = "ID del grupo de seguridad asociado a las instancias"
  value       = aws_security_group.instance_sg.id
}

output "iam_instance_profile_arn" {
  description = "ARN del perfil de instancia IAM"
  value       = aws_iam_instance_profile.notifications_profile.arn
}

// === ARCHIVO: environments/dev/terraform.tfvars ===
environment_name         = "dev"
environment_short        = "d"
aws_region               = "us-east-1"

vpc_cidr_block           = "10.0.0.0/16"
public_subnets_cidrs     = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets_cidrs    = ["10.0.11.0/24", "10.0.12.0/24"]

instance_type            = "t3.medium"
instance_count           = 2
ami_id                   = "ami-0c55b159cbfafe1f0"

enable_public_ip         = true
root_volume_size         = 30
root_volume_type         = "gp3"

allowed_ssh_cidr         = ["10.0.0.0/16"]
allowed_http_cidr        = ["0.0.0.0/0"]
allowed_https_cidr       = ["0.0.0.0/0"]
allowed_smtp_cidr        = ["10.0.0.0/16"]

tags = {
  Environment     = "development"
  Project         = "notificaciones"
  ManagedBy       = "terraform"
  CostCenter      = "engineering"
  Owner           = "devops-team"
}

// === ARCHIVO: environments/prod/terraform.tfvars ===
environment_name         = "prod"
environment_short        = "p"
aws_region               = "us-east-1"

vpc_cidr_block           = "10.1.0.0/16"
public_subnets_cidrs     = ["10.1.1.0/24", "10.1.2.0/24"]
private_subnets_cidrs    = ["10.1.11.0/24", "10.1.12.0/24"]

instance_type            = "t3.large"
instance_count           = 3
ami_id                   = "ami-0c55b159cbfafe1f0"

enable_public_ip         = false
root_volume_size         = 100
root_volume_type         = "gp3"

allowed_ssh_cidr         = ["10.1.0.0/16"]
allowed_http_cidr        = ["10.1.0.0/16"]
allowed_https_cidr       = ["10.1.0.0/16"]
allowed_smtp_cidr        = ["10.1.0.0/16"]

tags = {
  Environment     = "production"
  Project         = "notificaciones"
  ManagedBy       = "terraform"
  CostCenter      = "engineering"
  Owner           = "devops-team"
  Compliance      = "pci-dss"
  BackupRequired  = "true"
}

// === ARCHIVO: scripts/healthcheck.sh ===
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

```
