/* 
DO FILE CREADO POR MANUEL ANTONIO DÍAZ FLORES. TODOS LOS DERECHOS RESERVADOS.
ELABORADO PARA LA INVESTIGACIÓN EN CEPAL - ANÁLISIS DE DATOS PANEL DEL INEI, PERÍODO 2018-2022.
BACHILLER: UNIVERSIDAD NACIONAL DE TRUJILLO
MAESTRÍA: PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ
*/

* LIMPIAR TODO
clear all

/* -------------------------------
* Sección de Creación y Selección de Carpetas
* -------------------------------

* Establecer la carpeta principal
global main "F:\MANUEL\CEPAL\INVESTIGACION"

* Creando Carpetas
shell mkdir "Do Files"
shell mkdir "Data Base"
shell mkdir "Data Procesada"
shell mkdir "Graficas"

* Definir variables globales para las carpetas
global dos   "$main/Do Files"
global dta   "$main/Data Base"
global works "$main/Data Procesada"
global graphs "$main/Graficas"

* -------------------------------
* Sección de Descargar Archivos dta
* -------------------------------

* Lista de URLs a descargar
local urls "https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/845-Modulo1474.zip https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/845-Modulo1475.zip https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/845-Modulo1476.zip https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/845-Modulo1477.zip https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/845-Modulo1478.zip https://proyectos.inei.gob.pe/iinei/srienaho/descarga/STATA/845-Modulo1479.zip"

* Descargar cada archivo en la lista
foreach url of local urls {
    * Extraer el nombre del archivo de la URL
    local filename = substr("`url'", -19, .)
    local output "$dta/`filename'"
    
    di as text "Descargando `filename'..."
    ! curl -o "`output'" "`url'" --progress-bar
    di as text "`filename' ha sido descargado y guardado en `output'"
}

di as text "Todas las descargas han sido completadas."

* -------------------------------
* Sección de Descomprimir Archivos zip
* -------------------------------

* Lista de archivos a descomprimir
local files "845-Modulo1474.zip 845-Modulo1475.zip 845-Modulo1476.zip 845-Modulo1477.zip 845-Modulo1478.zip 845-Modulo1479.zip"

* Descomprimir cada archivo en la lista
foreach file of local files {
    local input "$dta\\`file'"
    local dest_dir = "$dta\\`=subinstr("`file'", ".zip", "", .)'"
    
    if !fileexists("`dest_dir'") {
        mkdir "`dest_dir'"
    }
    
    * Crear script de PowerShell para descomprimir
    local ps_script = "$dta\\unzip_script.ps1"
    file open myfile using "`ps_script'", write text replace
    file write myfile "Expand-Archive -Path '`input'' -DestinationPath '`dest_dir'' -Force" _n
    file close myfile
    
    * Ejecutar el script de PowerShell para descomprimir
    shell powershell -ExecutionPolicy Bypass -File "`ps_script'"
    
    di as text "`file' ha sido descomprimido en `dest_dir'"
}

di as text "Todas las descompresiones han sido completadas."

* -------------------------------
* Sección de Mover Archivos y Eliminar Carpetas
* -------------------------------

* Mover y eliminar para 845-Modulo1474
local old_path "$main/Data Base\845-Modulo1474\845-Modulo1474\enaho01-2018-2022-100-panel.dta"
local new_path "$main/Data Base\enaho01-2018-2022-100-panel.dta"

local ps_script_move = "$dta\move_file.ps1"
file open myfile using "`ps_script_move'", write text replace
file write myfile "Move-Item -Path '`old_path'' -Destination '`new_path'' -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_move'"

local folder_to_delete "$main/Data Base\845-Modulo1474"
local ps_script_delete = "$dta\delete_folder.ps1"
file open myfile using "`ps_script_delete'", write text replace
file write myfile "Remove-Item -Path '`folder_to_delete'' -Recurse -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_delete'"

di as text "El archivo 845-Modulo1474 ha sido movido y la carpeta eliminada."

* Mover y eliminar para 845-Modulo1475
local old_path "$main/Data Base\845-Modulo1475\845-Modulo1475\enaho01a-2018-2022-300-panel.dta"
local new_path "$main/Data Base\enaho01a-2018-2022-300-panel.dta"

local ps_script_move = "$dta\move_file.ps1"
file open myfile using "`ps_script_move'", write text replace
file write myfile "Move-Item -Path '`old_path'' -Destination '`new_path'' -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_move'"

local folder_to_delete "$main/Data Base\845-Modulo1475"
local ps_script_delete = "$dta\delete_folder.ps1"
file open myfile using "`ps_script_delete'", write text replace
file write myfile "Remove-Item -Path '`folder_to_delete'' -Recurse -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_delete'"

di as text "El archivo 845-Modulo1475 ha sido movido y la carpeta eliminada."

* Mover y eliminar para 845-Modulo1476
local old_path "$main/Data Base\845-Modulo1476\845-Modulo1476\enaho01a-2018-2022-400-panel.dta"
local new_path "$main/Data Base\enaho01a-2018-2022-400-panel.dta"

local ps_script_move = "$dta\move_file.ps1"
file open myfile using "`ps_script_move'", write text replace
file write myfile "Move-Item -Path '`old_path'' -Destination '`new_path'' -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_move'"

local folder_to_delete "$main/Data Base\845-Modulo1476"
local ps_script_delete = "$dta\delete_folder.ps1"
file open myfile using "`ps_script_delete'", write text replace
file write myfile "Remove-Item -Path '`folder_to_delete'' -Recurse -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_delete'"

di as text "El archivo 845-Modulo1476 ha sido movido y la carpeta eliminada."

* Mover y eliminar para 845-Modulo1477
local old_path "$main/Data Base\845-Modulo1477\845-Modulo1477\enaho01a-2018-2022-500-panel.dta"
local new_path "$main/Data Base\enaho01a-2018-2022-500-panel.dta"

local ps_script_move = "$dta\move_file.ps1"
file open myfile using "`ps_script_move'", write text replace
file write myfile "Move-Item -Path '`old_path'' -Destination '`new_path'' -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_move'"

local folder_to_delete "$main/Data Base\845-Modulo1477"
local ps_script_delete = "$dta\delete_folder.ps1"
file open myfile using "`ps_script_delete'", write text replace
file write myfile "Remove-Item -Path '`folder_to_delete'' -Recurse -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_delete'"

di as text "El archivo 845-Modulo1477 ha sido movido y la carpeta eliminada."

* Mover y eliminar para 845-Modulo1478
local old_path "$main/Data Base\845-Modulo1478\845-Modulo1478\sumaria-2018-2022-panel.dta"
local new_path "$main/Data Base\sumaria-2018-2022-panel.dta"

local ps_script_move = "$dta\move_file.ps1"
file open myfile using "`ps_script_move'", write text replace
file write myfile "Move-Item -Path '`old_path'' -Destination '`new_path'' -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_move'"

local folder_to_delete "$main/Data Base\845-Modulo1478"
local ps_script_delete = "$dta\delete_folder.ps1"
file open myfile using "`ps_script_delete'", write text replace
file write myfile "Remove-Item -Path '`folder_to_delete'' -Recurse -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_delete'"

di as text "El archivo 845-Modulo1478 ha sido movido y la carpeta eliminada."

* Mover y eliminar para 845-Modulo1479
local old_path "$main/Data Base\845-Modulo1479\845-Modulo1479\enaho01-2018-2022-200-panel.dta"
local new_path "$main/Data Base\enaho01-2018-2022-200-panel.dta"

local ps_script_move = "$dta\move_file.ps1"
file open myfile using "`ps_script_move'", write text replace
file write myfile "Move-Item -Path '`old_path'' -Destination '`new_path'' -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_move'"

local folder_to_delete "$main/Data Base\845-Modulo1479"
local ps_script_delete = "$dta\delete_folder.ps1"
file open myfile using "`ps_script_delete'", write text replace
file write myfile "Remove-Item -Path '`folder_to_delete'' -Recurse -Force" _n
file close myfile

shell powershell -ExecutionPolicy Bypass -File "`ps_script_delete'"

di as text "El archivo 845-Modulo1479 ha sido movido y la carpeta eliminada."

di as text "Todas las operaciones de mover y eliminar carpetas han sido completadas."

* -------------------------------
* Sección de Traducción de Base de Datos
* -------------------------------

* LIMPIAR TODO
clear all

* Establecer la carpeta principal
global main "F:\MANUEL\CEPAL\INVESTIGACION"

* Definir variables globales para las carpetas
global dos   "$main/Do Files"
global dta   "$main/Data Base"
global works "$main/Data Procesada"
global graphs "$main/Graficas"

* Cambiar directorio a la carpeta de datos
cd "$dta"

* Lista de archivos .dta en la carpeta $dta
local archivos : dir "." files "*.dta"

* Bucle para analizar y traducir cada archivo
foreach archivo in `archivos' {
    di "Analizando y traduciendo `archivo'..."
    
    * Analizar el archivo
    unicode analyze "`archivo'"
    
    * Establecer la codificación a latin1
    unicode encoding set "latin1"
    
    * Traducir el archivo
    unicode translate "`archivo'"
    
    di "Finalizado `archivo'"
}
*/
* -------------------------------
* Sección de Tratamiento de Datos
* -------------------------------

