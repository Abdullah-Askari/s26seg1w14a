FROM node:alpine AS build-stage
WORKDIR /web-app
COPY package*.json .
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build-stage /web-app/dist /usr/share/nginx/html