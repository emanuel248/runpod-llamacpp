# Docker Image README

This Docker image is designed to serve a model in GGUF format using a web server. It requires two environment variables to be provided during container instantiation:

1. `MODEL_URL`: The URL pointing to the model file in GGUF format.
2. `PUBLIC_KEY`: Your public key, which is used for accessing the container.

## Usage

### Pulling the Docker Image

You can pull the Docker image using the following command:

```bash
docker pull <image_name>:<tag>

## Running the container

docker run -d \
    -e MODEL_URL=<model_url> \
    -e PUBLIC_KEY=<your_public_key> \
    <image_name>:<tag>