* Establecer la carpeta principal
global main "F:\MANUEL\CEPAL\INVESTIGACION"

* Definir variables globales para las carpetas
global dos   "$main/Do Files"
global dta   "$main/Data Base"
global works "$main/Data Procesada"
global graphs "$main/Graficas"

* Usar el módulo básico de hogares de datos panel
*use "$dta\enaho01-2018-2022-100-panel.dta", clear
set maxvar 8000
use "$dta\enaho01a-2018-2022-500-panel.dta", clear
rename a*o year
gen    anio=real(year)
label var year "Year"

tab p500i year
drop if p500i=="00"

*Se establece quienes son residentes habituales
gen resi=1 if ((p204==1 & p205==2) | (p204==2 & p206==1))
*P204 ¿Es miembro del hogar?	204. ¿Es miembro del hogar familiar? 1. Sí 2. No
*P205 ¿Se encuentra ausente del hogar 30 días o más?	1. Sí 2. No
*P206 ¿Está presente en el hogar 30 días o más? 1. Sí 2. No


********************************************************************************
*GRÁFICO N° 3.2 PERÚ: TASA DE EMPLEO FORMAL E INFORMAL Y VARIACIÓN DE LA PEA OCUPADA CON EMPLEO FORMAL E INFORMAL, 2017-2022

