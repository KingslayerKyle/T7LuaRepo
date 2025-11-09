require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_CreateVariantName" )

CoD.systemOverlay_CreateVariantNameFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_CreateVariantNameFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_CreateVariantNameFrame )
	self.id = "systemOverlay_CreateVariantNameFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local foreground = CoD.systemOverlay_Layout_CreateVariantName.new( menu, controller )
	foreground:setLeftRight( true, false, 0, 1280 )
	foreground:setTopBottom( true, false, 0, 320 )
	foreground:linkToElementModel( self, nil, false, function ( model )
		foreground:setModel( model, controller )
	end )
	self:addElement( foreground )
	self.foreground = foreground
	
	foreground.id = "foreground"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.foreground:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.foreground:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

