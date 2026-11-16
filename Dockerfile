# Single build stage; docker-compose.dev.yml uses `target: dev` for
# the hot-reload development setup (nodemon + bind mount).
FROM node:20-alpine AS dev
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
EXPOSE 5000
CMD ["node", "server.js"]
