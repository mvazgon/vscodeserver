# vscodeserver
Repo para dockerfile para gestionar la construcción de un servicio basado en vscode via web.
## Introducción
Con este repo conseguimos el conocimiento necesario, inicial, para poder desplegar esta herramienta (vscoder-server) usando docker y en un futuro cercano también Kubernetes como un deploy.
La construcción del Dockerfile se dan estos pasos:
1. creamos un usuario no privilegiado, 
2. actualizamos los repositorios de la distro para poder usar otras herramientas
3. descargamos el paquete de instalación para la distro
4. realizamos el proceso de instalación
5. Cambiamos al usuario no privilegiado, 
6. iniciamos el servicio 
## Mecanismo de arranque
Para arrancar el servicio en un contenedor hemos decidido realizar los siguientes parámetros:
1. en la imagen obligamos a que el servicio se ejecute con los siguientes parámetros: que la conexión sea por SSL, que el servicio se publique en cualquier IP, y que se exiga un password para acceder al servicio
2. en el contenedor establecemos que: el servicio corra en segundo plano, que se vincule el puerto del contenedor al mismo puerto del host, establecemos un password de accceso "hardcodeado", y el nombre del contenedor relacionado con el de la imagen
## TODO
Estableceremos varias cuestiones:
1. los certificados serán: un wildcard de FQDN, firmados por una entidad externa y tendrán una validez de al menos 3 meses(let's encrypt)
2. el password será generado al vuelo y comunicado al usuario via correo electrónico
3. el puerto del host será calculado y se enviará al usuario via correo elecrónico la URL de acceso
