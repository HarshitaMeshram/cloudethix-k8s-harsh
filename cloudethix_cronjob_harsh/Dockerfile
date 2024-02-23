FROM python:3.7-alpine

# Add user group and assign user to that group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Create working directory
WORKDIR /app

# Copy Python script to the container folder app
COPY helloworld.py /app/helloworld.py
RUN chmod +x /app/helloworld.py

# Set user as appuser
USER appuser

# Set the entry point
ENTRYPOINT ["python", "/app/helloworld.py"]
