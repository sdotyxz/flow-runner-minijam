@echo off
cd /d "C:\Users\tony\clawd\minijam_flow"
git add -A
git commit -m "Final cleanup"
git push origin master
del final.bat
