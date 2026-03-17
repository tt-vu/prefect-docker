FROM python:3.11-slim

WORKDIR /app

# Install deps
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Install Prefect
RUN pip install prefect

# Set Prefect API (use Cloud or local server)
ENV PREFECT_API_URL=http://host.docker.internal:4200/api

# Start worker when container runs
CMD ["prefect", "worker", "start", "--pool", "my-pool"]
