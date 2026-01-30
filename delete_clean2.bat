@echo off
cd /d "C:\Users\tony\clawd\minijam_flow"
del clean2.bat
git add -A
git commit -m "Remove clean2.bat"
git push origin master
