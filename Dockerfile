FROM node.js 16-alpine

WORKDIR /app

COPY package*.json

RUN npm ci --omit=dev

COPY . .

EXPOSE 3000

CMD ["node", "index.js"]

