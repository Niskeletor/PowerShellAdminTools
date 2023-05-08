###Script para sacar todos ls usuarios de dominio y exportarlos a un Archivo de texto
###### SE HA DE EJECUTAR EL SCRIPT CON UN USUARIO ADMINISTRADOR DEL DOMINIO ######


###### []~(￣▽￣)~* SACA TODOS LOS USUARIOS ACTIVOS Y DESACTIVADOS （＾∀＾●）ﾉｼ（＾∀＾●）ﾉｼ


# Importar el módulo Active Directory
Import-Module ActiveDirectory

# Especificar la ruta donde se guardará el archivo de texto
$archivoDeTexto = "C:\ListaDeUsuarios.txt"

# Obtener todos los usuarios del dominio
$usuarios = Get-ADUser -Filter * -Properties samaccountname

# Guardar el samaccountname de cada usuario en el archivo de texto
foreach ($usuario in $usuarios) {
    $usuario.samaccountname | Out-File -Append $archivoDeTexto
}

# Mostrar un mensaje para confirmar la finalización del script
Write-Host "Se ha guardado la lista de usuarios en $archivoDeTexto"


######################################################################################
######¯\_( ͡° ͜ʖ ͡°)_/¯ ####    Sólo para usuarios activos #####   ¯\_( ͡° ͜ʖ ͡°)_/¯########
######################################################################################


# Importar el módulo Active Directory
Import-Module ActiveDirectory

# Especificar la ruta donde se guardará el archivo de texto
$archivoDeTexto = "C:\ListaDeUsuariosActivos.txt"

# Obtener todos los usuarios activos del dominio
$usuariosActivos = Get-ADUser -Filter {Enabled -eq $true} -Properties samaccountname

# Guardar el samaccountname de cada usuario activo en el archivo de texto
foreach ($usuario in $usuariosActivos) {
    $usuario.samaccountname | Out-File -Append $archivoDeTexto
}

# Mostrar un mensaje para confirmar la finalización del script
Write-Host "Se ha guardado la lista de usuarios activos en $archivoDeTexto"