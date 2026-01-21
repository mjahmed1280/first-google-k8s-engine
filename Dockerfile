# base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Prevent Python from writing .pyc files and enable unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# FIX THE SECURITY VULNERABILITY
# Upgrading pip to 25.3+ handles the CVSS 5.9 warning you received
# RUN pip install --no-cache-dir --upgrade pip>=25.3
RUN pip install --no-cache-dir --default-timeout=100 --upgrade pip>=25.3

# system depend. and pip packages
COPY requirements.txt .

# Install depedencies
RUN pip install --no-cache-dir -r requirements.txt

# copy app code
COPY . .

# expose port 
EXPOSE 5000

# run the app
# CMD ["python","app.py"]
# Run with Gunicorn (4 workers recommended for small apps)
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5001", "app:app"]
