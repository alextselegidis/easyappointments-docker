<h1 align="center">
    <br>
    <a href="https://easyappointments.org">
        <img src="https://raw.githubusercontent.com/alextselegidis/easyappointments/develop/logo.png" alt="Easy!Appointments" width="150">
    </a>
    <br>
    Easy!Appointments Docker
    <br>
</h1>

<br>

> NOTICE: This repository is undergoing major changes, make sure you update your existing clones before working on new features.

<br>

<h4 align="center">
    A powerful Open Source Appointment Scheduler that can be installed on your server. 
</h4>

<p align="center">
  <img alt="GitHub" src="https://img.shields.io/github/license/alextselegidis/easyappointments?style=for-the-badge">
  <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/alextselegidis/easyappointments?style=for-the-badge">
  <img alt="GitHub All Releases" src="https://img.shields.io/github/downloads/alextselegidis/easyappointments/total?style=for-the-badge">
  <a href="https://discord.com/invite/UeeSkaw">
    <img alt="Chat On Discord" src="https://img.shields.io/badge/chat-on%20discord-7289da?style=for-the-badge&logo=discord&logoColor=white">
  </a>
</p>

<p align="center">
  <a href="#about">About</a> •
  <a href="#features">Features</a> •
  <a href="#setup">Setup</a> •
  <a href="#installation">Installation</a> •
  <a href="#license">License</a>
</p>

## About

**Easy!Appointments** is a highly customizable web application that allows customers to book appointments with you 
via a sophisticated web interface. Moreover, it provides the ability to sync your data with Google Calendar so you can 
use them with other services. It is an open source project that you can download and install **even for commercial use**. 
Easy!Appointments will run smoothly with your existing website as it can be installed in a single folder of the 
server and of course share an existing database.

## Features

The application is designed to be flexible enough so that it can handle any enterprise work flow. 

* Customers and appointments management.
* Services and providers organization.
* Working plan and booking rules.
* Google Calendar synchronization.
* Email notifications system.
* Self hosted installation.
* Translated user interface.
* User community support. 

## Setup

To clone and run this application, you'll need [Git](https://git-scm.com), [Node.js](https://nodejs.org/en/download/) (which comes with [npm](http://npmjs.com)) and [Composer](https://getcomposer.org) installed on your computer. From your command line:

```bash
# Start a MySQL instance
$ docker run -d --name test-db -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=easyappointments mysql:latest

# Pull and run the app
$ docker run --name test-app -d --link test-db:db -p 80:80 -e DB_HOST=db -e DB_NAME=easyappointments -e DB_USERNAME=root -e DB_PASSWORD=secret alextselegidis/easyappointments
```

Note: If you're using Linux Bash for Windows, [see this guide](https://www.howtogeek.com/261575/how-to-run-graphical-linux-desktop-applications-from-windows-10s-bash-shell/) or use `node` from the command prompt.

## Docker Compose

You can use the following docker-compose.yml file to locally set up Easy!Appointments with a MySQL database: 

```
version: '3.1'
services:
  easyapointments:
    image: 'alextselegidis/easyappointments:1.4.3'
    environment:
      - BASE_URL=http://localhost
      - DEBUG_MODE=TRUE
      - DB_HOST=mysql
      - DB_NAME=easyappointments
      - DB_USERNAME=root
      - DB_PASSWORD=secret
    ports:
      - '80:80'
  mysql:
    image: 'mysql:8.0'
    volumes:
      - './docker/mysql:/var/lib/mysql'
    environment:
      - MYSQL_ROOT_PASSWORD=secret
      - MYSQL_DATABASE=easyappointments

```

## License 

Code Licensed Under [GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html) | Content Under [CC BY 3.0](https://creativecommons.org/licenses/by/3.0/)

---

Website [alextselegidis.com](https://alextselegidis.com) &nbsp;&middot;&nbsp;
GitHub [alextselegidis](https://github.com/alextselegidis) &nbsp;&middot;&nbsp;
Twitter [@alextselegidis](https://twitter.com/AlexTselegidis)
