require( "ui.uieditor.widgets.Border" )

CoD.ChooseCharacter_HelpBubble_Button_PC = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble_Button_PC.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_HelpBubble_Button_PC )
	self.id = "ChooseCharacter_HelpBubble_Button_PC"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 155 )
	self:setTopBottom( true, false, 0, 72 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.7 )
	self:addElement( Background )
	self.Background = Background
	
	local FETabIdle0 = LUI.UIImage.new()
	FETabIdle0:setLeftRight( true, true, 149.13, -150 )
	FETabIdle0:setTopBottom( true, true, -2, 2 )
	FETabIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle0:setShaderVector( 0, 0.04, 0.19, 0, 0 )
	FETabIdle0:setupNineSliceShader( 8, 8 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local TriangleBorder = CoD.Border.new( menu, controller )
	TriangleBorder:setLeftRight( true, true, -1, 0.13 )
	TriangleBorder:setTopBottom( true, true, 0, 0 )
	self:addElement( TriangleBorder )
	self.TriangleBorder = TriangleBorder
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -26, 2 )
	Image1:setTopBottom( false, false, 34, 38 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -26, 2 )
	Image0:setTopBottom( false, false, -38, -34 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local emblemline0 = LUI.UIImage.new()
	emblemline0:setLeftRight( false, false, -85, -81 )
	emblemline0:setTopBottom( false, false, -36, 36 )
	emblemline0:setAlpha( 0.25 )
	emblemline0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline0 )
	self.emblemline0 = emblemline0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 9, 145.13 )
	TextBox0:setTopBottom( true, false, 8.35, 27.35 )
	TextBox0:setText( Engine.Localize( "MENU_TO_BROWSE_CLICK" ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextBox0:completeAnimation()
				self.TextBox0:setText( Engine.Localize( "MENU_TO_BROWSE_CLICK" ) )
				self.clipFinished( TextBox0, {} )
			end
		},
		ChangedCharacter = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextBox0:completeAnimation()
				self.TextBox0:setText( Engine.Localize( "MENU_CLICK_WEAPON_ABILITY" ) )
				self.clipFinished( TextBox0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ChangedCharacter",
			condition = function ( menu, element, event )
				return FirstTimeSetup_ChangedCharacter( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "firstTimeFlowState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "firstTimeFlowState"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 10, 10 )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TriangleBorder:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

