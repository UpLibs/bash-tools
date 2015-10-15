#!/bin/bash

SSH_KEY_GEN_RSA=` cat /etc/ssh/ssh_host_rsa_key.check `

if [ "${SSH_KEY_GEN_RSA}" != "ok" ]
then

  echo -e "y\n\n\n" | /usr/bin/ssh-keygen -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key
  echo "ok" > /etc/ssh/ssh_host_rsa_key.check

  echo "Generated RSA key. "

fi

SSH_KEY_GEN_DSA=` cat /etc/ssh/ssh_host_dsa_key.check `

if [ "${SSH_KEY_GEN_DSA}" != "ok" ]
then

  echo -e "y\n\n\n" | /usr/bin/ssh-keygen -t dsa -N "" -f /etc/ssh/ssh_host_dsa_key
  echo "ok" > /etc/ssh/ssh_host_dsa_key.check

  echo "Generated DSA key. "

fi


