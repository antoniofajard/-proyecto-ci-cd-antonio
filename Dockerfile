# Usamos una imagen que ya tiene Python instalado
FROM python:3.9-slim

# Instalamos Flask (lo que necesita tu app.py)
RUN pip install flask

# Copiamos tu archivo app.py dentro del contenedor
COPY app.py /app.py

# Exponemos el puerto que usa tu código
EXPOSE 5000

# El comando para arrancar la aplicación
CMD ["python", "/app.py"]
