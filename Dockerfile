FROM node:alpine as image1

WORKDIR /app

COPY package.json .

RUN  npm install

COPY . . 

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=image1 /app/build /usr/share/nginx/html