# Базовий образ
FROM python:3.10-slim

# Встановимо змінні середовища
ENV APP_HOME=/app \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8000

# Встановимо робочу директорію
WORKDIR $APP_HOME

# Встановимо системні залежності
RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Скопіюємо тільки requirements.txt спочатку
COPY requirements.txt .

# Встановимо Python залежності
RUN pip install --no-cache-dir -r requirements.txt

# Скопіюємо всі інші файли зберігаючи структуру
COPY . .

# Позначимо порт
EXPOSE $PORT

# Запустимо застосунок
CMD ["python", "main.py"]
