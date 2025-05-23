# Bot-Calculator
A plugin for Team Fortress 2 servers that automatically calculates (and sets) the maximum possible bot quota that a map supports, based on how many edicts remain available after map load.
The values are currently hard coded, but it's simple enough to edit them.

By default, it is assumed each player takes 20 edicts each, and the server is also granted 40 entities worth of extra wiggle room, to handle unexpected spikes. It will not attempt to set the quota higher than 100 bots. You may wish to edit any of these defaults to fit your server's needs better.

This may work on other Source games, but it has not been tested.
