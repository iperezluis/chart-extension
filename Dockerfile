FROM node:alpine

# Crea un directorio para la aplicación y establece como directorio de trabajo
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Instala las dependencias
COPY package.json /usr/src/app/
RUN npm install

# Copia la aplicación a la imagen de Docker
COPY . /usr/src/app

# Expone el puerto de la aplicación
EXPOSE 3000

# Inicia la aplicación
CMD ["npm", "start"]
