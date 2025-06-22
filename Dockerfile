FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "-c", "import os, sys; print('PWD:', os.getcwd()); print('DIRS:', os.listdir()); print('PYTHONPATH:', sys.path); import app; print('app imported successfully')"]
