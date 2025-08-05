# terraform-iam-user-ec2-access

Este repositorio muestra cómo crear un usuario IAM en AWS y asignarlo a un grupo con permisos completos sobre EC2 utilizando **Terraform**. El proyecto es parte de mi portafolio profesional técnico orientado a roles de **Cloud Engineer Junior** y refleja dominio de conceptos clave de gobernanza y automatización en la nube.

---

## 📌 Objetivo del proyecto
- Crear un usuario IAM llamado **Ian**.
- Crear un grupo llamado **EC2Users**.
- Asociar la política administrada `AmazonEC2FullAccess` al grupo.
- Agregar al usuario al grupo para heredar sus permisos.
- Gestionar todos estos recursos desde código usando Terraform.

---

## 🛠️ Requisitos

- Cuenta de AWS activa
- AWS CLI configurado
- Terraform instalado
- Visual Studio Code con la extensión HashiCorp terraform instalado
- Permisos IAM para crear usuarios, grupos y políticas

---

## 📁 Estructura del proyecto
```
terraform-iam-user-ec2-access/
├── main.tf              # Código principal de infraestructura
├── outputs.tf           # Salidas visibles tras ejecución (ARN, grupo, etc.)
├── README.md            # Documentación 
└── screenshots/         # Evidencias gráficas desde la consola AWS y VS Code
```

---

## 🔍 Explicación del archivo `main.tf`
```hcl
provider "aws" {
  region = "us-east-1"
}
```
Define el proveedor AWS y la región donde se aplicarán los recursos.

```hcl
resource "aws_iam_user" "ian" {
  name = "Ian"
  tags = {
    CreatedBy = "larrycloud"
  }
}
```
Crea un usuario IAM llamado Ian con una etiqueta personalizada.

```hcl
resource "aws_iam_group" "ec2_users" {
  name = "EC2Users"
}
```
Define el grupo IAM al que se le otorgarán permisos sobre EC2.

```hcl
resource "aws_iam_group_policy_attachment" "ec2_group_policy" {
  group      = aws_iam_group.ec2_users.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}
```
Adjunta la política administrada `AmazonEC2FullAccess` al grupo, permitiéndole control total sobre EC2.

```hcl
resource "aws_iam_user_group_membership" "ian_membership" {
  user   = aws_iam_user.ian.name
  groups = [aws_iam_group.ec2_users.name]
}
```
Agrega al usuario Ian como miembro del grupo EC2Users, heredando así sus permisos.

---

## 📤 Explicación del archivo `outputs.tf`
```hcl
output "user_arn" {
  description = "ARN del usuario Ian creado"
  value       = aws_iam_user.ian.arn
}

output "grupo_nombre" {
  description = "Nombre del grupo EC2 asignado"
  value       = aws_iam_group.ec2_users.name
}
```
El objetivo de estos outputs es mostrar directamente en consola dos elementos clave tras la ejecución de `terraform apply`:
- El **ARN** del usuario Ian, útil para trazabilidad.
- El **nombre del grupo IAM** al que fue asignado, confirmando que la relación se aplicó correctamente.

Esto ahorra pasos de verificación en la consola web y demuestra buenas prácticas.

---

## 🚀 Comandos Terraform utilizados
```bash
terraform init     # Inicializa el entorno de trabajo
terraform plan     # Muestra los cambios que se aplicarán
terraform apply    # Crea los recursos en AWS
```

---

## 🧪 Verificación desde la consola AWS
Tras aplicar el código, se verifica:
1. IAM > Usuarios > **Ian** → Usuario creado.
2. Pestaña **Grupos** del usuario Ian → pertenece al grupo **EC2Users**.
3. IAM > Grupos > **EC2Users** → Adjuntada la política **AmazonEC2FullAccess**.

---

## 📸 Evidencias visuales del proyecto (VSCode + AWS Console)

Las evidencias visuales disponibles en la carpeta `/screenshots/` documentan paso a paso la ejecución completa del proyecto, tanto desde **Visual Studio Code** como desde la **consola de AWS**. Estas capturas muestran la correcta aplicación de Terraform y la creación real de los recursos en la nube de AWS.


#### Desde Visual Studio Code:

1. **Estructura del proyecto**  
   ![01 - Estructura del proyecto VSCode](screenshots/01-estructura-proyecto-vscode.png)

2. **Archivo `main.tf` completo**  
   ![02 - main.tf](screenshots/02-main-tf.png)

3. **Archivo `outputs.tf`**  
   ![03 - outputs.tf](screenshots/03-outputs-tf.png)

4. **Comando `terraform init` ejecutado**  
   ![04 - terraform init](screenshots/04-terraform-init.png)

5. **Comando `terraform plan`**  
   ![05 - terraform plan](screenshots/05-terraform-plan.png)

6. **Aplicación con `terraform apply`**  
   ![06 - terraform apply](screenshots/06-terraform-apply.png)

7. **Resultados de ejecución y `outputs`**  
   ![07 - resultados outputs](screenshots/07-resultados-outputs.png)

#### Desde consola AWS:

8. **Usuario creado**  
   ![08 - usuario iam IAN](screenshots/08-iam-usuario-ian.png)

9. **Grupo IAM con política EC2**  
   ![09 - grupo ec2users](screenshots/09-iam-grupo-ec2users.png)

10. **Usuario agregado al grupo**  
    ![10 - vinculo usuario-grupo](screenshots/10-iam-vinculo-usuario-grupo.png)


Estas imágenes evidencian paso a paso el manejo técnico y la ejecución real del proyecto.

---

## 🧠 Habilidades demostradas
- Uso de Terraform como herramienta de infraestructura como código (IaC)
- Implementación de principios de gobernanza con AWS IAM
- Automatización de recursos reproducibles, trazables y auditable desde código
- Documentación visual clara, orientada a buenas prácticas profesionales

---

## ⚠️ Notas de seguridad
- La política `AmazonEC2FullAccess` otorga privilegios amplios.
- En entornos reales, es recomendable aplicar el principio de menor privilegio (least privilege), diseñando políticas específicas para cada rol.

---

## ✨ Próximas mejoras

- Aplicar Terraform en otros proyectos del portafolio: como Organización en el Cloud, SPA en S3, ECS, Kubernetes y más.
- Crear políticas IAM personalizadas con aws_iam_policy_document.
- Agregar credenciales temporales IAM asociadas a roles seguros.
- Modularizar el código Terraform para permitir su reutilización por entornos (dev, test, prod) con estructuras organizadas por carpetas y variables.

---

## 🙋 Autor

**Larry Andrés Rondan Manrique**  
📬 Email: larrycloudaws@gmail.com  
🐙 GitHub: [@larrycloud](https://github.com/larrycloud)