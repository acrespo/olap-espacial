# Trabajo Practico Especial - OLAP

## Introducción

Este repositorio contiene el código y los scripts necesarios para instalar y
ejecutar dos funciones de agregación: `ST_Intersects` y `ST_NearCentroid`, como
fue descripto en el enunciado (disponible en el repositorio como
`enunciado.pdf`).

## Instalación

### Linux Debian o Ubuntu

1. Instalar el motor de bases de datos postgresql y la extensión PostGIS, que
   añade funcionalidad para trabajar con datos geoespaciales.

        wget http://anonscm.debian.org/loggerhead/pkg-postgresql/postgresql-common/trunk/download/head:/apt.postgresql.org.s-20130224224205-px3qyst90b3xp8zj-1/apt.postgresql.org.sh
        chmod +x apt.postgresql.org.sh
        sudo ./apt.postgresql.org.sh

        sudo apt-get install postgres
        sudo apt-get install postgis

### Windows 64 bits

1. Instalar Postgres y Postgis:

    1.  PostgreSQL: [http://get.enterprisedb.com/postgresql/postgresql-9.2.4-1-windows-x64.exe]

    1.  Postgis: [http://download.osgeo.org/postgis/windows/pg92/postgis-pg92x64-setup-2.0.3-2.exe]

2. Crear una base de datos con posibilidad para usar PostGIS:

    1.   Ejecutar pgAdminIII
    1.   Utilizar pgAdminIII para crear una nueva base de datos, por ejemplo, `olap`.
    1.   Estando pgAdminIII conectado a esa base de datos, ejecutar el archivo
         `install.sql` que se encuentra en este repositorio

## Ejecucion de pruebas

### \*nix

1.  Ejecutar el script de bash `run_tests.sh`.

### Windows

1.  Ejecutar el script `test_st_intersects.sql` desde pgAdminIII para testear la
    funcion de agregación `ST_Intersects`.

2.  Ejecutar el script `test_st_nearcentroid.sql` desde pgAdminIII para testear la
    funcion de agregación `ST_NearCentroid`.
