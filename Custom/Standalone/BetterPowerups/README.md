# Powerups widget rebuilt from scratch
- Ditched the trash T6 widget, disabled that one
- This one uses a UIList.. like the perks widget
- Uses images instead of materials, images can easily be changed at the top of the file
- Hooks off existing CF for powerups, not using any custom scripts
- Has clips, so your powerups will fade when tabbing/pausing the game
- Easy to position, just change LeftRight, TopBottom as you would any other widget
- Third param on the UIList, the "8" is the spacing between each image

## Installation
1) Drag & drop the files provided into your maps folder

2) Add the following to your maps zone file:

```
rawfile,ui/uieditor/widgets/HUD/KingslayerPowerupsWidget/KingslayerPowerupsContainer.lua
rawfile,ui/uieditor/widgets/HUD/KingslayerPowerupsWidget/KingslayerPowerupsListItem.lua
```

3) Open your T7Hud_zm_factory.lua file. If you don't have this you can find it here:
- [T7Hud_zm_factory.lua](https://github.com/KingslayerKyle/t7-lua/blob/main/ui/uieditor/menus/hud/T7Hud_zm_factory.lua)

4) Underneath your requires paste the following:

`require( "ui.uieditor.widgets.HUD.KingslayerPowerupsWidget.KingslayerPowerupsContainer" )`

5) After `self.anyChildUsesUpdateState = true` paste the following:

```
self.KingslayerPowerupsContainer = CoD.KingslayerPowerupsContainer.new( self, controller )
self.KingslayerPowerupsContainer:setLeftRight( true, true, 0, 0 )
self.KingslayerPowerupsContainer:setTopBottom( true, true, 0, 0 )
self:addElement( self.KingslayerPowerupsContainer )
```

6) After `LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )` paste the following:

`element.KingslayerPowerupsContainer:close()`
