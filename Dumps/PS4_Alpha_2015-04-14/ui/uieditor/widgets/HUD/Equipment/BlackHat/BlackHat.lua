require( "ui.uieditor.widgets.HUD.Equipment.BlackHat.BlackHat_Internal" )

CoD.BlackHat = InheritFrom( LUI.UIElement )
CoD.BlackHat.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackHat )
	self.id = "BlackHat"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 256 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.BlackHat_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( 0, 128, 256 )
	internal:setUI3DWindow( 0 )
	internal:setRGB( 1, 1, 1 )
	self:addElement( internal )
	self.internal = internal
	
	self.close = function ( self )
		self.internal:close()
		CoD.BlackHat.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

