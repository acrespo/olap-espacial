# Trabajo Practico Especial - OLAP

## Introducción

Este repositorio contiene el código y los scripts necesarios para instalar y
ejecutar dos funciones de agregación: `ST_Intersects` y `ST_NearCentroid`, como
fue descripto en el enunciado (disponible en el repositorio como
`enunciado.pdf`).

## Instalación

### Ubuntu 12.04 en adelante

1.  Instalar el motor de bases de datos postgresql y la extensión PostGIS, que
   añade funcionalidad para trabajar con datos geoespaciales.

        sudo apt-get install python-software-properties
        sudo apt-add-repository ppa:ubuntugis/ppa
        sudo apt-get update
        sudo apt-get install postgresql-9.1
        sudo apt-get install postgresql-9.1-postgis

    A partir de este momento, ejecutar los comandos como usuario con permisos
    para utilizar la base de datos (en Ubuntu 12.04 este usuario se llama
    `postgres` por defecto).

        sudo su postgres

2.  Crear una base de datos utilizando `createdb`. Por ejemplo:

        createdb olap

3.  Ejecutar `install.sh` con el nombre de la base de datos como argumento.
    Ejemplo:

        ./install.sh olap

4.  (Opcional) Ejecutar los tests para verificar la correcta instalación de las
    funciones:

        ./run_tests.sh olap


### Windows 64 bits

1. Instalar Postgres y Postgis:

    1.  PostgreSQL: [http://get.enterprisedb.com/postgresql/postgresql-9.2.4-1-windows-x64.exe]
    1.  Postgis: [http://download.osgeo.org/postgis/windows/pg92/postgis-pg92x64-setup-2.0.3-2.exe]

2. Crear una base de datos con posibilidad para usar PostGIS:

    1.   Ejecutar pgAdminIII
    1.   Utilizar pgAdminIII para crear una nueva base de datos, por ejemplo, `olap`.
    1.   Estando pgAdminIII conectado a esa base de datos, ejecutar el archivo
         `install.sql` que se encuentra en esta carpeta.

## Ejecucion de pruebas

### \*nix

1.  Ejecutar el script de bash `run_tests.sh`.

### Windows

1.  Ejecutar el script `test_st_intersects.sql` desde pgAdminIII para testear la
    funcion de agregación `ST_Intersects`.

2.  Ejecutar el script `test_st_nearcentroid.sql` desde pgAdminIII para testear la
    funcion de agregación `ST_NearCentroid`.
