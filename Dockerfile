# Use an official Python image as base
FROM python:3.11

# Set working directory to /app
WORKDIR /cyberdckr_app

# Copy application code
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Run command when container launches
CMD ["gunicorn", "-b", ":5000", "--access-logfile", "-", "--error-logfile", "-", "microblog:app"]


# To create the image - first - note the dot at the end indicates path
# docker build -t urlshort_img .

# Then to create the container that would have the app
# docker run -d -ti -p 80:8000 --name Ibra_site urlshort_img