*ocupinf= situacion de informalidad, 1: empleo informal, 2: empleo formal 
table ocupinf year if resi==1 [iw= fac500a],  nformat(%12.0fc)

gen     informal=ocupinf
replace informal=0  if ocupinf==2
gen     formal  =1  if ocupinf==2
replace formal  =0  if ocupinf==1

graph bar informal formal if resi==1 [pw= fac500a], /// 
 over(year) per stack yscale(off) /// 
 legend(cols(2) position(6) label(1 "Tasa de empleo informal") label(2 "Tasa de empleo formal")) ///
 blabel(bar, format(%4.1f) size(small) position(center) color(white)) ///
 bar(1,color(red)) bar(2,color(orange)) ///
 saving(gr3_2a.gph, replace)

bys year: egen double t_informal = total(fac500a * informal) if resi==1
bys year: egen float  t_formal   = total(fac500a * formal)   if resi==1
label var t_informal "Empleos Informales"
label var t_formal "Empleos Formales"

br t_informal t_formal
format t_* %20.0fc

preserve 

keep t_* anio 
duplicates drop

scatter t_informal t_formal anio, /// 
 connect(l l) lcolor(red orange) msymbol(D S) mcolor(red orange)  /// 
 mlabel(t_informal t_formal) mlabcolor(red orange) mlabposition(6 12) ///
 mlabsize(small small) yscale(off) xtitle("") legend(cols(2) position(6)) /// 
 xlabel(, nogrid) ylabel(, nogrid) ///
 saving(gr3_2b.gph, replace)

restore


gr combine gr3_2a.gph gr3_2b.gph, ///
title("GRÁFICO N° 3.2" "PERÚ: TASA DE EMPLEO FORMAL E INFORMAL Y VAR. DE LA PEA OCUPADA" "CON EMPLEO FORMAL E INFORMAL, 2017-2022", size(small) color(red) margin(medsmall)) ///
subtitle("(Porcentaje y absolutos)", size(small)) ///
xcommon commonscheme     
graph export gr3_2.png, replace 


