require( "ui.uieditor.widgets.Footer.prototype_FooterPrompts_Left" )

CoD.PrototypeBackgroundFrame = InheritFrom( LUI.UIElement )
CoD.PrototypeBackgroundFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrototypeBackgroundFrame )
	self.id = "PrototypeBackgroundFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local prototypeFooterPromptsLeft = CoD.prototype_FooterPrompts_Left.new( menu, controller )
	prototypeFooterPromptsLeft:setLeftRight( 0, 0, 0, 792 )
	prototypeFooterPromptsLeft:setTopBottom( 0, 0, 869, 917 )
	prototypeFooterPromptsLeft:linkToElementModel( self, nil, false, function ( model )
		prototypeFooterPromptsLeft:setModel( model, controller )
	end )
	self:addElement( prototypeFooterPromptsLeft )
	self.prototypeFooterPromptsLeft = prototypeFooterPromptsLeft
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.prototypeFooterPromptsLeft:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

