require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorButtonPrompt" )

CoD.EmblemEditorColorSwatchControls = InheritFrom( LUI.UIElement )
CoD.EmblemEditorColorSwatchControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemEditorColorSwatchControls )
	self.id = "EmblemEditorColorSwatchControls"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 250 )
	self:setTopBottom( true, false, 0, 244 )
	self.anyChildUsesUpdateState = true
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, 250 )
	title:setTopBottom( true, false, 0, 25 )
	title:setRGB( 1, 1, 1 )
	title:setText( Engine.Localize( "MENU_CONTROLS" ) )
	title:setTTF( "fonts/default.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local opacityText = LUI.UIText.new()
	opacityText:setLeftRight( true, true, 13, -53 )
	opacityText:setTopBottom( true, false, 61.94, 77.94 )
	opacityText:setRGB( 1, 1, 1 )
	opacityText:setText( Engine.Localize( "MENU_EMBLEM_LAYER_OPACITY" ) )
	opacityText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	opacityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( opacityText )
	self.opacityText = opacityText
	
	local changeColor = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	changeColor:setLeftRight( true, false, 0, 250 )
	changeColor:setTopBottom( true, false, 26.94, 57.94 )
	changeColor:setRGB( 1, 1, 1 )
	changeColor.label:setText( Engine.Localize( "MENU_EMBLEM_CHANGE_COLOR" ) )
	changeColor:subscribeToGlobalModel( controller, "Controller", "left_stick_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			changeColor.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( changeColor )
	self.changeColor = changeColor
	
	local toggleColorMixerButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	toggleColorMixerButton:setLeftRight( true, false, 0, 250 )
	toggleColorMixerButton:setTopBottom( true, false, 86.94, 117.94 )
	toggleColorMixerButton:setRGB( 1, 1, 1 )
	toggleColorMixerButton.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_COLOR_MIXER" ) )
	toggleColorMixerButton:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleColorMixerButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleColorMixerButton )
	self.toggleColorMixerButton = toggleColorMixerButton
	
	local toggleSolidColorButton = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	toggleSolidColorButton:setLeftRight( true, false, 0, 250 )
	toggleSolidColorButton:setTopBottom( true, false, 86.94, 117.94 )
	toggleSolidColorButton:setRGB( 1, 1, 1 )
	toggleSolidColorButton:setAlpha( 0 )
	toggleSolidColorButton.label:setText( Engine.Localize( "MENU_EMBLEM_TOGGLE_TO_SOLID_FILL" ) )
	toggleSolidColorButton:subscribeToGlobalModel( controller, "Controller", "back_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			toggleSolidColorButton.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( toggleSolidColorButton )
	self.toggleSolidColorButton = toggleSolidColorButton
	
	local lsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	lsOpacity:setLeftRight( true, false, 200, 224 )
	lsOpacity:setTopBottom( true, false, 57.94, 81.94 )
	lsOpacity:setRGB( 1, 1, 1 )
	lsOpacity.label:setText( Engine.Localize( "" ) )
	lsOpacity:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lsOpacity.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( lsOpacity )
	self.lsOpacity = lsOpacity
	
	local rsOpacity = CoD.EmblemEditorButtonPrompt.new( menu, controller )
	rsOpacity:setLeftRight( true, false, 226, 250 )
	rsOpacity:setTopBottom( true, false, 57.94, 81.94 )
	rsOpacity:setRGB( 1, 1, 1 )
	rsOpacity.label:setText( Engine.Localize( "" ) )
	rsOpacity:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rsOpacity.buttonPromptImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rsOpacity )
	self.rsOpacity = rsOpacity
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				toggleColorMixerButton:completeAnimation()
				self.toggleColorMixerButton:setAlpha( 1 )
				self.clipFinished( toggleColorMixerButton, {} )
				toggleSolidColorButton:completeAnimation()
				self.toggleSolidColorButton:setAlpha( 0 )
				self.clipFinished( toggleSolidColorButton, {} )
			end
		},
		colorMixerMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				toggleColorMixerButton:completeAnimation()
				self.toggleColorMixerButton:setAlpha( 0 )
				self.clipFinished( toggleColorMixerButton, {} )
				toggleSolidColorButton:completeAnimation()
				self.toggleSolidColorButton:setAlpha( 1 )
				self.clipFinished( toggleSolidColorButton, {} )
			end
		},
		solidColorMode = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				toggleColorMixerButton:completeAnimation()
				self.toggleColorMixerButton:setAlpha( 1 )
				self.clipFinished( toggleColorMixerButton, {} )
				toggleSolidColorButton:completeAnimation()
				self.toggleSolidColorButton:setAlpha( 0 )
				self.clipFinished( toggleSolidColorButton, {} )
			end
		}
	}
	self.close = function ( self )
		self.changeColor:close()
		self.toggleColorMixerButton:close()
		self.toggleSolidColorButton:close()
		self.lsOpacity:close()
		self.rsOpacity:close()
		CoD.EmblemEditorColorSwatchControls.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

