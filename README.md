# Bot-Calculator
A plugin for Team Fortress 2 servers that automatically calculates (and sets) the maximum possible bot quota that a map supports, based on how many edicts remain available after map load.
The values are currently hard coded, but it's simple enough to edit them.

By default, it is assumed each player takes 20 edicts each, and the server is also granted 40 entities worth of extra wiggle room, to handle unexpected spikes. It will not attempt to set the quota higher than 100 bots. You may wish to edit any of these defaults to fit your server's needs better.

This may work on other Source games, but it has not been tested.

# Usage

Simply place the smx file in your sourcemod plugins folder.

# Map Override

The bot count can be forced to specific values for certain maps. This is useful if you are unhappy with the value the plugin reached itself, or in order to 'fix' certain maps bots aren't working correctly on, such as MvM maps.
To use this, create the file `tf/cfg/sourcemod/BotOverride.cfg`. You can now specify maps following this example format:
```
"BotOverrideConfig"
{
        "mvm_bigrock"
        {
                botcount 0
        }
        "cp_process"
        {
                botcount 6
        }
        "pl_upward"
        {
                botcount 32
        }
}
```
If a map is present in this configuration file, the value specified will *always* be used, and will skip calculation. Please note the disk access time to read this value is likely higher than the time it takes the plugin to calculate the value itself, so writing values here won't help your performance.
