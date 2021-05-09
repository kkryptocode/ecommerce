FROM node:12.4.0-alpine as build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install
COPY . ./
EXPOSE 3002
RUN npm run development
#FROM nginx:1.17.0-alpine
#FROM duluca/minimal-node-web-server:lts-alpine

#WORKDIR /usr/src/app
#COPY --from=build app/dist/server.generated.js public
#CMD [ "node", "dist/server.generated.js" ]
CMD [ "npm", "start" ]





# Copy the react build from Stage 1
#COPY --from=build /app/dist /var/www

# Copy our custom nginx config
#COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80 to the Docker host, so we can access it 
# from the outside.
#EXPOSE 80

#ENTRYPOINT ["nginx","-g","daemon off;"]
