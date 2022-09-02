-- 5aa0fed55515488b69df0ed38d318b2f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewRedLine" )

CoD.weakpoint_NewRedLineContainer = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewRedLineContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewRedLineContainer )
	self.id = "weakpoint_NewRedLineContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 218 )
	self:setTopBottom( true, false, 0, 16 )
	self.anyChildUsesUpdateState = true
	
	local weakpointNewRedLine0 = CoD.weakpoint_NewRedLine.new( menu, controller )
	weakpointNewRedLine0:setLeftRight( true, false, 0, 36 )
	weakpointNewRedLine0:setTopBottom( false, false, -8, 8 )
	self:addElement( weakpointNewRedLine0 )
	self.weakpointNewRedLine0 = weakpointNewRedLine0
	
	local weakpointNewRedLine1 = CoD.weakpoint_NewRedLine.new( menu, controller )
	weakpointNewRedLine1:setLeftRight( false, true, -36, 0 )
	weakpointNewRedLine1:setTopBottom( false, false, -8, 8 )
	weakpointNewRedLine1:setYRot( -180 )
	weakpointNewRedLine1.Image00:setZoom( -50 )
	self:addElement( weakpointNewRedLine1 )
	self.weakpointNewRedLine1 = weakpointNewRedLine1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weakpointNewRedLine0:close()
		element.weakpointNewRedLine1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

