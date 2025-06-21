FROM python:3.11-slim

WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all required files explicitly
COPY SongsMasterGrid.csv SongsMasterGrid.csv
COPY app/ app/

CMD ["python", "app/main.py"]
