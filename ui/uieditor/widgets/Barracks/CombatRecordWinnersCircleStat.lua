-- 911bead775fd5dc79f359ea557749916
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CombatRecordWinnersCircleStat = InheritFrom( LUI.UIElement )
CoD.CombatRecordWinnersCircleStat.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordWinnersCircleStat )
	self.id = "CombatRecordWinnersCircleStat"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 55 )
	self:setTopBottom( true, false, 0, 102 )
	self.anyChildUsesUpdateState = true
	
	local RibbonImage = LUI.UIImage.new()
	RibbonImage:setLeftRight( false, false, -21.5, 21.5 )
	RibbonImage:setTopBottom( true, false, 6, 64 )
	RibbonImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RibbonImage )
	self.RibbonImage = RibbonImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( false, true, -32, 0 )
	StartMenuframenoBG0:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG00:setTopBottom( true, false, 0, 70 )
	StartMenuframenoBG00:setAlpha( 0.8 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local StatValue = LUI.UIText.new()
	StatValue:setLeftRight( false, false, -21.5, 21.5 )
	StatValue:setTopBottom( false, true, -26, -6 )
	StatValue:setRGB( 1, 0.8, 0.4 )
	StatValue:setText( Engine.Localize( "888" ) )
	StatValue:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	StatValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( StatValue )
	self.StatValue = StatValue
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG00:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
