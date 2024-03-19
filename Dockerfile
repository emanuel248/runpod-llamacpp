FROM runpod/pytorch:2.2.0-py3.10-cuda12.1.1-devel-ubuntu22.04

RUN mkdir /code
WORKDIR /code
RUN git clone https://github.com/ggerganov/llama.cpp.git

WORKDIR /code/llama.cpp
COPY ./devops/runmodel.sh runmodel.sh

ENV MODEL_URL="https://huggingface.co/TheBloke/Mistral-7B-Instruct-v0.2-GGUF/resolve/main/mistral-7b-instruct-v0.2.Q6_K.gguf?download=true"
EXPOSE 9009

CMD ["./runmodel.sh", "/workspace/model.gguf"]
