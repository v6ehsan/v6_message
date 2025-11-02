# 💜 V6_MESSAGE – Global Sequential HUD Display

**Version:** 4.6  
**Developer:** V6 EHSAN
---

✅ 100% clean and safe code — no backdoors.

## 📜 Overview

**V6_MESSAGE** is a clean and HL-safe AMX Mod X plugin for **CS 1.6 / HL Engine servers**, designed to display **global HUD messages** to all players sequentially.

- Each message stays on screen for **20 seconds**  
- After a **2-second gap**, the next message appears  
- The sequence restarts automatically at the beginning of each round  
- New players receive a **personalized one-time welcome message**

---

## ✨ Features

- 🔹 Global server-wide HUD display  
- 🔹 Neon purple theme, optimized for CS 1.6  
- 🔹 20-second display + 2-second interval  
- 🔹 Automatic restart each round  
- 🔹 One-time personalized welcome message  
- 🔹 Lightweight and fully HL Engine safe  
- 🔹 Easy to customize messages and timings  

---

## ⚙️ Requirements / Dependencies

| Component          | Version | Description                      |
|--------------------|----------|----------------------------------|
| **AMX Mod X**      | 1.8.2+   | Core plugin engine               |
| **CS 1.6 / HLDS**  | Any      | Works on all HL engine servers   |
| **AMXX Compiler**  | —        | Used to compile the `.sma` file  |

> ✅ No extra modules required — only the default `amxmodx` include.

---

## 🧩 Installation

1️⃣ Copy the source file to the scripting folder:
```bash
addons/amxmodx/scripting/v6_message.sma
```

2️⃣ Compile the plugin:
```bash
amxxpc v6_message.sma
```
This creates:
```bash
v6_message.amx
```

3️⃣ Move the compiled file to the plugins folder:
```bash
addons/amxmodx/plugins/v6_message.amx
```

4️⃣ Edit your plugins configuration:
```bash
addons/amxmodx/configs/plugins.ini
```
Add this line:
```
v6_message.amx
```

5️⃣ Restart your server or change the map to activate the plugin.

---

## ⚙️ Configuration

All options are defined inside the `.sma` file for easy customization:

| Variable         | Description                        | Default |
|------------------|------------------------------------|----------|
| `MESSAGE_HOLD`   | Duration of each message (seconds)  | `20.0`   |
| `MESSAGE_GAP`    | Gap between messages (seconds)      | `2.0`    |
| `WELCOME_HOLD`   | Duration of welcome message (sec)   | `8.0`    |

### 💬 Message List Example
Edit this section inside the `.sma` file:

```pawn
new const g_Messages[][] = {
    "💜 EVAN MATCH SERVER — Welcome to our community!",
    "🌐 TeamSpeak: EvanTs | Telegram: t.me/v6ehsan",
    "👑 Owner & Developer: V6 EHSAN",
    "📜 Rules: Play fair and respect others!",
    "🎮 Enjoy your stay at EVAN MATCH Server!"
}
```

After editing, **recompile the plugin**.

---

## 🧠 Developer Notes

- Keep messages under **120 characters** to prevent text cutoff.  
- Avoid complex color codes like `^x01`, `^x03`, etc.  
- Adjust HUD X/Y position via `set_hudmessage`.  
- Fully HL Engine safe — no crashes, no FPS issues.  

---

## 💜 Credits

- **Concept & Development:** V6 EHSAN  

**Version:** 4.6 – Sequential Global HUD Display  
**Project:** EVAN Match System  

---

## 🌐 Links

🔗 **Discord:** [Join Server](https://discord.com/invite/ENMnprrc8Y)  
🔗 **GitHub:** [v6_banner_v4.2](https://github.com/itsV6/v6_banner_v4.2)  
🔗 **YouTube:** [@v6ehsan](https://www.youtube.com/@v6ehsan)
