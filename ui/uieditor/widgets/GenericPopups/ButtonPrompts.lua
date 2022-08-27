-- f9ba7eaad8cf74f92b770d2a38e659d7
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 321 )
	self:setTopBottom( true, false, 0, 31 )
	self.anyChildUsesUpdateState = true
	
	local PromptSelect = CoD.buttonprompt_small.new( menu, controller )
	PromptSelect:setLeftRight( false, false, -160.5, 53.5 )
	PromptSelect:setTopBottom( false, false, -15.5, 15.5 )
	PromptSelect.label:setText( Engine.Localize( "MENU_SELECT" ) )
	PromptSelect:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			PromptSelect.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	self:addElement( PromptSelect )
	self.PromptSelect = PromptSelect
	
	local PromptBack = CoD.buttonprompt_small.new( menu, controller )
	PromptBack:setLeftRight( false, false, -53.5, 160.5 )
	PromptBack:setTopBottom( false, false, -15.5, 15.5 )
	PromptBack.label:setText( Engine.Localize( "MENU_BACK" ) )
	PromptBack:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			PromptBack.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	self:addElement( PromptBack )
	self.PromptBack = PromptBack
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PromptSelect:close()
		element.PromptBack:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

