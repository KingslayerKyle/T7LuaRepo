CoD.GunsmithSessionModeText = InheritFrom( LUI.UIElement )
CoD.GunsmithSessionModeText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithSessionModeText )
	self.id = "GunsmithSessionModeText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 127 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local modeText = LUI.UITightText.new()
	modeText:setLeftRight( 0, 0, 0, 128 )
	modeText:setTopBottom( 0, 0, 0, 38 )
	modeText:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	modeText:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( modeText, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( modeText )
	self.modeText = modeText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

