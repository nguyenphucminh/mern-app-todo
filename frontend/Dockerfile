FROM node:20

WORKDIR /app

ARG REACT_APP_BE_API_URL
ENV REACT_APP_BE_API_URL=$REACT_APP_BE_API_URL

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "start"]