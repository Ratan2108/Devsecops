
FROM node:20-alpine AS builder


WORKDIR /app


COPY backend/package*.json ./
RUN npm install --only=production


COPY backend/ .


FROM node:20-alpine


RUN addgroup appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=builder /app /app


RUN chown -R appuser:appgroup /app


USER appuser


EXPOSE 3000


CMD ["node", "app.js"]