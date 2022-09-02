-- 54733dc38db7802f6313f7d213aacce1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Scorestreaks.CallingScorestreaks.ArmDeviceWidgetInternal" )

CoD.ArmDeviceWidget = InheritFrom( LUI.UIElement )
CoD.ArmDeviceWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ArmDeviceWidget )
	self.id = "ArmDeviceWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 271 )
	self:setTopBottom( true, false, 0, 200 )
	self.anyChildUsesUpdateState = true
	
	local ArmDeviceWidgetInternal = CoD.ArmDeviceWidgetInternal.new( menu, controller )
	ArmDeviceWidgetInternal:setLeftRight( true, true, 0, 0 )
	ArmDeviceWidgetInternal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 2, 271, 200 )
	ArmDeviceWidgetInternal:setUI3DWindow( 2 )
	self:addElement( ArmDeviceWidgetInternal )
	self.ArmDeviceWidgetInternal = ArmDeviceWidgetInternal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ArmDeviceWidgetInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

