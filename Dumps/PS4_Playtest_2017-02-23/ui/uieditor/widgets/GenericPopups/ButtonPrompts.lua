require( "ui.uieditor.widgets.buttonprompt_small" )

CoD.ButtonPrompts = InheritFrom( LUI.UIElement )
CoD.ButtonPrompts.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ButtonPrompts )
	self.id = "ButtonPrompts"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 481 )
	self:setTopBottom( 0, 0, 0, 46 )
	self.anyChildUsesUpdateState = true
	
	local PromptSelect = CoD.buttonprompt_small.new( menu, controller )
	PromptSelect:setLeftRight( 0.5, 0.5, -240.5, 80.5 )
	PromptSelect:setTopBottom( 0.5, 0.5, -23, 23 )
	PromptSelect.label:setText( Engine.Localize( "MENU_SELECT" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local PromptBack = CoD.buttonprompt_small.new( menu, controller )
	PromptBack:setLeftRight( 0.5, 0.5, -80.5, 240.5 )
	PromptBack:setTopBottom( 0.5, 0.5, -23, 23 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PromptBack.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PromptSelect:close()
		self.PromptBack:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

