# Simple Dockerfile for running n8n
FROM n8nio/n8n:latest

# Expose default port
EXPOSE 5678

# Use the official n8n image; environment variables are set at deploy time.
# For local development, use the provided docker-compose.yml
