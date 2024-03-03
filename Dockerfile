# Dockerfile for monitoring main.py using New Relic and deploying on Google Cloud Run
# Replace "main.py" with your actual Python script name

# Use the official Python image as the base image
FROM python:3.8-slim

# Set environment variables for New Relic
ENV NEW_RELIC_LICENSE_KEY=cf78c4a85fde596c802f43481f9bf4fdFFFFNRAL
ENV NEW_RELIC_APP_NAME=uat_log_tester

# Install New Relic Python agent
RUN pip install flask
RUN pip install newrelic

# Set working directory
WORKDIR /app

# Copy the Python script to the container
COPY main.py .

# Expose the port on which the application will run (if applicable)
EXPOSE 8080

# Run the New Relic agent and the Python script
CMD newrelic-admin run-program python main.py

