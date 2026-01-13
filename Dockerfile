# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy source code
COPY app.py .

# Run the app
CMD ["python", "app.py"]
