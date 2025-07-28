# Webhost2

```bash
# Als root user.
git clone git@github.com:erlendgit/manifest-webhost2.git webhost2
cd webhost2

cp .env-example .env
vim .env
bin/setup.sh
```

* Installeer ssl certificaten

## Nieuwe applicatie

```bash
bin/new-user.sh <app-name>
```

* Maak symlinks voor de services
* Maak symlinks voor de nginx configuratie
* Bepaal poorten voor de django runners.
