require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_Specialist_btn_bg" )
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
	self:setLeftRight( true, false, 0, 71 )
	self:setTopBottom( true, false, 0, 37 )
	self.anyChildUsesUpdateState = true
	
	local BMContractsSpecialistbtnbg = CoD.BM_Contracts_Specialist_btn_bg.new( menu, controller )
	BMContractsSpecialistbtnbg:setLeftRight( true, true, -31, 10 )
	BMContractsSpecialistbtnbg:setTopBottom( true, false, -7, 34 )
	BMContractsSpecialistbtnbg:setAlpha( 0 )
	self:addElement( BMContractsSpecialistbtnbg )
	self.BMContractsSpecialistbtnbg = BMContractsSpecialistbtnbg
	
	local BlackBoxBottomRight = LUI.UIImage.new()
	BlackBoxBottomRight:setLeftRight( true, true, -31, 0 )
	BlackBoxBottomRight:setTopBottom( false, false, 11.88, 18.02 )
	BlackBoxBottomRight:setRGB( 0, 0, 0 )
	BlackBoxBottomRight:setAlpha( 0.6 )
	self:addElement( BlackBoxBottomRight )
	self.BlackBoxBottomRight = BlackBoxBottomRight
	
	local BlackBoxRight = LUI.UIImage.new()
	BlackBoxRight:setLeftRight( true, true, -31, 0 )
	BlackBoxRight:setTopBottom( false, false, -18.5, 8.89 )
	BlackBoxRight:setRGB( 0, 0, 0 )
	BlackBoxRight:setAlpha( 0.45 )
	self:addElement( BlackBoxRight )
	self.BlackBoxRight = BlackBoxRight
	
	local backOfCardLabel = LUI.UITightText.new()
	backOfCardLabel:setLeftRight( false, false, -35.5, 35.5 )
	backOfCardLabel:setTopBottom( false, false, -15, 5 )
	backOfCardLabel:setText( Engine.Localize( "MENU_BACK_OF_CARD" ) )
	backOfCardLabel:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( backOfCardLabel, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 5 )
	end )
	self:addElement( backOfCardLabel )
	self.backOfCardLabel = backOfCardLabel
	
	local buttonImage = LUI.UIImage.new()
	buttonImage:setLeftRight( true, false, -27, -5 )
	buttonImage:setTopBottom( false, false, -16, 6 )
	buttonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			buttonImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( buttonImage )
	self.buttonImage = buttonImage
	
	local rightBar = LUI.UIImage.new()
	rightBar:setLeftRight( false, true, -10, 6 )
	rightBar:setTopBottom( false, false, -15.75, 6.14 )
	rightBar:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokemr" ) )
	rightBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( rightBar )
	self.rightBar = rightBar
	
	local borderLines = LUI.UIImage.new()
	borderLines:setLeftRight( true, true, -31, 8.3 )
	borderLines:setTopBottom( false, false, -31.8, 26.2 )
	borderLines:setAlpha( 0.8 )
	borderLines:setImage( RegisterImage( "uie_t7_specialist_footer_btn_frame_right" ) )
	borderLines:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	borderLines:setShaderVector( 0, 0.45, 0.5, 0, 0 )
	borderLines:setupNineSliceShader( 50, 29 )
	self:addElement( borderLines )
	self.borderLines = borderLines
	
	local breadcrumbCount = CoD.NewBreadcrumbCount.new( menu, controller )
	breadcrumbCount:setLeftRight( false, true, -18, 0 )
	breadcrumbCount:setTopBottom( true, false, -13.3, 4.7 )
	breadcrumbCount:linkToElementModel( self, nil, false, function ( model )
		breadcrumbCount:setModel( model, controller )
	end )
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
	self:addElement( breadcrumbCount )
	self.breadcrumbCount = breadcrumbCount
	
	self.breadcrumbCount:linkToElementModel( self, "newTransmissions", true, function ( model )
		local newTransmissions = Engine.GetModelValue( model )
		if newTransmissions then
			breadcrumbCount.countText:setText( Engine.Localize( newTransmissions ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMContractsSpecialistbtnbg:close()
		element.breadcrumbCount:close()
		element.buttonImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

