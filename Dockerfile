FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY SongsMasterGrid.csv SongsMasterGrid.csv
COPY app/ app/     # ⬅️ The fix: directly copy the `app/` folder

CMD ["python", "main.py"]
