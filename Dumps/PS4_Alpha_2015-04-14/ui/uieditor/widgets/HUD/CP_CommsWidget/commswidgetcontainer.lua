require( "ui.uieditor.widgets.HUD.CP_CommsWidget.CommsWidget" )

CoD.CommsWidgetContainer = InheritFrom( LUI.UIElement )
CoD.CommsWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsWidgetContainer )
	self.id = "CommsWidgetContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 492 )
	self:setTopBottom( true, false, 0, 177 )
	self.anyChildUsesUpdateState = true
	
	local CommsWidget = CoD.CommsWidget.new( menu, controller )
	CommsWidget:setLeftRight( true, false, 0, 492 )
	CommsWidget:setTopBottom( true, false, 0, 177.14 )
	CommsWidget:setRGB( 1, 1, 1 )
	CommsWidget:setXRot( -17 )
	CommsWidget:setYRot( -21 )
	CommsWidget:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:addElement( CommsWidget )
	self.CommsWidget = CommsWidget
	
	self.close = function ( self )
		self.CommsWidget:close()
		CoD.CommsWidgetContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

