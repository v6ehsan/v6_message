// ██╗░░░██╗░█████╗░    ███████╗██╗░░██╗░██████╗░█████╗░███╗░░██╗
// ██║░░░██║██╔═══╝░    ██╔════╝██║░░██║██╔════╝██╔══██╗████╗░██║
// ╚██╗░██╔╝██████╗░    █████╗░░███████║╚█████╗░███████║██╔██╗██║
// ░╚████╔╝░██╔══██╗    ██╔══╝░░██╔══██║░╚═══██╗██╔══██║██║╚████║
// ░░╚██╔╝░░╚█████╔╝    ███████╗██║░░██║██████╔╝██║░░██║██║░╚███║
// ░░░╚═╝░░░░╚════╝░    ╚══════╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝╚═╝░░╚══╝
//
// 💜 EVAN MATCH MESSAGE SYSTEM v4.6 (Global Timed Sequential Edition)
// 💬 20s HUD messages shown to all players, one after another
// 🖋 Developed & Personalized by: V6 EHSAN
// ---------------------------------------------------------------
//
// 🇬🇧 Description:
// Displays each HUD message globally for 20 seconds,
// waits 2 seconds, then shows the next message.
// Restart sequence every new round.
//
// 🇮🇷 Persian Description (translated):
// Shows messages to all players sequentially.
// Each message stays for 20 seconds, then waits 2 seconds.
// The cycle restarts at the beginning of every round.
//
// ---------------------------------------------------------------
// ✨ Features:
//  • Global broadcast (all players see the same text)
//  • 20-second duration per message
//  • 2-second gap between messages
//  • Automatic round restart
//  • One-time personalized welcome per player
// ---------------------------------------------------------------

#include <amxmodx>

#define MESSAGE_HOLD     20.0   // Duration of each message (seconds)
#define MESSAGE_GAP       2.0   // Time gap between two messages (seconds)
#define WELCOME_HOLD      8.0   // Welcome message duration
#define TASK_ID_MESSAGES 6060   // Task ID for message sequence

new g_CurrentMsg
new bool:g_ShownWelcome[33]

// 🔠 Messages (freely editable)
new const g_Messages[][] = {
    "💜 ip TeamSpeak : EvanTs",
    "🌐 Telegram: t.me/v6ehsan",
    "👑 Owner: V6 EHSAN",
    "📜 ip TeamSpeak : EvanTs",
    "🎮 Telegram: t.me/v6ehsan"
}

public plugin_init()
{
    register_plugin("EVAN Message System by V6 EHSAN", "4.6", "V6 EHSAN")

    // 🎮 When a new round starts, restart the message cycle
    register_event("ResetHUD", "on_new_round", "be")

    // ⏳ Start showing messages 5 seconds after map load
    set_task(5.0, "show_next_message", TASK_ID_MESSAGES)
}

public client_connect(id)
{
    g_ShownWelcome[id] = false
}

// 🌀 Restart the sequence at the start of each round
public on_new_round()
{
    g_CurrentMsg = 0

    if (task_exists(TASK_ID_MESSAGES))
        remove_task(TASK_ID_MESSAGES)

    set_task(3.0, "show_next_message", TASK_ID_MESSAGES)
}

// 💬 Display the next global message
public show_next_message()
{
    if (g_CurrentMsg >= sizeof g_Messages)
        return // End of list, wait for next round

    set_hudmessage(190, 120, 255, 0.02, 0.77, 0, 0.5, MESSAGE_HOLD - 0.5, 0.1, 0.2)
    show_hudmessage(0, "%s", g_Messages[g_CurrentMsg])

    g_CurrentMsg++

    // Gap between two messages (20 + 2 seconds)
    set_task(MESSAGE_HOLD + MESSAGE_GAP, "show_next_message", TASK_ID_MESSAGES)
}

// 💜 Personalized welcome message (only once per player)
public client_putinserver(id)
{
    g_ShownWelcome[id] = false
    set_task(2.0, "welcome_player", id)
}

public welcome_player(id)
{
    if (!is_user_connected(id) || g_ShownWelcome[id])
        return

    g_ShownWelcome[id] = true

    new name[32]
    get_user_name(id, name, charsmax(name))

    new msg[128]
    format(msg, charsmax(msg), "💜 Welcome %s to EVAN MATCH Server!", name)

    set_hudmessage(200, 100, 255, 0.02, 0.65, 0, 0.5, WELCOME_HOLD, 0.1, 0.1)
    show_hudmessage(id, "%s", msg)
}
