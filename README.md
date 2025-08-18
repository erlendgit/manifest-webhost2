# Webhost2

#### Maak een ssl key

```bash
ssh-keygen -b 4096 -N "" -f ~/.ssh/id_gitlab
```

#### Voeg de public key toe aan je GitHub account.

#### Stel ~/.ssh/config in

```bash
Host github.com
  User git
  IdentityFile ~/.ssh/id_gitlab
```

#### Haal de manifest bestanden op.

```bash
cd /var/local
git clone git@github.com:erlendgit/manifest-webhost2.git webhost2

cd webhost2
bin/setup.sh
```

#### Installeer ssl certificaten

#### Maak /etc/environment up to date met environment-example.txt

## Nieuwe applicatie

```bash
bin/new-user.sh <app-name>
```

* Maak symlinks voor de services
* Maak symlinks voor de nginx configuratie
* Bepaal poorten voor de django runners.
