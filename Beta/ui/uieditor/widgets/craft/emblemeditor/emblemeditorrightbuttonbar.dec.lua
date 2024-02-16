require( "ui.uieditor.widgets.buttonprompt" )

CoD.EmblemEditorRightButtonBar = InheritFrom( LUI.UIElement )
CoD.EmblemEditorRightButtonBar.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorRightButtonBar )
	self.id = "EmblemEditorRightButtonBar"
	self.soundSet = "CustomizationEditor"
	self:setLeftRight( true, false, 0, 353 )
	self:setTopBottom( true, false, 0, 33 )
	self.anyChildUsesUpdateState = true
	
	local change = CoD.buttonprompt.new( menu, controller )
	change:setLeftRight( true, false, 263, 353 )
	change:setTopBottom( true, false, 1, 32 )
	change.label:setText( Engine.Localize( "MENU_EMBLEM_CHANGE_DECAL" ) )
	change:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			change.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( change )
	self.change = change
	
	local cut = CoD.buttonprompt.new( menu, controller )
	cut:setLeftRight( true, false, 186, 263 )
	cut:setTopBottom( true, false, 1, 32 )
	cut.label:setText( Engine.Localize( "MENU_EMBLEM_CUT_LAYER" ) )
	cut:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cut.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( cut )
	self.cut = cut
	
	local copy = CoD.buttonprompt.new( menu, controller )
	copy:setLeftRight( true, false, 100, 186 )
	copy:setTopBottom( true, false, 1, 32 )
	copy.label:setText( Engine.Localize( "MENU_EMBLEM_COPY_LAYER" ) )
	copy:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			copy.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( copy )
	self.copy = copy
	
	local new = CoD.buttonprompt.new( menu, controller )
	new:setLeftRight( true, false, 9, 100 )
	new:setTopBottom( true, false, 1, 32 )
	new.label:setText( Engine.Localize( "MENU_EMBLEM_INSERT_LAYER" ) )
	new:subscribeToGlobalModel( controller, "Controller", "dpad_down_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			new.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( new )
	self.new = new
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.change:close()
		self.cut:close()
		self.copy:close()
		self.new:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

