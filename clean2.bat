@echo off
cd /d "C:\Users\tony\clawd\minijam_flow"
del clean.bat
git add -A
git commit -m "Remove clean.bat"
git push origin master
