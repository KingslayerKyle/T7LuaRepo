require( "ui.uieditor.widgets.CAC.NewBreadcrumbCount" )

CoD.ChooseCharacterLoadout_CardFront_BackOfCardOnlyFooter = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardFront_BackOfCardOnlyFooter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardFront_BackOfCardOnlyFooter )
	self.id = "ChooseCharacterLoadout_CardFront_BackOfCardOnlyFooter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 111 )
	self:setTopBottom( 0, 0, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local BlackBox0 = LUI.UIImage.new()
	BlackBox0:setLeftRight( 0, 1, -36, 0 )
	BlackBox0:setTopBottom( 1, 1, 2, 11 )
	BlackBox0:setRGB( 0, 0, 0 )
	BlackBox0:setAlpha( 0.6 )
	self:addElement( BlackBox0 )
	self.BlackBox0 = BlackBox0
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 1, -36, 0 )
	BlackBox:setTopBottom( 0.5, 0.5, -19, 21 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.45 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local text = LUI.UITightText.new()
	text:setLeftRight( 0.5, 0.5, -55.5, 55.5 )
	text:setTopBottom( 0.5, 0.5, -14, 16 )
	text:setText( Engine.Localize( "MENU_BACK_OF_CARD" ) )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 5 )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 5, 70 )
	end )
	self:addElement( text )
	self.text = text
	
	local Button2 = LUI.UIImage.new()
	Button2:setLeftRight( 0, 0, -36, -3 )
	Button2:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	Button2:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Button2:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Button2 )
	self.Button2 = Button2
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 1, 1, -14, 10 )
	Image0:setTopBottom( 0, 1, 10, -8 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokemr" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local frameImage = LUI.UIImage.new()
	frameImage:setLeftRight( 0, 1, -92, 14 )
	frameImage:setTopBottom( 0.5, 0.5, -42, 50 )
	frameImage:setAlpha( 0.8 )
	frameImage:setImage( RegisterImage( "uie_t7_specialist_footer_btn_frame_back" ) )
	frameImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	frameImage:setShaderVector( 0, 0, 0, 0, 0 )
	frameImage:setupNineSliceShader( 100, 45 )
	self:addElement( frameImage )
	self.frameImage = frameImage
	
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
		self.Button2:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

