# Flask Application 

### Resources
---
- Presentation: https://docs.google.com/presentation/d/12R2lT8XvUO6oy493f7I_fcXP0ECTgpIrUo1grBTOzD0/edit#slide=id.ga3bad5fd7a_0_87
- Jira Board: https://alasdairh.atlassian.net/secure/RapidBoard.jspa?rapidView=8&projectKey=QPP&selectedIssue=QPP-10

## Contents
---

* [Brief](#brief)
   * [Requirements](#requirements)
   * [My Approach](#my-approach)
* [Architecture](#architecture)
   * [Website](#website)
   * [Server](#server)
   * [Database](#database)
* [Project Tracking](#project-tracking)
* [Risk Assessment](#risk-assessment)
* [Testing](#testing)
* [Front-End Design](#front-end-design)
* [Known Issues](#known-issues)
* [Future Improvements](#future-improvements)
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

The application is a flask application running on two micro-services: a frontend and a backend.

### Terraform

Terraform is an infrastructure provisioning tool that automatically creates resources such as virtual machines and database solutions. It removes the need to manually create each resource needed in the DevOps pipeline by programmatically defining their attributes in a single file using an automation language such as YAML. 

### Ansible

Ansible is a software provisioning and application management tool that securely connects to virtual machines and configures its resources. It reduces the need for the user to manually SSH into a machine and configure the software themselves. Ansible can be triggered by Terraform to provision the resources it creates, meaning that resources such as virtual machines can be created and configured in one action.

### Jenkins

Jenkins is an automation server that automatically builds, tests and deploys software. It executes instructions inside a Jenkinsfile that defines a list of steps, or "pipeline", to create software.

### PyTest

### Kubernetes

## Project Tracking
---

Jira was used to manage the workflow of the project (pictured below). The link to this board can be found here:
https://alasdairh.atlassian.net/secure/RapidBoard.jspa?rapidView=8&projectKey=QPP&selectedIssue=QPP-11

![Imgur](https://i.imgur.com/PYZKvym.png)

The Jira board is based on a Kanban process which helps visualise the state of tasks and how far they are along in development. The flow of tasks goes from left to right, from their point of conception in the backlog, to their completion and implementation. The board contains cards showing different information about what needs to be done and come in various forms:

* *Epics*:
   A larger body of work that can be broken down into user stories.
* *Tasks*:
   Individual elements of a user story describing what needs to be done to meet it's requirements.

## Known Issues
---



## Future Improvements
---



## Authors
---

Alasdair Hanson

