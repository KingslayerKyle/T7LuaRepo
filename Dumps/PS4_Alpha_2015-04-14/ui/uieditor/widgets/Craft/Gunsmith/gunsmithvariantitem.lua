require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.Panes.CustomClassPlusSymbol" )

CoD.GunsmithVariantItem = InheritFrom( LUI.UIElement )
CoD.GunsmithVariantItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithVariantItem )
	self.id = "GunsmithVariantItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, -0.5, 0.5 )
	BorderBakedMask0:setTopBottom( true, true, -0.5, 0.5 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0.9 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setRGB( 1, 1, 1 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0.5, -0.5 )
	border:setTopBottom( true, true, 0.5, -0.5 )
	border:setRGB( 1, 0.41, 0 )
	border:setAlpha( 0 )
	self:addElement( border )
	self.border = border
	
	local variantImage = LUI.UIImage.new()
	variantImage:setLeftRight( true, true, 12, -12 )
	variantImage:setTopBottom( true, true, 4, -20 )
	variantImage:setRGB( 1, 1, 1 )
	variantImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	variantImage:linkToElementModel( self, "variantImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			variantImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( variantImage )
	self.variantImage = variantImage
	
	local variantImageMask = LUI.UIImage.new()
	variantImageMask:setLeftRight( true, true, 0.5, -0.5 )
	variantImageMask:setTopBottom( true, true, 0.5, -3.5 )
	variantImageMask:setRGB( 0, 0, 0 )
	variantImageMask:setAlpha( 0.36 )
	variantImageMask:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( variantImageMask )
	self.variantImageMask = variantImageMask
	
	local plusIcon = CoD.CustomClassPlusSymbol.new( menu, controller )
	plusIcon:setLeftRight( false, false, -10, 10 )
	plusIcon:setTopBottom( false, false, -10, 10 )
	plusIcon:setRGB( 1, 1, 1 )
	plusIcon:setAlpha( 0 )
	self:addElement( plusIcon )
	self.plusIcon = plusIcon
	
	local variantName = LUI.UIText.new()
	variantName:setLeftRight( true, true, 0.5, 0.5 )
	variantName:setTopBottom( true, false, 70.5, 86.5 )
	variantName:setRGB( 1, 1, 1 )
	variantName:setTTF( "fonts/default.ttf" )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	variantName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	variantName:linkToElementModel( self, "variantName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			variantName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( variantName )
	self.variantName = variantName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
				variantImage:completeAnimation()
				self.variantImage:setRGB( 1, 1, 1 )
				self.variantImage:setAlpha( 1 )
				self.clipFinished( variantImage, {} )
				variantImageMask:completeAnimation()
				self.variantImageMask:setRGB( 0, 0, 0 )
				self.variantImageMask:setAlpha( 0 )
				self.clipFinished( variantImageMask, {} )
				plusIcon:completeAnimation()
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				variantName:completeAnimation()
				self.variantName:setRGB( 1, 1, 1 )
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
				variantImage:completeAnimation()
				self.variantImage:setRGB( 1, 1, 1 )
				self.variantImage:setAlpha( 1 )
				self.clipFinished( variantImage, {} )
				variantImageMask:completeAnimation()
				self.variantImageMask:setRGB( 0, 0, 0 )
				self.variantImageMask:setAlpha( 0 )
				self.clipFinished( variantImageMask, {} )
				plusIcon:completeAnimation()
				self.plusIcon:setRGB( 1, 1, 1 )
				self.plusIcon:setAlpha( 0 )
				self.clipFinished( plusIcon, {} )
				variantName:completeAnimation()
				self.variantName:setRGB( 1, 0.41, 0 )
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
			end
		},
		EmptySlot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 0 )
				self.clipFinished( border, {} )
				variantImage:completeAnimation()
				self.variantImage:setAlpha( 1 )
				self.clipFinished( variantImage, {} )
				variantImageMask:completeAnimation()
				self.variantImageMask:setRGB( 0, 0, 0 )
				self.variantImageMask:setAlpha( 0.36 )
				self.clipFinished( variantImageMask, {} )
				plusIcon:completeAnimation()
				self.plusIcon:setRGB( 1, 1, 1 )
				self.plusIcon:setAlpha( 1 )
				self.clipFinished( plusIcon, {} )
				variantName:completeAnimation()
				self.variantName:setRGB( 1, 1, 1 )
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
				variantImage:completeAnimation()
				self.variantImage:setAlpha( 1 )
				self.clipFinished( variantImage, {} )
				variantImageMask:completeAnimation()
				self.variantImageMask:setRGB( 0, 0, 0 )
				self.variantImageMask:setAlpha( 0.36 )
				self.clipFinished( variantImageMask, {} )
				plusIcon:completeAnimation()
				self.plusIcon:setRGB( 1, 0.41, 0 )
				self.plusIcon:setAlpha( 1 )
				self.clipFinished( plusIcon, {} )
				variantName:completeAnimation()
				self.variantName:setRGB( 1, 0.41, 0 )
				self.variantName:setAlpha( 1 )
				self.clipFinished( variantName, {} )
			end
		}
	}
	self.close = function ( self )
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.border:close()
		self.plusIcon:close()
		self.variantImage:close()
		self.variantName:close()
		CoD.GunsmithVariantItem.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

