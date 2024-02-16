-- dc40cfc29bb6d781ad7410c284a5aff2
-- This hash is used for caching, delete to decompile the file again

CoD.GunsmithStatName = InheritFrom( LUI.UIElement )
CoD.GunsmithStatName.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStatName )
	self.id = "GunsmithStatName"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 24 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, false, 0, 24 )
	self:addElement( background )
	self.background = background
	
	local statName = LUI.UIText.new()
	statName:setLeftRight( true, true, 0, 0 )
	statName:setTopBottom( true, false, 3, 21 )
	statName:setRGB( 0, 0, 0 )
	statName:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	statName:setTTF( "fonts/escom.ttf" )
	statName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	statName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( statName )
	self.statName = statName
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
