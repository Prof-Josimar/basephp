echo "# basephp %date% %time%" > README.md
git init
git add . -v
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Prof-Josimar/basephp.git
git push -u origin main