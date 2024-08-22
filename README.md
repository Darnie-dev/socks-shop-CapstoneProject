# AltSchool of Cloud Engineering Tinyuka 2023 Capstone Project

## Overview
[project link](https://darnie-dev.me/)
This project involves deploying the Socks Shop, a microservices-based application, on a Kubernetes cluster using Infrastructure as Code (IaaC) principles. The project aims to demonstrate the deployment of a modern cloud-native application with an emphasis on automation, monitoring, and security. The deployment was carried out on **Azure**, using **Terraform** for IaaC and **Helm** for managing Kubernetes resources.

## Table of Contents

- [Project Objectives](#project-objectives)
- [Technologies Used](#technologies-used)
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Setup and Deployment](#setup-and-deployment)
  - [1. Initialize Terraform](#1-initialize-terraform)
  - [2. Configure Kubernetes Cluster](#2-configure-kubernetes-cluster)
  - [3. Deploy the Application](#3-deploy-the-application)
  - [4. Setup Ingress Controller](#4-setup-ingress-controller)
  - [5. Configure DNS and HTTPS](#5-configure-dns-and-https)
  - [6. Monitoring and Logging](#6-monitoring-and-logging)
- [Security Measures](#security-measures)
- [Testing](#testing)
- [Future Improvements](#future-improvements)
- [Conclusion](#conclusion)

## Project Objectives

- Deploy the Socks Shop application on Kubernetes using an IaaC approach.
- Automate the deployment process to ensure quick and consistent setup.
- Implement monitoring and logging with Prometheus and Grafana.
- Secure the application with HTTPS using Let’s Encrypt.
- Optional: Implement network perimeter security access rules.

## Technologies Used

- **Azure**: Cloud service provider
- **Terraform**: Infrastructure as Code (IaaC) tool
- **Kubernetes**: Container orchestration platform
- **Helm**: Kubernetes package manager
- **Prometheus**: Monitoring tool
- **Grafana**: Visualization and monitoring dashboard
- **Cert-Manager**: Manages TLS certificates for Kubernetes

## Prerequisites

Before you begin, ensure you have the following:

- An active **Azure** subscription
- **Visual Studio Code (VS Code)** installed
- **Azure CLI** installed
- **kubectl** (Kubernetes CLI) installed
- **Helm** installed
- **Terraform** installed

## Project Structure
1. Configure Azure CLI: set up Azure and configure the CLI with Azure Services
[CLI instructions](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

2. Terraform Configuration:
   Ensure you have inatalled on your local machine
   -create a new directory for the terraform folder to have the configuration files and initiate the project
```
    mkdir Socks-Shop_Terraform
    cd Socks-Shop_Terraform
```
3. Git clone this repository and navigate to the terraform folder to have the terraform configuration files and initiate the terraform project.
   ```
   git clone https://https://github.com/Darnie-dev/socks-shop-CapstoneProject/terraform
   ```
4. Run the following command to initialise terraform project:
   ``` terraform init ```  

5. Run the following command to create and execution plan:
   ``` terraform plan ```




The project execution modes are as follows:


