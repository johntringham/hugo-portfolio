
git status

set /p DUMMY=Hit ENTER to deploy...

echo doing git stuff now:
echo "Going to deploy now"
hugo & echo john.seedganggames.com > docs/CNAME & git add -A & git commit -m "Deployment autocommit - %date% %time%" & git push
set /p DUMMY=Hit ENTER to continue...