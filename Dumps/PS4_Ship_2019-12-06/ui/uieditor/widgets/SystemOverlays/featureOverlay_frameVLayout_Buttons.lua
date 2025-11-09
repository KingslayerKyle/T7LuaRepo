require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

CoD.featureOverlay_frameVLayout_Buttons = InheritFrom( LUI.UIElement )
CoD.featureOverlay_frameVLayout_Buttons.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.featureOverlay_frameVLayout_Buttons )
	self.id = "featureOverlay_frameVLayout_Buttons"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( true, true, 0, 0 )
	buttonBacking:setTopBottom( true, true, 0, 0 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( true, true, 64, -784 )
	buttons:setTopBottom( false, false, -16, 16 )
	self:addElement( buttons )
	self.buttons = buttons
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttons:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

