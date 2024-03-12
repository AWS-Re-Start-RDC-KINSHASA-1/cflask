#!/bin/bash
sudo /opt/puppetlabs/bin/puppet agent  --test
# Chemin local de votre application
APPLICATION_PATH="/home/Tp1LoginJeremy"

# URL du dépôt GitHub
GITHUB_REPO="https://github.com/AWS-Re-Start-RDC-KINSHASA-1/Tp1LoginJeremy.git"

# Vérifier si le répertoire de l'application existe
if [ -d "$APPLICATION_PATH" ]; then
    echo "Le répertoire de l'application existe. Effectuer un pull depuis GitHub..."
    cd "$APPLICATION_PATH" || exit
    sudo git pull origin main
else
    echo "Le répertoire de l'application n'existe pas. Cloner depuis GitHub..."
   sudo  git clone "$GITHUB_REPO" "$APPLICATION_PATH"
fi

# Chemin vers votre application Flask

APPLICATION_PATH="/home/Tp1LoginJeremy/app.py"

# Vérifier si l'application Flask est déjà en cours d'exécution
if pgrep -f "$APPLICATION_PATH" > /dev/null; then
    echo "L'application Flask est déjà en cours d'exécution."
    exit 1
fi

# Démarrer l'application Flask en arrière-plan avec nohup
nohup python3 "$APPLICATION_PATH" &