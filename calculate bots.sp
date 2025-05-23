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
    char entities[100];
    IntToString(GetEntityCount(),entities,100);
    PrintToServer("Entity Count: %s", entities);
    int remEntities = 2048 - GetEntityCount();
    const int entitiesPerPlayer = 15;
    int botCount = (remEntities - 40) / entitiesPerPlayer;
    if (botCount > 99)
    {
        botCount = 100;
    }
    char bots[100];
    IntToString(botCount,bots,100);
    PrintToServer("Bot Quota: %s", bots);
    ServerCommand("tf_bot_quota %s", bots);
}