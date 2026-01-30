@echo off
cd /d "C:\Users\tony\clawd\minijam_flow"
del done.bat
git add -A
git commit -m "Remove done.bat"
git push origin master
