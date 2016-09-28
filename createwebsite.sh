#!/bin/bash
# Création d'une arborescence de site WEB

echo "------ Construction d'un nouveau site --------"
echo "Dans quel repertoire ? (/home/USER/simplon/jour1/)"
read repertoire
                 
echo "Création du répertoire ${repertoire}..."   
echo "mkdir ${repertoire}"                       
mkdir "${repertoire}"   
cd  "${repertoire}"
echo "------ Création de l'index.html --------"
echo '<!doctype html>
<html lang="fr">
<head>
  <meta charset="utf-8">
  <title>Titre de la page</title>
  <link rel="stylesheet" href="style.css">
  <script src="script.js"></script>
</head>
<body>
  ...
  <!-- Le reste du contenu -->
  ...
</body>
</html>' > index.html
echo "------ Création des repertoires css, scripts, img --------"
mkdir {css,scripts,img}
echo "------ Création des fichiers style.css et script.js --------"
touch "${repertoire}/css/style.css";touch "${repertoire}/scripts/script.js"
echo "-Avez-vous déjà configurer Git sur ce PC ?-"
read reponse
if [ "$reponse" == "non" ] || [ "$reponse" == "n" ] || [ "$reponse" == "N" ]; then
	echo "Veuillez entrer votre adresse email:"
	read email
	git config --global user.email "$email"
	echo "Veuillez entrer votre nom d'utilisateur:"
	read username
	git config --global user.name "$username"
fi
repo_name=${PWD##*/}
echo "Veuillez entrer votre identifiant Git:"
read login
curl -u $login https://api.github.com/user/repos -d" {\"name\":\"$repo_name\"}"
echo "------ Parametrage du nouveau REPO --------"
echo "- $REPO"
touch .gitignore
echo "# Nouveau site" >> README.md
git init
git add .
git commit -m 'initial commit'
git remote add origin "https://github.com/psykoterro/${repo_name}.git"
git push -u origin master
echo "------ C'est finis ! va coder --------"
firefox https://github.com/psykoterro/${repo_name} &