# USO BASE DE DATOS ENAHO PERÍODO 2018 - 2022

Este repositorio contiene un DO file para Stata que permite el uso y análisis de los datos de la Encuesta Nacional de Hogares (ENAHO) en formato panel para el período 2018 - 2022. La metodología ha sido actualizada para asegurar la precisión y eficiencia en el manejo de los datos.

## Características Principales

- Acceso y manejo de datos de la ENAHO para el período 2018 - 2022.
- Metodología actualizada para el análisis de datos en panel.
- Incluye un DO file específico para Stata 17 MP.
- Proceso automatizado para descargar, descomprimir y seleccionar los archivos `.dta` desde la página del INEI.
- Eliminación automática de archivos extra y movimiento de archivos `.dta` a la carpeta `dta`.

## Requisitos Previos

Para utilizar este proyecto, necesitarás:

- Stata 17 MP
- Conexión a internet para descargar los datos desde la página del INEI
- Sistema operativo Windows, preferiblemente versión 10 u 11

## Instrucciones de Instalación

1. Asegúrate de tener instalado Stata 17 MP en tu sistema.
2. Descarga o clona este repositorio en tu máquina local:

    ```bash
    git clone https://github.com/ManuelDF2398/ENAHO-DATA.git
    ```

3. Navega al directorio del proyecto:

    ```bash
    cd ENAHO-DATA
    ```

4. Abre Stata y ejecuta el DO file proporcionado:

    ```stata
    do enaho_base1.do
    ```

## Ejemplos de Uso

Para utilizar el DO file y comenzar a trabajar con los datos de la ENAHO, sigue estos pasos básicos:

1. Asegúrate de estar en el directorio correcto dentro de Stata.
2. Ejecuta el DO file siguiendo las instrucciones de instalación.
3. Los datos se descargarán, descomprimirán y seleccionarán automáticamente. Los archivos `.dta` se moverán a la carpeta `dta`, y los archivos extra serán eliminados.

## Contribuciones

Las contribuciones a este proyecto son bienvenidas. Si deseas contribuir, por favor sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una rama para tu funcionalidad (`git checkout -b feature-nueva-funcionalidad`).
3. Haz commit de tus cambios (`git commit -m 'Añadir nueva funcionalidad'`).
4. Sube tus cambios a tu fork (`git push origin feature-nueva-funcionalidad`).
5. Crea un Pull Request en GitHub.

## Licencia

Todo el contenido de este repositorio ha sido creado por Manuel Antonio Díaz Flores. El uso de este material es exclusivamente basado en la [licencia](LICENSE.md) con fines educacionales e investigativos.

## Código de Conducta

Este proyecto sigue el [Código de Conducta](CODE_OF_CONDUCT.md). Al participar, te pedimos que respetes estas directrices para asegurar un ambiente colaborativo y positivo para todos.

## Contacto

Para más información o consultas, puedes contactarme a través de mi WhatsApp: +51 983693233, correo electrónico a20224187@pucp.edu.pe, o mediante GitHub https://github.com/ManuelDF2398
