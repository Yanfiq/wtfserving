# Use TensorFlow Serving's official image as the base
FROM tensorflow/serving:latest

# Set the working directory (optional)
WORKDIR /app

# Copy the model config file into the container
COPY models.config /app/

# Expose TensorFlow Serving's ports
EXPOSE 8500
EXPOSE 8501
EXPOSE 8080

# Run TensorFlow Serving with the model config file
CMD ["tensorflow_model_server", "--port=8500", "--rest_api_port=8501", "--model_config_file=/app/models.config"]
