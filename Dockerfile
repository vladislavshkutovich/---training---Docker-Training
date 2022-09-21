# Создаем образ от ноды
FROM node

# Задаем рабочую директорию для образа
WORKDIR /app

# Копируем файл конфигурации зависимостей
COPY package.json /app

# Запускаем инсталяцию пакетов согласно package.json
RUN npm install

# Копируем все оставшиеся элементы (чтобы не копировать node_modules каждый раз)
COPY . .

ENV PORT 4200

# Задаем порт для localhost
EXPOSE $PORT

# Задаем папку для складывания данных, которые не хотим проебать
VOLUME [ "/app/data" ]

# Запускаем файл app.js, основанный на node
CMD ["node", "app.js"]
