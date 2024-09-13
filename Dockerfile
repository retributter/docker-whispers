FROM python:3.12-slim

ENV debian_frontend=noninteractive
# Use a non-root user for security
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ffmpeg && \
    apt upgrade -y && \
    rm -rf /var/lib/apt/lists/*

# Create custom user
RUN groupadd -r whispers && \
    useradd -m -r -g whispers whispers

WORKDIR /home/whispers

# Clone the repository and install dependencies
RUN git clone https://github.com/openai/whisper.git && \
    chown -R whispers:whispers whisper && \
    cd whisper && \
    pip install --no-cache-dir -r requirements.txt && \
    python setup.py install && \
    rm -rf /home/whispers/whisper

USER whispers

CMD ["sleep", "infinity"]