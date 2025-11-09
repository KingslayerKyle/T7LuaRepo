require( "ui.uieditor.widgets.ButtonIcon" )

CoD.GotIt_Button = InheritFrom( LUI.UIElement )
CoD.GotIt_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GotIt_Button )
	self.id = "GotIt_Button"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 45 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FEButtonFocus = LUI.UIImage.new()
	FEButtonFocus:setLeftRight( true, true, 0, 0 )
	FEButtonFocus:setTopBottom( false, false, -22.66, 22.66 )
	FEButtonFocus:setZoom( 10 )
	FEButtonFocus:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusfull" ) )
	FEButtonFocus:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEButtonFocus:setShaderVector( 0, 0.2, 0.5, 0.38, 0.2 )
	FEButtonFocus:setupNineSliceShader( 60, 20 )
	self:addElement( FEButtonFocus )
	self.FEButtonFocus = FEButtonFocus
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 50.88, 120 )
	TextBox2:setTopBottom( true, false, 12.69, 34.47 )
	TextBox2:setRGB( 0, 0, 0 )
	TextBox2:setText( Engine.Localize( "MENU_WELCOME_MENU_GOT_IT" ) )
	TextBox2:setTTF( "fonts/escom.ttf" )
	TextBox2:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox2:setShaderVector( 0, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 1, 0, 0, 0, 0 )
	TextBox2:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local ButtonIcon00 = CoD.ButtonIcon.new( menu, controller )
	ButtonIcon00:setLeftRight( true, false, 14.14, 42.14 )
	ButtonIcon00:setTopBottom( true, false, 9.58, 37.58 )
	ButtonIcon00:setAlpha( 0.7 )
	ButtonIcon00:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonIcon00.buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	ButtonIcon00:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( ButtonIcon00 )
	self.ButtonIcon00 = ButtonIcon00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonIcon00:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

