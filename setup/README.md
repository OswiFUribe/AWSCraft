# Guía de Configuración para el Script `install_minecraft.sh`

Este directorio contiene el script `install_minecraft.sh`, el cual automatiza la instalación de **Java 21** y **Fabric** para configurar un servidor de Minecraft en una instancia EC2 de AWS.

## Objetivo

El propósito de este script es facilitar el proceso de instalación de **Java**, **Fabric** y la configuración del servidor de **Minecraft** en la nube, permitiendo a los estudiantes configurar su servidor con unos pocos comandos. 

### Estructura del Script

El script `install_minecraft.sh` realiza las siguientes tareas:

1. **Instalar Java 21 (OpenJDK 21)**:  
   El script descarga e instala **OpenJDK 21** desde [Adoptium](https://adoptium.net/), que es la versión requerida para ejecutar Minecraft con Fabric.

2. **Descargar e instalar Fabric**:  
   Se descarga la versión más reciente de **Fabric** y se configura como el servidor de Minecraft.

3. **Configuración inicial del servidor**:
   - Crea la carpeta `minecraft-server`.
   - Descarga los archivos necesarios para correr el servidor de Minecraft.
   - Acepta automáticamente el **EULA** de Minecraft.
   - Crea un script para ejecutar el servidor (`run.sh`).

4. **Finalización**:  
   Una vez instalado todo, el script deja el servidor listo para ser ejecutado con el comando `./run.sh`.

## Personalización y Modificaciones

Si deseas personalizar el script para futuras versiones, o si necesitas hacer ajustes a la instalación, puedes modificar el script `install_minecraft.sh` de la siguiente manera:

### 1. **Cambiar la versión de Java**
Si en el futuro se requiere una versión diferente de **Java**, puedes modificar la URL de descarga de **OpenJDK** en el script. Por ejemplo, para cambiar a una nueva versión de Java, solo actualiza la URL de descarga:

```bash
# Actualiza la URL para descargar una nueva versión de OpenJDK
wget https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21%2B35/OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
```

Asegúrate de cambiar también el nombre del directorio después de descomprimir el archivo, para que coincida con la nueva versión:

```bash
# Cambia el nombre si la nueva versión de JDK tiene un nombre distinto
sudo mv jdk-21+35 /opt/
```

### 2. Modificar la instalación de Fabric

Si necesitas cambiar la versión de Fabric (por ejemplo, para una nueva versión de Minecraft), actualiza el enlace de descarga en el script. Asegúrate de que sea la URL más reciente de Fabric para la versión de Minecraft que quieras usar:

```bash
# Actualiza la URL de descarga de Fabric
curl -sSLO https://meta.fabricmc.net/v2/versions/loader/1.21.1/0.16.9/1.0.1/server/jar
```

Reemplaza la versión y el enlace según sea necesario.

3. Ajustar la configuración del servidor de Minecraft

```bash
# Modificar la configuración del servidor de Minecraft
nano minecraft-server/server.properties
```

Si deseas cambiar configuraciones adicionales del servidor, como los valores de memoria (Xmx y Xms), puedes modificar la línea que ejecuta el servidor de Minecraft en el script run.sh:

```bash
# Modificar el script para asignar más memoria (por ejemplo, 4GB)
java -Xmx4G -Xms2G -jar fabric-server-launch.jar nogui
```

### 4. Agregar dependencias adicionales

Si en el futuro necesitas agregar más dependencias o librerías (por ejemplo, si el servidor requiere algún otro software), puedes añadir las líneas necesarias en el script install_minecraft.sh. Por ejemplo:

```bash
# Instalar herramientas adicionales (si es necesario)
sudo yum install -y <paquete-adicional>
```

Cómo Ejecutar y Modificar el Script

Clonar el repositorio:

```bash
git clone https://github.com/OswiFUribe/AWSCraft
cd AWSCraft/setup
```

Dar permisos de ejecución al script:
```bash
chmod +x install_minecraft.sh
```

Ejecutar el script para instalar Java y Fabric:

```bash
./install_minecraft.sh
```

## Actualizaciones Futuras

Este script puede necesitar actualizaciones conforme a nuevas versiones de Minecraft, Java, o Fabric. Es importante que revises las notas de versión de estas herramientas para mantener el servidor actualizado y funcionando correctamente.

Si tienes dudas sobre cómo personalizar el script o agregar nuevas funcionalidades, ¡no dudes en contactarme!

## Estructura del archivo `install_minecraft.sh`

Recuerda que este archivo contiene los pasos esenciales para configurar tu servidor. Si deseas aprender más sobre cómo cada parte funciona, revisa el código del script y experimenta con las modificaciones.