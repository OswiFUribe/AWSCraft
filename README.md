# Del laboratorio a la nube: AWS, DevOps y un servidor de Minecraft :cloud:

**Duración**: 2 horas  
**Objetivo**: En este taller aprenderás a crear y gestionar un servidor de Minecraft en la nube usando **AWS**, **GitHub** y **Linux**. A lo largo del taller, también aprenderás los fundamentos de **CI/CD** (Integración Continua / Entrega Continua) y cómo usar herramientas de desarrollo colaborativo como **Git**.

### Requisitos Previos

Para este taller, necesitas:

- **Cuenta de GitHub**: Debes tener una cuenta en GitHub para clonar el repositorio y colaborar en los cambios.
- **Acceso a AWS**: Usarás una cuenta AWS proporcionada por el instructor para crear instancias EC2 y gestionar los recursos en la nube.
- **Conocimientos previos**: No se requiere experiencia previa en programación o en la nube, pero se recomienda que tengas conocimientos básicos de **Linux** y **Git**.

### Pasos de Instalación y Configuración

1. **Clonar el repositorio**  
    Clona el repositorio en tu instancia EC2 o máquina local:
    ```bash
    git clone https://github.com/OswiFUribe/AWSCraft
    cd AWSCraft
    ```

2. **Configurar la instancia EC2**  
    - Crea una instancia EC2 en AWS y configúrala con Amazon Linux 2.
    - Asegúrate de crear un Security Group que permita acceso SSH y al puerto 25565 (para Minecraft).
    - Si es necesario, asigna una IP elástica para que la IP no cambie.

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

5. **Verificar el servidor**  
    Conéctate a tu servidor de Minecraft usando la IP pública de tu instancia EC2 en el cliente de Minecraft.

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
