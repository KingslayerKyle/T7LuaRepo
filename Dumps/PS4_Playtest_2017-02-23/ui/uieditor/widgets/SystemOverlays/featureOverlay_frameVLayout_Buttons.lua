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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 54 )
	self.anyChildUsesUpdateState = true
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( 0, 1, 0, 0 )
	buttonBacking:setTopBottom( 0, 1, 0, 0 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( 0, 1, 96, -1176 )
	buttons:setTopBottom( 0.5, 0.5, -24, 24 )
	self:addElement( buttons )
	self.buttons = buttons
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttons:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

