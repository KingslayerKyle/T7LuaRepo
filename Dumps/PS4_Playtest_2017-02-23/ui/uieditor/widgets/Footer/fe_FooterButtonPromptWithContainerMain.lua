require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Footer.fe_BTNBG" )

CoD.fe_FooterButtonPromptWithContainerMain = InheritFrom( LUI.UIElement )
CoD.fe_FooterButtonPromptWithContainerMain.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_FooterButtonPromptWithContainerMain )
	self.id = "fe_FooterButtonPromptWithContainerMain"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local feBTNBG0 = CoD.fe_BTNBG.new( menu, controller )
	feBTNBG0:setLeftRight( 0, 1, -33, 7 )
	feBTNBG0:setTopBottom( 0, 1, 0, 0 )
	feBTNBG0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	feBTNBG0:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( feBTNBG0 )
	self.feBTNBG0 = feBTNBG0
	
	local line = LUI.UIImage.new()
	line:setLeftRight( 0, 1, 6, -34 )
	line:setTopBottom( 0, 1, 0, 0 )
	line:setAlpha( 0.35 )
	line:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_linetopandbotbg" ) )
	self:addElement( line )
	self.line = line
	
	local left = LUI.UIImage.new()
	left:setLeftRight( 0, 0, -33, 6 )
	left:setTopBottom( 0, 1, 0, 0 )
	left:setAlpha( 0.35 )
	left:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_left_bg" ) )
	self:addElement( left )
	self.left = left
	
	local Right = LUI.UIImage.new()
	Right:setLeftRight( 1, 1, -33, 6 )
	Right:setTopBottom( 0, 1, 0, 0 )
	Right:setAlpha( 0.35 )
	Right:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_rightbg" ) )
	self:addElement( Right )
	self.Right = Right
	
	local left0 = LUI.UIImage.new()
	left0:setLeftRight( 0, 0, -33, 6 )
	left0:setTopBottom( 0, 1, 0, 0 )
	left0:setAlpha( 0.65 )
	left0:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_left" ) )
	left0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( left0 )
	self.left0 = left0
	
	local Right0 = LUI.UIImage.new()
	Right0:setLeftRight( 1, 1, -33, 6 )
	Right0:setTopBottom( 0, 1, 0, 0 )
	Right0:setAlpha( 0.65 )
	Right0:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_right" ) )
	Right0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Right0 )
	self.Right0 = Right0
	
	local line0 = LUI.UIImage.new()
	line0:setLeftRight( 0, 1, 6, -34 )
	line0:setTopBottom( 0, 1, 0, 0 )
	line0:setAlpha( 0.65 )
	line0:setImage( RegisterImage( "uie_t7_fe_footer_btn_frame_linetopandbot" ) )
	line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( line0 )
	self.line0 = line0
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( 0, 0, 2, 38 )
	buttonPromptImage:setTopBottom( 0, 0, 28, 64 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
	buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( 0, 0, 44, 107 )
	label:setTopBottom( 0, 0, 33, 60 )
	label:setText( Engine.Localize( "Select" ) )
	label:setTTF( "fonts/default.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( label, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, -10 )
	end )
	self:addElement( label )
	self.label = label
	
	local keybind = LUI.UIText.new()
	keybind:setLeftRight( 0, 0, 2, 38 )
	keybind:setTopBottom( 0, 0, 28, 66 )
	keybind:setAlpha( 0 )
	keybind:setText( Engine.Localize( "MENU_NEW" ) )
	keybind:setTTF( "fonts/default.ttf" )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	keybind:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( keybind )
	self.keybind = keybind
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0, 0, 0, 39 )
	Border:setTopBottom( 0, 0, 27, 66 )
	Border:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( Border )
	self.Border = Border
	
	self.resetProperties = function ()
		line0:completeAnimation()
		Right0:completeAnimation()
		left0:completeAnimation()
		Right:completeAnimation()
		left:completeAnimation()
		line:completeAnimation()
		feBTNBG0:completeAnimation()
		buttonPromptImage:completeAnimation()
		label:completeAnimation()
		Border:completeAnimation()
		keybind:completeAnimation()
		line0:setAlpha( 0.65 )
		Right0:setAlpha( 0.65 )
		left0:setAlpha( 0.65 )
		Right:setAlpha( 0.35 )
		left:setAlpha( 0.35 )
		line:setAlpha( 0.35 )
		feBTNBG0:setAlpha( 1 )
		buttonPromptImage:setRGB( 1, 1, 1 )
		buttonPromptImage:setAlpha( 1 )
		buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_saturation_normal" ) )
		buttonPromptImage:setShaderVector( 0, 1, 0, 0, 0 )
		label:setRGB( 1, 1, 1 )
		label:setAlpha( 1 )
		Border:setAlpha( 1 )
		keybind:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
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
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
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
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		Enabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				label:completeAnimation()
				self.label:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( label, {} )
			end
		},
		DisabledPC = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				keybind:completeAnimation()
				self.keybind:setAlpha( 1 )
				self.clipFinished( keybind, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( label, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.feBTNBG0:close()
		self.Border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

