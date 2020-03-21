FROM node:alpine as builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# nginx starts automatcally - default cmd of base image
# /usr/share/nginx/html is nginx static content dir
