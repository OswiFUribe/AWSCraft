#!/usr/bin/env bash
set -euo pipefail

# 1. Instalar dependencias necesarias (wget y tar)
echo "[INFO] Instalando dependencias..."
sudo yum install -y wget tar

# 2. Descargar e instalar Java 21 (OpenJDK 21)
echo "[INFO] Instalando OpenJDK 21..."
wget https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21%2B35/OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
tar -xvzf OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
sudo mv jdk-21+35 /opt/

# 3. Configurar las variables de entorno para Java 21
echo "[INFO] Configurando JAVA_HOME y PATH..."
echo "export JAVA_HOME=/opt/jdk-21+35" >> ~/.bash_profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bash_profile

# 4. Limpieza
echo "[INFO] Limpiando archivos temporales..."
rm -f OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz

# 5. Crear la carpeta para Minecraft y entrar en ella
echo "[INFO] Creando carpeta ~/minecraft-server"
mkdir -p minecraft-server/
cd minecraft-server/

# 6. Descargar Fabric server installer (versión 1.21.1 como ejemplo)
echo "[INFO] Descargando Fabric..."
curl --create-dirs -o "fabric-server-launch.jar" -sSLO https://meta.fabricmc.net/v2/versions/loader/1.21.8/0.17.2/1.1.0/server/jar

# 7. Aceptar EULA automáticamente
echo "[INFO] Aceptando EULA..."
echo "eula=true" > eula.txt

# 8. Crear un script para iniciar el servidor
echo "[INFO] Creando script para ejecutar el servidor..."
cat > run.sh <<'EOF'
#!/usr/bin/env bash
java -Xmx2G -Xms1G -jar fabric-server-launch.jar nogui
EOF
chmod +x run.sh



echo "[INFO] Instalación completa."
echo "Usa './run.sh' dentro de minecraft-server/ para iniciar el servidor."

source ~/.bash_profile
