FROM python:3.15-rc-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["sh", "-c", "gunicorn --bind ${APP_HOST:-0.0.0.0}:${APP_PORT:-5000} app:app"]
