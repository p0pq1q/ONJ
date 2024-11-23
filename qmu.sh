#!/bin/bash

# Actualizar la lista de paquetes
sudo apt update

# Instalar QEMU y sus dependencias
sudo apt install -y qemu qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# Verificar si el módulo KVM está cargado
if lsmod | grep -q kvm; then
    echo "KVM está habilitado."
else
    echo "KVM no está habilitado. Asegúrate de que tu CPU soporte virtualización y que esté habilitada en la BIOS."
fi

# Agregar el usuario actual al grupo 'libvirt'
sudo usermod -aG libvirt $(whoami)

# Reiniciar el servicio de libvirt
sudo service libvirt-bin restart

# Confirmar la instalación
echo "Instalación completa. Puedes verificar el estado de libvirt con el siguiente comando:"
echo "sudo service libvirt-bin status"
