require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )

CoD.EmblemMaterialElement = InheritFrom( LUI.UIElement )
CoD.EmblemMaterialElement.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemMaterialElement )
	self.id = "EmblemMaterialElement"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local emblemMaterial = LUI.UIImage.new()
	emblemMaterial:setLeftRight( true, true, 5, -5 )
	emblemMaterial:setTopBottom( true, true, 5, -5 )
	emblemMaterial:linkToElementModel( self, "materialName", true, function ( model )
		local materialName = Engine.GetModelValue( model )
		if materialName then
			emblemMaterial:setImage( RegisterImage( materialName ) )
		end
	end )
	self:addElement( emblemMaterial )
	self.emblemMaterial = emblemMaterial
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 5, -5 )
	bgImage:setTopBottom( true, true, 5, -5 )
	bgImage:setRGB( 0.2, 0.2, 0.2 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local smallbargold = LUI.UIImage.new()
	smallbargold:setLeftRight( false, false, -27.5, 27 )
	smallbargold:setTopBottom( true, false, 17, 50 )
	smallbargold:setAlpha( 0 )
	smallbargold:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbar_small" ) )
	self:addElement( smallbargold )
	self.smallbargold = smallbargold
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -21.5, 24.5 )
	blackMarketBrandIcon:setTopBottom( false, false, -22, 24 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -12, 12 )
	lockedIcon:setTopBottom( false, false, -12, 12 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( false, false, -32, 32 )
	IconNew:setTopBottom( false, false, -12, 12 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				emblemMaterial:completeAnimation()
				self.emblemMaterial:setAlpha( 1 )
				self.clipFinished( emblemMaterial, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 2, -2 )
				self.background:setTopBottom( true, true, 2, -2 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				emblemMaterial:completeAnimation()
				self.emblemMaterial:setAlpha( 0 )
				self.clipFinished( emblemMaterial, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				smallbargold:completeAnimation()
				self.smallbargold:setAlpha( 0.65 )
				self.clipFinished( smallbargold, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 2, -2 )
				self.background:setTopBottom( true, true, 2, -2 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				smallbargold:completeAnimation()
				self.smallbargold:setAlpha( 1 )
				self.clipFinished( smallbargold, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				emblemMaterial:completeAnimation()
				self.emblemMaterial:setAlpha( 0 )
				self.clipFinished( emblemMaterial, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 2, -2 )
				self.background:setTopBottom( true, true, 2, -2 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				emblemMaterial:completeAnimation()
				self.emblemMaterial:setAlpha( 0 )
				self.clipFinished( emblemMaterial, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				emblemMaterial:completeAnimation()
				self.emblemMaterial:setAlpha( 0 )
				self.clipFinished( emblemMaterial, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				emblemMaterial:completeAnimation()
				self.emblemMaterial:setAlpha( 1 )
				self.clipFinished( emblemMaterial, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 2, -2 )
				self.background:setTopBottom( true, true, 2, -2 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "New",
			condition = function ( menu, element, event )
				return Emblems_IsMaterialNew( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "isBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	self:linkToElementModel( self, "materialID", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "materialID"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.lockedIcon:close()
		element.IconNew:close()
		element.emblemMaterial:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

