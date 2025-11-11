require( "ui.uieditor.widgets.CAC.NewBreadcrumbCount" )

CoD.ChooseCharacterLoadout_ButtonFooter_BackOfCard = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_ButtonFooter_BackOfCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_ButtonFooter_BackOfCard )
	self.id = "ChooseCharacterLoadout_ButtonFooter_BackOfCard"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 106 )
	self:setTopBottom( 0, 0, 0, 55 )
	self.anyChildUsesUpdateState = true
	
	local BlackBoxBottomRight = LUI.UIImage.new()
	BlackBoxBottomRight:setLeftRight( 0, 1, -46, 0 )
	BlackBoxBottomRight:setTopBottom( 0.5, 0.5, 18, 27 )
	BlackBoxBottomRight:setRGB( 0, 0, 0 )
	BlackBoxBottomRight:setAlpha( 0.6 )
	self:addElement( BlackBoxBottomRight )
	self.BlackBoxBottomRight = BlackBoxBottomRight
	
	local BlackBoxRight = LUI.UIImage.new()
	BlackBoxRight:setLeftRight( 0, 1, -46, 0 )
	BlackBoxRight:setTopBottom( 0.5, 0.5, -28, 13 )
	BlackBoxRight:setRGB( 0, 0, 0 )
	BlackBoxRight:setAlpha( 0.45 )
	self:addElement( BlackBoxRight )
	self.BlackBoxRight = BlackBoxRight
	
	local backOfCardLabel = LUI.UITightText.new()
	backOfCardLabel:setLeftRight( 0.5, 0.5, -53, 53 )
	backOfCardLabel:setTopBottom( 0.5, 0.5, -23, 7 )
	backOfCardLabel:setText( Engine.Localize( "MENU_BACK_OF_CARD" ) )
	backOfCardLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( backOfCardLabel, "setText", function ( element, text )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 5, 71 )
	end )
	self:addElement( backOfCardLabel )
	self.backOfCardLabel = backOfCardLabel
	
	local buttonImage = LUI.UIImage.new()
	buttonImage:setLeftRight( 0, 0, -41, -8 )
	buttonImage:setTopBottom( 0.5, 0.5, -24, 9 )
	buttonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( buttonImage )
	self.buttonImage = buttonImage
	
	local rightBar = LUI.UIImage.new()
	rightBar:setLeftRight( 1, 1, -15, 9 )
	rightBar:setTopBottom( 0.5, 0.5, -24, 9 )
	rightBar:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokemr" ) )
	rightBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( rightBar )
	self.rightBar = rightBar
	
	local borderLines = LUI.UIImage.new()
	borderLines:setLeftRight( 0, 1, -46, 12 )
	borderLines:setTopBottom( 0.5, 0.5, -48, 39 )
	borderLines:setAlpha( 0.8 )
	borderLines:setImage( RegisterImage( "uie_t7_specialist_footer_btn_frame_right" ) )
	borderLines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	borderLines:setShaderVector( 0, 0, 0, 0, 0 )
	borderLines:setupNineSliceShader( 75, 43 )
	self:addElement( borderLines )
	self.borderLines = borderLines
	
	local breadcrumbCount = CoD.NewBreadcrumbCount.new( menu, controller )
	breadcrumbCount:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "newTransmissions", 1 )
			end
		}
	} )
	breadcrumbCount:linkToElementModel( breadcrumbCount, "newTransmissions", true, function ( model )
		menu:updateElementState( breadcrumbCount, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "newTransmissions"
		} )
	end )
	breadcrumbCount:setLeftRight( 1, 1, -27.5, -0.5 )
	breadcrumbCount:setTopBottom( 0, 0, -19.5, 7.5 )
	breadcrumbCount:linkToElementModel( self, nil, false, function ( model )
		breadcrumbCount:setModel( model, controller )
	end )
	self:addElement( breadcrumbCount )
	self.breadcrumbCount = breadcrumbCount
	
	self.breadcrumbCount:linkToElementModel( self, "newTransmissions", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			breadcrumbCount.countText:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.breadcrumbCount:close()
		self.buttonImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

