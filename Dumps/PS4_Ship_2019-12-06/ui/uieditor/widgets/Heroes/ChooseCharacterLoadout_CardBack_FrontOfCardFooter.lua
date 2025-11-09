require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_specialiste_single_btn_bg" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.text:setText( f1_arg0.text:getText() )
end

CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter = InheritFrom( LUI.UIElement )
CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacterLoadout_CardBack_FrontOfCardFooter )
	self.id = "ChooseCharacterLoadout_CardBack_FrontOfCardFooter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 74 )
	self:setTopBottom( true, false, 0, 34 )
	
	local BMContractsspecialistesinglebtnbg = CoD.BM_Contracts_specialiste_single_btn_bg.new( menu, controller )
	BMContractsspecialistesinglebtnbg:setLeftRight( true, false, -62.5, 82.5 )
	BMContractsspecialistesinglebtnbg:setTopBottom( true, false, -2.75, 37.25 )
	BMContractsspecialistesinglebtnbg:setAlpha( 0 )
	self:addElement( BMContractsspecialistesinglebtnbg )
	self.BMContractsspecialistesinglebtnbg = BMContractsspecialistesinglebtnbg
	
	local BlackBox0 = LUI.UIImage.new()
	BlackBox0:setLeftRight( true, true, -24, 0 )
	BlackBox0:setTopBottom( false, true, 1.38, 7.13 )
	BlackBox0:setRGB( 0.52, 0.52, 0.52 )
	BlackBox0:setAlpha( 0.25 )
	self:addElement( BlackBox0 )
	self.BlackBox0 = BlackBox0
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( true, true, -24, 0 )
	BlackBox:setTopBottom( false, false, -13, 14 )
	BlackBox:setRGB( 0.52, 0.52, 0.52 )
	BlackBox:setAlpha( 0.25 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local text = LUI.UITightText.new()
	text:setLeftRight( false, false, -37, 37 )
	text:setTopBottom( false, false, -9.5, 10.5 )
	text:setText( Engine.Localize( "MENU_FRONT_OF_CARD" ) )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 5 )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 5, 70 )
	end )
	self:addElement( text )
	self.text = text
	
	local Button2 = LUI.UIImage.new()
	Button2:setLeftRight( true, false, -24, -2 )
	Button2:setTopBottom( false, false, -11, 11 )
	Button2:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			Button2:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( Button2 )
	self.Button2 = Button2
	
	local Line = LUI.UIImage.new()
	Line:setLeftRight( false, true, -9, 7 )
	Line:setTopBottom( true, true, 6.25, -5.25 )
	Line:setImage( RegisterImage( "uie_t7_menu_cac_buttonboxlrgstrokemr" ) )
	Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Line )
	self.Line = Line
	
	local frameImage = LUI.UIImage.new()
	frameImage:setLeftRight( true, true, -61.3, 9.5 )
	frameImage:setTopBottom( false, false, -27.83, 33.33 )
	frameImage:setAlpha( 0.8 )
	frameImage:setImage( RegisterImage( "uie_t7_specialist_footer_btn_frame_back" ) )
	frameImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	frameImage:setShaderVector( 0, 0.46, 0.49, 0, 0 )
	frameImage:setupNineSliceShader( 67, 30 )
	self:addElement( frameImage )
	self.frameImage = frameImage
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMContractsspecialistesinglebtnbg:close()
		element.Button2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

