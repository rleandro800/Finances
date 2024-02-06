## How to run the application

### Clone application

Use the following command line in your terminal to clone the project:
`git clone https://github.com/GabrielVilasboa/Finances.git`

### Starting database

#### Docker installation

Download Docker from the website [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/) and install it.

#### Container creation with image

Use the following command line in your terminal to create and run a container in Docker from the SQL image:

`docker run --name MYSQL -e MYSQL_ROOT_PASSWORD=1234 -p 3306:3306 -d mysql:latest`

Note: the option `-p 3306:3306` defines the port to b used by the container.

#### Accessing MySQL

Use the following command to access MySQL as root:
`docker exec -it MYSQL mysql -u root -p`


#### Create database

Use the following command to create the database:
`create database financeDB;`

## Starting Django and Django Rest Framework

#### Python installation

* Check if Python is already installed by typing `python` in your terminal.

* If it's not installed, download it from the link `https://www.python.org/downloads/` and install it.

#### Django installation

Install Django using the following command line:
`python -m pip install Django`

#### Django Rest Framework installation

Install Django Rest Framework with the following command:
`pip install djangorestframework`

### Starting Flutter

To install Flutter, access the following site `https://docs.flutter.dev/get-started/install` and follow the installation steps.