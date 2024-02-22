# Utilizar una imagen de Python 3.9 delgada como base
FROM python:3.9-slim

# Establecer el directorio de trabajo en /app
WORKDIR /app

# Copiar el código de la aplicación a /app
COPY api.py .

# Instalar las dependencias de la aplicación
RUN pip install --no-cache-dir flask pymongo

# Exponer el puerto 5000 para la aplicación Flask
EXPOSE 5000

# Comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["python", "api.py"]





# Usar una imagen base de Python
#FROM python:3.9-slim

# Establecer el directorio de trabajo en /app
#WORKDIR /app

# Copiar el archivo de requerimientos y el código de la aplicación a /app
#COPY requeriments.txt .
#COPY api.py .

# Instalar las dependencias de la aplicación
#RUN pip install --no-cache-dir -r requeriments.txt

# Exponer el puerto 5000 para la aplicación Flask
#EXPOSE 5000

# Comando para ejecutar la aplicación cuando se inicie el contenedor
#CMD ["python", "api.py"]
