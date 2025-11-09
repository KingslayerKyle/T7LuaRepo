# Black Ops 4 HUD
This is a Black Ops 4 UI mod for use with Call of Duty: Black Ops III - Mod Tools

# Donations
If you appreciate the time and effort that went into this project, consider showing your support with a donation:\
[https://paypal.me/kingslayerkyle](https://paypal.me/kingslayerkyle)

## Installation
1) Drop the `_custom` & `bin` folders into bo3 root, If prompted overwrite the existing file(s).

2) Place the contents of `your_maps_folder` into your map's folder

3) In GSC & CSC:
`#using scripts\zm\_zm_t8_hud;`

4) In your zone file:
`include,t8_hud`

5) Open this file:
`your_maps_folder\ui\uieditor\menus\hud\T8Hud_zm_factory.lua`

6) Find `CoD.UsermapName` on line 34

7) Replace `Replace this text\nwith your maps name` with your map's name (You can use \n for a newline)

8) For information on how to set up the weapon UI images check `your_maps_folder\ui\uieditor\widgets\HUD\T8AmmoWidget\T8AmmoWeaponImages.lua` and find the comments I left.

9) To set up the text on the HUD to display which zone the player is in, add a "script_string" KVP to your zone in radiant, and the value should be the text that you want to be displayed e.g "My New Zone"

10) That's it, please credit me if you use it.

## If you want to try without compiling
[Black Ops 4 HUD - Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=2699793938)

## Credits
Kingslayer Kyle\
lilrifa\
MrChuse\
AmberLeaf\
OldManCats\
Scobalula\
Ardivee\
JariK\
Warden\
EpicNNG
