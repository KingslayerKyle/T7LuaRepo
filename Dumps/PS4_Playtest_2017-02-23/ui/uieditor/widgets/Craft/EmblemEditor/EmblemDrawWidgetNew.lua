require( "ui.uieditor.widgets.BlackMarket.BM_GoldBar" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self.m_preventFromBeingCurrentMouseFocus = true
	end
end

CoD.EmblemDrawWidgetNew = InheritFrom( LUI.UIElement )
CoD.EmblemDrawWidgetNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemDrawWidgetNew )
	self.id = "EmblemDrawWidgetNew"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 471 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur0:setLeftRight( 0, 1, 0, 2 )
	BorderBakedBlur0:setTopBottom( 0, 1, 0, 0 )
	BorderBakedBlur0:setAlpha( 0.4 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( 0, 1, 0, 2 )
	BorderBakedMask0:setTopBottom( 0, 1, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( 0, 1, 0, 2 )
	BorderBakedSolid0:setTopBottom( 0, 1, 0, 0 )
	BorderBakedSolid0:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( 0, 1, 0, 2 )
	BorderBaked0:setTopBottom( 0, 1, 0, 0 )
	BorderBaked0:setAlpha( 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( 0, 1, 4, -2 )
	backgroundMask:setTopBottom( 0, 1, 3, -3 )
	backgroundMask:setRGB( 0, 0, 0 )
	backgroundMask:setAlpha( 0 )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local emblemDrawingArea = LUI.UIElement.new()
	emblemDrawingArea:setLeftRight( 0, 1, 15, -15 )
	emblemDrawingArea:setTopBottom( 0, 1, 15, -15 )
	emblemDrawingArea:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblemDrawingArea:setupEmblem( modelValue )
		end
	end )
	self:addElement( emblemDrawingArea )
	self.emblemDrawingArea = emblemDrawingArea
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -2, 2 )
	FocusBarT:setTopBottom( 0, 0, -1, 9 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarT0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT0:setLeftRight( 0, 1, -2, 2 )
	FocusBarT0:setTopBottom( 0, 0, 411, 421 )
	FocusBarT0:setAlpha( 0 )
	FocusBarT0:setZoom( 1 )
	self:addElement( FocusBarT0 )
	self.FocusBarT0 = FocusBarT0
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( 0, 1, 8, -10 )
	glitch2:setTopBottom( 1, 1, -14, 8 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( 0, 1, 6, -6 )
	glitch:setTopBottom( 0, 0, -9, 11 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	local emptyLayerIcon = LUI.UIImage.new()
	emptyLayerIcon:setLeftRight( 0.5, 0.5, -36, 36 )
	emptyLayerIcon:setTopBottom( 0.5, 0.5, -36, 36 )
	emptyLayerIcon:setAlpha( 0 )
	emptyLayerIcon:setImage( RegisterImage( "uie_img_t7_menu_customclass_plus" ) )
	self:addElement( emptyLayerIcon )
	self.emptyLayerIcon = emptyLayerIcon
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 0, 0 )
	bgImage:setTopBottom( 0, 1, 0, 0 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local BMGoldBar = CoD.BM_GoldBar.new( menu, controller )
	BMGoldBar:setLeftRight( 0, 1, 0, 2 )
	BMGoldBar:setTopBottom( 0.5, 0.5, -20, 10 )
	BMGoldBar:setAlpha( 0 )
	self:addElement( BMGoldBar )
	self.BMGoldBar = BMGoldBar
	
	local blackMarketBrandIcon0 = LUI.UIImage.new()
	blackMarketBrandIcon0:setLeftRight( 0, 1, 188, -178 )
	blackMarketBrandIcon0:setTopBottom( 0, 1, 39, -49 )
	blackMarketBrandIcon0:setAlpha( 0 )
	blackMarketBrandIcon0:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon0 )
	self.blackMarketBrandIcon0 = blackMarketBrandIcon0
	
	self.resetProperties = function ()
		bgImage:completeAnimation()
		BMGoldBar:completeAnimation()
		blackMarketBrandIcon0:completeAnimation()
		emptyLayerIcon:completeAnimation()
		bgImage:setAlpha( 1 )
		BMGoldBar:setLeftRight( 0, 1, 0, 2 )
		BMGoldBar:setTopBottom( 0.5, 0.5, -20, 10 )
		BMGoldBar:setAlpha( 0 )
		blackMarketBrandIcon0:setLeftRight( 0, 1, 188, -178 )
		blackMarketBrandIcon0:setTopBottom( 0, 1, 39, -49 )
		blackMarketBrandIcon0:setAlpha( 0 )
		emptyLayerIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
				BMGoldBar:completeAnimation()
				self.BMGoldBar:setLeftRight( 0, 1, 4, 0 )
				self.BMGoldBar:setTopBottom( 0.5, 0.5, -15, 15 )
				self.clipFinished( BMGoldBar, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BMGoldBar:completeAnimation()
				self.BMGoldBar:setLeftRight( 0, 1, 23, -9 )
				self.BMGoldBar:setTopBottom( 0.5, 0.5, -15, 15 )
				self.BMGoldBar:setAlpha( 1 )
				self.clipFinished( BMGoldBar, {} )
				blackMarketBrandIcon0:completeAnimation()
				self.blackMarketBrandIcon0:setLeftRight( 0, 1, 215, -213 )
				self.blackMarketBrandIcon0:setTopBottom( 0, 1, 72, -78 )
				self.blackMarketBrandIcon0:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon0, {} )
			end
		},
		Unfocusable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
			end
		},
		EmptySlot = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				emptyLayerIcon:completeAnimation()
				self.emptyLayerIcon:setAlpha( 1 )
				self.clipFinished( emptyLayerIcon, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				emptyLayerIcon:completeAnimation()
				self.emptyLayerIcon:setAlpha( 1 )
				self.clipFinished( emptyLayerIcon, {} )
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
			stateName = "Unfocusable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EmptySlot",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedBlur0:close()
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.BorderBaked0:close()
		self.FocusBarT:close()
		self.FocusBarT0:close()
		self.BMGoldBar:close()
		self.emblemDrawingArea:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

