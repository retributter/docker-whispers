# Whispers App

This repository contains a setup for running the [Whisper](https://github.com/openai/whisper) application inside a Docker container. The setup uses Python 3.12-slim and installs necessary dependencies such as `ffmpeg` for media handling.

## Prerequisites

Ensure you have Docker and Docker Compose installed on your machine:

- [Install Docker](https://docs.docker.com/get-docker/)
- [Install Docker Compose](https://docs.docker.com/compose/install/)

## Project Structure

```bash
.
├── app/                 # Your app directory with source code
├── docker-compose.yml   # Docker Compose file to manage services
├── Dockerfile           # Dockerfile for building the image
```

## Getting Started

### Clone the repository

```bash
git clone https://github.com/retributter/docker-whispers.git && \
cd docker-whispers
```

### Volume's already mounted!

Just move to the ./app folder the files you want to transcribe! It will be automounted on the container,
learn more about ["Volumes in docker"](https://docs.docker.com/engine/storage/volumes/): 

### Build and run the Docker Container
```bash
docker-compose up -d
```

### Access the container
```bash
docker exec -it whispers bash
```

## Configuration

- Platform: This setup is for the linux/amd64 architecture.
- Non-root user: The application runs as a non-root user for better security practices. The user whispers is created and used for running the application.

## License

- Apache License