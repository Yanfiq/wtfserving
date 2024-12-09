# Use TensorFlow Serving as the base image
FROM tensorflow/serving:latest

# Set model path
ENV MODEL_BASE_PATH=/models/model_bert-en-uncased-l-12-h-768-a-12
ENV MODEL_NAME=model_bert-en-uncased-l-12-h-768-a-12

# Copy model from GCP bucket (optional: include wget/gsutil commands if downloading at build time)
RUN apt-get update && apt-get install -y wget
RUN mkdir -p ${MODEL_BASE_PATH}
RUN wget -O model.tar.gz https://0.0.0.0:9000/model_bert-en-uncased-l-12-h-768-a-12.tar.gz
RUN tar -xzf model.tar.gz -C ${MODEL_BASE_PATH} --strip-components=1 && rm model.tar.gz

# TensorFlow Serving will automatically serve models from the path defined in MODEL_BASE_PATH

