# Simple Forward Proxy using NGINX and Docker

This project demonstrates how to set up a simple forward proxy using NGINX within a Docker container. The proxy will forward all traffic to the external API at `https://dummyapi.online/`.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Run docker compose](#2-run-docker-compose)
  - [3. Test the Proxy](#3-test-the-proxy)
- [Configuration](#configuration)
- [Contributing](#contributing)

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)

## Project Structure

```
.
├── Dockerfile
├── nginx.conf
├── README.md
└── docker-compose.yml
```
- Dockerfile: The Docker configuration file to set up the NGINX container.
- nginx.conf: The NGINX configuration file for the proxy setup.
- README.md: This file containing project information.
- docker-compose.yml: The docker compose file

## Getting Started
Follow these steps to run the project on your local machine.
### 1. Clone the Repository
```
git clone https://github.com/linhpd-axonivy/api-proxy.git
cd api-proxy
```
### 2. Run docker compose
```
docker-compose up -d
```
### 3. Test the Proxy
Once the container is running, you can test the proxy by sending a request to http://localhost:8888/api/movies. You can see the api docs here: https://docs.dummyapi.online/getting-started/quickstart/
```
curl http://localhost:8888/api/movies
```
The request will be forwarded to https://dummyapi.online/api/movies, and you should see the response from the dummy API.

## Configuration
The NGINX proxy is configured via the nginx.conf file. If you need to modify the proxy behavior, you can edit this file and rerun the Docker compose.

```
events {
    worker_connections 1024;
}

http {
  server {
    listen 80 default_server;

    location / {
      resolver 8.8.8.8;
      proxy_pass https://dummyapi.online;
    }
  }
}
```

## Contributing
Contributions are welcome! Feel free to open issues or submit pull requests.