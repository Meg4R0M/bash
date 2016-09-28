#!/bin/bash
# Création d'une arborescence de site WEB

echo "----------------------------------------------"
echo "------ Construction d'un nouveau site --------"
echo "----------------------------------------------"

echo "Dans quel repertoire ? (home/USER/simplon/jour1/)"
read repertoire
                 
echo "Création du répertoire ${repertoire}..."   
echo "mkdir ${repertoire}"                       
mkdir "${repertoire}"   
cd  "${repertoire}"
echo "----------------------------------------"
echo "------ Création de l'index.html --------"
echo "----------------------------------------"
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
echo "----------------------------------------------------------"
echo "------ Création des repertoires css, scripts, img --------"
echo "----------------------------------------------------------"
mkdir "css";mkdir "scripts";mkdir "img"
echo "------------------------------------------------------------"
echo "------ Création des fichiers style.css et script.js --------"
echo "------------------------------------------------------------"
touch "${repertoire}/css/style.css";touch "${repertoire}/scripts/script.js"
echo "---------------------------------------------------------"
echo "------ Tout est crée dans le repertoire voulu :) --------"
echo "---------------------------------------------------------"
echo ""
echo ""
echo "lien Git du nouveau repo pliz:"
read REPO
echo "-------------------------------------------"
echo "------ Parametrage du nouveau REPO --------"
echo "-------------------------------------------"
echo "- $REPO"
echo "-------------------------------------------"
touch .gitignore
echo "# Nouveau site" >> README.md
git init
git add .
git commit -m 'initial commit'
git remote add origin $REPO
git push -u origin master
echo "--------------------------------------"
echo "------ C'est finis ! va coder --------"
echo "--------------------------------------"