# Flask Application 

### Resources
---
- Presentation: https://docs.google.com/presentation/d/1ulECNoPwJHpUmVOGgueOIUzWRYSvV9R87JJlX5T5AcA/edit#slide=id.gacf035dd76_0_53
- Jira Board: https://alasdairh.atlassian.net/secure/RapidBoard.jspa?rapidView=8&projectKey=QPP&selectedIssue=QPP-10

## Contents
---

* [Brief](#brief)
   * [Requirements](#requirements)
* [Architecture](#architecture)
   * [Terraform](#terraform)
   * [Ansible](#ansible)
   * [Jenkins](#Jenkins)
   * [PyTest](#pytest)
   * [Kubernetes](#kubernetes)
* [Project Tracking](#project-tracking)
* [Authors](#authors)

## Brief
---

I have been tasked with creating a DevOps Continuous Integration pipeline in order to facilitate the automatic testing and deployment of a flask application.

### Requirements

In addition to the brief, I am also required to include:

- Deployment to a virtual machine for testing
- Deployment to a managed Kubernetes cluster for production
- Make use of a managed database solution

## Infrastructure
---

The application is a flask application running on two micro-services: a frontend and a backend. The infrastructure is designed to automatically facilitate the resources needed to run the services and connect them to a database with little user configuration. 

For the project, the infrastructure utilises Amazon Web Services for its components. It uses Elastic Cloud Compute (EC2) virtual machines to run different software, as well as Relational Database Service to contain databases. A Virtual Private Cloud is also utilised to define a private network for hosting the the other services.

![Imgur](https://i.imgur.com/CyvLUvR.png)

The image above shows a diagram of the infrastructure and how each component interacts. Terraform creates the EC2 and RDS instances, and Ansible follows up with software installation such as Kubernetes, Jenkins and PyTest.

### Terraform

Terraform is an infrastructure provisioning tool that automatically creates resources such as virtual machines and database solutions. It removes the need to manually create each resource needed in the DevOps pipeline by programmatically defining their attributes in a single file using an automation language such as YAML. 

Terraform runs from a single main.tf file that contains a list of resources and their configuration. Solutions such as EC2 and RDS instances are defined as an individual resource where they are given specific attributes. Other resources such as AWS Virtual Private Cloud can be created and linked to the EC2 or RDS instances in order to host them.

![Imgur](https://i.imgur.com/tm5OJA9.png)

Terraform creation

![Imgur](https://i.imgur.com/lEUb4JZ.png)

EC2 instances running

![Imgur](https://i.imgur.com/iwfk2Jt.png)

RDS instances running

### Ansible

Ansible is a software provisioning and application management tool that securely connects to virtual machines and configures its resources. It reduces the need for the user to manually SSH into a machine and configure the software themselves. Ansible can be triggered by Terraform to provision the resources it creates, meaning that resources such as virtual machines can be created and configured in one action.

In the project, Ansible is responsible for running an SSH command into the EC2 instances that Terraform creates and installs software needed to run them. 

![Imgur](https://i.imgur.com/Wt79ea9.png)

Resource in Terraform for automatically deploying Ansible

![Imgur](https://i.imgur.com/fsxFHaJ.png)

Ansible code running in the terminal. Each task corresponds to a particular resource being installed.

### Jenkins

Jenkins is an automation server that automatically builds, tests and deploys software. It executes instructions inside a Jenkinsfile that defines a list of steps, or "pipeline", to create software. Terraform spins up an EC2 where Jenkins can then be run from.

The first step in the pipeline is to SSH into the PyTest VM and execute a ./deploy script that contains the commands for installing the Git repo containing the frontend and backend YAML files. It then executes a docker-compose command that creates the images and then execs into the images to run the Pytests.

The second step is to exprt environment variables which are the test database and production database URIs for kubernetes to use when configuring the cluster.

The third step is to deploy frontend.yaml and backend.yaml files which pull the images uploaded to Dockerhub from the Pytest EC2 and containerise them.

![Imgur](https://i.imgur.com/N9I1nn1.png)

### PyTest

PyTest utilises integration testing to evaluate the functionality of the frontend and backend micro-services. It simulates a GET request to query the user database and retrieve its contents.

![Imgur](https://i.imgur.com/0lsqc69.png)

The backend service test 

### Kubernetes

Kubernetes is a container orchestration tool that automatically deploys images on a structure called a cluster. The cluster comprises of nodes which represent individual EC2 instances. Inside the nodes there are pods which hold the containers built from the images.

## Project Tracking
---

Jira was used to manage the workflow of the project (pictured below). The link to this board can be found here:
https://alasdairh.atlassian.net/secure/RapidBoard.jspa?rapidView=8&projectKey=QPP&selectedIssue=QPP-11

![Imgur](https://i.imgur.com/PYZKvym.png)

The Jira board is based on a Kanban process which helps visualise the state of tasks and how far they are along in development. The flow of tasks goes from left to right, from their point of conception in the backlog, to their completion and implementation. The board contains cards showing different information about what needs to be done and come in various forms:

* *Epics*:
   A larger body of work that can be broken down into tasks.
* *Tasks*:
   Individual elements of an epic describing what needs to be done to meet it's requirements.

## Authors
---

Alasdair Hanson

