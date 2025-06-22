FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ app/
COPY SongsMasterGrid.csv SongsMasterGrid.csv

# Make sure Python can find `app` as a package
ENV PYTHONPATH=/app

CMD ["python", "-m", "app.main"]
