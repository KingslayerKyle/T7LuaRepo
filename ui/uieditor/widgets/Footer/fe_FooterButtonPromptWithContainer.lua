-- 8f7ce84295f7fcbda2ee57dbe801e004
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.fe_BTNBG" )
require( "ui.uieditor.widgets.Border" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	f1_arg0:setHandleMouse( true )
	f1_arg0:registerEventHandler( "button_action", function ( element, event )
		CoD.PCUtil.SimulateButtonPressUsingElement( f1_arg1, element )
		element:playClip( "DefaultClip" )
		return true
	end )
	f1_arg0.keybind:linkToElementModel( f1_arg0, "KeyShortcut", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.keybind:setText( Engine.Localize( modelValue ) )
		end
	end )
end

local PostLoadFunc = function ( f4_arg0, f4_arg1 )
	if CoD.isPC then
		f0_local0( f4_arg0, f4_arg1 )
	end
	f4_arg0.label:linkToElementModel( f4_arg0, "Label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f4_arg0.label:setText( Engine.Localize( modelValue ) )
		end
	end )
end

CoD.fe_FooterButtonPromptWithContainer = InheritFrom( LUI.UIElement )
CoD.fe_FooterButtonPromptWithContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_FooterButtonPromptWithContainer )
	self.id = "fe_FooterButtonPromptWithContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 65 )
	self.anyChildUsesUpdateState = true
	
	local feBTNBG0 = CoD.fe_BTNBG.new( menu, controller )
	feBTNBG0:setLeftRight( true, true, -22, 5 )
	feBTNBG0:setTopBottom( true, true, 0, 0 )
	feBTNBG0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	feBTNBG0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( feBTNBG0 )
	self.feBTNBG0 = feBTNBG0
	
	local line = LUI.UIImage.new()
	line:setLeftRight( true, true, 4, -22 )
	line:setTopBottom( true, true, 0, 0 )
	line:setAlpha( 0.35 )
	line:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_linetopandbotbg" ) )
	self:addElement( line )
	self.line = line
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, false, -22, 4 )
	left:setTopBottom( true, true, 0, 0 )
	left:setAlpha( 0.35 )
	left:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_left_bg" ) )
	self:addElement( left )
	self.left = left
	
	local Right = LUI.UIImage.new()
	Right:setLeftRight( false, true, -22, 4 )
	Right:setTopBottom( true, true, 0, 0 )
	Right:setAlpha( 0.35 )
	Right:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_rightbg" ) )
	self:addElement( Right )
	self.Right = Right
	
	local left0 = LUI.UIImage.new()
	left0:setLeftRight( true, false, -22, 4 )
	left0:setTopBottom( true, true, 0, 0 )
	left0:setAlpha( 0.65 )
	left0:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_left" ) )
	left0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( left0 )
	self.left0 = left0
	
	local Right0 = LUI.UIImage.new()
	Right0:setLeftRight( false, true, -22, 4 )
	Right0:setTopBottom( true, true, 0, 0 )
	Right0:setAlpha( 0.65 )
	Right0:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_right" ) )
	Right0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Right0 )
	self.Right0 = Right0
	
	local line0 = LUI.UIImage.new()
	line0:setLeftRight( true, true, 4, -22 )
	line0:setTopBottom( true, true, 0, 0 )
	line0:setAlpha( 0.65 )
	line0:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_linetopandbot" ) )
	line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( line0 )
	self.line0 = line0
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 8, 32 )
	buttonPromptImage:setTopBottom( true, false, 19, 43 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 36, 78 )
	label:setTopBottom( true, false, 22, 40 )
	label:setText( Engine.Localize( "Select" ) )
	label:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( label )
	self.label = label
	
	local keybind = LUI.UIText.new()
	keybind:setLeftRight( true, false, 8, 32 )
	keybind:setTopBottom( true, false, 19, 44 )
	keybind:setAlpha( 0 )
	keybind:setText( Engine.Localize( "MENU_NEW" ) )
	keybind:setTTF( "fonts/default.ttf" )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( keybind )
	self.keybind = keybind
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, false, 7, 33 )
	Border:setTopBottom( true, false, 18, 44 )
	Border:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( Border )
	self.Border = Border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				feBTNBG0:completeAnimation()
				self.feBTNBG0:setAlpha( 0 )
				self.clipFinished( feBTNBG0, {} )
				line:completeAnimation()
				self.line:setAlpha( 0 )
				self.clipFinished( line, {} )
				left:completeAnimation()
				self.left:setAlpha( 0 )
				self.clipFinished( left, {} )
				Right:completeAnimation()
				self.Right:setAlpha( 0 )
				self.clipFinished( Right, {} )
				left0:completeAnimation()
				self.left0:setAlpha( 0 )
				self.clipFinished( left0, {} )
				Right0:completeAnimation()
				self.Right0:setAlpha( 0 )
				self.clipFinished( Right0, {} )
				line0:completeAnimation()
				self.line0:setAlpha( 0 )
				self.clipFinished( line0, {} )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 0.5, 0.5, 0.5 )
				self.buttonPromptImage:setAlpha( 0.5 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.5, 0.5, 0.5 )
				self.label:setAlpha( 0.5 )
				self.clipFinished( label, {} )
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		Enabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				feBTNBG0:completeAnimation()
				self.feBTNBG0:setAlpha( 1 )
				self.clipFinished( feBTNBG0, {} )
				line:completeAnimation()
				self.line:setAlpha( 0.35 )
				self.clipFinished( line, {} )
				left:completeAnimation()
				self.left:setAlpha( 0.35 )
				self.clipFinished( left, {} )
				Right:completeAnimation()
				self.Right:setAlpha( 0.35 )
				self.clipFinished( Right, {} )
				left0:completeAnimation()
				self.left0:setAlpha( 0.65 )
				self.clipFinished( left0, {} )
				Right0:completeAnimation()
				self.Right0:setAlpha( 0.65 )
				self.clipFinished( Right0, {} )
				line0:completeAnimation()
				self.line0:setAlpha( 0.65 )
				self.clipFinished( line0, {} )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 1 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 10 )
				feBTNBG0:completeAnimation()
				self.feBTNBG0:setAlpha( 1 )
				self.clipFinished( feBTNBG0, {} )
				line:completeAnimation()
				self.line:setAlpha( 0.35 )
				self.clipFinished( line, {} )
				left:completeAnimation()
				self.left:setAlpha( 0.35 )
				self.clipFinished( left, {} )
				Right:completeAnimation()
				self.Right:setAlpha( 0.35 )
				self.clipFinished( Right, {} )
				left0:completeAnimation()
				self.left0:setAlpha( 0.65 )
				self.clipFinished( left0, {} )
				Right0:completeAnimation()
				self.Right0:setAlpha( 0.65 )
				self.clipFinished( Right0, {} )
				line0:completeAnimation()
				self.line0:setAlpha( 0.65 )
				self.clipFinished( line0, {} )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 1 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.87, 0.37, 0 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				keybind:completeAnimation()
				self.keybind:setAlpha( 0 )
				self.clipFinished( keybind, {} )
			end
		},
		DisabledPC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setRGB( 0.5, 0.5, 0.5 )
				self.buttonPromptImage:setAlpha( 0 )
				self.buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
				self.buttonPromptImage:setShaderVector( 0, 0, 0, 0, 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.5, 0.5, 0.5 )
				self.label:setAlpha( 0.5 )
				self.clipFinished( label, {} )
				keybind:completeAnimation()
				self.keybind:setAlpha( 0.25 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		EnabledPC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				feBTNBG0:completeAnimation()
				self.feBTNBG0:setAlpha( 1 )
				self.clipFinished( feBTNBG0, {} )
				line:completeAnimation()
				self.line:setAlpha( 0.35 )
				self.clipFinished( line, {} )
				left:completeAnimation()
				self.left:setAlpha( 0.35 )
				self.clipFinished( left, {} )
				Right:completeAnimation()
				self.Right:setAlpha( 0.35 )
				self.clipFinished( Right, {} )
				left0:completeAnimation()
				self.left0:setAlpha( 0.65 )
				self.clipFinished( left0, {} )
				Right0:completeAnimation()
				self.Right0:setAlpha( 0.65 )
				self.clipFinished( Right0, {} )
				line0:completeAnimation()
				self.line0:setAlpha( 0.65 )
				self.clipFinished( line0, {} )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				keybind:completeAnimation()
				self.keybind:setAlpha( 1 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 9 )
				feBTNBG0:completeAnimation()
				self.feBTNBG0:setAlpha( 1 )
				self.clipFinished( feBTNBG0, {} )
				line:completeAnimation()
				self.line:setAlpha( 0.35 )
				self.clipFinished( line, {} )
				left:completeAnimation()
				self.left:setAlpha( 0.35 )
				self.clipFinished( left, {} )
				Right:completeAnimation()
				self.Right:setAlpha( 0.35 )
				self.clipFinished( Right, {} )
				left0:completeAnimation()
				self.left0:setAlpha( 0.65 )
				self.clipFinished( left0, {} )
				Right0:completeAnimation()
				self.Right0:setAlpha( 0.65 )
				self.clipFinished( Right0, {} )
				line0:completeAnimation()
				self.line0:setAlpha( 0.65 )
				self.clipFinished( line0, {} )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.87, 0.37, 0 )
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS ) and IsGamepad( controller )
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS ) and IsGamepad( controller )
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS ) and not IsGamepad( controller )
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "", Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS ) and not IsGamepad( controller )
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if self.m_eventHandlers.input_source_changed then
		local f6_local12 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f6_local12( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "DefaultState" ) then
			OverrideWidgetWidth( self, "0" )
		else
			RestoreWidgetWidth( self )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feBTNBG0:close()
		element.Border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

