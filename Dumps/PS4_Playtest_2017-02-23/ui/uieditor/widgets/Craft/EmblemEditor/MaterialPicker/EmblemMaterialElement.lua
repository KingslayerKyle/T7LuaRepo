require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

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
	self:setLeftRight( 0, 0, 0, 96 )
	self:setTopBottom( 0, 0, 0, 96 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local emblemMaterial = LUI.UIImage.new()
	emblemMaterial:setLeftRight( 0, 1, 8, -8 )
	emblemMaterial:setTopBottom( 0, 1, 8, -8 )
	emblemMaterial:linkToElementModel( self, "materialName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblemMaterial:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( emblemMaterial )
	self.emblemMaterial = emblemMaterial
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 8, -8 )
	bgImage:setTopBottom( 0, 1, 8, -8 )
	bgImage:setRGB( 0.2, 0.2, 0.2 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local smallbargold = LUI.UIImage.new()
	smallbargold:setLeftRight( 0.5, 0.5, -41, 41 )
	smallbargold:setTopBottom( 0, 0, 25, 75 )
	smallbargold:setAlpha( 0 )
	smallbargold:setImage( RegisterImage( "uie_t7_blackmarket_brandgoldbar_small" ) )
	self:addElement( smallbargold )
	self.smallbargold = smallbargold
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0.5, 0.5, -32, 37 )
	blackMarketBrandIcon:setTopBottom( 0.5, 0.5, -33, 36 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -18, 18 )
	lockedIcon:setTopBottom( 0.5, 0.5, -18, 18 )
	lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( 0.5, 0.5, -48, 48 )
	IconNew:setTopBottom( 0.5, 0.5, -18, 18 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	self.resetProperties = function ()
		background:completeAnimation()
		emblemMaterial:completeAnimation()
		bgImage:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		smallbargold:completeAnimation()
		lockedIcon:completeAnimation()
		IconNew:completeAnimation()
		background:setLeftRight( 0, 1, 0, 0 )
		background:setTopBottom( 0, 1, 0, 0 )
		background:setRGB( 1, 1, 1 )
		background:setAlpha( 0 )
		emblemMaterial:setAlpha( 1 )
		bgImage:setAlpha( 0 )
		blackMarketBrandIcon:setAlpha( 0 )
		smallbargold:setAlpha( 0 )
		lockedIcon:setAlpha( 0 )
		IconNew:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setLeftRight( 0, 1, 3, -3 )
				self.background:setTopBottom( 0, 1, 3, -3 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
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
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setLeftRight( 0, 1, 3, -3 )
				self.background:setTopBottom( 0, 1, 3, -3 )
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
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				emblemMaterial:completeAnimation()
				self.emblemMaterial:setAlpha( 0 )
				self.clipFinished( emblemMaterial, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setLeftRight( 0, 1, 3, -3 )
				self.background:setTopBottom( 0, 1, 3, -3 )
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
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setLeftRight( 0, 1, 3, -3 )
				self.background:setTopBottom( 0, 1, 3, -3 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.lockedIcon:close()
		self.IconNew:close()
		self.emblemMaterial:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

