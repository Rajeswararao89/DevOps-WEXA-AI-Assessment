FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci


COPY . .
RUN npm run build


FROM node:18-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package*.json ./

EXPOSE 3000

CMD ["npm", "run", "start"]
