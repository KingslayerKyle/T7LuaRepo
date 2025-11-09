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
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 25 )
	
	local modeText = LUI.UITightText.new()
	modeText:setLeftRight( true, false, -0.06, 85 )
	modeText:setTopBottom( true, false, 0, 25 )
	modeText:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	modeText:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( modeText, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( modeText )
	self.modeText = modeText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

