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
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 0, 0, 36 )
	self:addElement( background )
	self.background = background
	
	local statName = LUI.UIText.new()
	statName:setLeftRight( 0, 1, 0, 0 )
	statName:setTopBottom( 0, 0, 4, 31 )
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

