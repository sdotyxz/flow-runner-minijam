# 🎮 Flow Runner - Mini Jam 203

**Theme: Flow (流动)**

A relaxing but challenging endless runner where you control a flowing energy ball!

---

## 🎨 Assets Credit

This game uses free assets from **Kenney Games** (www.kenney.nl):

| Asset Pack | Usage |
|------------|-------|
| Simple Space | Background stars, asteroid obstacles |
| Particle Pack | Glow effects, particles |
| Rolling Ball Assets | Player ball, collectible stars |
| Sci-Fi Sounds | Collect & hit sound effects |

**License**: CC0 1.0 Universal (Public Domain)

---

## 🎯 Theme Interpretation

**"Flow"** represents:
- **Continuous movement** - The energy ball never stops flowing forward
- **Fluid dynamics** - Smooth, organic motion with trail effects
- **Flow state** - Immersive gameplay that puts players in a zen-like state
- **Energy flow** - Collecting energy to grow and score points

## 🎮 Gameplay

### Controls
- **Mouse Movement** - Guide the flow in any direction
- The energy ball automatically flows forward
- Stay within the screen bounds - falling off means game over!

### Objective
- Dodge red obstacles (rocks/barriers)
- Collect yellow energy orbs for +10 points
- Survive as long as possible
- Speed gradually increases for added challenge

### Visual Features
- Glowing particle trail effect
- Rainbow color shifting
- Smooth animations and transitions
- Dark cosmic background with flowing lines

## 📁 Project Structure

```
minijam_flow/
├── project.godot           # Godot project file
├── export_presets.cfg      # Export settings (Web/HTML5)
├── default_env.tres        # Environment settings
├── icon.svg                # Game icon
├── README.md               # This file
├── addons/                 # Godot addons
├── assets/
│   ├── audio/             # Sound effects & music
│   ├── textures/          # Sprites & images
│   └── fonts/             # Custom fonts
├── scenes/
│   ├── main.tscn          # Main game scene
│   ├── player.tscn        # Player (energy ball)
│   ├── obstacle.tscn      # Obstacles (red rocks)
│   ├── collectible.tsn    # Collectibles (energy orbs)
│   └── ui.tscn            # UI layer
└── scripts/
    ├── main.gd            # Game logic
    ├── player.gd          # Player movement & effects
    ├── obstacle.gd        # Obstacle behavior
    └── collectible.gd     # Collectible animations
```

## 🚀 Running the Game

### Option 1: Godot Editor
1. Download & install Godot 4.2+
2. Open `project.godot`
3. Press **F5** or click Play button

### Option 2: Export to Web
1. Open project in Godot
2. Go to **Project → Export**
3. Select **Web** preset
4. Click **Export Project**
5. Upload to itch.io

## 🎨 Visual Style

- **Colors**: Cyan/blue glowing energy, red obstacles, yellow collectibles
- **Vibe**: Cosmic, zen, futuristic
- **Effects**: Particle trails, glow, smooth animations

## 📝 Development Notes

- Built with Godot 4.x (GDScript)
- Compatible with GLES3 and Compatibility renderer
- Designed for 1280×720 resolution
- Supports keyboard (WASD/Arrows) and mouse input

## 🏆 Credits

Created for **Mini Jam 203: Flow**  
Theme: Flow (流动)

---

*Keep flowing!* ✨🌊
