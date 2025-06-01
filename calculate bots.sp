#include <sourcemod>

public Plugin myinfo = {
    name        = "Bot Calculator",
    author      = "Maria",
    description = "Calculates the maximum available bots for a map without hitting the edict limit.",
    version     = "0.1",
    url         = ""
};

public void OnMapStart()
{   
    KeyValues kv = new KeyValues("BotOverrideConfig");
    kv.ImportFromFile("cfg/sourcemod/BotOverride.cfg");
    int overridebotcount = -1
    char map[100];
    GetCurrentMap(map,100);
    PrintToServer("Map: %s", map)
    if (kv.JumpToKey(map))
    {
        char value[100];
        kv.GetString("botcount",value,100);
        overridebotcount = StringToInt(value);
        PrintToServer("Value: %s", value)
    }
    char bots[100];
    if (overridebotcount < 0)
    {
        char entities[100];
        IntToString(GetEntityCount(),entities,100);
        PrintToServer("Entity Count: %s", entities);
        int remEntities = 2048 - GetEntityCount();
        const int entitiesPerPlayer = 20;
        int botCount = (remEntities - 40) / entitiesPerPlayer;
        if (botCount > 99)
        {
            botCount = 100;
        }
        IntToString(botCount,bots,100);  
    }
    else
    {
        IntToString(overridebotcount,bots,100)
    }
    PrintToServer("Bot Quota: %s", bots);
    ServerCommand("tf_bot_quota %s", bots);
}
