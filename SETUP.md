# Installeren van de webserver

## setup.sh

Installeer afhankelijkheden:

```bash
bin/setup.sh
```

## Automatische updates

Configureer apt's unattended-upgrades programma

```bash
vim /etc/apt/apt.conf.d/50unattended-upgrades
```

## Environment

Voeg de variabelen van environment-example.txt to aan /etc/environment in.

```bash
vim /etc/environment
```