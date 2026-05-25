![Banner](banner-en.png)

📘 **Available languages**
- 🇪🇸 [Versión en Español](readme.md)
- 🇬🇧 [English Version](README_EN.md)

# 🚀 Terraform – IAM User with Access to Amazon EC2

This project demonstrates how to **create and manage AWS IAM users using Terraform**, applying the **Infrastructure as Code (IaC)** approach and best practices for **cloud governance and access control**.

It is part of my **Cloud & DevOps professional portfolio**, focused on infrastructure automation, AWS identity management, and the application of DevOps best practices with verifiable evidence.

---

## 🎯 Project Objectives

- Create an **IAM user** named `Ian`
- Create an **IAM group** named `EC2Users`
- Attach a custom least-privilege IAM policy for operating only tagged EC2 instances
- Associate the user with the group to inherit permissions
- Manage the entire process using **Terraform**

---

## 🧱 Project Architecture

![IAM EC2 Architecture](architecture/terraform_iam_ec2.png)

The architecture represents the permission flow:
- Terraform defines and manages the resources
- IAM controls access through users and groups
- The IAM group centralizes EC2 permissions
- The user inherits permissions in a secure and scalable way

---

## 🛠️ Technologies Used

- Terraform
- AWS IAM
- Amazon EC2
- AWS CLI
- Visual Studio Code

---

## 📁 Project Structure

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

## 🔍 Technical Explanation

### `main.tf`

- Defines the AWS provider and region.
- Creates the IAM user **Ian**.
- Creates the IAM group **EC2Users**.
- Attaches a custom **least-privilege** policy.
- Limits `StartInstances`, `StopInstances` and `RebootInstances` to instances with the `Project` tag.
- Associates the user with the IAM group.

This approach allows **centralized permission management**, easier **auditing**, and **scalable access control** without modifying individual users.

### `outputs.tf`

Exposes key information after execution:

- **ARN** of the created IAM user.
- **Name of the assigned IAM group**.

This enables **direct verification from the terminal output**, without relying on the AWS web console.

---

## 🚀 Project Execution

```bash
terraform init     # Initialize the project
terraform plan     # Preview planned changes
terraform apply    # Provision resources in AWS
```

---

## 🧪 AWS Verification

After execution, the following is validated:

- The **Ian** IAM user was successfully created.
- The user belongs to the **EC2Users** group.
- The group has a custom least-privilege policy attached.
- EC2 operational actions are restricted by resource tag.

---

## 📸 Project Evidence (VS Code + AWS Console)

The following screenshots document the **complete step-by-step execution** of the project, from the code in **Visual Studio Code**, through **Terraform execution**, to the **final verification in the AWS Console**.

### 🖥️ Visual Studio Code & Terraform

1. **Project structure in VS Code**  
   ![01 - Project structure](screenshots/01-estructura-proyecto-vscode.png)

2. **`main.tf` – IAM resource definitions**  
   ![02 - main.tf](screenshots/02-main-tf.png)

3. **`outputs.tf` – Terraform outputs**  
   ![03 - outputs.tf](screenshots/03-outputs-tf.png)

4. **Project initialization with `terraform init`**  
   ![04 - terraform init](screenshots/04-terraform-init.png)

5. **Execution planning with `terraform plan`**  
   ![05 - terraform plan](screenshots/05-terraform-plan.png)

6. **Infrastructure deployment with `terraform apply`**  
   ![06 - terraform apply](screenshots/06-terraform-apply.png)

7. **Final outputs after execution**  
   ![07 - Terraform outputs](screenshots/07-resultados-outputs.png)

### ☁️ AWS Console (IAM)

8. **IAM user `Ian` successfully created**  
   ![08 - IAM user Ian](screenshots/08-iam-usuario-ian.png)

9. **IAM group `EC2Users` with attached policy**  
   ![09 - IAM group EC2Users](screenshots/09-iam-grupo-ec2users.png)

10. **User `Ian` associated with `EC2Users` group**  
    ![10 - User-group association](screenshots/10-iam-vinculo-usuario-grupo.png)

These screenshots confirm that:

- Resources were **successfully created using Terraform**.
- The **user → group → policy** relationship works correctly.
- The project was deployed and validated in a **real AWS environment**.

---

## 🧠 Skills Demonstrated

- Infrastructure as Code (IaC) with Terraform.
- Identity and Access Management using AWS IAM.
- Cloud permission automation.
- Governance best practices.
- Clear and professional technical documentation.

---

## ⚠️ Security Considerations

> This project applies a custom IAM policy with a **least-privilege** approach.  
> EC2 read actions are global because AWS requires `Resource: "*"`, while operational actions are restricted to tagged instances.

## CI/CD

The `.github/workflows/terraform-ci.yml` workflow validates:

- `terraform fmt -check`
- `terraform init -backend=false`
- `terraform validate`
- Security scanning with Checkov

---

## ✨ Future Improvements

- Modularize the Terraform code.
- Environment separation (**dev / prod**).
- Use IAM roles and temporary credentials (**STS**).

---

## 👨‍💻 Author

**Larry Andrés Rondan Manrique**  
🌐 Portfolio: https://devopscloud.click  
🐙 GitHub: https://github.com/larrycloud  
💼 LinkedIn: https://www.linkedin.com/in/larry-cloud-devops/
