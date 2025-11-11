require( "ui.uieditor.widgets.Lobby.Common.LiveEventViewerFooter" )

CoD.LiveEventViewerFooterContainer = InheritFrom( LUI.UIElement )
CoD.LiveEventViewerFooterContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LiveEventViewerFooterContainer )
	self.id = "LiveEventViewerFooterContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local LiveEventViewerFooter0 = CoD.LiveEventViewerFooter.new( menu, controller )
	LiveEventViewerFooter0:setLeftRight( 0, 1, 0, 0 )
	LiveEventViewerFooter0:setTopBottom( 1, 1, -98, 0 )
	LiveEventViewerFooter0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( LiveEventViewerFooter0 )
	self.LiveEventViewerFooter0 = LiveEventViewerFooter0
	
	LiveEventViewerFooter0:setModel( menu.buttonModel, controller )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LiveEventViewerFooter0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

