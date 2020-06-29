#!/bin/bash
#Por: Alejgg

#INICIO
echo "SISTEMA PARA ARCHIVAR Y COMPRIMIR DIRECTORIOS CON TAR"

#FUNCIONES
function saludo {
    echo "Que es lo que quieres hacer?"
}

function Verificar {
    echo "Introduce la direccion de la carpeta: "
    read carpeta
if [ -d "$carpeta" ]; then
    echo "Se ingreso la siguiente direccion: $carpeta"
else
    echo "El valor ingresado no es un directorio"
    exit
fi
}
function Datos {
    echo "Introduce tu nombre de usuario:"
    read usr
    echo "La ruta a utilizar para guardar el archivo sera /home/$usr/"
    echo "Como se llamara tu respaldo?"
    read respaldo
}
function Archivar {
    Verificar
    Datos
    tar -cvf "/home/$usr/$respaldo.tar" $carpeta
    echo "Respaldo Efectuado con exito en /home/$usr/$respaldo.tar"
}
function Comprimir {
    Verificar
    Datos
    comprimir="gzip bzip xz Salir"
    echo "Opciones para comprimir: "
    select comprimir in $comprimir
    do
        if [ $comprimir = "gzip" ]; then
            tar -cvzf "/home/$usr/$respaldo.tar.gz" $carpeta
            echo "Respaldo Efectuado con exito en /home/$usr/$respaldo.tar.gz"
        elif [ $comprimir = "bzip" ]; then
            tar -cvjf "/home/$usr/$respaldo.tar.bz2" $carpeta
            echo "Respaldo Efectuado con exito en /home/$usr/$respaldo.tar.bz2"
        elif [ $comprimir = "xz" ]; then
            tar -cvJf "/home/$usr/$respaldo.tar.xz" $carpeta
            echo "Respaldo Efectuado con exito en /home/$usr/$respaldo.tar.xz"
        elif [ $comprimir = "Salir" ]; then
            echo "Hasta la proxima"
            exit      
        else
            echo "Opcion no valida"
        fi
    done

}

function Zip {
    Verificar
    Datos
    zip -r "/home/$usr/$respaldo.zip" $carpeta
    echo "Directorio guardado con Zip en /home/$usr/$respaldo.zip"
}
#ACCION
saludo
menu="Archivar Comprimir Zip Salir"
select menu in $menu
do 
    if [ $menu = "Archivar" ]; then
        Archivar
    elif [ $menu = "Comprimir" ]; then
        Comprimir 
    elif [ $menu = "Zip" ]; then
        Zip
    elif [ $menu = "Salir" ]; then
        echo "Hasta la proxima"
        exit     
    else
        echo "Opcion no valida"
    fi
    saludo
    echo "1)Archivar 2)Comprimir 3)Zip 4)Salir" 
done




