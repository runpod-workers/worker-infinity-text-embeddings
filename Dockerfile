ARG WORKER_CUDA_VERSION=11.8.0
FROM runpod/base:0.6.1-cuda${WORKER_CUDA_VERSION}


# Python dependencies
COPY builder/requirements.txt /requirements.txt
RUN python3.11 -m pip install --upgrade pip && \
    python3.11 -m pip install --upgrade -r /requirements.txt --no-cache-dir && \
    rm /requirements.txt

ENV SENTENCE_TRANSFORMERS_HOME=/runpod-volume

# Add src files (Worker Template)
ADD src .

CMD python3.11 -u /handler.py
