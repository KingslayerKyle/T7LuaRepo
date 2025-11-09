CoD.VisorHud = {}
CoD.VisorHud.VisorDefaultAlpha = 0.7
CoD.VisorHud.VisorTextDefaultAlpha = 0.25
CoD.VisorHud.FontName = "Big"
CoD.VisorHud.Margin = 20
CoD.VisorHud.new = function ()
	local visorTopMaterial = RegisterMaterial( "menu_visor_grid_top" )
	local visorBottomMaterial = RegisterMaterial( "menu_visor_grid_bottom" )
	local visorLeftMaterial = RegisterMaterial( "menu_visor_grid_left" )
	local visorRightMaterial = RegisterMaterial( "menu_visor_grid_right" )
	local visorHud = LUI.UIElement.new()
	visorHud:setLeftRight( true, true, 0, 0 )
	visorHud:setTopBottom( true, true, 0, 0 )
	visorHud.id = visorHud.id .. ".VisorHud"
	local visorTopBottomWidth = 1280 + 2 * CoD.VisorHud.Margin
	local visorTopBottomHeight = 159 + CoD.VisorHud.Margin
	local visorImageTop = LUI.UIImage.new()
	visorImageTop:setLeftRight( false, false, -visorTopBottomWidth / 2, visorTopBottomWidth / 2 )
	visorImageTop:setTopBottom( true, false, -CoD.VisorHud.Margin, -CoD.VisorHud.Margin + visorTopBottomHeight )
	visorImageTop:setImage( visorTopMaterial )
	visorImageTop:setAlpha( CoD.VisorHud.VisorDefaultAlpha )
	visorImageTop.id = visorImageTop.id .. ".VisorImageTop"
	visorHud:addElement( visorImageTop )
	local visorImageBottom = LUI.UIImage.new()
	visorImageBottom:setLeftRight( false, false, -visorTopBottomWidth / 2, visorTopBottomWidth / 2 )
	visorImageBottom:setTopBottom( false, true, CoD.VisorHud.Margin - visorTopBottomHeight, CoD.VisorHud.Margin )
	visorImageBottom:setImage( visorBottomMaterial )
	visorImageBottom:setAlpha( CoD.VisorHud.VisorDefaultAlpha )
	visorImageBottom.id = visorImageBottom.id .. ".VisorImageBottom"
	visorHud:addElement( visorImageBottom )
	local visorLeftRightWidth = 107 + CoD.VisorHud.Margin
	local visorLeftRightHeight = 402
	local visorImageLeft = LUI.UIImage.new()
	visorImageLeft:setLeftRight( true, false, -CoD.VisorHud.Margin, -CoD.VisorHud.Margin + visorLeftRightWidth )
	visorImageLeft:setTopBottom( false, false, -visorLeftRightHeight / 2, visorLeftRightHeight / 2 )
	visorImageLeft:setImage( visorLeftMaterial )
	visorImageLeft:setAlpha( CoD.VisorHud.VisorDefaultAlpha )
	visorImageLeft.id = visorImageLeft.id .. ".VisorImageLeft"
	visorHud:addElement( visorImageLeft )
	local visorImageRight = LUI.UIImage.new()
	visorImageRight:setLeftRight( false, true, CoD.VisorHud.Margin - visorLeftRightWidth, CoD.VisorHud.Margin )
	visorImageRight:setTopBottom( false, false, -visorLeftRightHeight / 2, visorLeftRightHeight / 2 )
	visorImageRight:setImage( visorRightMaterial )
	visorImageRight:setAlpha( CoD.VisorHud.VisorDefaultAlpha )
	visorImageRight.id = visorImageRight.id .. ".VisorImageRight"
	visorHud:addElement( visorImageRight )
	local visorText = LUI.UIText.new()
	visorText:setLeftRight( true, true, 0, 0 )
	visorText:setTopBottom( true, false, 0, CoD.textSize[CoD.VisorHud.FontName] )
	visorText:setAlpha( CoD.VisorHud.VisorTextDefaultAlpha )
	visorText:setFont( CoD.fonts[CoD.VisorHud.FontName] )
	visorText.id = visorText.id .. ".VisorText"
	visorHud:addElement( visorText )
	visorHud.setVisorText = CoD.VisorHud.SetVisorText
	visorHud:registerEventHandler( "bootup_init", CoD.VisorHud.BootupInit )
	visorHud:registerEventHandler( "bootup_saving", CoD.VisorHud.BootupSaving )
	visorHud:registerEventHandler( "bootup_end", CoD.VisorHud.BootupEnd )
	visorHud:registerEventHandler( "bootup_switch_to_hud", CoD.VisorHud.BootupSwitchToHud )
	visorHud.visorImageTop = visorImageTop
	visorHud.visorImageBottom = visorImageBottom
	visorHud.visorImageLeft = visorImageLeft
	visorHud.visorImageRight = visorImageRight
	visorHud.visorText = visorText
	return visorHud
end

CoD.VisorHud.SetVisorText = function ( self, text )
	self.visorText.textValue = text
	if text == "" then
		self.visorText:setText( "" )
		return 
	else
		self.visorText:setText( "/// " .. text .. " ///" )
	end
end

CoD.VisorHud.BootupInit = function ( self, event )
	self:setVisorText( Engine.Localize( "MENU_INITIALIZING_CAPS" ) )
end

CoD.VisorHud.BootupSaving = function ( self, event )
	self:setVisorText( Engine.Localize( "MENU_SAVING_CAPS" ) )
end

CoD.VisorHud.BootupEnd = function ( self, event )
	self:setVisorText( "" )
end

CoD.VisorHud.BootupSwitchToHud = function ( self, event )
	self:setAlpha( CoD.VisorHud.VisorDefaultAlpha )
end

