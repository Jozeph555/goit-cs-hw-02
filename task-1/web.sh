#!/bin/bash

# Список вебсайтів
websites="https://google.com https://facebook.com https://x.com"
webarray=($websites)

# Перевірка чи існує файл логів
touch website_status.log

# Додаємо заголовок з датою
echo "Status check - $(date)" >> website_status.log

# Перевірка доступності кожного сайту
for site in "${webarray[@]}"; do
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    status=$(curl -L -o /dev/null -s -w "%{http_code}" $site)

    if [ $status -eq 200 ]; then
        message="UP"
    else
        message="DOWN"
    fi

    echo "[$timestamp] $site is $message" >> website_status.log
done

echo "The results have been recorded to the 'website_status.log' file."
