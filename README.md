# socks-shop-CapstoneProject
Overview
This project involves deploying the Socks Shop, a microservices-based application, on a Kubernetes cluster using Infrastructure as Code (IaaC) principles. The project aims to demonstrate the deployment of a modern cloud-native application with an emphasis on automation, monitoring, and security. The deployment was carried out on Azure, using Terraform for IaaC and Helm for managing Kubernetes resources.

Table of Contents
Project Objectives
Technologies Used
Prerequisites
Project Structure
Setup and Deployment
1. Initialize Terraform
2. Configure Kubernetes Cluster
3. Deploy the Application
4. Setup Ingress Controller
5. Configure DNS and HTTPS
6. Monitoring and Logging
Security Measures
Testing
Future Improvements
Conclusion
Project Objectives
Deploy the Socks Shop application on Kubernetes using an IaaC approach.
Automate the deployment process to ensure quick and consistent setup.
Implement monitoring and logging with Prometheus and Grafana.
Secure the application with HTTPS using Let’s Encrypt.
Optional: Implement network perimeter security access rules.
Technologies Used
Azure: Cloud service provider
Terraform: Infrastructure as Code (IaaC) tool
Kubernetes: Container orchestration platform
Helm: Kubernetes package manager
Prometheus: Monitoring tool
Grafana: Visualization and monitoring dashboard
Cert-Manager: Manages TLS certificates for Kubernetes
Prerequisites
Before you begin, ensure you have the following:

An active Azure subscription
Visual Studio Code (VS Code) installed
Azure CLI installed
kubectl (Kubernetes CLI) installed
Helm installed
Terraform installed
Project Structure
The project directory is organized as follows:

css
Copy code
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── kubernetes/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   └── cert-manager.yaml
└── README.md
Setup and Deployment
1. Initialize Terraform
Navigate to the terraform/ directory and initialize Terraform:

bash
Copy code
terraform init
2. Configure Kubernetes Cluster
Deploy the Kubernetes cluster on Azure:

bash
Copy code
terraform apply
Ensure your kubeconfig is updated to interact with the new cluster:

bash
Copy code
az aks get-credentials --resource-group <resource-group> --name <cluster-name>
3. Deploy the Application
Deploy the Socks Shop application using the provided YAML files:

bash
Copy code
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
4. Setup Ingress Controller
Install the NGINX Ingress Controller using Helm:

bash
Copy code
helm repo add nginx https://helm.nginx.com/stable
helm repo update
helm install ingress-controller nginx/nginx-ingress
5. Configure DNS and HTTPS
Map your domain to the Ingress Controller’s external IP and apply the Ingress configuration:

bash
Copy code
kubectl apply -f kubernetes/ingress.yaml
Install Cert-Manager and apply the TLS certificate configuration:

bash
Copy code
helm repo add jetstack https://charts.jetstack.io
kubectl apply -f kubernetes/cert-manager.yaml
6. Monitoring and Logging
Install Prometheus and Grafana using Helm:

bash
Copy code
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install monitoring prometheus-community/kube-prometheus-stack
Update the Ingress configuration to expose Grafana and Prometheus dashboards.

Security Measures
HTTPS with Let’s Encrypt: The application is secured with TLS certificates.
Ingress Rules: Proper Ingress rules are configured to restrict traffic to the application.
Optional: Network perimeter security rules can be added for enhanced security.
Testing
Verify the application deployment using:

bash
Copy code
kubectl get pods,svc -n sock-shop
Access the application via the browser using your domain name to ensure it’s secure with HTTPS.

Check the Grafana and Prometheus dashboards for monitoring metrics.

Future Improvements
Implement network perimeter security rules.
Use Ansible for configuration management (if needed in future projects).
Enhance alerting by integrating more notification channels (e.g., Slack).
Conclusion
This project demonstrates the deployment of a microservices-based application using Kubernetes and IaaC on Azure. The setup is automated, secure, and monitored, reflecting modern DevOps practices. Future enhancements could focus on further security measures and expanding the monitoring and alerting capabilities.

