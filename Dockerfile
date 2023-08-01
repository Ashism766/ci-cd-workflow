FROM node:16-alpine as builder

WORKDIR /app

COPY ./package.json .

RUN npm install

COPY ./ ./

RUN npm run build


# build folder location inside container ./app/build

## NGINX run phase

## Just putting second FROM state we are terminating previous block

FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html
