#! /bin/bash

echo "Introduzca usuario MySQL:"
read user

echo -n "Introduzca la contraseña de $user de MySQL: "
read clave

echo -n "Creando base de datos..."
if mysql -u root --password="$clave" < database.sql; then
  echo "*** Base de datos creada ***"
else
  echo "*** Se ha producido un error al crear la base de datos ***"
fi

echo "Realizando el despliegue de la aplicación... "

cd src/main/resources/META-INF/spring/
sed -i 's/database.username=/database.username='"$user"'/' database.properties
sed -i 's/database.password=/database.password='"$clave"'/' database.properties
cd ../../../../..

mvn tomcat7:run
