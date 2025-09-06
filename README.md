# Del laboratorio a la nube: AWS, DevOps y un servidor de Minecraft :cloud:

**Duración**: 2 horas  
**Objetivo**: En este taller aprenderás a crear y gestionar un servidor de Minecraft en la nube usando **AWS**, **GitHub** y **Linux**. A lo largo del taller, también aprenderás los fundamentos de **CI/CD** (Integración Continua / Entrega Continua) y cómo usar herramientas de desarrollo colaborativo como **Git**.

## Requisitos Previos

Para este taller, necesitas:

- **Cuenta de GitHub**:  
  Si no tienes una cuenta de GitHub, [crea una aquí](https://github.com/join). GitHub es fundamental para la colaboración en proyectos, ya que nos permite gestionar versiones de código y trabajar de manera eficiente en equipo.
- **Acceso a AWS**:  
  Necesitarás una cuenta en **Amazon Web Services (AWS)** para crear y gestionar instancias EC2. Si aún no tienes una cuenta, puedes seguir este [tutorial sobre cómo crear una cuenta de AWS](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/).

- **Conocimientos previos**: No se requiere experiencia previa en programación o en la nube, pero se recomienda que tengas conocimientos básicos de **Linux** y **Git**.

### Pasos de Instalación y Configuración

1. **Configurar la instancia EC2**  
#### Seleccionar una instancia EC2

Cuando crees una instancia EC2 en AWS, elige el tipo de instancia que mejor se ajuste a tus necesidades. Aquí tienes una guía rápida para seleccionar la instancia adecuada para este taller, considerando tamaño, precio y uso de recursos.

#### Crear una instancia EC2 con Amazon Linux 2

1. Dirígete a la consola de AWS EC2 y selecciona **Launch Instance**.
2. Elige **Amazon Linux 2** como sistema operativo.
3. En el **Security Group**, agrega reglas para permitir el acceso:
    - **SSH** (puerto 22)
    - **Minecraft** (puerto 25565)
4. Si deseas una IP estática, asigna una **Elastic IP** a tu instancia para evitar que la IP cambie.

#### Tipos de instancias recomendadas

A continuación, se muestran las instancias más recomendadas para levantar tu servidor de Minecraft con buen rendimiento y precio accesible:

| Instancia   | vCPUs | RAM    | Precio aprox. por hora (us-west-2) | Uso recomendado                               |
|-------------|-------|--------|-------------------------------------|-----------------------------------------------|
| t3.micro    | 2     | 1 GB   | ~$0.0104                           | Bajo tráfico, pruebas, servidores pequeños    |
| t3.small    | 2     | 2 GB   | ~$0.0208                           | Grupos pequeños (1-5 jugadores)               |
| t3.medium   | 2     | 4 GB   | ~$0.0416                           | Grupos medianos (5-10 jugadores)              |
| t3.large    | 2     | 8 GB   | ~$0.0832                           | Tráfico moderado (10-20 jugadores)            |
| t3.xlarge   | 4     | 16 GB  | ~$0.1664                           | Tráfico alto o más de 20 jugadores            |

**Recomendación:**  
Para este taller, utiliza la instancia **t3.small**. Si necesitas mayor rendimiento (más jugadores o mods), puedes optar por **t3.medium** o **t3.large**.

> [!NOTE]
> - Si solo necesitas probar el servidor para pocos jugadores, la **t3.micro** puede ser suficiente.  
> - Las instancias **t3** son de uso general y adecuadas para aplicaciones como Minecraft.

#### Configurar el Security Group

Asegúrate de agregar las siguientes reglas en tu Security Group:

- **SSH (Puerto 22):** Para conectarte a la instancia EC2.
- **Minecraft (Puerto 25565):** Para permitir a los jugadores conectarse a tu servidor.

#### Asignar una IP elástica (opcional):
Si deseas que tu IP pública no cambie al reiniciar la instancia, puedes asignar una Elastic IP. Esto es útil si no quieres perder el acceso a tu servidor cuando la instancia se detenga y se inicie nuevamente.

Pasos para asignar una Elastic IP:

1. En la consola de EC2, ve a Elastic IPs en el menú de la izquierda.

2. Haz clic en Allocate Elastic IP address.

3. Luego, asocia la IP elástica a tu instancia EC2.

Para obtener más información sobre Elastic IPs, consulta la [documentación de AWS sobre Elastic IP](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/elastic-ip-addresses-eip.html).

2. **Clonar el repositorio**  
Clona el repositorio en tu instancia EC2 o máquina local:
```bash
sudo yum install -y git
git clone https://github.com/OswiFUribe/AWSCraft
cd AWSCraft
```

3. **Ejecutar el script `install_minecraft.sh`**  
Una vez que tengas la instancia EC2 funcionando, ejecuta el siguiente script para instalar Java 21 y Fabric:
```bash
cd setup/
chmod +x install_minecraft.sh
./install_minecraft.sh
```

4. **Iniciar el servidor de Minecraft**  
Navega a la carpeta `minecraft-server` y ejecuta el servidor con el siguiente comando:
```bash
cd ~/minecraft-server
./run.sh
```
El servidor debería iniciarse y estar listo para aceptar conexiones.

> [!NOTE]
> - Este archivo está adaptado para la versión actual de Minecraft (1.21.8) y su versión de Fabric correspondiente. Si en el futuro hay nuevas versiones, es posible que necesites actualizar las URLs de descarga en el script `install_minecraft.sh`, para ello, puedes referirte al siguiente [archivo](setup/README.md) para más detalles.

1. **Verificar el servidor**  
Conéctate a tu servidor de Minecraft usando la IP pública de tu instancia EC2 en el cliente de Minecraft, la cual puedes encontrar en la consola de AWS.

### Flujo de Trabajo con Git

1. **Crear una rama**  
Crea una nueva rama para trabajar en tu tarea (por ejemplo, añadir el nombre del equipo):
```bash
git checkout -b equipo1
```

2. **Modificar el README.md**  
Abre el archivo `README.md` y agrega el nombre de tu equipo y los miembros del mismo.

3. **Hacer un Commit y Push**  
Realiza un commit con los cambios que hiciste y sube tu rama al repositorio:
```bash
git add README.md
git commit -m "Añadido nombre del equipo y miembros"
git push origin equipo1
```

4. **Abrir un Pull Request**  
Crea un Pull Request (PR) en GitHub desde tu rama hacia `main`. Usa la plantilla proporcionada para asegurarte de que el PR esté bien documentado.

### Flujo de CI/CD

Este repositorio tiene un flujo de CI/CD integrado que valida automáticamente tus cambios:

- **CI**: Cada PR es validado con un flujo que verifica:
  - Si modificaste el archivo `README.md`.
  - Si creaste la carpeta `minecraft-server`.
- **CD**: Cuando tu PR se fusiona con `main`, el flujo de CD empaqueta el código y lo sube como un artifact descargable.

### Aplicaciones Reales y la Nube

El uso de la nube tiene muchas aplicaciones en proyectos de ciencia e ingeniería. Algunas áreas donde podrías aplicar lo aprendido incluyen:

- **Simulaciones científicas**: Usar AWS para correr simulaciones complejas en física o química.
- **Análisis de datos**: Gestionar grandes volúmenes de datos, como en proyectos de biomedicina o física experimental.
- **Despliegue de servidores**: Levantar servicios o aplicaciones en la nube, como el servidor de Minecraft, que puede ser utilizado para proyectos educativos o colaborativos.

### Conclusión

¡Felicidades! Ahora has aprendido a:

- Crear y configurar instancias EC2 en AWS.
- Usar GitHub para trabajar de manera colaborativa en proyectos.
- Levantar y gestionar un servidor de Minecraft en la nube.

La nube tiene un potencial enorme para todo tipo de proyectos científicos, de ingeniería y más. Las habilidades que has adquirido te permitirán aplicar estos conceptos a futuros proyectos reales.

---
### :writing_hand: Autor
- Nombre: Oswaldo Emmanuel Fonseca Uribe
- LinkedIn: [Oswaldo Fonseca](https://www.linkedin.com/in/oswaldo-emmanuel-fonseca-uribe-9593ba21b/)

---
### :lock: Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo [LICENSE](./LICENSE) para más detalles.
