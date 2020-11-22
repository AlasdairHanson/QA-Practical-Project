# Flask Application 

### Resources
---
- Presentation: https://docs.google.com/presentation/d/12R2lT8XvUO6oy493f7I_fcXP0ECTgpIrUo1grBTOzD0/edit#slide=id.ga3bad5fd7a_0_87
- Trello: https://alasdairh.atlassian.net/secure/RapidBoard.jspa?rapidView=7&projectKey=QA&selectedIssue=QA-5

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

### Terraform

### Ansible

### Jenkins

### PyTest

### Kubernetes

## Project Tracking
---

Jira was used to manage the workflow of the project (pictured below). The link to this board can be found here:
https://alasdairh.atlassian.net/secure/RapidBoard.jspa?rapidView=7&projectKey=QA&selectedIssue=QA-5

![Imgur](https://i.imgur.com/7QuWoOs.png)

The Jira board is based on a Kanban process which helps visualise the state of tasks and how far they are along in development. The flow of tasks goes from left to right, from their point of conception in the backlog, to their completion and implementation. The board contains cards showing different information about what needs to be done and come in various forms:

* *Epics*:
   A larger body of work that can be broken down into user stories.
* *User Stories*:
   An abstract element written from the user's point-of-view about what the finished software should achieve. This keeps the development focused around the user.
* *Tasks*:
   Individual elements of a user story describing what needs to be done to meet it's requirements.



## Known Issues
---

- Game cards on the web page stack downwards instead of to the right for more optimum use of space.
- Update card appears ar the bottom of the card list instead of beside the card it is updating.

## Future Improvements
---

There are some improvements that I would like to implement:

- A date and time that each game was added. Automatically updates when an update is done on a game card.
- Game sorting by title, date or price.
- Sorting the games by most wanted.
- An alert telling the user which game was deleted from the wish list for clarity.

## Authors
---

Alasdair Hanson

