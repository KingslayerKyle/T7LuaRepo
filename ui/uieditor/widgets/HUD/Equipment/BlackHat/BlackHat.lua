-- 0fee8c1f6b833ce033ac1e06ee9e0d1e
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.BlackHat_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 0, 256, 256 )
	internal:setUI3DWindow( 0 )
	self:addElement( internal )
	self.internal = internal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

