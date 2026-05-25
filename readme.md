![Banner](banner-es.png)

📘 **Idiomas disponibles**
- 🇪🇸 [Versión en Español](readme.md)
- 🇬🇧 [English Version](README_EN.md)

# 🚀 Terraform – IAM User con acceso a Amazon EC2

Este proyecto demuestra cómo **crear y gestionar usuarios IAM en AWS utilizando Terraform**, aplicando el enfoque de **Infraestructura como Código (IaC)** y buenas prácticas de **gobernanza y control de accesos en la nube**.

Forma parte de mi **portafolio profesional Cloud & DevOps**, enfocado en la automatización de infraestructura, la administración de identidades en AWS y la aplicación de buenas prácticas DevOps con evidencias verificables.

---

## 🎯 Objetivo del proyecto

- Crear un **usuario IAM** llamado `Ian`
- Crear un **grupo IAM** llamado `EC2Users`
- Asignar una política IAM custom de mínimo privilegio para operar solo instancias EC2 etiquetadas
- Asociar el usuario al grupo para heredar permisos
- Gestionar todo el proceso mediante **Terraform**

---

## 🧱 Arquitectura del proyecto

![Arquitectura IAM EC2](architecture/terraform_iam_ec2.png)

La arquitectura refleja el flujo de permisos:
- Terraform define y gestiona los recursos
- IAM controla el acceso mediante usuarios y grupos
- El grupo IAM centraliza los permisos EC2
- El usuario hereda permisos de forma segura y escalable

---

## 🛠️ Tecnologías utilizadas

- Terraform
- AWS IAM
- Amazon EC2
- AWS CLI
- Visual Studio Code

---

## 📁 Estructura del proyecto

```text
terraform-iam-user-ec2-access/
├── main.tf
├── outputs.tf
├── readme.md
├── README_EN.md
├── architecture/
│   └── terraform_iam_ec2.png
└── screenshots/
    └── *.png
```

---

## 🔍 Explicación técnica

### `main.tf`

- Define el proveedor AWS y la región.
- Crea el usuario IAM **Ian**.
- Crea el grupo IAM **EC2Users**.
- Asigna una política custom de **mínimo privilegio**.
- Limita `StartInstances`, `StopInstances` y `RebootInstances` a instancias con tag `Project`.
- Vincula el usuario al grupo IAM.

Este enfoque permite **centralizar permisos**, facilitar **auditorías** y **escalar accesos** sin modificar usuarios individualmente.

### `outputs.tf`

Expone información clave tras la ejecución:

- **ARN** del usuario IAM creado.
- **Nombre del grupo IAM** asignado.

Esto permite **verificar resultados directamente desde la consola**, sin depender de la interfaz web de AWS.

---

## 🚀 Ejecución del proyecto

```bash
terraform init     # Inicializa el proyecto
terraform plan     # Muestra los cambios a aplicar
terraform apply    # Crea los recursos en AWS
```

---

## 🧪 Verificación en AWS

Tras la ejecución se valida que:

- El usuario **Ian** fue creado correctamente.
- El usuario pertenece al grupo **EC2Users**.
- El grupo tiene asignada una política custom de mínimo privilegio.
- Las acciones operativas sobre EC2 se limitan por tag de recurso.

---

## 📸 Evidencias visuales del proyecto (VS Code + AWS Console)

Las siguientes capturas documentan **paso a paso** la ejecución completa del proyecto, desde el código en **Visual Studio Code**, la ejecución de **Terraform**, hasta la **verificación final en la consola de AWS**.

### 🖥️ Visual Studio Code & Terraform

1. **Estructura del proyecto en VS Code**  
   ![01 - Estructura del proyecto](screenshots/01-estructura-proyecto-vscode.png)

2. **Archivo `main.tf` – definición de recursos IAM**  
   ![02 - main.tf](screenshots/02-main-tf.png)

3. **Archivo `outputs.tf` – salidas del proyecto**  
   ![03 - outputs.tf](screenshots/03-outputs-tf.png)

4. **Inicialización del proyecto con `terraform init`**  
   ![04 - terraform init](screenshots/04-terraform-init.png)

5. **Planificación de cambios con `terraform plan`**  
   ![05 - terraform plan](screenshots/05-terraform-plan.png)

6. **Aplicación de la infraestructura con `terraform apply`**  
   ![06 - terraform apply](screenshots/06-terraform-apply.png)

7. **Resultados finales y outputs generados**  
   ![07 - resultados outputs](screenshots/07-resultados-outputs.png)

### ☁️ Consola de AWS (IAM)

8. **Usuario IAM `Ian` creado correctamente**  
   ![08 - Usuario IAM Ian](screenshots/08-iam-usuario-ian.png)

9. **Grupo IAM `EC2Users` con política adjunta**  
   ![09 - Grupo IAM EC2Users](screenshots/09-iam-grupo-ec2users.png)

10. **Usuario `Ian` asociado al grupo `EC2Users`**  
    ![10 - Usuario vinculado al grupo](screenshots/10-iam-vinculo-usuario-grupo.png)

Estas evidencias confirman que:

- Los recursos fueron creados **exitosamente con Terraform**.
- La relación **usuario → grupo → política** funciona correctamente.
- El proyecto fue ejecutado y validado en un **entorno real de AWS**.

---

## 🧠 Habilidades demostradas

- Infraestructura como Código (IaC) con Terraform.
- Gestión de identidades y accesos con AWS IAM.
- Automatización de permisos en la nube.
- Buenas prácticas de gobernanza.
- Documentación técnica clara y profesional.

---

## ⚠️ Consideraciones de seguridad

> El proyecto aplica una política IAM custom con enfoque de **mínimo privilegio**.  
> Las acciones de lectura EC2 son globales porque AWS las requiere con `Resource: "*"`, pero las acciones operativas se restringen a instancias etiquetadas.

## CI/CD

El workflow `.github/workflows/terraform-ci.yml` valida:

- `terraform fmt -check`
- `terraform init -backend=false`
- `terraform validate`
- Escaneo de seguridad con Checkov

---

## ✨ Próximas mejoras

- Modularizar el código Terraform.
- Separación por entornos (**dev / prod**).
- Uso de roles IAM y credenciales temporales (**STS**).

---

## 👨‍💻 Autor

**Larry Andrés Rondan Manrique**  
🌐 Portafolio: https://devopscloud.click  
🐙 GitHub: https://github.com/larrycloud  
💼 LinkedIn: https://www.linkedin.com/in/larry-cloud-devops/
