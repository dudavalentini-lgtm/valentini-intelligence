FROM node:20-bookworm-slim
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev
COPY src ./src
RUN mkdir -p /data/cache
ENV NODE_ENV=production
CMD ["npm","start"]
