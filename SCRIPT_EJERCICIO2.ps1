
function FILE_SHUTDOWN(){
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$($env:USERPROFILE)\Videos\Apagar.lnk")
$Shortcut.TargetPath = "shutdown.exe"
$Shortcut.Arguments = "/s /t 60 /c `"El equipo se apagará en 1 minuto`""
$Shortcut.Save()
}

function SHUTDOWN(){
Start-Process -FilePath "$($env:USERPROFILE)\Videos\Apagar.lnk"
}

function FILE_CANCEL(){
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$($env:USERPROFILE)\Videos\Detener.lnk")
$Shortcut.TargetPath = "shutdown.exe"
$Shortcut.Arguments = "/a"
$Shortcut.Save()
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