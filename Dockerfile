FROM python:3.12.10-slim

# Enable system-wide access
ENV ALLOW_SYSTEM_ACCESS=true

WORKDIR /app

# Copy the necessary requirements files
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY server.py .

# Define a volume for persistent data
VOLUME /app/data

# Expose the port the server runs on
EXPOSE 8050

# Command to run the server
CMD ["uv", "run", "server.py", "--transport", "sse", "--host", "0.0.0.0", "--port", "8050"]