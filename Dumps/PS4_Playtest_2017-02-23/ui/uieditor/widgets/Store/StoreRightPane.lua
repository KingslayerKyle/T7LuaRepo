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
	self:setLeftRight( 0, 0, 0, 582 )
	self:setTopBottom( 0, 0, 0, 789 )
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local productDescBg = LUI.UIImage.new()
	productDescBg:setLeftRight( 0, 1, 2, -2 )
	productDescBg:setTopBottom( 1, 1, -406, 0 )
	productDescBg:setRGB( 0, 0, 0 )
	productDescBg:setAlpha( 0.8 )
	self:addElement( productDescBg )
	self.productDescBg = productDescBg
	
	local previewImage = LUI.UIImage.new()
	previewImage:setLeftRight( 0, 0, 2, 581 )
	previewImage:setTopBottom( 0, 0, 1, 382 )
	previewImage:linkToElementModel( self, "productImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			previewImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( previewImage )
	self.previewImage = previewImage
	
	local verticalScrollingTextBox = CoD.verticalScrollingTextBox.new( menu, controller )
	verticalScrollingTextBox:setLeftRight( 0, 0, 24, 537 )
	verticalScrollingTextBox:setTopBottom( 0, 0, 410, 762 )
	verticalScrollingTextBox.textBox:setTTF( "fonts/Store.ttf" )
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
	featlineleft:setLeftRight( 0, 0, 293, 299 )
	featlineleft:setTopBottom( 0, 0, 82, 685 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local ArrowSide0 = LUI.UIImage.new()
	ArrowSide0:setLeftRight( 0.5, 0.5, 260, 268 )
	ArrowSide0:setTopBottom( 0.5, 0.5, 359, 375 )
	ArrowSide0:setZRot( -90 )
	ArrowSide0:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowhorz" ) )
	self:addElement( ArrowSide0 )
	self.ArrowSide0 = ArrowSide0
	
	local ArrowSide00 = LUI.UIImage.new()
	ArrowSide00:setLeftRight( 0.5, 0.5, 260, 268 )
	ArrowSide00:setTopBottom( 0.5, 0.5, 11, 27 )
	ArrowSide00:setZRot( 90 )
	ArrowSide00:setImage( RegisterImage( "uie_t7_mp_hud_scorestreak_arrowhorz" ) )
	self:addElement( ArrowSide00 )
	self.ArrowSide00 = ArrowSide00
	
	self.resetProperties = function ()
		ArrowSide00:completeAnimation()
		ArrowSide0:completeAnimation()
		featlineleft:completeAnimation()
		verticalScrollingTextBox:completeAnimation()
		previewImage:completeAnimation()
		productDescBg:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		ArrowSide00:setAlpha( 1 )
		ArrowSide0:setAlpha( 1 )
		featlineleft:setAlpha( 1 )
		verticalScrollingTextBox:setAlpha( 1 )
		previewImage:setAlpha( 1 )
		productDescBg:setAlpha( 0.8 )
		BoxButtonLrgInactive:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				productDescBg:completeAnimation()
				self.productDescBg:setAlpha( 0 )
				self.clipFinished( productDescBg, {} )
				previewImage:completeAnimation()
				self.previewImage:setAlpha( 0 )
				self.clipFinished( previewImage, {} )
				verticalScrollingTextBox:completeAnimation()
				self.verticalScrollingTextBox:setAlpha( 0 )
				self.clipFinished( verticalScrollingTextBox, {} )
				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )
				ArrowSide0:completeAnimation()
				self.ArrowSide0:setAlpha( 0 )
				self.clipFinished( ArrowSide0, {} )
				ArrowSide00:completeAnimation()
				self.ArrowSide00:setAlpha( 0 )
				self.clipFinished( ArrowSide00, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return HideProductNameAndDesc()
			end
		}
	} )
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

