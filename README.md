# Keplergl-Jupyter Docker Image

This repository contains a Dockerfile for building a Docker image with Keplergl-Jupyter. The latest version of Keplergl-Jupyter docker image is automatically updated by GitHub Actions.

The latest version is [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/lixun910/keplergl-jupyter?sort=semver)](https://hub.docker.com/r/lixun910/keplergl-jupyter)

## Usage

To use the Keplergl-Jupyter docker image, you can run the following command:

Run the docker under your notebook directory

```bash
docker run -v $(pwd):/notebooks --rm -p 8888:8888/tcp lixun910/keplergl-jupyter:latest
```

Run your notebooks in browser with the token which you can see in the terminal or log e.g.

```bash
http://127.0.0.1:8888/tree?token=f5be411ce5567b49baaaa80977f100aa4819d61fd66d3559
```


## Build Docker Image

To build the Docker image, run the following command:

```bash
docker build -t keplergl-jupyter .
```
