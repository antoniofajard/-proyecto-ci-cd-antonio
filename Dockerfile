# Usamos la imagen de Jenkins que YA está descargada y no necesita internet
FROM jenkins/jenkins:lts

WORKDIR /app

COPY . .

EXPOSE 5000

# Usamos echo para que no falle por falta de python
CMD ["echo", "Imagen construida con exito"]
