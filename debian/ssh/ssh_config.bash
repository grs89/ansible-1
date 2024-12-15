#!/bin/bash sed -i -e 's/#PubkeyAuthentication.*/PubkeyAuthentication yes/' -e 's/#PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Archivo de configuración de SSH
SSHD_CONFIG="/etc/ssh/sshd_config"

# Verificar si el archivo existe
if [[ ! -f "$SSHD_CONFIG" ]]; then
  echo "El archivo $SSHD_CONFIG no existe."
  exit 1
fi

# Cambiar 'PubkeyAuthentication' a 'yes'
sed -i 's/#PubkeyAuthentication.*/PubkeyAuthentication yes/' "$SSHD_CONFIG"

# Cambiar 'PasswordAuthentication' a 'yes'
sed -i 's/#PasswordAuthentication.*/PasswordAuthentication yes/' "$SSHD_CONFIG"

# Reiniciar el servicio SSH
systemctl restart sshd

# Verificar si el servicio se reinició correctamente
if [[ $? -eq 0 ]]; then
  echo "Configuración aplicada y servicio SSH reiniciado correctamente."
else
  echo "Hubo un error al reiniciar el servicio SSH."
fi

