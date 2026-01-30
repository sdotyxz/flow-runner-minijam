@echo off
cd /d "C:\Users\tony\clawd\minijam_flow"
git commit -m "Fix: Use area_entered instead of body_entered for Area2D collision detection

- player.gd: Changed from body_entered to area_entered signal for obstacle detection
  (Area2D-to-Area2D collision requires area_entered, not body_entered)
- player.tscn: Removed unused body_entered connection
- Re-imported corrupted texture files (ball.png, rock.png, star.png)
- Re-exported web build"
git push origin master
echo Push completed!
