# Use an official Python image as base
FROM python:3.11

# Set working directory to /app
WORKDIR /app

# Copy application code
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Run command when container launches
CMD ["exec", "gunicorn", "-b", ":5000", "--access-logfile", "-", "--error-logfile", "-", "microblog:app"]