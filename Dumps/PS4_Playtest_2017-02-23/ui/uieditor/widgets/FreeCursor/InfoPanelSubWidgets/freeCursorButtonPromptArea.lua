require( "ui.uieditor.widgets.FreeCursor.InfoPanelSubWidgets.freeCursorButtonPromptContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "buttonPrompts", true, function ( model )
		self.buttonPrompts:close()
		self.buttonPrompts = nil
		
		local buttonPrompts = CoD.freeCursorButtonPromptContainer.new( menu, controller )
		buttonPrompts:setLeftRight( 0, 1, 0, 0 )
		buttonPrompts:setTopBottom( 0, 0, 0, 48 )
		buttonPrompts:setModel( model and model:get(), controller )
		self:addElement( buttonPrompts )
		self.buttonPrompts = buttonPrompts
		
	end )
end

CoD.freeCursorButtonPromptArea = InheritFrom( LUI.UIElement )
CoD.freeCursorButtonPromptArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorButtonPromptArea )
	self.id = "freeCursorButtonPromptArea"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 792 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 0, 0 )
	backing:setTopBottom( 0, 1, 0, 0 )
	backing:setRGB( 0.16, 0.2, 0.2 )
	backing:setAlpha( 0.99 )
	self:addElement( backing )
	self.backing = backing
	
	local buttonPrompts = CoD.freeCursorButtonPromptContainer.new( menu, controller )
	buttonPrompts:setLeftRight( 0, 1, 0, 0 )
	buttonPrompts:setTopBottom( 0, 0, 0, 48 )
	self:addElement( buttonPrompts )
	self.buttonPrompts = buttonPrompts
	
	self:linkToElementModel( self, "updateActivePrompts", true, function ( model )
		local element = self
		if AnyContextualButtonPrompts( self ) then
			ExpandFreeCursorElement( self )
		else
			CollapseFreeCursorElement( self )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonPrompts:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

