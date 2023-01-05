FROM node:alpine

# Crea un directorio para la aplicación y establece como directorio de trabajo
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Instala las dependencias
COPY package.json /usr/src/app/
RUN npm install

# Copia la aplicación a la imagen de Docker
COPY . /usr/src/app

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl -f http://localhost:3000 || exit 1
# Expone el puerto de la aplicación
EXPOSE 3000

# Inicia la aplicación
CMD ["npm", "start"]
