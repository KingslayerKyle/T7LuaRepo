# World at War HUD
This is a World at War UI mod for use with Call of Duty: Black Ops III - Mod Tools

## Prerequisites
1) Download the latest release from the following repo:

https://github.com/LG-RZ/BlackOps3Shaders/releases

2) Extract the contents of the ZIP file to your BO3 root.

## Installation
1) Drop the `_custom` & `bin` folders into bo3 root, If prompted overwrite the existing file(s).

2) Place the contents of `your_maps_folder` into your map's folder.

3) In GSC & CSC:
`#using scripts\zm\_zm_t4_hud;`

4) In your zone file:
`include,t4_hud`

5) That's it, please credit me if you use it.

## Troubleshooting & Customization Notes

### Custom Weapon CSV File Name
If you've renamed your weapon CSV file from the default (`gamedata/weapons/zm/zm_levelcommon_weapons.csv`), you must update the reference in the HUD script.  
Open `scripts/zm/_zm_t4_hud.csc` and change the path on **line 113** to match your new CSV file name.  
This step is necessary because the script reads the CSV to determine weapon classes for proper UI behavior.

### Ammo Overlap Issue
If your weapon displays excessive ammo and it visually overlaps HUD elements:

- **Preferred solution:** Reduce the total ammo count for that weapon. Extremely high ammo values can cause display issues in the UI.
- **Alternative solution:** If you wish to keep the high ammo value, you can adjust how many ammo pips are displayed per row.

To do this, open:
`ui/uieditor/widgets/HUD/T4AmmoWidget/T4AmmoInfo.lua`

At the top of the file, you'll find a table defining each weapon class.  
Modify the `rowLength` value for the relevant class — this controls how many pips are shown horizontally per row.

## If you want to try without compiling
[World at War HUD - Steam Workshop](https://steamcommunity.com/sharedfiles/filedetails/?id=3507219917)

## Credits
Kingslayer Kyle\
Lilrifa\
LG-RZ\
Scobalula\
JariK\
TheAllNightFall