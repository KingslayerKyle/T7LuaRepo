require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )

CoD.StoreRightPane = InheritFrom( LUI.UIElement )
CoD.StoreRightPane.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StoreRightPane )
	self.id = "StoreRightPane"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 388 )
	self:setTopBottom( true, false, 0, 526 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local productDescBg = LUI.UIImage.new()
	productDescBg:setLeftRight( true, true, 1, -1 )
	productDescBg:setTopBottom( false, true, -270.9, 0 )
	productDescBg:setRGB( 0, 0, 0 )
	productDescBg:setAlpha( 0.8 )
	self:addElement( productDescBg )
	self.productDescBg = productDescBg
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( true, false, 1, 387 )
	previewImage:setTopBottom( true, false, 1, 255 )
	previewImage:linkToElementModel( self, "productImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			previewImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	local verticalScrollingTextBox = CoD.verticalScrollingTextBox.new( menu, controller )
	verticalScrollingTextBox:setLeftRight( true, false, 16, 358 )
	verticalScrollingTextBox:setTopBottom( true, false, 273, 508 )
	verticalScrollingTextBox.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	verticalScrollingTextBox:linkToElementModel( self, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			verticalScrollingTextBox.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( verticalScrollingTextBox )
	self.verticalScrollingTextBox = verticalScrollingTextBox
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( true, false, 195, 199 )
	featlineleft:setTopBottom( true, false, 55, 457 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local ArrowSide0 = LUI.UIImage.new()
	ArrowSide0:setLeftRight( false, false, 173.5, 179 )
	ArrowSide0:setTopBottom( false, false, 239, 250 )
	ArrowSide0:setZRot( -90 )
	ArrowSide0:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowhorz" ) )
	self:addElement( ArrowSide0 )
	self.ArrowSide0 = ArrowSide0
	
	local ArrowSide00 = LUI.UIImage.new()
	ArrowSide00:setLeftRight( false, false, 173.5, 179 )
	ArrowSide00:setTopBottom( false, false, 7, 18 )
	ArrowSide00:setZRot( 90 )
	ArrowSide00:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowhorz" ) )
	self:addElement( ArrowSide00 )
	self.ArrowSide00 = ArrowSide00
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.verticalScrollingTextBox:close()
		self.previewImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

