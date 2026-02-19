# ⛓️ Imprisoned

*Movement is both your weapon and your life.*

## 🌌 Overview
In a void space prison, the ancient "Slime Prime"—a being that once tried to consume the world before being chained by the Wizard Council—seeks its escape. You are a newborn slime, shaped from its final strength and unbound by the magical chains. 

Your mission is to traverse floating islands, defeat relentless wardens, and find the keys to free your creator. But beware: as you move, your body spreads into a deadly trail. Enclosing enemies within this trail destroys them, but every motion costs a part of your own mass. 

Use your form wisely. Free the Slime Prime—and unleash what was never meant to escape.

---

## 🔗 Links
- 🕹️ **Play the Game:** [Imprisoned on Itch.io](https://ksenia-spirina.itch.io/imprisoned)

---

## 🎮 Controls
*Playing with a Gamepad is highly recommended for full immersion.*

| Action | Gamepad | Keyboard |
| :--- | :--- | :--- |
| **Move** | `Left Stick` | `Arrow Keys` |
| **Speak / Interact** | `A Button` | `E` |

---

## ✨ Key Features
- **Mass-Trail Combat System:** A unique risk/reward mechanic where moving leaves a trail that drains player health/size. Enclosing enemies within the trail eliminates them but requires strategic positioning.
- **Resource Management Loop:** Survival depends on balancing offensive area-closure maneuvers with gathering "slime remnants" to replenish volume.
- **Roguelike Progression:** Features procedural difficulty scaling and permadeath. Depleting your mass or touching a warden restarts the cycle.
- **3D Rigged Animations:** Fully rigged 3D character models and environments, enhancing the atmospheric depth of the magical prison.

---

## ⚙️ Technical Highlights
To achieve the specific game-feel and visual style, the team bypassed standard engine tools to build custom systems:

- **Custom Relative Physics Engine:** Overcame Unity's native physics limitations by engineering a custom kinematic system where player input rotates and translates the world/platform rather than the character itself, seamlessly driving the trail-drawing logic.
- **Algorithmic Area Capture:** Implemented complex polygon-filling and spatial detection algorithms to calculate when the player's trail successfully creates a closed loop around dynamic enemy targets.
- **Dynamic Custom Shaders:** Engineered and integrated original shaders from scratch to handle the visual rendering of the slime trail, dynamic area filling, and environmental effects.

---

## 🧠 Team
- **Programming:** Shir Seroussi, Eden Avrahami, David Deitch
- **Art & Design:** Ksenia Spirina, Ohad Lerman
- **Guidance:** Idan Rooze, Eli Babajanov, Dani Bacon
- **Assistance:** Noa Dveyrin

---

## 💡 Notes
- Developed in Unity 3D with C#
- Created within the Department of Visual Communication at Bezalel Academy of Arts and Design, in collaboration with The Hebrew University of Jerusalem (2026)
