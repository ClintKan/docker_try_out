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

# Define the entrypoint for gunicorn
ENTRYPOINT ["gunicorn"]

# Run command when container launches
CMD ["-b", ":5000", "--access-logfile", "-", "--error-logfile", "-", "microblog:app"]

# To create the image - first - note the dot at the end indicates path
# docker build -t cytry_img .

# Then to create the container that would have the app
# docker run -d -ti -p 5000:5000 --name dckr_try_site cytry_img