
function FILE_SHUTDOWN(){
$Objeto = New-Object -ComObject WScript.Shell
$Acceso = $Objeto.CreateShortcut("$($env:USERPROFILE)\Videos\Apagar.lnk")
$Acceso.TargetPath = "shutdown.exe"
$Acceso.Arguments = "/s /t 60 /c `"El equipo se apagará en 1 minuto`""
$Acceso.Save()
}

function SHUTDOWN(){
Start-Process -FilePath "$($env:USERPROFILE)\Videos\Apagar.lnk"
}

function FILE_CANCEL(){
$Objeto = New-Object -ComObject WScript.Shell
$Acceso = $Objeto.CreateShortcut("$($env:USERPROFILE)\Videos\Detener.lnk")
$Acceso.TargetPath = "shutdown.exe"
$Acceso.Arguments = "/a"
$Acceso.Save()
}

#function CANCEL(){
    #Start-Process -FilePath "shutdown.exe" -ArgumentList "/a"
#}
function CANCEL(){
Start-Process -FilePath "$($env:USERPROFILE)\Videos\Detener.lnk"
}

while ($true) {
  $opcionMenu = Read-Host "
  CREAR ARCHIVOS
  Apagar el ordenador: ORDEN -> FILE_SHUTDOWN
  Cancelar apagado: ORDEN -> FILECANCEL

  EJECUTAR ARCHIVOS
  Apagar el ordenador: ORDEN -> SHUTDOWN
  Cancelar apagado: ORDEN -> CANCEL
  ¿Qué deseas hacer?"

  if ($opcionMenu -eq "FILE_SHUTDOWN") {
    FILE_SHUTDOWN
  } elseif ($opcionMenu -eq "FILE_CANCEL") {
    FILE_CANCEL
  } elseif ($opcionMenu -eq "CANCEL") {
    CANCEL
  } elseif ($opcionMenu -eq "SHUTDOWN") {
    SHUTDOWN
  }
}
