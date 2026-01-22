# CI/CD Pipeline – Hello World Python App 🚀

This project demonstrates a **basic CI/CD pipeline** for a *Hello World Python application* running locally on **Windows**, using **Jenkins, Docker, and Kubernetes**.

---

## 📌 Project Overview

The goal of this project is to understand and implement an **end-to-end CI/CD workflow**:
- From source code hosted on GitHub
- To automated build and deployment
- Using containerization and Kubernetes

---

## 🛠 Tools & Technologies

- **Language:** Python (Hello World)
- **Source Control:** GitHub
- **CI/CD Tool:** Jenkins (Windows Agent)
- **Containerization:** Docker
- **Image Registry:** Docker Hub
- **Container Orchestration:** Kubernetes (Docker Desktop)

---

## 🔄 CI/CD Pipeline Flow

1. Code is pushed to **GitHub**
2. **Jenkins pipeline** is triggered
3. Docker image is built and tagged
4. Image is pushed to **Docker Hub**
5. Application is deployed to **Kubernetes**
6. Service is exposed using **NodePort**

---

## 📂 Project Structure

```text
myapp/
│
├── app.py                 # Hello World Python app
├── Dockerfile             # Docker image definition
├── Jenkinsfile            # CI/CD pipeline script
├── k8s/
│   ├── deployment.yaml    # Kubernetes Deployment
│   └── service.yaml       # Kubernetes Service
└── README.md


▶️ How to Run (Locally)
Prerequisites
Docker Desktop (with Kubernetes enabled)
Jenkins running on Windows
Git
Access Application
Copy code

http://localhost:30007
📌 Jenkins Credentials Used
Docker Credentials – for Docker Hub login
Kubeconfig File Credential – for Kubernetes access


🎯 Learning Outcome
Hands-on experience with CI/CD pipelines
Docker image build & push automation
Kubernetes deployment using Jenkins
Working with credentials securely in Jenkins

