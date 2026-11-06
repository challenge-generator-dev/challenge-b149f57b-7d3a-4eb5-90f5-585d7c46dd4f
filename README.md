# Versionado de Infraestructura con Terraform

El equipo de notificaciones necesita versionar su infraestructura para asegurar la consistencia y replicabilidad en diferentes entornos. La infraestructura incluye la red y el computo del servicio de notificaciones. Debes usar Terraform para aprovisionar y versionar esta infraestructura.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: Un IDE o editor de código.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Verifica que el proyecto arranca sin errores.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Exploración y Configuración Inicial

**Objetivo:** Configurar el entorno de Terraform y explorar la infraestructura existente.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Configura tu entorno de Terraform para trabajar con el servicio de notificaciones.
- Explora la infraestructura actual y documenta sus componentes y relaciones.

**Entregable:** Documentación de la infraestructura existente y configuración inicial de Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform se utiliza para definir y aprovisionar la infraestructura.
- La documentación debe incluir detalles sobre la red y el computo.

</details>

### Fase 2: Definición y Aprovisionamiento de la Infraestructura

**Objetivo:** Definir y aprovisionar la infraestructura del servicio de notificaciones usando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crea los archivos de Terraform necesarios para definir la red y el computo del servicio de notificaciones.
- Aprovisiona la infraestructura usando Terraform y verifica que todo esté configurado correctamente.

**Entregable:** Archivos de Terraform que definen y aprovisionan la infraestructura del servicio de notificaciones.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza módulos de Terraform para reutilizar configuraciones comunes.
- Verifica que la infraestructura aprovisionada cumpla con los requisitos del servicio de notificaciones.

</details>

### Fase 3: Versionado y Despliegue

**Objetivo:** Versionar la infraestructura y realizar un despliegue controlado.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Versiona los archivos de Terraform y realiza un despliegue controlado de la infraestructura.
- Documenta el proceso de versionado y despliegue para futuras referencias.

**Entregable:** Infraestructura versionada y documentación del proceso de despliegue.

<details>
<summary>Pistas de conocimiento</summary>

- Utiliza un sistema de control de versiones para gestionar los cambios en los archivos de Terraform.
- Documenta cada paso del proceso de despliegue para asegurar la replicabilidad.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para aprovisionar infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la infraestructura con Terraform?
- **comoSeUsa**: ¿Cómo se usa Terraform para definir y aprovisionar la infraestructura del servicio de notificaciones?
- **erroresComunes**: ¿Cuáles son los errores comunes al usar Terraform para aprovisionar infraestructura?
- **queDecisionesImplica**: ¿Qué decisiones implica el versionado y despliegue de la infraestructura con Terraform?

## Criterios de Evaluacion

- Configuración inicial de Terraform y documentación de la infraestructura existente.
- Definición y aprovisionamiento de la infraestructura usando Terraform.
- Versionado de la infraestructura y realización de un despliegue controlado.
- Documentación del proceso de versionado y despliegue.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
docker build -t reto:local . && terraform -chdir=terraform init -backend=false && terraform -chdir=terraform validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
