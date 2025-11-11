require( "ui.uieditor.widgets.BlackMarket.BM_DateTimeAndTotalCount" )
require( "ui.uieditor.widgets.BlackMarket.BM_FlyEmberFX" )
require( "ui.uieditor.widgets.BlackMarket.BM_ItemHintText" )
require( "ui.uieditor.widgets.BlackMarket.BM_LineLight2FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_LineLightFX" )
require( "ui.uieditor.widgets.BlackMarket.BM_LockItem" )
require( "ui.uieditor.widgets.BlackMarket.BM_Pixel02FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Pixel03FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Pixel04FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_PixelFX" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionFakeImageCycle" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionImage" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_1" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_2" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_3" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_4" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_5" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_6" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_7" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_8" )

CoD.LootDecryptionWidget = InheritFrom( LUI.UIElement )
CoD.LootDecryptionWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LootDecryptionWidget )
	self.id = "LootDecryptionWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 367 )
	self:setTopBottom( 0, 0, 0, 510 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FocusBar3 = LUI.UIImage.new()
	FocusBar3:setLeftRight( 0.5, 0.5, -125, 109 )
	FocusBar3:setTopBottom( 0, 0, 541, 580 )
	FocusBar3:setAlpha( 0 )
	FocusBar3:setImage( RegisterImage( "uie_t7_blackmarket_focusglow3" ) )
	self:addElement( FocusBar3 )
	self.FocusBar3 = FocusBar3
	
	local fxGlitch1800 = CoD.fxGlitch1_8.new( menu, controller )
	fxGlitch1800:setLeftRight( 0.5, 0.5, -190.5, 190.5 )
	fxGlitch1800:setTopBottom( 0, 0, 224.5, 223.5 )
	fxGlitch1800:setAlpha( 0 )
	self:addElement( fxGlitch1800 )
	self.fxGlitch1800 = fxGlitch1800
	
	local fxGlitch1700 = CoD.fxGlitch1_7.new( menu, controller )
	fxGlitch1700:setLeftRight( 0.5, 0.5, -190.5, 190.5 )
	fxGlitch1700:setTopBottom( 0, 0, 251.5, 250.5 )
	fxGlitch1700:setAlpha( 0 )
	self:addElement( fxGlitch1700 )
	self.fxGlitch1700 = fxGlitch1700
	
	local fxGlitch1600 = CoD.fxGlitch1_6.new( menu, controller )
	fxGlitch1600:setLeftRight( 0.5, 0.5, -190, 190 )
	fxGlitch1600:setTopBottom( 0, 0, 184, 286 )
	fxGlitch1600:setAlpha( 0 )
	self:addElement( fxGlitch1600 )
	self.fxGlitch1600 = fxGlitch1600
	
	local fxGlitch1500 = CoD.fxGlitch1_5.new( menu, controller )
	fxGlitch1500:setLeftRight( 0.5, 0.5, -98, 69 )
	fxGlitch1500:setTopBottom( 0, 0, 172, 300 )
	fxGlitch1500:setAlpha( 0 )
	self:addElement( fxGlitch1500 )
	self.fxGlitch1500 = fxGlitch1500
	
	local fxGlitch1400 = CoD.fxGlitch1_4.new( menu, controller )
	fxGlitch1400:setLeftRight( 0.5, 0.5, -192, 189 )
	fxGlitch1400:setTopBottom( 0, 0, 184, 311 )
	fxGlitch1400:setAlpha( 0 )
	self:addElement( fxGlitch1400 )
	self.fxGlitch1400 = fxGlitch1400
	
	local fxGlitch1300 = CoD.fxGlitch1_3.new( menu, controller )
	fxGlitch1300:setLeftRight( 0.5, 0.5, -191, 189 )
	fxGlitch1300:setTopBottom( 0, 0, 137, 380 )
	fxGlitch1300:setAlpha( 0 )
	self:addElement( fxGlitch1300 )
	self.fxGlitch1300 = fxGlitch1300
	
	local fxGlitch1200 = CoD.fxGlitch1_2.new( menu, controller )
	fxGlitch1200:setLeftRight( 0.5, 0.5, -193, 189 )
	fxGlitch1200:setTopBottom( 0, 0, 160, 357 )
	fxGlitch1200:setAlpha( 0 )
	self:addElement( fxGlitch1200 )
	self.fxGlitch1200 = fxGlitch1200
	
	local fxGlitch1100 = CoD.fxGlitch1_1.new( menu, controller )
	fxGlitch1100:setLeftRight( 0.5, 0.5, -190, 189 )
	fxGlitch1100:setTopBottom( 0, 0, 172, 324 )
	fxGlitch1100:setAlpha( 0 )
	self:addElement( fxGlitch1100 )
	self.fxGlitch1100 = fxGlitch1100
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0.5, 0.5, -237, 233 )
	Glow:setTopBottom( 0.5, 0.5, -299, 299 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_blackmarket_backing_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local EpicBacking = LUI.UIImage.new()
	EpicBacking:setLeftRight( 0, 1, -45, 43 )
	EpicBacking:setTopBottom( 0, 1, -33, 41 )
	EpicBacking:setAlpha( 0 )
	EpicBacking:setImage( RegisterImage( "uie_t7_blackmarket_epic_backing" ) )
	self:addElement( EpicBacking )
	self.EpicBacking = EpicBacking
	
	local LegendaryBacking = LUI.UIImage.new()
	LegendaryBacking:setLeftRight( 0.5, 0.5, -229, 227 )
	LegendaryBacking:setTopBottom( 0, 0, -33, 551 )
	LegendaryBacking:setAlpha( 0 )
	LegendaryBacking:setImage( RegisterImage( "uie_t7_blackmarket_legendary_backing" ) )
	self:addElement( LegendaryBacking )
	self.LegendaryBacking = LegendaryBacking
	
	local RareBacking = LUI.UIImage.new()
	RareBacking:setLeftRight( 0, 1, -45, 43 )
	RareBacking:setTopBottom( 0, 1, -33, 41 )
	RareBacking:setAlpha( 0 )
	RareBacking:setImage( RegisterImage( "uie_t7_blackmarket_rare_backing" ) )
	self:addElement( RareBacking )
	self.RareBacking = RareBacking
	
	local CommonBacking = LUI.UIImage.new()
	CommonBacking:setLeftRight( 0, 1, -45, 43 )
	CommonBacking:setTopBottom( 0, 1, -33, 41 )
	CommonBacking:setAlpha( 0 )
	CommonBacking:setImage( RegisterImage( "uie_t7_blackmarket_common_backing" ) )
	self:addElement( CommonBacking )
	self.CommonBacking = CommonBacking
	
	local BMLineLightFX = CoD.BM_LineLightFX.new( menu, controller )
	BMLineLightFX:setLeftRight( 0.5, 0.5, -224, 226 )
	BMLineLightFX:setTopBottom( 0, 0, -33, 552 )
	BMLineLightFX:setAlpha( 0 )
	BMLineLightFX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMLineLightFX )
	self.BMLineLightFX = BMLineLightFX
	
	local BMTriangleLightFX = CoD.BM_LineLight2FX.new( menu, controller )
	BMTriangleLightFX:setLeftRight( 0.5, 0.5, -226, 226 )
	BMTriangleLightFX:setTopBottom( 0, 0, -33, 553 )
	BMTriangleLightFX:setAlpha( 0 )
	BMTriangleLightFX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMTriangleLightFX )
	self.BMTriangleLightFX = BMTriangleLightFX
	
	local lootRarityText = LUI.UIText.new()
	lootRarityText:setLeftRight( 0, 1, 0, -2 )
	lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
	lootRarityText:setAlpha( 0 )
	lootRarityText:setTTF( "fonts/escom.ttf" )
	lootRarityText:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	lootRarityText:setShaderVector( 0, 0.09, 0, 0, 0 )
	lootRarityText:setShaderVector( 1, 0.06, 0, 0, 0 )
	lootRarityText:setShaderVector( 2, 1, 0, 0, 0 )
	lootRarityText:setLetterSpacing( 1 )
	lootRarityText:setLineSpacing( 1 )
	lootRarityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootRarityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootRarityText:linkToElementModel( self, "rarityName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lootRarityText:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( lootRarityText )
	self.lootRarityText = lootRarityText
	
	local lootRaritySet = LUI.UIText.new()
	lootRaritySet:setLeftRight( 0, 1, 0, 0 )
	lootRaritySet:setTopBottom( 0.5, 0.5, 134, 164 )
	lootRaritySet:setAlpha( 0 )
	lootRaritySet:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	lootRaritySet:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootRaritySet:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootRaritySet:linkToElementModel( self, "raritySet", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lootRaritySet:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( lootRaritySet )
	self.lootRaritySet = lootRaritySet
	
	local lootCategory = LUI.UIText.new()
	lootCategory:setLeftRight( 0, 1, -2, 0 )
	lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
	lootCategory:setAlpha( 0 )
	lootCategory:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	lootCategory:setLetterSpacing( 0.2 )
	lootCategory:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootCategory:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootCategory:linkToElementModel( self, "categoryName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lootCategory:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( lootCategory )
	self.lootCategory = lootCategory
	
	local lootName = LUI.UIText.new()
	lootName:setLeftRight( 0, 1, -2, 0 )
	lootName:setTopBottom( 0.5, 0.5, 47, 77 )
	lootName:setAlpha( 0 )
	lootName:setTTF( "fonts/escom.ttf" )
	lootName:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	lootName:setShaderVector( 0, 0.09, 0, 0, 0 )
	lootName:setShaderVector( 1, 0.06, 0, 0, 0 )
	lootName:setShaderVector( 2, 1, 0, 0, 0 )
	lootName:setLetterSpacing( 1 )
	lootName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootName:linkToElementModel( self, "rarityName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lootName:setRGB( RarityToColor( modelValue ) )
		end
	end )
	lootName:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lootName:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( lootName )
	self.lootName = lootName
	
	local LootDecryptionImage = CoD.LootDecryptionImage.new( menu, controller )
	LootDecryptionImage:setLeftRight( 0, 0, -7, 374 )
	LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
	LootDecryptionImage:setAlpha( 0 )
	LootDecryptionImage:linkToElementModel( self, nil, false, function ( model )
		LootDecryptionImage:setModel( model, controller )
	end )
	self:addElement( LootDecryptionImage )
	self.LootDecryptionImage = LootDecryptionImage
	
	local LootDecryptionFakeImageCycle = CoD.LootDecryptionFakeImageCycle.new( menu, controller )
	LootDecryptionFakeImageCycle:setLeftRight( 0, 1, -14, 14 )
	LootDecryptionFakeImageCycle:setTopBottom( 0, 1, 38, -42 )
	LootDecryptionFakeImageCycle:setAlpha( 0 )
	LootDecryptionFakeImageCycle:linkToElementModel( self, nil, false, function ( model )
		LootDecryptionFakeImageCycle:setModel( model, controller )
	end )
	self:addElement( LootDecryptionFakeImageCycle )
	self.LootDecryptionFakeImageCycle = LootDecryptionFakeImageCycle
	
	local BMLockItem = CoD.BM_LockItem.new( menu, controller )
	BMLockItem:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "lockItemText" )
			end
		}
	} )
	BMLockItem:linkToElementModel( BMLockItem, "lockItemText", true, function ( model )
		menu:updateElementState( BMLockItem, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lockItemText"
		} )
	end )
	BMLockItem:setLeftRight( 0, 1, 0, -2 )
	BMLockItem:setTopBottom( 0, 1, 367, -73 )
	BMLockItem:setAlpha( 0 )
	BMLockItem:linkToElementModel( self, nil, false, function ( model )
		BMLockItem:setModel( model, controller )
	end )
	BMLockItem:linkToElementModel( self, "lockAvailabilityText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BMLockItem.desc:setText( Engine.Localize( modelValue ) )
		end
	end )
	BMLockItem:linkToElementModel( self, "lockItemText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BMLockItem.title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( BMLockItem )
	self.BMLockItem = BMLockItem
	
	local GLOWrare = LUI.UIImage.new()
	GLOWrare:setLeftRight( 0, 1, -104, 100 )
	GLOWrare:setTopBottom( 0, 1, -93, 103 )
	GLOWrare:setAlpha( 0 )
	GLOWrare:setImage( RegisterImage( "uie_t7_blackmarket_backing_glow100" ) )
	self:addElement( GLOWrare )
	self.GLOWrare = GLOWrare
	
	local GLOWLengendary = LUI.UIImage.new()
	GLOWLengendary:setLeftRight( 0, 1, -107, 101 )
	GLOWLengendary:setTopBottom( 0, 1, -96, 108 )
	GLOWLengendary:setAlpha( 0 )
	GLOWLengendary:setImage( RegisterImage( "uie_t7_blackmarket_backing_glowlegendary" ) )
	self:addElement( GLOWLengendary )
	self.GLOWLengendary = GLOWLengendary
	
	local GLOWEpic = LUI.UIImage.new()
	GLOWEpic:setLeftRight( 0, 1, -104, 104 )
	GLOWEpic:setTopBottom( 0, 1, -97, 103 )
	GLOWEpic:setAlpha( 0 )
	GLOWEpic:setImage( RegisterImage( "uie_t7_blackmarket_backing_epicglow" ) )
	self:addElement( GLOWEpic )
	self.GLOWEpic = GLOWEpic
	
	local GLOWcommon = LUI.UIImage.new()
	GLOWcommon:setLeftRight( 0, 1, -94, 96 )
	GLOWcommon:setTopBottom( 0, 1, -89, 95 )
	GLOWcommon:setAlpha( 0 )
	GLOWcommon:setImage( RegisterImage( "uie_t7_blackmarket_backing_glow_common" ) )
	self:addElement( GLOWcommon )
	self.GLOWcommon = GLOWcommon
	
	local blurbox = LUI.UIImage.new()
	blurbox:setLeftRight( 0, 1, -98, 98 )
	blurbox:setTopBottom( 0, 1, -96, 100 )
	blurbox:setRGB( 1, 0.67, 0 )
	blurbox:setAlpha( 0 )
	blurbox:setScale( 1.2 )
	blurbox:setImage( RegisterImage( "uie_t7_blackmarket_backing_boxblur" ) )
	self:addElement( blurbox )
	self.blurbox = blurbox
	
	local BMPixelFX = CoD.BM_PixelFX.new( menu, controller )
	BMPixelFX:setLeftRight( 0, 1, -94, 96 )
	BMPixelFX:setTopBottom( 0, 1, -96, 92 )
	BMPixelFX:setRGB( 1, 0.67, 0 )
	BMPixelFX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixelFX )
	self.BMPixelFX = BMPixelFX
	
	local BMPixel02FX = CoD.BM_Pixel02FX.new( menu, controller )
	BMPixel02FX:setLeftRight( 0, 1, -94, 96 )
	BMPixel02FX:setTopBottom( 0, 1, -96, 92 )
	BMPixel02FX:setRGB( 1, 0.67, 0 )
	BMPixel02FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixel02FX )
	self.BMPixel02FX = BMPixel02FX
	
	local BMPixel03FX = CoD.BM_Pixel03FX.new( menu, controller )
	BMPixel03FX:setLeftRight( 0, 1, -94, 96 )
	BMPixel03FX:setTopBottom( 0, 1, -96, 92 )
	BMPixel03FX:setRGB( 1, 0.67, 0 )
	BMPixel03FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixel03FX )
	self.BMPixel03FX = BMPixel03FX
	
	local BMPixel04FX = CoD.BM_Pixel04FX.new( menu, controller )
	BMPixel04FX:setLeftRight( 0, 1, -94, 96 )
	BMPixel04FX:setTopBottom( 0, 1, -96, 92 )
	BMPixel04FX:setRGB( 1, 0.67, 0 )
	BMPixel04FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixel04FX )
	self.BMPixel04FX = BMPixel04FX
	
	local LightCommon = LUI.UIImage.new()
	LightCommon:setLeftRight( 0, 1, -45, 43 )
	LightCommon:setTopBottom( 0, 1, -33, 41 )
	LightCommon:setAlpha( 0 )
	LightCommon:setImage( RegisterImage( "uie_t7_blackmarket_common_backing_underglow" ) )
	self:addElement( LightCommon )
	self.LightCommon = LightCommon
	
	local LightRare = LUI.UIImage.new()
	LightRare:setLeftRight( 0, 1, -45, 43 )
	LightRare:setTopBottom( 0, 1, -33, 41 )
	LightRare:setAlpha( 0 )
	LightRare:setImage( RegisterImage( "uie_t7_blackmarket_rare_backing_underglow" ) )
	self:addElement( LightRare )
	self.LightRare = LightRare
	
	local LightLegendary = LUI.UIImage.new()
	LightLegendary:setLeftRight( 0, 1, -45, 43 )
	LightLegendary:setTopBottom( 0, 1, -33, 41 )
	LightLegendary:setAlpha( 0 )
	LightLegendary:setImage( RegisterImage( "uie_t7_blackmarket_legendary_backing_underglow" ) )
	self:addElement( LightLegendary )
	self.LightLegendary = LightLegendary
	
	local LightEpic = LUI.UIImage.new()
	LightEpic:setLeftRight( 0, 1, -45, 43 )
	LightEpic:setTopBottom( 0, 1, -33, 41 )
	LightEpic:setAlpha( 0 )
	LightEpic:setImage( RegisterImage( "uie_t7_blackmarket_epic_backing_underglow" ) )
	self:addElement( LightEpic )
	self.LightEpic = LightEpic
	
	local EpicEmber5 = LUI.UIImage.new()
	EpicEmber5:setLeftRight( 0, 0, -33, 402 )
	EpicEmber5:setTopBottom( 0, 0, -20, 538 )
	EpicEmber5:setAlpha( 0 )
	EpicEmber5:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember" ) )
	self:addElement( EpicEmber5 )
	self.EpicEmber5 = EpicEmber5
	
	local EpicEmber4 = LUI.UIImage.new()
	EpicEmber4:setLeftRight( 0, 0, -33, 402 )
	EpicEmber4:setTopBottom( 0, 0, -20, 538 )
	EpicEmber4:setAlpha( 0 )
	EpicEmber4:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember4" ) )
	self:addElement( EpicEmber4 )
	self.EpicEmber4 = EpicEmber4
	
	local EpicEmber3 = LUI.UIImage.new()
	EpicEmber3:setLeftRight( 0, 0, -33, 402 )
	EpicEmber3:setTopBottom( 0, 0, -20, 538 )
	EpicEmber3:setAlpha( 0 )
	EpicEmber3:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember3" ) )
	self:addElement( EpicEmber3 )
	self.EpicEmber3 = EpicEmber3
	
	local EpicEmber2 = LUI.UIImage.new()
	EpicEmber2:setLeftRight( 0, 0, -33, 402 )
	EpicEmber2:setTopBottom( 0, 0, -20, 538 )
	EpicEmber2:setAlpha( 0 )
	EpicEmber2:setScale( 2 )
	EpicEmber2:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember-02" ) )
	self:addElement( EpicEmber2 )
	self.EpicEmber2 = EpicEmber2
	
	local EpicEmber1 = LUI.UIImage.new()
	EpicEmber1:setLeftRight( 0, 0, -33, 402 )
	EpicEmber1:setTopBottom( 0, 0, -20, 538 )
	EpicEmber1:setAlpha( 0 )
	EpicEmber1:setScale( 2 )
	EpicEmber1:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember1" ) )
	self:addElement( EpicEmber1 )
	self.EpicEmber1 = EpicEmber1
	
	local epicSkull = LUI.UIImage.new()
	epicSkull:setLeftRight( 0, 0, -38, 423 )
	epicSkull:setTopBottom( 0, 0, -66, 549 )
	epicSkull:setAlpha( 0 )
	epicSkull:setImage( RegisterImage( "uie_t7_blackmarket_epic_skull" ) )
	epicSkull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated" ) )
	epicSkull:setShaderVector( 0, 27, 1, 0, 0 )
	epicSkull:setShaderVector( 1, 35, 0, 0, 0 )
	self:addElement( epicSkull )
	self.epicSkull = epicSkull
	
	local LegendaryEmber1 = LUI.UIImage.new()
	LegendaryEmber1:setLeftRight( 0, 0, -33, 402 )
	LegendaryEmber1:setTopBottom( 0, 0, -20, 538 )
	LegendaryEmber1:setAlpha( 0 )
	LegendaryEmber1:setScale( 2 )
	LegendaryEmber1:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember1" ) )
	self:addElement( LegendaryEmber1 )
	self.LegendaryEmber1 = LegendaryEmber1
	
	local LegendaryEmber2 = LUI.UIImage.new()
	LegendaryEmber2:setLeftRight( 0, 0, -33, 402 )
	LegendaryEmber2:setTopBottom( 0, 0, -20, 538 )
	LegendaryEmber2:setAlpha( 0 )
	LegendaryEmber2:setScale( 2 )
	LegendaryEmber2:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember2" ) )
	self:addElement( LegendaryEmber2 )
	self.LegendaryEmber2 = LegendaryEmber2
	
	local LegendaryEmber3 = LUI.UIImage.new()
	LegendaryEmber3:setLeftRight( 0, 0, -33, 402 )
	LegendaryEmber3:setTopBottom( 0, 0, -20, 538 )
	LegendaryEmber3:setAlpha( 0 )
	LegendaryEmber3:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember3" ) )
	self:addElement( LegendaryEmber3 )
	self.LegendaryEmber3 = LegendaryEmber3
	
	local LegendaryEmber4 = LUI.UIImage.new()
	LegendaryEmber4:setLeftRight( 0, 0, -33, 402 )
	LegendaryEmber4:setTopBottom( 0, 0, -20, 538 )
	LegendaryEmber4:setAlpha( 0 )
	LegendaryEmber4:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember4" ) )
	self:addElement( LegendaryEmber4 )
	self.LegendaryEmber4 = LegendaryEmber4
	
	local LegendaryEmber5 = LUI.UIImage.new()
	LegendaryEmber5:setLeftRight( 0, 0, -33, 402 )
	LegendaryEmber5:setTopBottom( 0, 0, -20, 538 )
	LegendaryEmber5:setAlpha( 0 )
	LegendaryEmber5:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember5" ) )
	self:addElement( LegendaryEmber5 )
	self.LegendaryEmber5 = LegendaryEmber5
	
	local BMFlyEmberFX = CoD.BM_FlyEmberFX.new( menu, controller )
	BMFlyEmberFX:setLeftRight( 0, 0, 284, 374 )
	BMFlyEmberFX:setTopBottom( 0, 0, -9, 81 )
	BMFlyEmberFX:setAlpha( 0 )
	self:addElement( BMFlyEmberFX )
	self.BMFlyEmberFX = BMFlyEmberFX
	
	local BMFlyEmberFX0 = CoD.BM_FlyEmberFX.new( menu, controller )
	BMFlyEmberFX0:setLeftRight( 0, 0, -14, 76 )
	BMFlyEmberFX0:setTopBottom( 0, 0, 438, 528 )
	BMFlyEmberFX0:setAlpha( 0 )
	BMFlyEmberFX0:setZRot( 180 )
	self:addElement( BMFlyEmberFX0 )
	self.BMFlyEmberFX0 = BMFlyEmberFX0
	
	local itemHintText = CoD.BM_ItemHintText.new( menu, controller )
	itemHintText:mergeStateConditions( {
		{
			stateName = "PCHidden",
			condition = function ( menu, element, event )
				return IsPC()
			end
		},
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return not BlackMarketListItemCanEquip( element, controller )
			end
		},
		{
			stateName = "CenterAlign",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	itemHintText:linkToElementModel( itemHintText, "category", true, function ( model )
		menu:updateElementState( itemHintText, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "category"
		} )
	end )
	itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
	itemHintText:setTopBottom( 1, 1, 33, 78 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_EQUIP_PROMPT" ) )
	itemHintText.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemHintText:linkToElementModel( self, nil, false, function ( model )
		itemHintText:setModel( model, controller )
	end )
	self:addElement( itemHintText )
	self.itemHintText = itemHintText
	
	local BMDateTimeAndTotalCount = CoD.BM_DateTimeAndTotalCount.new( menu, controller )
	BMDateTimeAndTotalCount:setLeftRight( 0, 0, 0, 368 )
	BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
	BMDateTimeAndTotalCount:setAlpha( 0 )
	BMDateTimeAndTotalCount:linkToElementModel( self, "dateTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BMDateTimeAndTotalCount.backing:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	BMDateTimeAndTotalCount:linkToElementModel( self, "dateTime", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BMDateTimeAndTotalCount.dateTimeReceived:setText( Engine.Localize( modelValue ) )
		end
	end )
	BMDateTimeAndTotalCount:linkToElementModel( self, "duplicateText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BMDateTimeAndTotalCount.TotalCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( BMDateTimeAndTotalCount )
	self.BMDateTimeAndTotalCount = BMDateTimeAndTotalCount
	
	self.resetProperties = function ()
		BMPixel03FX:completeAnimation()
		BMPixel04FX:completeAnimation()
		BMPixel02FX:completeAnimation()
		BMPixelFX:completeAnimation()
		LootDecryptionFakeImageCycle:completeAnimation()
		fxGlitch1800:completeAnimation()
		fxGlitch1600:completeAnimation()
		fxGlitch1400:completeAnimation()
		fxGlitch1700:completeAnimation()
		fxGlitch1300:completeAnimation()
		fxGlitch1100:completeAnimation()
		fxGlitch1500:completeAnimation()
		CommonBacking:completeAnimation()
		blurbox:completeAnimation()
		Glow:completeAnimation()
		GLOWcommon:completeAnimation()
		lootRarityText:completeAnimation()
		lootRaritySet:completeAnimation()
		lootCategory:completeAnimation()
		lootName:completeAnimation()
		LootDecryptionImage:completeAnimation()
		RareBacking:completeAnimation()
		GLOWrare:completeAnimation()
		LegendaryBacking:completeAnimation()
		GLOWLengendary:completeAnimation()
		LegendaryEmber5:completeAnimation()
		LegendaryEmber2:completeAnimation()
		LegendaryEmber1:completeAnimation()
		LegendaryEmber3:completeAnimation()
		EpicBacking:completeAnimation()
		epicSkull:completeAnimation()
		GLOWEpic:completeAnimation()
		EpicEmber1:completeAnimation()
		EpicEmber2:completeAnimation()
		EpicEmber5:completeAnimation()
		BMFlyEmberFX:completeAnimation()
		EpicEmber3:completeAnimation()
		BMFlyEmberFX0:completeAnimation()
		BMLockItem:completeAnimation()
		FocusBar3:completeAnimation()
		LightCommon:completeAnimation()
		BMDateTimeAndTotalCount:completeAnimation()
		itemHintText:completeAnimation()
		BMLineLightFX:completeAnimation()
		LightRare:completeAnimation()
		BMTriangleLightFX:completeAnimation()
		LightLegendary:completeAnimation()
		LightEpic:completeAnimation()
		BMPixel03FX:setRGB( 1, 0.67, 0 )
		BMPixel03FX:setAlpha( 1 )
		BMPixel04FX:setRGB( 1, 0.67, 0 )
		BMPixel04FX:setAlpha( 1 )
		BMPixel02FX:setRGB( 1, 0.67, 0 )
		BMPixel02FX:setAlpha( 1 )
		BMPixelFX:setRGB( 1, 0.67, 0 )
		BMPixelFX:setAlpha( 1 )
		LootDecryptionFakeImageCycle:setLeftRight( 0, 1, -14, 14 )
		LootDecryptionFakeImageCycle:setTopBottom( 0, 1, 38, -42 )
		LootDecryptionFakeImageCycle:setAlpha( 0 )
		fxGlitch1800:setAlpha( 0 )
		fxGlitch1600:setAlpha( 0 )
		fxGlitch1400:setAlpha( 0 )
		fxGlitch1700:setAlpha( 0 )
		fxGlitch1300:setAlpha( 0 )
		fxGlitch1100:setAlpha( 0 )
		fxGlitch1500:setAlpha( 0 )
		CommonBacking:setAlpha( 0 )
		CommonBacking:setScale( 1 )
		blurbox:setRGB( 1, 0.67, 0 )
		blurbox:setAlpha( 0 )
		blurbox:setScale( 1.2 )
		Glow:setAlpha( 0 )
		GLOWcommon:setAlpha( 0 )
		lootRarityText:setLeftRight( 0, 1, 0, -2 )
		lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
		lootRarityText:setAlpha( 0 )
		lootRarityText:setScale( 1 )
		lootRaritySet:setLeftRight( 0, 1, 0, 0 )
		lootRaritySet:setTopBottom( 0.5, 0.5, 134, 164 )
		lootRaritySet:setAlpha( 0 )
		lootRaritySet:setScale( 1 )
		lootCategory:setLeftRight( 0, 1, -2, 0 )
		lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
		lootCategory:setRGB( 1, 1, 1 )
		lootCategory:setAlpha( 0 )
		lootCategory:setScale( 1 )
		lootName:setLeftRight( 0, 1, -2, 0 )
		lootName:setTopBottom( 0.5, 0.5, 47, 77 )
		lootName:setAlpha( 0 )
		lootName:setScale( 1 )
		LootDecryptionImage:setLeftRight( 0, 0, -7, 374 )
		LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
		LootDecryptionImage:setAlpha( 0 )
		LootDecryptionImage:setScale( 1 )
		RareBacking:setAlpha( 0 )
		RareBacking:setScale( 1 )
		GLOWrare:setAlpha( 0 )
		LegendaryBacking:setAlpha( 0 )
		LegendaryBacking:setScale( 1 )
		GLOWLengendary:setAlpha( 0 )
		LegendaryEmber5:setLeftRight( 0, 0, -33, 402 )
		LegendaryEmber5:setTopBottom( 0, 0, -20, 538 )
		LegendaryEmber5:setAlpha( 0 )
		LegendaryEmber5:setScale( 1 )
		LegendaryEmber2:setAlpha( 0 )
		LegendaryEmber2:setScale( 2 )
		LegendaryEmber1:setAlpha( 0 )
		LegendaryEmber1:setScale( 2 )
		LegendaryEmber3:setAlpha( 0 )
		LegendaryEmber3:setScale( 1 )
		EpicBacking:setAlpha( 0 )
		EpicBacking:setScale( 1 )
		epicSkull:setLeftRight( 0, 0, -38, 423 )
		epicSkull:setTopBottom( 0, 0, -66, 549 )
		epicSkull:setAlpha( 0 )
		epicSkull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated" ) )
		epicSkull:setShaderVector( 0, 27, 1, 0, 0 )
		epicSkull:setShaderVector( 1, 35, 0, 0, 0 )
		GLOWEpic:setAlpha( 0 )
		EpicEmber1:setAlpha( 0 )
		EpicEmber1:setScale( 2 )
		EpicEmber2:setAlpha( 0 )
		EpicEmber2:setScale( 2 )
		EpicEmber5:setLeftRight( 0, 0, -33, 402 )
		EpicEmber5:setTopBottom( 0, 0, -20, 538 )
		EpicEmber5:setAlpha( 0 )
		EpicEmber5:setScale( 1 )
		BMFlyEmberFX:setAlpha( 0 )
		EpicEmber3:setAlpha( 0 )
		EpicEmber3:setScale( 1 )
		BMFlyEmberFX0:setAlpha( 0 )
		BMLockItem:setLeftRight( 0, 1, 0, -2 )
		BMLockItem:setTopBottom( 0, 1, 367, -73 )
		BMLockItem:setAlpha( 0 )
		BMLockItem:setScale( 1 )
		FocusBar3:setLeftRight( 0.5, 0.5, -125, 109 )
		FocusBar3:setTopBottom( 0, 0, 541, 580 )
		FocusBar3:setAlpha( 0 )
		FocusBar3:setScale( 1 )
		LightCommon:setAlpha( 0 )
		LightCommon:setScale( 1 )
		BMDateTimeAndTotalCount:setLeftRight( 0, 0, 0, 368 )
		BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
		BMDateTimeAndTotalCount:setAlpha( 0 )
		BMDateTimeAndTotalCount:setScale( 1 )
		BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 1, 1 )
		itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
		itemHintText:setTopBottom( 1, 1, 33, 78 )
		itemHintText:setAlpha( 0 )
		itemHintText:setScale( 1 )
		BMLineLightFX:setRGB( 1, 1, 1 )
		BMLineLightFX:setAlpha( 0 )
		BMLineLightFX:setScale( 1 )
		LightRare:setAlpha( 0 )
		LightRare:setScale( 1 )
		BMTriangleLightFX:setLeftRight( 0.5, 0.5, -226, 226 )
		BMTriangleLightFX:setTopBottom( 0, 0, -33, 553 )
		BMTriangleLightFX:setRGB( 1, 1, 1 )
		BMTriangleLightFX:setAlpha( 0 )
		BMTriangleLightFX:setScale( 1 )
		LightLegendary:setAlpha( 0 )
		LightLegendary:setScale( 1 )
		LightEpic:setAlpha( 0 )
		LightEpic:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setAlpha( 0 )
				self.clipFinished( BMPixelFX, {} )
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setAlpha( 0 )
				self.clipFinished( BMPixel02FX, {} )
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setAlpha( 0 )
				self.clipFinished( BMPixel03FX, {} )
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setAlpha( 0 )
				self.clipFinished( BMPixel04FX, {} )
			end,
			StartFuzz = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				local fxGlitch1800Frame2 = function ( fxGlitch1800, event )
					local fxGlitch1800Frame3 = function ( fxGlitch1800, event )
						local fxGlitch1800Frame4 = function ( fxGlitch1800, event )
							local fxGlitch1800Frame5 = function ( fxGlitch1800, event )
								local fxGlitch1800Frame6 = function ( fxGlitch1800, event )
									local fxGlitch1800Frame7 = function ( fxGlitch1800, event )
										local fxGlitch1800Frame8 = function ( fxGlitch1800, event )
											local fxGlitch1800Frame9 = function ( fxGlitch1800, event )
												local fxGlitch1800Frame10 = function ( fxGlitch1800, event )
													local fxGlitch1800Frame11 = function ( fxGlitch1800, event )
														local fxGlitch1800Frame12 = function ( fxGlitch1800, event )
															local fxGlitch1800Frame13 = function ( fxGlitch1800, event )
																local fxGlitch1800Frame14 = function ( fxGlitch1800, event )
																	local fxGlitch1800Frame15 = function ( fxGlitch1800, event )
																		local fxGlitch1800Frame16 = function ( fxGlitch1800, event )
																			local fxGlitch1800Frame17 = function ( fxGlitch1800, event )
																				local fxGlitch1800Frame18 = function ( fxGlitch1800, event )
																					local fxGlitch1800Frame19 = function ( fxGlitch1800, event )
																						local fxGlitch1800Frame20 = function ( fxGlitch1800, event )
																							local fxGlitch1800Frame21 = function ( fxGlitch1800, event )
																								local fxGlitch1800Frame22 = function ( fxGlitch1800, event )
																									local fxGlitch1800Frame23 = function ( fxGlitch1800, event )
																										local fxGlitch1800Frame24 = function ( fxGlitch1800, event )
																											local fxGlitch1800Frame25 = function ( fxGlitch1800, event )
																												local fxGlitch1800Frame26 = function ( fxGlitch1800, event )
																													local fxGlitch1800Frame27 = function ( fxGlitch1800, event )
																														local fxGlitch1800Frame28 = function ( fxGlitch1800, event )
																															local fxGlitch1800Frame29 = function ( fxGlitch1800, event )
																																local fxGlitch1800Frame30 = function ( fxGlitch1800, event )
																																	local fxGlitch1800Frame31 = function ( fxGlitch1800, event )
																																		local fxGlitch1800Frame32 = function ( fxGlitch1800, event )
																																			local fxGlitch1800Frame33 = function ( fxGlitch1800, event )
																																				local fxGlitch1800Frame34 = function ( fxGlitch1800, event )
																																					if not event.interrupted then
																																						fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																					end
																																					fxGlitch1800:setAlpha( 0 )
																																					if event.interrupted then
																																						self.clipFinished( fxGlitch1800, event )
																																					else
																																						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																																					end
																																				end
																																				
																																				if event.interrupted then
																																					fxGlitch1800Frame34( fxGlitch1800, event )
																																					return 
																																				else
																																					fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																																					fxGlitch1800:setAlpha( 0.72 )
																																					fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame34 )
																																				end
																																			end
																																			
																																			if event.interrupted then
																																				fxGlitch1800Frame33( fxGlitch1800, event )
																																				return 
																																			else
																																				fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																																				fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame33 )
																																			end
																																		end
																																		
																																		if event.interrupted then
																																			fxGlitch1800Frame32( fxGlitch1800, event )
																																			return 
																																		else
																																			fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																			fxGlitch1800:setAlpha( 0 )
																																			fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame32 )
																																		end
																																	end
																																	
																																	if event.interrupted then
																																		fxGlitch1800Frame31( fxGlitch1800, event )
																																		return 
																																	else
																																		fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																		fxGlitch1800:setAlpha( 1 )
																																		fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame31 )
																																	end
																																end
																																
																																if event.interrupted then
																																	fxGlitch1800Frame30( fxGlitch1800, event )
																																	return 
																																else
																																	fxGlitch1800:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																																	fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame30 )
																																end
																															end
																															
																															if event.interrupted then
																																fxGlitch1800Frame29( fxGlitch1800, event )
																																return 
																															else
																																fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																																fxGlitch1800:setAlpha( 0 )
																																fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame29 )
																															end
																														end
																														
																														if event.interrupted then
																															fxGlitch1800Frame28( fxGlitch1800, event )
																															return 
																														else
																															fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																															fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame28 )
																														end
																													end
																													
																													if event.interrupted then
																														fxGlitch1800Frame27( fxGlitch1800, event )
																														return 
																													else
																														fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																														fxGlitch1800:setAlpha( 0.8 )
																														fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame27 )
																													end
																												end
																												
																												if event.interrupted then
																													fxGlitch1800Frame26( fxGlitch1800, event )
																													return 
																												else
																													fxGlitch1800:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
																													fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame26 )
																												end
																											end
																											
																											if event.interrupted then
																												fxGlitch1800Frame25( fxGlitch1800, event )
																												return 
																											else
																												fxGlitch1800:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
																												fxGlitch1800:setAlpha( 0 )
																												fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame25 )
																											end
																										end
																										
																										if event.interrupted then
																											fxGlitch1800Frame24( fxGlitch1800, event )
																											return 
																										else
																											fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																											fxGlitch1800:setAlpha( 0.55 )
																											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame24 )
																										end
																									end
																									
																									if event.interrupted then
																										fxGlitch1800Frame23( fxGlitch1800, event )
																										return 
																									else
																										fxGlitch1800:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
																										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame23 )
																									end
																								end
																								
																								if event.interrupted then
																									fxGlitch1800Frame22( fxGlitch1800, event )
																									return 
																								else
																									fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																									fxGlitch1800:setAlpha( 0 )
																									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame22 )
																								end
																							end
																							
																							if event.interrupted then
																								fxGlitch1800Frame21( fxGlitch1800, event )
																								return 
																							else
																								fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																								fxGlitch1800:setAlpha( 0.69 )
																								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame21 )
																							end
																						end
																						
																						if event.interrupted then
																							fxGlitch1800Frame20( fxGlitch1800, event )
																							return 
																						else
																							fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																							fxGlitch1800:setAlpha( 0.31 )
																							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame20 )
																						end
																					end
																					
																					if event.interrupted then
																						fxGlitch1800Frame19( fxGlitch1800, event )
																						return 
																					else
																						fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
																						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame19 )
																					end
																				end
																				
																				if event.interrupted then
																					fxGlitch1800Frame18( fxGlitch1800, event )
																					return 
																				else
																					fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																					fxGlitch1800:setAlpha( 0 )
																					fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame18 )
																				end
																			end
																			
																			if event.interrupted then
																				fxGlitch1800Frame17( fxGlitch1800, event )
																				return 
																			else
																				fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																				fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame17 )
																			end
																		end
																		
																		if event.interrupted then
																			fxGlitch1800Frame16( fxGlitch1800, event )
																			return 
																		else
																			fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																			fxGlitch1800:setAlpha( 1 )
																			fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		fxGlitch1800Frame15( fxGlitch1800, event )
																		return 
																	else
																		fxGlitch1800:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
																		fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame15 )
																	end
																end
																
																if event.interrupted then
																	fxGlitch1800Frame14( fxGlitch1800, event )
																	return 
																else
																	fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																	fxGlitch1800:setAlpha( 0 )
																	fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame14 )
																end
															end
															
															if event.interrupted then
																fxGlitch1800Frame13( fxGlitch1800, event )
																return 
															else
																fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame13 )
															end
														end
														
														if event.interrupted then
															fxGlitch1800Frame12( fxGlitch1800, event )
															return 
														else
															fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
															fxGlitch1800:setAlpha( 1 )
															fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame12 )
														end
													end
													
													if event.interrupted then
														fxGlitch1800Frame11( fxGlitch1800, event )
														return 
													else
														fxGlitch1800:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
														fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame11 )
													end
												end
												
												if event.interrupted then
													fxGlitch1800Frame10( fxGlitch1800, event )
													return 
												else
													fxGlitch1800:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame10 )
												end
											end
											
											if event.interrupted then
												fxGlitch1800Frame9( fxGlitch1800, event )
												return 
											else
												fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												fxGlitch1800:setAlpha( 0 )
												fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1800Frame8( fxGlitch1800, event )
											return 
										else
											fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											fxGlitch1800:setAlpha( 1 )
											fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1800Frame7( fxGlitch1800, event )
										return 
									else
										fxGlitch1800:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
										fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1800Frame6( fxGlitch1800, event )
									return 
								else
									fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									fxGlitch1800:setAlpha( 0 )
									fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1800Frame5( fxGlitch1800, event )
								return 
							else
								fxGlitch1800:beginAnimation( "keyframe", 0, false, false, CoD.TweenType.Linear )
								fxGlitch1800:setAlpha( 0.8 )
								fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1800Frame4( fxGlitch1800, event )
							return 
						else
							fxGlitch1800:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1800:setAlpha( 0.6 )
							fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1800Frame3( fxGlitch1800, event )
						return 
					else
						fxGlitch1800:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1800:setAlpha( 0.8 )
						fxGlitch1800:registerEventHandler( "transition_complete_keyframe", fxGlitch1800Frame3 )
					end
				end
				
				fxGlitch1800:completeAnimation()
				self.fxGlitch1800:setAlpha( 0 )
				fxGlitch1800Frame2( fxGlitch1800, {} )
				local fxGlitch1700Frame2 = function ( fxGlitch1700, event )
					local fxGlitch1700Frame3 = function ( fxGlitch1700, event )
						local fxGlitch1700Frame4 = function ( fxGlitch1700, event )
							local fxGlitch1700Frame5 = function ( fxGlitch1700, event )
								local fxGlitch1700Frame6 = function ( fxGlitch1700, event )
									local fxGlitch1700Frame7 = function ( fxGlitch1700, event )
										local fxGlitch1700Frame8 = function ( fxGlitch1700, event )
											local fxGlitch1700Frame9 = function ( fxGlitch1700, event )
												local fxGlitch1700Frame10 = function ( fxGlitch1700, event )
													local fxGlitch1700Frame11 = function ( fxGlitch1700, event )
														local fxGlitch1700Frame12 = function ( fxGlitch1700, event )
															local fxGlitch1700Frame13 = function ( fxGlitch1700, event )
																local fxGlitch1700Frame14 = function ( fxGlitch1700, event )
																	local fxGlitch1700Frame15 = function ( fxGlitch1700, event )
																		local fxGlitch1700Frame16 = function ( fxGlitch1700, event )
																			if not event.interrupted then
																				fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			end
																			fxGlitch1700:setAlpha( 0 )
																			if event.interrupted then
																				self.clipFinished( fxGlitch1700, event )
																			else
																				fxGlitch1700:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if event.interrupted then
																			fxGlitch1700Frame16( fxGlitch1700, event )
																			return 
																		else
																			fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			fxGlitch1700:setAlpha( 0.16 )
																			fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame16 )
																		end
																	end
																	
																	if event.interrupted then
																		fxGlitch1700Frame15( fxGlitch1700, event )
																		return 
																	else
																		fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		fxGlitch1700:setAlpha( 0.19 )
																		fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame15 )
																	end
																end
																
																if event.interrupted then
																	fxGlitch1700Frame14( fxGlitch1700, event )
																	return 
																else
																	fxGlitch1700:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																	fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame14 )
																end
															end
															
															if event.interrupted then
																fxGlitch1700Frame13( fxGlitch1700, event )
																return 
															else
																fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																fxGlitch1700:setAlpha( 0 )
																fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame13 )
															end
														end
														
														if event.interrupted then
															fxGlitch1700Frame12( fxGlitch1700, event )
															return 
														else
															fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															fxGlitch1700:setAlpha( 0.51 )
															fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame12 )
														end
													end
													
													if event.interrupted then
														fxGlitch1700Frame11( fxGlitch1700, event )
														return 
													else
														fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														fxGlitch1700:setAlpha( 1 )
														fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame11 )
													end
												end
												
												if event.interrupted then
													fxGlitch1700Frame10( fxGlitch1700, event )
													return 
												else
													fxGlitch1700:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
													fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame10 )
												end
											end
											
											if event.interrupted then
												fxGlitch1700Frame9( fxGlitch1700, event )
												return 
											else
												fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												fxGlitch1700:setAlpha( 0 )
												fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1700Frame8( fxGlitch1700, event )
											return 
										else
											fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1700Frame7( fxGlitch1700, event )
										return 
									else
										fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										fxGlitch1700:setAlpha( 1 )
										fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1700Frame6( fxGlitch1700, event )
									return 
								else
									fxGlitch1700:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1700Frame5( fxGlitch1700, event )
								return 
							else
								fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								fxGlitch1700:setAlpha( 0 )
								fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1700Frame4( fxGlitch1700, event )
							return 
						else
							fxGlitch1700:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1700:setAlpha( 0.16 )
							fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1700Frame3( fxGlitch1700, event )
						return 
					else
						fxGlitch1700:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1700:setAlpha( 0.19 )
						fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame3 )
					end
				end
				
				fxGlitch1700:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				fxGlitch1700:setAlpha( 0 )
				fxGlitch1700:registerEventHandler( "transition_complete_keyframe", fxGlitch1700Frame2 )
				local fxGlitch1600Frame2 = function ( fxGlitch1600, event )
					local fxGlitch1600Frame3 = function ( fxGlitch1600, event )
						local fxGlitch1600Frame4 = function ( fxGlitch1600, event )
							local fxGlitch1600Frame5 = function ( fxGlitch1600, event )
								local fxGlitch1600Frame6 = function ( fxGlitch1600, event )
									if not event.interrupted then
										fxGlitch1600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									fxGlitch1600:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( fxGlitch1600, event )
									else
										fxGlitch1600:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									fxGlitch1600Frame6( fxGlitch1600, event )
									return 
								else
									fxGlitch1600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									fxGlitch1600:setAlpha( 0.28 )
									fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1600Frame5( fxGlitch1600, event )
								return 
							else
								fxGlitch1600:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
								fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1600Frame4( fxGlitch1600, event )
							return 
						else
							fxGlitch1600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1600:setAlpha( 0 )
							fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1600Frame3( fxGlitch1600, event )
						return 
					else
						fxGlitch1600:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1600:setAlpha( 0.28 )
						fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame3 )
					end
				end
				
				fxGlitch1600:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
				fxGlitch1600:setAlpha( 0 )
				fxGlitch1600:registerEventHandler( "transition_complete_keyframe", fxGlitch1600Frame2 )
				local fxGlitch1500Frame2 = function ( fxGlitch1500, event )
					local fxGlitch1500Frame3 = function ( fxGlitch1500, event )
						local fxGlitch1500Frame4 = function ( fxGlitch1500, event )
							if not event.interrupted then
								fxGlitch1500:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1500:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1500, event )
							else
								fxGlitch1500:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1500Frame4( fxGlitch1500, event )
							return 
						else
							fxGlitch1500:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1500:setAlpha( 0.8 )
							fxGlitch1500:registerEventHandler( "transition_complete_keyframe", fxGlitch1500Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1500Frame3( fxGlitch1500, event )
						return 
					else
						fxGlitch1500:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1500:setAlpha( 0.18 )
						fxGlitch1500:registerEventHandler( "transition_complete_keyframe", fxGlitch1500Frame3 )
					end
				end
				
				fxGlitch1500:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				fxGlitch1500:setAlpha( 0 )
				fxGlitch1500:registerEventHandler( "transition_complete_keyframe", fxGlitch1500Frame2 )
				local fxGlitch1400Frame2 = function ( fxGlitch1400, event )
					local fxGlitch1400Frame3 = function ( fxGlitch1400, event )
						local fxGlitch1400Frame4 = function ( fxGlitch1400, event )
							local fxGlitch1400Frame5 = function ( fxGlitch1400, event )
								local fxGlitch1400Frame6 = function ( fxGlitch1400, event )
									local fxGlitch1400Frame7 = function ( fxGlitch1400, event )
										local fxGlitch1400Frame8 = function ( fxGlitch1400, event )
											local fxGlitch1400Frame9 = function ( fxGlitch1400, event )
												local fxGlitch1400Frame10 = function ( fxGlitch1400, event )
													if not event.interrupted then
														fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													fxGlitch1400:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( fxGlitch1400, event )
													else
														fxGlitch1400:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													fxGlitch1400Frame10( fxGlitch1400, event )
													return 
												else
													fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													fxGlitch1400:setAlpha( 0.33 )
													fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame10 )
												end
											end
											
											if event.interrupted then
												fxGlitch1400Frame9( fxGlitch1400, event )
												return 
											else
												fxGlitch1400:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
												fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame9 )
											end
										end
										
										if event.interrupted then
											fxGlitch1400Frame8( fxGlitch1400, event )
											return 
										else
											fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame8 )
										end
									end
									
									if event.interrupted then
										fxGlitch1400Frame7( fxGlitch1400, event )
										return 
									else
										fxGlitch1400:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										fxGlitch1400:setAlpha( 0 )
										fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame7 )
									end
								end
								
								if event.interrupted then
									fxGlitch1400Frame6( fxGlitch1400, event )
									return 
								else
									fxGlitch1400:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									fxGlitch1400:setAlpha( 1 )
									fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame6 )
								end
							end
							
							if event.interrupted then
								fxGlitch1400Frame5( fxGlitch1400, event )
								return 
							else
								fxGlitch1400:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame5 )
							end
						end
						
						if event.interrupted then
							fxGlitch1400Frame4( fxGlitch1400, event )
							return 
						else
							fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1400:setAlpha( 0 )
							fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1400Frame3( fxGlitch1400, event )
						return 
					else
						fxGlitch1400:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						fxGlitch1400:setAlpha( 0.33 )
						fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame3 )
					end
				end
				
				fxGlitch1400:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
				fxGlitch1400:setAlpha( 0 )
				fxGlitch1400:registerEventHandler( "transition_complete_keyframe", fxGlitch1400Frame2 )
				local fxGlitch1300Frame2 = function ( fxGlitch1300, event )
					local fxGlitch1300Frame3 = function ( fxGlitch1300, event )
						local fxGlitch1300Frame4 = function ( fxGlitch1300, event )
							if not event.interrupted then
								fxGlitch1300:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1300:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1300, event )
							else
								fxGlitch1300:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1300Frame4( fxGlitch1300, event )
							return 
						else
							fxGlitch1300:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1300:setAlpha( 1 )
							fxGlitch1300:registerEventHandler( "transition_complete_keyframe", fxGlitch1300Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1300Frame3( fxGlitch1300, event )
						return 
					else
						fxGlitch1300:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1300:setAlpha( 0.25 )
						fxGlitch1300:registerEventHandler( "transition_complete_keyframe", fxGlitch1300Frame3 )
					end
				end
				
				fxGlitch1300:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				fxGlitch1300:setAlpha( 0 )
				fxGlitch1300:registerEventHandler( "transition_complete_keyframe", fxGlitch1300Frame2 )
				local fxGlitch1100Frame2 = function ( fxGlitch1100, event )
					local fxGlitch1100Frame3 = function ( fxGlitch1100, event )
						local fxGlitch1100Frame4 = function ( fxGlitch1100, event )
							if not event.interrupted then
								fxGlitch1100:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							fxGlitch1100:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( fxGlitch1100, event )
							else
								fxGlitch1100:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							fxGlitch1100Frame4( fxGlitch1100, event )
							return 
						else
							fxGlitch1100:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							fxGlitch1100:registerEventHandler( "transition_complete_keyframe", fxGlitch1100Frame4 )
						end
					end
					
					if event.interrupted then
						fxGlitch1100Frame3( fxGlitch1100, event )
						return 
					else
						fxGlitch1100:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						fxGlitch1100:setAlpha( 1 )
						fxGlitch1100:registerEventHandler( "transition_complete_keyframe", fxGlitch1100Frame3 )
					end
				end
				
				fxGlitch1100:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				fxGlitch1100:setAlpha( 0 )
				fxGlitch1100:registerEventHandler( "transition_complete_keyframe", fxGlitch1100Frame2 )
				local LootDecryptionFakeImageCycleFrame2 = function ( LootDecryptionFakeImageCycle, event )
					local LootDecryptionFakeImageCycleFrame3 = function ( LootDecryptionFakeImageCycle, event )
						local LootDecryptionFakeImageCycleFrame4 = function ( LootDecryptionFakeImageCycle, event )
							local LootDecryptionFakeImageCycleFrame5 = function ( LootDecryptionFakeImageCycle, event )
								local LootDecryptionFakeImageCycleFrame6 = function ( LootDecryptionFakeImageCycle, event )
									if not event.interrupted then
										LootDecryptionFakeImageCycle:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
									end
									LootDecryptionFakeImageCycle:setAlpha( 0.86 )
									if event.interrupted then
										self.clipFinished( LootDecryptionFakeImageCycle, event )
									else
										LootDecryptionFakeImageCycle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LootDecryptionFakeImageCycleFrame6( LootDecryptionFakeImageCycle, event )
									return 
								else
									LootDecryptionFakeImageCycle:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
									LootDecryptionFakeImageCycle:setAlpha( 0.95 )
									LootDecryptionFakeImageCycle:registerEventHandler( "transition_complete_keyframe", LootDecryptionFakeImageCycleFrame6 )
								end
							end
							
							if event.interrupted then
								LootDecryptionFakeImageCycleFrame5( LootDecryptionFakeImageCycle, event )
								return 
							else
								LootDecryptionFakeImageCycle:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
								LootDecryptionFakeImageCycle:setAlpha( 0.85 )
								LootDecryptionFakeImageCycle:registerEventHandler( "transition_complete_keyframe", LootDecryptionFakeImageCycleFrame5 )
							end
						end
						
						if event.interrupted then
							LootDecryptionFakeImageCycleFrame4( LootDecryptionFakeImageCycle, event )
							return 
						else
							LootDecryptionFakeImageCycle:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
							LootDecryptionFakeImageCycle:setAlpha( 0.97 )
							LootDecryptionFakeImageCycle:registerEventHandler( "transition_complete_keyframe", LootDecryptionFakeImageCycleFrame4 )
						end
					end
					
					if event.interrupted then
						LootDecryptionFakeImageCycleFrame3( LootDecryptionFakeImageCycle, event )
						return 
					else
						LootDecryptionFakeImageCycle:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						LootDecryptionFakeImageCycle:setAlpha( 0.85 )
						LootDecryptionFakeImageCycle:registerEventHandler( "transition_complete_keyframe", LootDecryptionFakeImageCycleFrame3 )
					end
				end
				
				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				LootDecryptionFakeImageCycleFrame2( LootDecryptionFakeImageCycle, {} )
				self.nextClip = "StartFuzz"
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			RevealedCommon = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						Glow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame2 )
				local CommonBackingFrame2 = function ( CommonBacking, event )
					local CommonBackingFrame3 = function ( CommonBacking, event )
						if not event.interrupted then
							CommonBacking:beginAnimation( "keyframe", 69, true, false, CoD.TweenType.Linear )
						end
						CommonBacking:setAlpha( 1 )
						CommonBacking:setScale( 1 )
						if event.interrupted then
							self.clipFinished( CommonBacking, event )
						else
							CommonBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CommonBackingFrame3( CommonBacking, event )
						return 
					else
						CommonBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						CommonBacking:setAlpha( 1 )
						CommonBacking:setScale( 1.31 )
						CommonBacking:registerEventHandler( "transition_complete_keyframe", CommonBackingFrame3 )
					end
				end
				
				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1.5 )
				CommonBackingFrame2( CommonBacking, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", lootRarityTextFrame2 )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", lootRaritySetFrame2 )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", lootCategoryFrame2 )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", lootNameFrame2 )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", LootDecryptionImageFrame2 )
				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setLeftRight( 0, 1, -45, 43 )
				self.LootDecryptionFakeImageCycle:setTopBottom( 0, 1, -33, 41 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					local GLOWcommonFrame3 = function ( GLOWcommon, event )
						if not event.interrupted then
							GLOWcommon:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						end
						GLOWcommon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GLOWcommon, event )
						else
							GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GLOWcommonFrame3( GLOWcommon, event )
						return 
					else
						GLOWcommon:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						GLOWcommon:setAlpha( 0.75 )
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", GLOWcommonFrame3 )
					end
				end
				
				GLOWcommon:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWcommon:setAlpha( 0 )
				GLOWcommon:registerEventHandler( "transition_complete_keyframe", GLOWcommonFrame2 )
				local blurboxFrame2 = function ( blurbox, event )
					local blurboxFrame3 = function ( blurbox, event )
						local blurboxFrame4 = function ( blurbox, event )
							if not event.interrupted then
								blurbox:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
							end
							blurbox:setRGB( 1, 1, 1 )
							blurbox:setAlpha( 0 )
							blurbox:setScale( 1.05 )
							if event.interrupted then
								self.clipFinished( blurbox, event )
							else
								blurbox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							blurboxFrame4( blurbox, event )
							return 
						else
							blurbox:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
							blurbox:setAlpha( 0.75 )
							blurbox:setScale( 1.01 )
							blurbox:registerEventHandler( "transition_complete_keyframe", blurboxFrame4 )
						end
					end
					
					if event.interrupted then
						blurboxFrame3( blurbox, event )
						return 
					else
						blurbox:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						blurbox:registerEventHandler( "transition_complete_keyframe", blurboxFrame3 )
					end
				end
				
				blurbox:completeAnimation()
				self.blurbox:setRGB( 1, 1, 1 )
				self.blurbox:setAlpha( 0 )
				self.blurbox:setScale( 1 )
				blurboxFrame2( blurbox, {} )
			end,
			RevealedRare = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				local RareBackingFrame2 = function ( RareBacking, event )
					local RareBackingFrame3 = function ( RareBacking, event )
						if not event.interrupted then
							RareBacking:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						RareBacking:setAlpha( 1 )
						RareBacking:setScale( 1 )
						if event.interrupted then
							self.clipFinished( RareBacking, event )
						else
							RareBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						RareBackingFrame3( RareBacking, event )
						return 
					else
						RareBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						RareBacking:setAlpha( 1 )
						RareBacking:setScale( 2.46 )
						RareBacking:registerEventHandler( "transition_complete_keyframe", RareBackingFrame3 )
					end
				end
				
				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 3.5 )
				RareBackingFrame2( RareBacking, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", lootRarityTextFrame2 )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", lootRaritySetFrame2 )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", lootCategoryFrame2 )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", lootNameFrame2 )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", LootDecryptionImageFrame2 )
				local GLOWrareFrame2 = function ( GLOWrare, event )
					local GLOWrareFrame3 = function ( GLOWrare, event )
						if not event.interrupted then
							GLOWrare:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
						end
						GLOWrare:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GLOWrare, event )
						else
							GLOWrare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GLOWrareFrame3( GLOWrare, event )
						return 
					else
						GLOWrare:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						GLOWrare:setAlpha( 1 )
						GLOWrare:registerEventHandler( "transition_complete_keyframe", GLOWrareFrame3 )
					end
				end
				
				GLOWrare:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWrare:setAlpha( 0 )
				GLOWrare:registerEventHandler( "transition_complete_keyframe", GLOWrareFrame2 )
				local blurboxFrame2 = function ( blurbox, event )
					local blurboxFrame3 = function ( blurbox, event )
						if not event.interrupted then
							blurbox:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						end
						blurbox:setRGB( 0.22, 0.93, 0.93 )
						blurbox:setAlpha( 0 )
						blurbox:setScale( 1.2 )
						if event.interrupted then
							self.clipFinished( blurbox, event )
						else
							blurbox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						blurboxFrame3( blurbox, event )
						return 
					else
						blurbox:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						blurbox:setAlpha( 1 )
						blurbox:setScale( 1.05 )
						blurbox:registerEventHandler( "transition_complete_keyframe", blurboxFrame3 )
					end
				end
				
				blurbox:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				blurbox:setRGB( 0.22, 0.93, 0.93 )
				blurbox:setAlpha( 0 )
				blurbox:setScale( 1 )
				blurbox:registerEventHandler( "transition_complete_keyframe", blurboxFrame2 )
				local BMPixelFXFrame2 = function ( BMPixelFX, event )
					if not event.interrupted then
						BMPixelFX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixelFX:setRGB( 0, 0.6, 0.9 )
					BMPixelFX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixelFX, event )
					else
						BMPixelFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setRGB( 0, 0.6, 0.9 )
				self.BMPixelFX:setAlpha( 0 )
				BMPixelFXFrame2( BMPixelFX, {} )
				local BMPixel02FXFrame2 = function ( BMPixel02FX, event )
					if not event.interrupted then
						BMPixel02FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel02FX:setRGB( 0, 0.6, 0.9 )
					BMPixel02FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel02FX, event )
					else
						BMPixel02FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setRGB( 0, 0.6, 0.9 )
				self.BMPixel02FX:setAlpha( 0 )
				BMPixel02FXFrame2( BMPixel02FX, {} )
				local BMPixel03FXFrame2 = function ( BMPixel03FX, event )
					if not event.interrupted then
						BMPixel03FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel03FX:setRGB( 0, 0.6, 0.9 )
					BMPixel03FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel03FX, event )
					else
						BMPixel03FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setRGB( 0, 0.6, 0.9 )
				self.BMPixel03FX:setAlpha( 0 )
				BMPixel03FXFrame2( BMPixel03FX, {} )
				local BMPixel04FXFrame2 = function ( BMPixel04FX, event )
					if not event.interrupted then
						BMPixel04FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel04FX:setRGB( 0, 0.6, 0.9 )
					BMPixel04FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel04FX, event )
					else
						BMPixel04FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setRGB( 0, 0.6, 0.9 )
				self.BMPixel04FX:setAlpha( 0 )
				BMPixel04FXFrame2( BMPixel04FX, {} )
			end,
			RevealedLegendary = function ()
				self.resetProperties()
				self:setupElementClipCounter( 16 )
				local LegendaryBackingFrame2 = function ( LegendaryBacking, event )
					local LegendaryBackingFrame3 = function ( LegendaryBacking, event )
						if not event.interrupted then
							LegendaryBacking:beginAnimation( "keyframe", 69, false, true, CoD.TweenType.Linear )
						end
						LegendaryBacking:setAlpha( 1 )
						LegendaryBacking:setScale( 1 )
						if event.interrupted then
							self.clipFinished( LegendaryBacking, event )
						else
							LegendaryBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LegendaryBackingFrame3( LegendaryBacking, event )
						return 
					else
						LegendaryBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						LegendaryBacking:setAlpha( 1 )
						LegendaryBacking:setScale( 2.46 )
						LegendaryBacking:registerEventHandler( "transition_complete_keyframe", LegendaryBackingFrame3 )
					end
				end
				
				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 3.5 )
				LegendaryBackingFrame2( LegendaryBacking, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", lootRarityTextFrame2 )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", lootRaritySetFrame2 )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", lootCategoryFrame2 )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", lootNameFrame2 )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", LootDecryptionImageFrame2 )
				local GLOWLengendaryFrame2 = function ( GLOWLengendary, event )
					local GLOWLengendaryFrame3 = function ( GLOWLengendary, event )
						if not event.interrupted then
							GLOWLengendary:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Linear )
						end
						GLOWLengendary:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GLOWLengendary, event )
						else
							GLOWLengendary:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GLOWLengendaryFrame3( GLOWLengendary, event )
						return 
					else
						GLOWLengendary:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						GLOWLengendary:setAlpha( 1 )
						GLOWLengendary:registerEventHandler( "transition_complete_keyframe", GLOWLengendaryFrame3 )
					end
				end
				
				GLOWLengendary:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWLengendary:setAlpha( 0 )
				GLOWLengendary:registerEventHandler( "transition_complete_keyframe", GLOWLengendaryFrame2 )
				local blurboxFrame2 = function ( blurbox, event )
					local blurboxFrame3 = function ( blurbox, event )
						local blurboxFrame4 = function ( blurbox, event )
							if not event.interrupted then
								blurbox:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
							end
							blurbox:setRGB( 0.67, 0.2, 1 )
							blurbox:setAlpha( 0 )
							blurbox:setScale( 1.2 )
							if event.interrupted then
								self.clipFinished( blurbox, event )
							else
								blurbox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							blurboxFrame4( blurbox, event )
							return 
						else
							blurbox:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
							blurbox:setAlpha( 1 )
							blurbox:setScale( 1.04 )
							blurbox:registerEventHandler( "transition_complete_keyframe", blurboxFrame4 )
						end
					end
					
					if event.interrupted then
						blurboxFrame3( blurbox, event )
						return 
					else
						blurbox:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						blurbox:registerEventHandler( "transition_complete_keyframe", blurboxFrame3 )
					end
				end
				
				blurbox:completeAnimation()
				self.blurbox:setRGB( 0.67, 0.2, 1 )
				self.blurbox:setAlpha( 0 )
				self.blurbox:setScale( 1 )
				blurboxFrame2( blurbox, {} )
				local BMPixelFXFrame2 = function ( BMPixelFX, event )
					local BMPixelFXFrame3 = function ( BMPixelFX, event )
						if not event.interrupted then
							BMPixelFX:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						BMPixelFX:setRGB( 0.67, 0.2, 1 )
						BMPixelFX:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMPixelFX, event )
						else
							BMPixelFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMPixelFXFrame3( BMPixelFX, event )
						return 
					else
						BMPixelFX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						BMPixelFX:setAlpha( 1 )
						BMPixelFX:registerEventHandler( "transition_complete_keyframe", BMPixelFXFrame3 )
					end
				end
				
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setRGB( 0.67, 0.2, 1 )
				self.BMPixelFX:setAlpha( 0 )
				BMPixelFXFrame2( BMPixelFX, {} )
				local BMPixel02FXFrame2 = function ( BMPixel02FX, event )
					local BMPixel02FXFrame3 = function ( BMPixel02FX, event )
						if not event.interrupted then
							BMPixel02FX:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						BMPixel02FX:setRGB( 0.67, 0.2, 1 )
						BMPixel02FX:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMPixel02FX, event )
						else
							BMPixel02FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMPixel02FXFrame3( BMPixel02FX, event )
						return 
					else
						BMPixel02FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						BMPixel02FX:setAlpha( 1 )
						BMPixel02FX:registerEventHandler( "transition_complete_keyframe", BMPixel02FXFrame3 )
					end
				end
				
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setRGB( 0.67, 0.2, 1 )
				self.BMPixel02FX:setAlpha( 0 )
				BMPixel02FXFrame2( BMPixel02FX, {} )
				local BMPixel03FXFrame2 = function ( BMPixel03FX, event )
					local BMPixel03FXFrame3 = function ( BMPixel03FX, event )
						if not event.interrupted then
							BMPixel03FX:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						BMPixel03FX:setRGB( 0.67, 0.2, 1 )
						BMPixel03FX:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMPixel03FX, event )
						else
							BMPixel03FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMPixel03FXFrame3( BMPixel03FX, event )
						return 
					else
						BMPixel03FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						BMPixel03FX:setAlpha( 1 )
						BMPixel03FX:registerEventHandler( "transition_complete_keyframe", BMPixel03FXFrame3 )
					end
				end
				
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setRGB( 0.67, 0.2, 1 )
				self.BMPixel03FX:setAlpha( 0 )
				BMPixel03FXFrame2( BMPixel03FX, {} )
				local BMPixel04FXFrame2 = function ( BMPixel04FX, event )
					local BMPixel04FXFrame3 = function ( BMPixel04FX, event )
						if not event.interrupted then
							BMPixel04FX:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						BMPixel04FX:setRGB( 0.67, 0.2, 1 )
						BMPixel04FX:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMPixel04FX, event )
						else
							BMPixel04FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMPixel04FXFrame3( BMPixel04FX, event )
						return 
					else
						BMPixel04FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						BMPixel04FX:setAlpha( 1 )
						BMPixel04FX:registerEventHandler( "transition_complete_keyframe", BMPixel04FXFrame3 )
					end
				end
				
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setRGB( 0.67, 0.2, 1 )
				self.BMPixel04FX:setAlpha( 0 )
				BMPixel04FXFrame2( BMPixel04FX, {} )
				local LegendaryEmber1Frame2 = function ( LegendaryEmber1, event )
					local LegendaryEmber1Frame3 = function ( LegendaryEmber1, event )
						local LegendaryEmber1Frame4 = function ( LegendaryEmber1, event )
							local LegendaryEmber1Frame5 = function ( LegendaryEmber1, event )
								local LegendaryEmber1Frame6 = function ( LegendaryEmber1, event )
									if not event.interrupted then
										LegendaryEmber1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									end
									LegendaryEmber1:setAlpha( 0 )
									LegendaryEmber1:setScale( 2 )
									if event.interrupted then
										self.clipFinished( LegendaryEmber1, event )
									else
										LegendaryEmber1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LegendaryEmber1Frame6( LegendaryEmber1, event )
									return 
								else
									LegendaryEmber1:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									LegendaryEmber1:setScale( 1.86 )
									LegendaryEmber1:registerEventHandler( "transition_complete_keyframe", LegendaryEmber1Frame6 )
								end
							end
							
							if event.interrupted then
								LegendaryEmber1Frame5( LegendaryEmber1, event )
								return 
							else
								LegendaryEmber1:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								LegendaryEmber1:setAlpha( 0 )
								LegendaryEmber1:setScale( 1.62 )
								LegendaryEmber1:registerEventHandler( "transition_complete_keyframe", LegendaryEmber1Frame5 )
							end
						end
						
						if event.interrupted then
							LegendaryEmber1Frame4( LegendaryEmber1, event )
							return 
						else
							LegendaryEmber1:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							LegendaryEmber1:setAlpha( 1 )
							LegendaryEmber1:setScale( 1.22 )
							LegendaryEmber1:registerEventHandler( "transition_complete_keyframe", LegendaryEmber1Frame4 )
						end
					end
					
					if event.interrupted then
						LegendaryEmber1Frame3( LegendaryEmber1, event )
						return 
					else
						LegendaryEmber1:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						LegendaryEmber1:setAlpha( 0.2 )
						LegendaryEmber1:registerEventHandler( "transition_complete_keyframe", LegendaryEmber1Frame3 )
					end
				end
				
				LegendaryEmber1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber1:setAlpha( 0 )
				LegendaryEmber1:setScale( 1 )
				LegendaryEmber1:registerEventHandler( "transition_complete_keyframe", LegendaryEmber1Frame2 )
				local LegendaryEmber2Frame2 = function ( LegendaryEmber2, event )
					local LegendaryEmber2Frame3 = function ( LegendaryEmber2, event )
						local LegendaryEmber2Frame4 = function ( LegendaryEmber2, event )
							local LegendaryEmber2Frame5 = function ( LegendaryEmber2, event )
								if not event.interrupted then
									LegendaryEmber2:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								LegendaryEmber2:setAlpha( 0 )
								LegendaryEmber2:setScale( 1.5 )
								if event.interrupted then
									self.clipFinished( LegendaryEmber2, event )
								else
									LegendaryEmber2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LegendaryEmber2Frame5( LegendaryEmber2, event )
								return 
							else
								LegendaryEmber2:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
								LegendaryEmber2:setAlpha( 0 )
								LegendaryEmber2:setScale( 1.46 )
								LegendaryEmber2:registerEventHandler( "transition_complete_keyframe", LegendaryEmber2Frame5 )
							end
						end
						
						if event.interrupted then
							LegendaryEmber2Frame4( LegendaryEmber2, event )
							return 
						else
							LegendaryEmber2:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							LegendaryEmber2:setAlpha( 1 )
							LegendaryEmber2:setScale( 1.26 )
							LegendaryEmber2:registerEventHandler( "transition_complete_keyframe", LegendaryEmber2Frame4 )
						end
					end
					
					if event.interrupted then
						LegendaryEmber2Frame3( LegendaryEmber2, event )
						return 
					else
						LegendaryEmber2:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						LegendaryEmber2:setAlpha( 0.2 )
						LegendaryEmber2:registerEventHandler( "transition_complete_keyframe", LegendaryEmber2Frame3 )
					end
				end
				
				LegendaryEmber2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber2:setAlpha( 0 )
				LegendaryEmber2:setScale( 1.2 )
				LegendaryEmber2:registerEventHandler( "transition_complete_keyframe", LegendaryEmber2Frame2 )
				local LegendaryEmber3Frame2 = function ( LegendaryEmber3, event )
					local LegendaryEmber3Frame3 = function ( LegendaryEmber3, event )
						if not event.interrupted then
							LegendaryEmber3:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						LegendaryEmber3:setAlpha( 0 )
						LegendaryEmber3:setScale( 1.5 )
						if event.interrupted then
							self.clipFinished( LegendaryEmber3, event )
						else
							LegendaryEmber3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LegendaryEmber3Frame3( LegendaryEmber3, event )
						return 
					else
						LegendaryEmber3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						LegendaryEmber3:setAlpha( 1 )
						LegendaryEmber3:setScale( 1.3 )
						LegendaryEmber3:registerEventHandler( "transition_complete_keyframe", LegendaryEmber3Frame3 )
					end
				end
				
				LegendaryEmber3:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				LegendaryEmber3:setAlpha( 0 )
				LegendaryEmber3:setScale( 1.1 )
				LegendaryEmber3:registerEventHandler( "transition_complete_keyframe", LegendaryEmber3Frame2 )
				local LegendaryEmber5Frame2 = function ( LegendaryEmber5, event )
					local LegendaryEmber5Frame3 = function ( LegendaryEmber5, event )
						local LegendaryEmber5Frame4 = function ( LegendaryEmber5, event )
							local LegendaryEmber5Frame5 = function ( LegendaryEmber5, event )
								if not event.interrupted then
									LegendaryEmber5:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								LegendaryEmber5:setLeftRight( 0, 0, -112.5, 475.5 )
								LegendaryEmber5:setTopBottom( 0, 0, -118, 636 )
								LegendaryEmber5:setAlpha( 0 )
								LegendaryEmber5:setScale( 1.8 )
								if event.interrupted then
									self.clipFinished( LegendaryEmber5, event )
								else
									LegendaryEmber5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								LegendaryEmber5Frame5( LegendaryEmber5, event )
								return 
							else
								LegendaryEmber5:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
								LegendaryEmber5:setAlpha( 0 )
								LegendaryEmber5:setScale( 1.45 )
								LegendaryEmber5:registerEventHandler( "transition_complete_keyframe", LegendaryEmber5Frame5 )
							end
						end
						
						if event.interrupted then
							LegendaryEmber5Frame4( LegendaryEmber5, event )
							return 
						else
							LegendaryEmber5:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							LegendaryEmber5:setAlpha( 1 )
							LegendaryEmber5:setScale( 0.96 )
							LegendaryEmber5:registerEventHandler( "transition_complete_keyframe", LegendaryEmber5Frame4 )
						end
					end
					
					if event.interrupted then
						LegendaryEmber5Frame3( LegendaryEmber5, event )
						return 
					else
						LegendaryEmber5:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						LegendaryEmber5:setAlpha( 0.2 )
						LegendaryEmber5:registerEventHandler( "transition_complete_keyframe", LegendaryEmber5Frame3 )
					end
				end
				
				LegendaryEmber5:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber5:setLeftRight( 0, 0, -112.5, 475.5 )
				LegendaryEmber5:setTopBottom( 0, 0, -118, 636 )
				LegendaryEmber5:setAlpha( 0 )
				LegendaryEmber5:setScale( 0.8 )
				LegendaryEmber5:registerEventHandler( "transition_complete_keyframe", LegendaryEmber5Frame2 )
			end,
			RevealedEpic = function ()
				self.resetProperties()
				self:setupElementClipCounter( 21 )
				local EpicBackingFrame2 = function ( EpicBacking, event )
					local EpicBackingFrame3 = function ( EpicBacking, event )
						if not event.interrupted then
							EpicBacking:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						EpicBacking:setAlpha( 1 )
						EpicBacking:setScale( 1 )
						if event.interrupted then
							self.clipFinished( EpicBacking, event )
						else
							EpicBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EpicBackingFrame3( EpicBacking, event )
						return 
					else
						EpicBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						EpicBacking:setAlpha( 1 )
						EpicBacking:setScale( 2.46 )
						EpicBacking:registerEventHandler( "transition_complete_keyframe", EpicBackingFrame3 )
					end
				end
				
				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.EpicBacking:setScale( 3.5 )
				EpicBackingFrame2( EpicBacking, {} )
				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setScale( 3.5 )
				self.clipFinished( LegendaryBacking, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", lootRarityTextFrame2 )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", lootRaritySetFrame2 )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", lootCategoryFrame2 )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					lootName:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", lootNameFrame2 )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0, 0, -7, 374 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( 0, 0, -7, 374 )
				LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", LootDecryptionImageFrame2 )
				local LootDecryptionFakeImageCycleFrame2 = function ( LootDecryptionFakeImageCycle, event )
					if not event.interrupted then
						LootDecryptionFakeImageCycle:beginAnimation( "keyframe", 540, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionFakeImageCycle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( LootDecryptionFakeImageCycle, event )
					else
						LootDecryptionFakeImageCycle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				LootDecryptionFakeImageCycleFrame2( LootDecryptionFakeImageCycle, {} )
				local GLOWEpicFrame2 = function ( GLOWEpic, event )
					local GLOWEpicFrame3 = function ( GLOWEpic, event )
						if not event.interrupted then
							GLOWEpic:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						end
						GLOWEpic:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GLOWEpic, event )
						else
							GLOWEpic:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GLOWEpicFrame3( GLOWEpic, event )
						return 
					else
						GLOWEpic:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						GLOWEpic:setAlpha( 1 )
						GLOWEpic:registerEventHandler( "transition_complete_keyframe", GLOWEpicFrame3 )
					end
				end
				
				GLOWEpic:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWEpic:setAlpha( 0 )
				GLOWEpic:registerEventHandler( "transition_complete_keyframe", GLOWEpicFrame2 )
				local blurboxFrame2 = function ( blurbox, event )
					local blurboxFrame3 = function ( blurbox, event )
						if not event.interrupted then
							blurbox:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						end
						blurbox:setRGB( 1, 0.67, 0 )
						blurbox:setAlpha( 0 )
						blurbox:setScale( 1.2 )
						if event.interrupted then
							self.clipFinished( blurbox, event )
						else
							blurbox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						blurboxFrame3( blurbox, event )
						return 
					else
						blurbox:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						blurbox:setAlpha( 1 )
						blurbox:setScale( 1.04 )
						blurbox:registerEventHandler( "transition_complete_keyframe", blurboxFrame3 )
					end
				end
				
				blurbox:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				blurbox:setRGB( 1, 0.67, 0 )
				blurbox:setAlpha( 0 )
				blurbox:setScale( 1 )
				blurbox:registerEventHandler( "transition_complete_keyframe", blurboxFrame2 )
				local BMPixelFXFrame2 = function ( BMPixelFX, event )
					if not event.interrupted then
						BMPixelFX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixelFX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixelFX, event )
					else
						BMPixelFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setAlpha( 0 )
				BMPixelFXFrame2( BMPixelFX, {} )
				local BMPixel02FXFrame2 = function ( BMPixel02FX, event )
					if not event.interrupted then
						BMPixel02FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel02FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel02FX, event )
					else
						BMPixel02FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setAlpha( 0 )
				BMPixel02FXFrame2( BMPixel02FX, {} )
				local BMPixel03FXFrame2 = function ( BMPixel03FX, event )
					if not event.interrupted then
						BMPixel03FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel03FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel03FX, event )
					else
						BMPixel03FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setAlpha( 0 )
				BMPixel03FXFrame2( BMPixel03FX, {} )
				local BMPixel04FXFrame2 = function ( BMPixel04FX, event )
					if not event.interrupted then
						BMPixel04FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel04FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel04FX, event )
					else
						BMPixel04FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setAlpha( 0 )
				BMPixel04FXFrame2( BMPixel04FX, {} )
				local EpicEmber5Frame2 = function ( EpicEmber5, event )
					local EpicEmber5Frame3 = function ( EpicEmber5, event )
						local EpicEmber5Frame4 = function ( EpicEmber5, event )
							if not event.interrupted then
								EpicEmber5:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							EpicEmber5:setLeftRight( 0, 0, -112.5, 475.5 )
							EpicEmber5:setTopBottom( 0, 0, -118, 636 )
							EpicEmber5:setAlpha( 0 )
							EpicEmber5:setScale( 1.8 )
							if event.interrupted then
								self.clipFinished( EpicEmber5, event )
							else
								EpicEmber5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							EpicEmber5Frame4( EpicEmber5, event )
							return 
						else
							EpicEmber5:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
							EpicEmber5:setAlpha( 0 )
							EpicEmber5:setScale( 1.45 )
							EpicEmber5:registerEventHandler( "transition_complete_keyframe", EpicEmber5Frame4 )
						end
					end
					
					if event.interrupted then
						EpicEmber5Frame3( EpicEmber5, event )
						return 
					else
						EpicEmber5:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						EpicEmber5:setAlpha( 1 )
						EpicEmber5:setScale( 0.98 )
						EpicEmber5:registerEventHandler( "transition_complete_keyframe", EpicEmber5Frame3 )
					end
				end
				
				EpicEmber5:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				EpicEmber5:setLeftRight( 0, 0, -112.5, 475.5 )
				EpicEmber5:setTopBottom( 0, 0, -118, 636 )
				EpicEmber5:setAlpha( 0 )
				EpicEmber5:setScale( 0.8 )
				EpicEmber5:registerEventHandler( "transition_complete_keyframe", EpicEmber5Frame2 )
				local EpicEmber3Frame2 = function ( EpicEmber3, event )
					local EpicEmber3Frame3 = function ( EpicEmber3, event )
						if not event.interrupted then
							EpicEmber3:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						EpicEmber3:setAlpha( 0 )
						EpicEmber3:setScale( 1.5 )
						if event.interrupted then
							self.clipFinished( EpicEmber3, event )
						else
							EpicEmber3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						EpicEmber3Frame3( EpicEmber3, event )
						return 
					else
						EpicEmber3:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						EpicEmber3:setAlpha( 1 )
						EpicEmber3:setScale( 1.3 )
						EpicEmber3:registerEventHandler( "transition_complete_keyframe", EpicEmber3Frame3 )
					end
				end
				
				EpicEmber3:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				EpicEmber3:setAlpha( 0 )
				EpicEmber3:setScale( 1.1 )
				EpicEmber3:registerEventHandler( "transition_complete_keyframe", EpicEmber3Frame2 )
				local EpicEmber2Frame2 = function ( EpicEmber2, event )
					local EpicEmber2Frame3 = function ( EpicEmber2, event )
						local EpicEmber2Frame4 = function ( EpicEmber2, event )
							local EpicEmber2Frame5 = function ( EpicEmber2, event )
								local EpicEmber2Frame6 = function ( EpicEmber2, event )
									local EpicEmber2Frame7 = function ( EpicEmber2, event )
										if not event.interrupted then
											EpicEmber2:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										EpicEmber2:setAlpha( 0 )
										EpicEmber2:setScale( 1.4 )
										if event.interrupted then
											self.clipFinished( EpicEmber2, event )
										else
											EpicEmber2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										EpicEmber2Frame7( EpicEmber2, event )
										return 
									else
										EpicEmber2:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
										EpicEmber2:setScale( 1.38 )
										EpicEmber2:registerEventHandler( "transition_complete_keyframe", EpicEmber2Frame7 )
									end
								end
								
								if event.interrupted then
									EpicEmber2Frame6( EpicEmber2, event )
									return 
								else
									EpicEmber2:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
									EpicEmber2:setAlpha( 0 )
									EpicEmber2:setScale( 1.36 )
									EpicEmber2:registerEventHandler( "transition_complete_keyframe", EpicEmber2Frame6 )
								end
							end
							
							if event.interrupted then
								EpicEmber2Frame5( EpicEmber2, event )
								return 
							else
								EpicEmber2:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								EpicEmber2:setScale( 1.33 )
								EpicEmber2:registerEventHandler( "transition_complete_keyframe", EpicEmber2Frame5 )
							end
						end
						
						if event.interrupted then
							EpicEmber2Frame4( EpicEmber2, event )
							return 
						else
							EpicEmber2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							EpicEmber2:setScale( 1.3 )
							EpicEmber2:registerEventHandler( "transition_complete_keyframe", EpicEmber2Frame4 )
						end
					end
					
					if event.interrupted then
						EpicEmber2Frame3( EpicEmber2, event )
						return 
					else
						EpicEmber2:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						EpicEmber2:setAlpha( 1 )
						EpicEmber2:setScale( 1.2 )
						EpicEmber2:registerEventHandler( "transition_complete_keyframe", EpicEmber2Frame3 )
					end
				end
				
				EpicEmber2:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				EpicEmber2:setAlpha( 0 )
				EpicEmber2:setScale( 1.1 )
				EpicEmber2:registerEventHandler( "transition_complete_keyframe", EpicEmber2Frame2 )
				local EpicEmber1Frame2 = function ( EpicEmber1, event )
					local EpicEmber1Frame3 = function ( EpicEmber1, event )
						local EpicEmber1Frame4 = function ( EpicEmber1, event )
							local EpicEmber1Frame5 = function ( EpicEmber1, event )
								local EpicEmber1Frame6 = function ( EpicEmber1, event )
									local EpicEmber1Frame7 = function ( EpicEmber1, event )
										local EpicEmber1Frame8 = function ( EpicEmber1, event )
											if not event.interrupted then
												EpicEmber1:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											end
											EpicEmber1:setAlpha( 0 )
											EpicEmber1:setScale( 1.4 )
											if event.interrupted then
												self.clipFinished( EpicEmber1, event )
											else
												EpicEmber1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											EpicEmber1Frame8( EpicEmber1, event )
											return 
										else
											EpicEmber1:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											EpicEmber1:setScale( 1.39 )
											EpicEmber1:registerEventHandler( "transition_complete_keyframe", EpicEmber1Frame8 )
										end
									end
									
									if event.interrupted then
										EpicEmber1Frame7( EpicEmber1, event )
										return 
									else
										EpicEmber1:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
										EpicEmber1:setScale( 1.36 )
										EpicEmber1:registerEventHandler( "transition_complete_keyframe", EpicEmber1Frame7 )
									end
								end
								
								if event.interrupted then
									EpicEmber1Frame6( EpicEmber1, event )
									return 
								else
									EpicEmber1:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
									EpicEmber1:setAlpha( 0 )
									EpicEmber1:setScale( 1.34 )
									EpicEmber1:registerEventHandler( "transition_complete_keyframe", EpicEmber1Frame6 )
								end
							end
							
							if event.interrupted then
								EpicEmber1Frame5( EpicEmber1, event )
								return 
							else
								EpicEmber1:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								EpicEmber1:setScale( 1.3 )
								EpicEmber1:registerEventHandler( "transition_complete_keyframe", EpicEmber1Frame5 )
							end
						end
						
						if event.interrupted then
							EpicEmber1Frame4( EpicEmber1, event )
							return 
						else
							EpicEmber1:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							EpicEmber1:setAlpha( 1 )
							EpicEmber1:setScale( 1.24 )
							EpicEmber1:registerEventHandler( "transition_complete_keyframe", EpicEmber1Frame4 )
						end
					end
					
					if event.interrupted then
						EpicEmber1Frame3( EpicEmber1, event )
						return 
					else
						EpicEmber1:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						EpicEmber1:setScale( 1.22 )
						EpicEmber1:registerEventHandler( "transition_complete_keyframe", EpicEmber1Frame3 )
					end
				end
				
				EpicEmber1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				EpicEmber1:setAlpha( 0 )
				EpicEmber1:setScale( 1.2 )
				EpicEmber1:registerEventHandler( "transition_complete_keyframe", EpicEmber1Frame2 )
				local epicSkullFrame2 = function ( epicSkull, event )
					local epicSkullFrame3 = function ( epicSkull, event )
						local epicSkullFrame4 = function ( epicSkull, event )
							local epicSkullFrame5 = function ( epicSkull, event )
								local epicSkullFrame6 = function ( epicSkull, event )
									local epicSkullFrame7 = function ( epicSkull, event )
										local epicSkullFrame8 = function ( epicSkull, event )
											if not event.interrupted then
												epicSkull:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
											end
											epicSkull:setLeftRight( 0, 0, -88, 465 )
											epicSkull:setTopBottom( 0, 0, -109, 628 )
											epicSkull:setAlpha( 0 )
											epicSkull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated" ) )
											epicSkull:setShaderVector( 0, 27, 1, 0, 0 )
											epicSkull:setShaderVector( 1, 0, 0, 0, 0 )
											if event.interrupted then
												self.clipFinished( epicSkull, event )
											else
												epicSkull:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											epicSkullFrame8( epicSkull, event )
											return 
										else
											epicSkull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											epicSkull:setAlpha( 0 )
											epicSkull:setShaderVector( 1, 0, 0, 0, 0 )
											epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame8 )
										end
									end
									
									if event.interrupted then
										epicSkullFrame7( epicSkull, event )
										return 
									else
										epicSkull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										epicSkull:setShaderVector( 1, 26.99, 0, 0, 0 )
										epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame7 )
									end
								end
								
								if event.interrupted then
									epicSkullFrame6( epicSkull, event )
									return 
								else
									epicSkull:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
									epicSkull:setShaderVector( 1, 26.15, 0, 0, 0 )
									epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame6 )
								end
							end
							
							if event.interrupted then
								epicSkullFrame5( epicSkull, event )
								return 
							else
								epicSkull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								epicSkull:setShaderVector( 1, 0.99, 0, 0, 0 )
								epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame5 )
							end
						end
						
						if event.interrupted then
							epicSkullFrame4( epicSkull, event )
							return 
						else
							epicSkull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							epicSkull:setAlpha( 1 )
							epicSkull:setShaderVector( 1, 0.5, 0, 0, 0 )
							epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame4 )
						end
					end
					
					if event.interrupted then
						epicSkullFrame3( epicSkull, event )
						return 
					else
						epicSkull:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						epicSkull:setShaderVector( 0, 27, 1, 0, 0 )
						epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame3 )
					end
				end
				
				epicSkull:completeAnimation()
				self.epicSkull:setLeftRight( 0, 0, -88, 465 )
				self.epicSkull:setTopBottom( 0, 0, -109, 628 )
				self.epicSkull:setAlpha( 0 )
				self.epicSkull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated" ) )
				self.epicSkull:setShaderVector( 0, 27, 0, 0, 0 )
				self.epicSkull:setShaderVector( 1, 0, 0, 0, 0 )
				epicSkullFrame2( epicSkull, {} )
				local BMFlyEmberFXFrame2 = function ( BMFlyEmberFX, event )
					if not event.interrupted then
						BMFlyEmberFX:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					BMFlyEmberFX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMFlyEmberFX, event )
					else
						BMFlyEmberFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFlyEmberFX:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				BMFlyEmberFX:setAlpha( 0 )
				BMFlyEmberFX:registerEventHandler( "transition_complete_keyframe", BMFlyEmberFXFrame2 )
				local BMFlyEmberFX0Frame2 = function ( BMFlyEmberFX0, event )
					if not event.interrupted then
						BMFlyEmberFX0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					BMFlyEmberFX0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMFlyEmberFX0, event )
					else
						BMFlyEmberFX0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFlyEmberFX0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
				BMFlyEmberFX0:setAlpha( 0 )
				BMFlyEmberFX0:registerEventHandler( "transition_complete_keyframe", BMFlyEmberFX0Frame2 )
			end
		},
		RevealedCommon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -125, 109 )
				self.FocusBar3:setTopBottom( 0, 0, 571, 610 )
				self.clipFinished( FocusBar3, {} )
				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 1 )
				self.clipFinished( CommonBacking, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.clipFinished( lootName, {} )
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 1 )
				self.clipFinished( LootDecryptionImage, {} )
				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.clipFinished( BMLockItem, {} )
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setAlpha( 0 )
				self.clipFinished( BMPixelFX, {} )
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setAlpha( 0 )
				self.clipFinished( BMPixel02FX, {} )
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setAlpha( 0 )
				self.clipFinished( BMPixel03FX, {} )
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setAlpha( 0 )
				self.clipFinished( BMPixel04FX, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
				self.FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 1 )
				self.CommonBacking:setScale( 1.08 )
				self.clipFinished( CommonBacking, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 53, 83 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 381, -59 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )
				local LightCommonFrame2 = function ( LightCommon, event )
					local LightCommonFrame3 = function ( LightCommon, event )
						if not event.interrupted then
							LightCommon:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						LightCommon:setAlpha( 1 )
						LightCommon:setScale( 1.08 )
						if event.interrupted then
							self.clipFinished( LightCommon, event )
						else
							LightCommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LightCommonFrame3( LightCommon, event )
						return 
					else
						LightCommon:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						LightCommon:setAlpha( 0.65 )
						LightCommon:registerEventHandler( "transition_complete_keyframe", LightCommonFrame3 )
					end
				end
				
				LightCommon:completeAnimation()
				self.LightCommon:setAlpha( 1 )
				self.LightCommon:setScale( 1.08 )
				LightCommonFrame2( LightCommon, {} )
				BMDateTimeAndTotalCount:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
				self.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMDateTimeAndTotalCount:setScale( 1.08 )
				self.clipFinished( BMDateTimeAndTotalCount, {} )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
					FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
					FocusBar3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -120, 120 )
				self.FocusBar3:setTopBottom( 0, 0, 546.5, 612.5 )
				self.FocusBar3:setAlpha( 0 )
				FocusBar3Frame2( FocusBar3, {} )
				local CommonBackingFrame2 = function ( CommonBacking, event )
					if not event.interrupted then
						CommonBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					CommonBacking:setAlpha( 1 )
					CommonBacking:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( CommonBacking, event )
					else
						CommonBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 1 )
				self.CommonBacking:setScale( 1 )
				CommonBackingFrame2( CommonBacking, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( 0, 1, 0, -2 )
					lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
					lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 133, 163 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( 0, 1, -2, 0 )
					lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( 0, 1, -2, 0 )
					lootName:setTopBottom( 0.5, 0.5, 53, 83 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 47, 77 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( 0, 1, 0, -2 )
					BMLockItem:setTopBottom( 0, 1, 381, -59 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 367, -73 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				BMLockItemFrame2( BMLockItem, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					if not event.interrupted then
						GLOWcommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					GLOWcommon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GLOWcommon, event )
					else
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
				local LightCommonFrame2 = function ( LightCommon, event )
					if not event.interrupted then
						LightCommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightCommon:setAlpha( 1 )
					LightCommon:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LightCommon, event )
					else
						LightCommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightCommon:completeAnimation()
				self.LightCommon:setAlpha( 0 )
				self.LightCommon:setScale( 1 )
				LightCommonFrame2( LightCommon, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
					itemHintText:setTopBottom( 1, 1, 33, 78 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
				self.itemHintText:setTopBottom( 1, 1, 44, 89 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMDateTimeAndTotalCountFrame2 = function ( BMDateTimeAndTotalCount, event )
					if not event.interrupted then
						BMDateTimeAndTotalCount:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
					BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
					BMDateTimeAndTotalCount:setAlpha( 1 )
					BMDateTimeAndTotalCount:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMDateTimeAndTotalCount, event )
					else
						BMDateTimeAndTotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDateTimeAndTotalCount:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
				self.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.BMDateTimeAndTotalCount:setScale( 1 )
				BMDateTimeAndTotalCountFrame2( BMDateTimeAndTotalCount, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( 0.5, 0.5, -120, 120 )
					FocusBar3:setTopBottom( 0, 0, 546.5, 612.5 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
				self.FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				local CommonBackingFrame2 = function ( CommonBacking, event )
					if not event.interrupted then
						CommonBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					CommonBacking:setAlpha( 1 )
					CommonBacking:setScale( 1 )
					if event.interrupted then
						self.clipFinished( CommonBacking, event )
					else
						CommonBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 1 )
				self.CommonBacking:setScale( 1.08 )
				CommonBackingFrame2( CommonBacking, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( 0, 1, 0, -2 )
					lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
					lootRaritySet:setTopBottom( 0.5, 0.5, 133, 163 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( 0, 1, -2, 0 )
					lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( 0, 1, -2, 0 )
					lootName:setTopBottom( 0.5, 0.5, 47, 77 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 53, 83 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( 0, 1, 0, -2 )
					BMLockItem:setTopBottom( 0, 1, 367, -73 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 381, -59 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				BMLockItemFrame2( BMLockItem, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					if not event.interrupted then
						GLOWcommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					GLOWcommon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GLOWcommon, event )
					else
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
				local LightCommonFrame2 = function ( LightCommon, event )
					if not event.interrupted then
						LightCommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightCommon:setAlpha( 0 )
					LightCommon:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LightCommon, event )
					else
						LightCommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightCommon:completeAnimation()
				self.LightCommon:setAlpha( 1 )
				self.LightCommon:setScale( 1.08 )
				LightCommonFrame2( LightCommon, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
					itemHintText:setTopBottom( 1, 1, 44, 89 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
				self.itemHintText:setTopBottom( 1, 1, 33, 78 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMDateTimeAndTotalCountFrame2 = function ( BMDateTimeAndTotalCount, event )
					if not event.interrupted then
						BMDateTimeAndTotalCount:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
					BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
					BMDateTimeAndTotalCount:setAlpha( 0 )
					BMDateTimeAndTotalCount:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMDateTimeAndTotalCount, event )
					else
						BMDateTimeAndTotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDateTimeAndTotalCount:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
				self.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMDateTimeAndTotalCount:setScale( 1.08 )
				BMDateTimeAndTotalCountFrame2( BMDateTimeAndTotalCount, {} )
			end
		},
		RevealedRare = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -119, 115 )
				self.FocusBar3:setTopBottom( 0, 0, 570, 609 )
				self.clipFinished( FocusBar3, {} )
				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 1 )
				self.clipFinished( RareBacking, {} )
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.65, 0.88, 1 )
				self.BMLineLightFX:setAlpha( 1 )
				self.clipFinished( BMLineLightFX, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.clipFinished( lootName, {} )
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.clipFinished( LootDecryptionImage, {} )
				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.clipFinished( BMLockItem, {} )
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setAlpha( 0 )
				self.clipFinished( BMPixelFX, {} )
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setAlpha( 0 )
				self.clipFinished( BMPixel02FX, {} )
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setAlpha( 0 )
				self.clipFinished( BMPixel03FX, {} )
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setAlpha( 0 )
				self.clipFinished( BMPixel04FX, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 11 )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
				self.FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 1 )
				self.RareBacking:setScale( 1.08 )
				self.clipFinished( RareBacking, {} )
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.65, 0.88, 1 )
				self.BMLineLightFX:setAlpha( 1 )
				self.BMLineLightFX:setScale( 1.08 )
				self.clipFinished( BMLineLightFX, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 53, 83 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 381, -59 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )
				local LightRareFrame2 = function ( LightRare, event )
					local LightRareFrame3 = function ( LightRare, event )
						if not event.interrupted then
							LightRare:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						LightRare:setAlpha( 1 )
						LightRare:setScale( 1.08 )
						if event.interrupted then
							self.clipFinished( LightRare, event )
						else
							LightRare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LightRareFrame3( LightRare, event )
						return 
					else
						LightRare:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						LightRare:setAlpha( 0.65 )
						LightRare:registerEventHandler( "transition_complete_keyframe", LightRareFrame3 )
					end
				end
				
				LightRare:completeAnimation()
				self.LightRare:setAlpha( 1 )
				self.LightRare:setScale( 1.08 )
				LightRareFrame2( LightRare, {} )
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
				self.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMDateTimeAndTotalCount:setScale( 1.08 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
				self.clipFinished( BMDateTimeAndTotalCount, {} )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
					FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
					FocusBar3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -120, 120 )
				self.FocusBar3:setTopBottom( 0, 0, 546.5, 612.5 )
				self.FocusBar3:setAlpha( 0 )
				FocusBar3Frame2( FocusBar3, {} )
				local RareBackingFrame2 = function ( RareBacking, event )
					if not event.interrupted then
						RareBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					RareBacking:setAlpha( 1 )
					RareBacking:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( RareBacking, event )
					else
						RareBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 1 )
				self.RareBacking:setScale( 1 )
				RareBackingFrame2( RareBacking, {} )
				local BMLineLightFXFrame2 = function ( BMLineLightFX, event )
					if not event.interrupted then
						BMLineLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLineLightFX:setRGB( 0.65, 0.88, 1 )
					BMLineLightFX:setAlpha( 1 )
					BMLineLightFX:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLineLightFX, event )
					else
						BMLineLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.65, 0.88, 1 )
				self.BMLineLightFX:setAlpha( 0 )
				self.BMLineLightFX:setScale( 1 )
				BMLineLightFXFrame2( BMLineLightFX, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( 0, 1, 0, -2 )
					lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
					lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 133, 163 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( 0, 1, -2, 0 )
					lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
					lootCategory:setRGB( 1, 1, 1 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
				self.lootCategory:setRGB( 1, 1, 1 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( 0, 1, -2, 0 )
					lootName:setTopBottom( 0.5, 0.5, 53, 83 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 47, 77 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( 0, 1, 0, -2 )
					BMLockItem:setTopBottom( 0, 1, 381, -59 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 367, -73 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				BMLockItemFrame2( BMLockItem, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					if not event.interrupted then
						GLOWcommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					GLOWcommon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GLOWcommon, event )
					else
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
				local LightRareFrame2 = function ( LightRare, event )
					if not event.interrupted then
						LightRare:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightRare:setAlpha( 1 )
					LightRare:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LightRare, event )
					else
						LightRare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightRare:completeAnimation()
				self.LightRare:setAlpha( 0 )
				self.LightRare:setScale( 1 )
				LightRareFrame2( LightRare, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
					itemHintText:setTopBottom( 1, 1, 33, 78 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
				self.itemHintText:setTopBottom( 1, 1, 44, 89 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMDateTimeAndTotalCountFrame2 = function ( BMDateTimeAndTotalCount, event )
					if not event.interrupted then
						BMDateTimeAndTotalCount:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
					BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
					BMDateTimeAndTotalCount:setAlpha( 1 )
					BMDateTimeAndTotalCount:setScale( 1.08 )
					BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
					if event.interrupted then
						self.clipFinished( BMDateTimeAndTotalCount, event )
					else
						BMDateTimeAndTotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
				self.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.BMDateTimeAndTotalCount:setScale( 1 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
				BMDateTimeAndTotalCountFrame2( BMDateTimeAndTotalCount, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( 0.5, 0.5, -120, 120 )
					FocusBar3:setTopBottom( 0, 0, 546.5, 612.5 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
				self.FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				local RareBackingFrame2 = function ( RareBacking, event )
					if not event.interrupted then
						RareBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					RareBacking:setAlpha( 1 )
					RareBacking:setScale( 1 )
					if event.interrupted then
						self.clipFinished( RareBacking, event )
					else
						RareBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 1 )
				self.RareBacking:setScale( 1.08 )
				RareBackingFrame2( RareBacking, {} )
				local BMLineLightFXFrame2 = function ( BMLineLightFX, event )
					if not event.interrupted then
						BMLineLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLineLightFX:setRGB( 0.65, 0.88, 1 )
					BMLineLightFX:setAlpha( 1 )
					BMLineLightFX:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLineLightFX, event )
					else
						BMLineLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.65, 0.88, 1 )
				self.BMLineLightFX:setAlpha( 1 )
				self.BMLineLightFX:setScale( 1.08 )
				BMLineLightFXFrame2( BMLineLightFX, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( 0, 1, 0, -2 )
					lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
					lootRaritySet:setTopBottom( 0.5, 0.5, 133, 163 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( 0, 1, -2, 0 )
					lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( 0, 1, -2, 0 )
					lootName:setTopBottom( 0.5, 0.5, 47, 77 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 53, 83 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( 0, 1, 0, -2 )
					BMLockItem:setTopBottom( 0, 1, 367, -73 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 381, -59 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				BMLockItemFrame2( BMLockItem, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					if not event.interrupted then
						GLOWcommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					GLOWcommon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GLOWcommon, event )
					else
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
				local LightRareFrame2 = function ( LightRare, event )
					if not event.interrupted then
						LightRare:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightRare:setAlpha( 0 )
					LightRare:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LightRare, event )
					else
						LightRare:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightRare:completeAnimation()
				self.LightRare:setAlpha( 1 )
				self.LightRare:setScale( 1.08 )
				LightRareFrame2( LightRare, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
					itemHintText:setTopBottom( 1, 1, 44, 89 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
				self.itemHintText:setTopBottom( 1, 1, 33, 78 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMDateTimeAndTotalCountFrame2 = function ( BMDateTimeAndTotalCount, event )
					if not event.interrupted then
						BMDateTimeAndTotalCount:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
					BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
					BMDateTimeAndTotalCount:setAlpha( 0 )
					BMDateTimeAndTotalCount:setScale( 1 )
					BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
					if event.interrupted then
						self.clipFinished( BMDateTimeAndTotalCount, event )
					else
						BMDateTimeAndTotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
				self.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMDateTimeAndTotalCount:setScale( 1.08 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
				BMDateTimeAndTotalCountFrame2( BMDateTimeAndTotalCount, {} )
			end
		},
		RevealedLegendary = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0, 0, 59, 293 )
				self.FocusBar3:setTopBottom( 0, 0, 571, 610 )
				self.clipFinished( FocusBar3, {} )
				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 1 )
				self.clipFinished( LegendaryBacking, {} )
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.86, 0.74, 1 )
				self.BMLineLightFX:setAlpha( 1 )
				self.clipFinished( BMLineLightFX, {} )
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setLeftRight( 0.5, 0.5, -224, 226 )
				self.BMTriangleLightFX:setTopBottom( 0, 0, -32.5, 552.5 )
				self.BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.clipFinished( BMTriangleLightFX, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.clipFinished( lootName, {} )
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.clipFinished( LootDecryptionImage, {} )
				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.clipFinished( BMLockItem, {} )
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setAlpha( 0 )
				self.clipFinished( BMPixelFX, {} )
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setAlpha( 0 )
				self.clipFinished( BMPixel02FX, {} )
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setAlpha( 0 )
				self.clipFinished( BMPixel03FX, {} )
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setAlpha( 0 )
				self.clipFinished( BMPixel04FX, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
				self.FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 1 )
				self.LegendaryBacking:setScale( 1.08 )
				self.clipFinished( LegendaryBacking, {} )
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.86, 0.74, 1 )
				self.BMLineLightFX:setAlpha( 1 )
				self.BMLineLightFX:setScale( 1.08 )
				self.clipFinished( BMLineLightFX, {} )
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.BMTriangleLightFX:setScale( 1.08 )
				self.clipFinished( BMTriangleLightFX, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 53, 83 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 381, -59 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )
				local LightLegendaryFrame2 = function ( LightLegendary, event )
					local LightLegendaryFrame3 = function ( LightLegendary, event )
						if not event.interrupted then
							LightLegendary:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						LightLegendary:setAlpha( 1 )
						LightLegendary:setScale( 1.08 )
						if event.interrupted then
							self.clipFinished( LightLegendary, event )
						else
							LightLegendary:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LightLegendaryFrame3( LightLegendary, event )
						return 
					else
						LightLegendary:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						LightLegendary:setAlpha( 0.65 )
						LightLegendary:registerEventHandler( "transition_complete_keyframe", LightLegendaryFrame3 )
					end
				end
				
				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 1 )
				self.LightLegendary:setScale( 1.08 )
				LightLegendaryFrame2( LightLegendary, {} )
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
				self.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMDateTimeAndTotalCount:setScale( 1.08 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
				self.clipFinished( BMDateTimeAndTotalCount, {} )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
					FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
					FocusBar3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -120, 120 )
				self.FocusBar3:setTopBottom( 0, 0, 546.5, 612.5 )
				self.FocusBar3:setAlpha( 0 )
				FocusBar3Frame2( FocusBar3, {} )
				local LegendaryBackingFrame2 = function ( LegendaryBacking, event )
					if not event.interrupted then
						LegendaryBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LegendaryBacking:setAlpha( 1 )
					LegendaryBacking:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LegendaryBacking, event )
					else
						LegendaryBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 1 )
				self.LegendaryBacking:setScale( 1 )
				LegendaryBackingFrame2( LegendaryBacking, {} )
				local BMLineLightFXFrame2 = function ( BMLineLightFX, event )
					if not event.interrupted then
						BMLineLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLineLightFX:setRGB( 0.86, 0.74, 1 )
					BMLineLightFX:setAlpha( 1 )
					BMLineLightFX:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLineLightFX, event )
					else
						BMLineLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.86, 0.74, 1 )
				self.BMLineLightFX:setAlpha( 0 )
				self.BMLineLightFX:setScale( 1 )
				BMLineLightFXFrame2( BMLineLightFX, {} )
				local BMTriangleLightFXFrame2 = function ( BMTriangleLightFX, event )
					if not event.interrupted then
						BMTriangleLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
					BMTriangleLightFX:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMTriangleLightFX, event )
					else
						BMTriangleLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
				self.BMTriangleLightFX:setScale( 1 )
				BMTriangleLightFXFrame2( BMTriangleLightFX, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( 0, 1, 0, -2 )
					lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
					lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 133, 163 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( 0, 1, -2, 0 )
					lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( 0, 1, -2, 0 )
					lootName:setTopBottom( 0.5, 0.5, 53, 83 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 47, 77 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( 0, 1, 0, -2 )
					BMLockItem:setTopBottom( 0, 1, 381, -59 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 367, -73 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				BMLockItemFrame2( BMLockItem, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					if not event.interrupted then
						GLOWcommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					GLOWcommon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GLOWcommon, event )
					else
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
				local LightLegendaryFrame2 = function ( LightLegendary, event )
					if not event.interrupted then
						LightLegendary:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightLegendary:setAlpha( 1 )
					LightLegendary:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LightLegendary, event )
					else
						LightLegendary:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 0 )
				self.LightLegendary:setScale( 1 )
				LightLegendaryFrame2( LightLegendary, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
					itemHintText:setTopBottom( 1, 1, 33, 78 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
				self.itemHintText:setTopBottom( 1, 1, 44, 89 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMDateTimeAndTotalCountFrame2 = function ( BMDateTimeAndTotalCount, event )
					if not event.interrupted then
						BMDateTimeAndTotalCount:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
					BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
					BMDateTimeAndTotalCount:setAlpha( 1 )
					BMDateTimeAndTotalCount:setScale( 1.08 )
					BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
					if event.interrupted then
						self.clipFinished( BMDateTimeAndTotalCount, event )
					else
						BMDateTimeAndTotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
				self.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.BMDateTimeAndTotalCount:setScale( 1 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
				BMDateTimeAndTotalCountFrame2( BMDateTimeAndTotalCount, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( 0.5, 0.5, -120, 120 )
					FocusBar3:setTopBottom( 0, 0, 546.5, 612.5 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
				self.FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				local LegendaryBackingFrame2 = function ( LegendaryBacking, event )
					if not event.interrupted then
						LegendaryBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LegendaryBacking:setAlpha( 1 )
					LegendaryBacking:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LegendaryBacking, event )
					else
						LegendaryBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 1 )
				self.LegendaryBacking:setScale( 1.08 )
				LegendaryBackingFrame2( LegendaryBacking, {} )
				local BMLineLightFXFrame2 = function ( BMLineLightFX, event )
					if not event.interrupted then
						BMLineLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLineLightFX:setRGB( 0.86, 0.74, 1 )
					BMLineLightFX:setAlpha( 0 )
					BMLineLightFX:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLineLightFX, event )
					else
						BMLineLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.86, 0.74, 1 )
				self.BMLineLightFX:setAlpha( 0 )
				self.BMLineLightFX:setScale( 1.08 )
				BMLineLightFXFrame2( BMLineLightFX, {} )
				local BMTriangleLightFXFrame2 = function ( BMTriangleLightFX, event )
					if not event.interrupted then
						BMTriangleLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
					BMTriangleLightFX:setAlpha( 0 )
					BMTriangleLightFX:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleLightFX, event )
					else
						BMTriangleLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
				self.BMTriangleLightFX:setAlpha( 0 )
				self.BMTriangleLightFX:setScale( 1.08 )
				BMTriangleLightFXFrame2( BMTriangleLightFX, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( 0, 1, 0, -2 )
					lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
					lootRaritySet:setTopBottom( 0.5, 0.5, 133, 163 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( 0, 1, -2, 0 )
					lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( 0, 1, -2, 0 )
					lootName:setTopBottom( 0.5, 0.5, 47, 77 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 53, 83 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( 0, 1, 0, -2 )
					BMLockItem:setTopBottom( 0, 1, 367, -73 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 381, -59 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				BMLockItemFrame2( BMLockItem, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					if not event.interrupted then
						GLOWcommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					GLOWcommon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GLOWcommon, event )
					else
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
				local LightLegendaryFrame2 = function ( LightLegendary, event )
					if not event.interrupted then
						LightLegendary:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightLegendary:setAlpha( 0 )
					LightLegendary:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LightLegendary, event )
					else
						LightLegendary:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 1 )
				self.LightLegendary:setScale( 1.08 )
				LightLegendaryFrame2( LightLegendary, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
					itemHintText:setTopBottom( 1, 1, 44, 89 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
				self.itemHintText:setTopBottom( 1, 1, 33, 78 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMDateTimeAndTotalCountFrame2 = function ( BMDateTimeAndTotalCount, event )
					if not event.interrupted then
						BMDateTimeAndTotalCount:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
					BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
					BMDateTimeAndTotalCount:setAlpha( 0 )
					BMDateTimeAndTotalCount:setScale( 1 )
					BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
					if event.interrupted then
						self.clipFinished( BMDateTimeAndTotalCount, event )
					else
						BMDateTimeAndTotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
				self.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMDateTimeAndTotalCount:setScale( 1.08 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
				BMDateTimeAndTotalCountFrame2( BMDateTimeAndTotalCount, {} )
			end
		},
		RevealedEpic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0, 0, 59, 293 )
				self.FocusBar3:setTopBottom( 0, 0, 571, 610 )
				self.clipFinished( FocusBar3, {} )
				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 1 )
				self.clipFinished( EpicBacking, {} )
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 1, 0.87, 0.61 )
				self.BMLineLightFX:setAlpha( 1 )
				self.clipFinished( BMLineLightFX, {} )
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 1, 0.67, 0 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.clipFinished( BMTriangleLightFX, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.clipFinished( lootName, {} )
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.clipFinished( LootDecryptionImage, {} )
				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.clipFinished( BMLockItem, {} )
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setAlpha( 0 )
				self.clipFinished( BMPixelFX, {} )
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setAlpha( 0 )
				self.clipFinished( BMPixel02FX, {} )
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setAlpha( 0 )
				self.clipFinished( BMPixel03FX, {} )
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setAlpha( 0 )
				self.clipFinished( BMPixel04FX, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 13 )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
				self.FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 1 )
				self.EpicBacking:setScale( 1.08 )
				self.clipFinished( EpicBacking, {} )
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 1, 0.67, 0 )
				self.BMLineLightFX:setAlpha( 1 )
				self.BMLineLightFX:setScale( 1.08 )
				self.clipFinished( BMLineLightFX, {} )
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 1, 0.67, 0 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.BMTriangleLightFX:setScale( 1.08 )
				self.clipFinished( BMTriangleLightFX, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 53, 83 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 381, -59 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )
				LightLegendary:completeAnimation()
				self.LightLegendary:setScale( 1.08 )
				self.clipFinished( LightLegendary, {} )
				local LightEpicFrame2 = function ( LightEpic, event )
					local LightEpicFrame3 = function ( LightEpic, event )
						if not event.interrupted then
							LightEpic:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						LightEpic:setAlpha( 1 )
						LightEpic:setScale( 1.08 )
						if event.interrupted then
							self.clipFinished( LightEpic, event )
						else
							LightEpic:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LightEpicFrame3( LightEpic, event )
						return 
					else
						LightEpic:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						LightEpic:setAlpha( 0.65 )
						LightEpic:registerEventHandler( "transition_complete_keyframe", LightEpicFrame3 )
					end
				end
				
				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 1 )
				self.LightEpic:setScale( 1.08 )
				LightEpicFrame2( LightEpic, {} )
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
				self.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMDateTimeAndTotalCount:setScale( 1.08 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				self.clipFinished( BMDateTimeAndTotalCount, {} )
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 14 )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
					FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
					FocusBar3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -120, 120 )
				self.FocusBar3:setTopBottom( 0, 0, 546.5, 612.5 )
				self.FocusBar3:setAlpha( 0 )
				FocusBar3Frame2( FocusBar3, {} )
				local EpicBackingFrame2 = function ( EpicBacking, event )
					if not event.interrupted then
						EpicBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					EpicBacking:setAlpha( 1 )
					EpicBacking:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( EpicBacking, event )
					else
						EpicBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 1 )
				self.EpicBacking:setScale( 1 )
				EpicBackingFrame2( EpicBacking, {} )
				local BMLineLightFXFrame2 = function ( BMLineLightFX, event )
					if not event.interrupted then
						BMLineLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLineLightFX:setRGB( 1, 0.67, 0 )
					BMLineLightFX:setAlpha( 1 )
					BMLineLightFX:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLineLightFX, event )
					else
						BMLineLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 1, 0.67, 0 )
				self.BMLineLightFX:setAlpha( 0 )
				self.BMLineLightFX:setScale( 1 )
				BMLineLightFXFrame2( BMLineLightFX, {} )
				local BMTriangleLightFXFrame2 = function ( BMTriangleLightFX, event )
					if not event.interrupted then
						BMTriangleLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTriangleLightFX:setRGB( 1, 0.67, 0 )
					BMTriangleLightFX:setAlpha( 0 )
					BMTriangleLightFX:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMTriangleLightFX, event )
					else
						BMTriangleLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 1, 0.67, 0 )
				self.BMTriangleLightFX:setAlpha( 0 )
				self.BMTriangleLightFX:setScale( 1 )
				BMTriangleLightFXFrame2( BMTriangleLightFX, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( 0, 1, 0, -2 )
					lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
					lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 133, 163 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( 0, 1, -2, 0 )
					lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( 0, 1, -2, 0 )
					lootName:setTopBottom( 0.5, 0.5, 53, 83 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 47, 77 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( 0, 1, 0, -2 )
					BMLockItem:setTopBottom( 0, 1, 381, -59 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 367, -73 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				BMLockItemFrame2( BMLockItem, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					if not event.interrupted then
						GLOWcommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					GLOWcommon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GLOWcommon, event )
					else
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
				local LightEpicFrame2 = function ( LightEpic, event )
					if not event.interrupted then
						LightEpic:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightEpic:setAlpha( 1 )
					LightEpic:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LightEpic, event )
					else
						LightEpic:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 0 )
				self.LightEpic:setScale( 1 )
				LightEpicFrame2( LightEpic, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
					itemHintText:setTopBottom( 1, 1, 33, 78 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
				self.itemHintText:setTopBottom( 1, 1, 44, 89 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMDateTimeAndTotalCountFrame2 = function ( BMDateTimeAndTotalCount, event )
					if not event.interrupted then
						BMDateTimeAndTotalCount:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
					BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
					BMDateTimeAndTotalCount:setAlpha( 1 )
					BMDateTimeAndTotalCount:setScale( 1.08 )
					BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
					if event.interrupted then
						self.clipFinished( BMDateTimeAndTotalCount, event )
					else
						BMDateTimeAndTotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
				self.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.BMDateTimeAndTotalCount:setScale( 1 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				BMDateTimeAndTotalCountFrame2( BMDateTimeAndTotalCount, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 15 )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( 0.5, 0.5, -120, 120 )
					FocusBar3:setTopBottom( 0, 0, 546.5, 612.5 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( 0.5, 0.5, -165, 165 )
				self.FocusBar3:setTopBottom( 0, 0, 525.5, 613.5 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				local EpicBackingFrame2 = function ( EpicBacking, event )
					if not event.interrupted then
						EpicBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					EpicBacking:setAlpha( 1 )
					EpicBacking:setScale( 1 )
					if event.interrupted then
						self.clipFinished( EpicBacking, event )
					else
						EpicBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 1 )
				self.EpicBacking:setScale( 1.08 )
				EpicBackingFrame2( EpicBacking, {} )
				local BMLineLightFXFrame2 = function ( BMLineLightFX, event )
					if not event.interrupted then
						BMLineLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLineLightFX:setRGB( 1, 0.67, 0 )
					BMLineLightFX:setAlpha( 1 )
					BMLineLightFX:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLineLightFX, event )
					else
						BMLineLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 1, 0.67, 0 )
				self.BMLineLightFX:setAlpha( 1 )
				self.BMLineLightFX:setScale( 1.08 )
				BMLineLightFXFrame2( BMLineLightFX, {} )
				local BMTriangleLightFXFrame2 = function ( BMTriangleLightFX, event )
					if not event.interrupted then
						BMTriangleLightFX:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTriangleLightFX:setRGB( 1, 0.67, 0 )
					BMTriangleLightFX:setAlpha( 0 )
					BMTriangleLightFX:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMTriangleLightFX, event )
					else
						BMTriangleLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 1, 0.67, 0 )
				self.BMTriangleLightFX:setAlpha( 0 )
				self.BMTriangleLightFX:setScale( 1.08 )
				BMTriangleLightFXFrame2( BMTriangleLightFX, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( 0, 1, 0, -2 )
					lootRarityText:setTopBottom( 0.5, 0.5, 200, 239 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( 0, 1, 0, -2 )
				self.lootRarityText:setTopBottom( 0.5, 0.5, 219, 258 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
					lootRaritySet:setTopBottom( 0.5, 0.5, 135, 165 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( 0, 1, -0.5, -0.5 )
				self.lootRaritySet:setTopBottom( 0.5, 0.5, 147, 177 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( 0, 1, -2, 0 )
					lootCategory:setTopBottom( 0.5, 0.5, 77, 107 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( 0, 1, -2, 0 )
				self.lootCategory:setTopBottom( 0.5, 0.5, 83, 113 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( 0, 1, -2, 0 )
					lootName:setTopBottom( 0.5, 0.5, 47, 77 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( 0, 1, -2, 0 )
				self.lootName:setTopBottom( 0.5, 0.5, 53, 83 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
					LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( 0.5, 0.5, -191, 190 )
				self.LootDecryptionImage:setTopBottom( 0, 0, -86, 438 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( 0, 1, 0, -2 )
					BMLockItem:setTopBottom( 0, 1, 367, -73 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( 0, 1, 0, -2 )
				self.BMLockItem:setTopBottom( 0, 1, 381, -59 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				BMLockItemFrame2( BMLockItem, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					if not event.interrupted then
						GLOWcommon:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					GLOWcommon:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( GLOWcommon, event )
					else
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
				local LightLegendaryFrame2 = function ( LightLegendary, event )
					if not event.interrupted then
						LightLegendary:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightLegendary:setAlpha( 0 )
					LightLegendary:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LightLegendary, event )
					else
						LightLegendary:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 0 )
				self.LightLegendary:setScale( 1.08 )
				LightLegendaryFrame2( LightLegendary, {} )
				local LightEpicFrame2 = function ( LightEpic, event )
					if not event.interrupted then
						LightEpic:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightEpic:setAlpha( 0 )
					LightEpic:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LightEpic, event )
					else
						LightEpic:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 1 )
				self.LightEpic:setScale( 1.08 )
				LightEpicFrame2( LightEpic, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
					itemHintText:setTopBottom( 1, 1, 44, 89 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( 0.5, 0.5, -123, 123 )
				self.itemHintText:setTopBottom( 1, 1, 33, 78 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMDateTimeAndTotalCountFrame2 = function ( BMDateTimeAndTotalCount, event )
					if not event.interrupted then
						BMDateTimeAndTotalCount:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
					BMDateTimeAndTotalCount:setTopBottom( 0, 0, 5, 62 )
					BMDateTimeAndTotalCount:setAlpha( 0 )
					BMDateTimeAndTotalCount:setScale( 1 )
					BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
					if event.interrupted then
						self.clipFinished( BMDateTimeAndTotalCount, event )
					else
						BMDateTimeAndTotalCount:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMDateTimeAndTotalCount:completeAnimation()
				BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMDateTimeAndTotalCount:setLeftRight( 0, 0, -3, 367 )
				self.BMDateTimeAndTotalCount:setTopBottom( 0, 0, -14.5, 49.5 )
				self.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMDateTimeAndTotalCount:setScale( 1.08 )
				self.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				BMDateTimeAndTotalCountFrame2( BMDateTimeAndTotalCount, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "RevealedCommon",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_COMMON" ) and IsSelfModelValueTrue( element, controller, "reveal" )
			end
		},
		{
			stateName = "RevealedRare",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_RARE" ) and IsSelfModelValueTrue( element, controller, "reveal" )
			end
		},
		{
			stateName = "RevealedLegendary",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_LEGENDARY" ) and IsSelfModelValueTrue( element, controller, "reveal" )
			end
		},
		{
			stateName = "RevealedEpic",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_EPIC" ) and IsSelfModelValueTrue( element, controller, "reveal" )
			end
		}
	} )
	self:linkToElementModel( self, "rarityName", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarityName"
		} )
	end )
	self:linkToElementModel( self, "reveal", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "reveal"
		} )
	end )
	BMDateTimeAndTotalCount.id = "BMDateTimeAndTotalCount"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.BMDateTimeAndTotalCount:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.fxGlitch1800:close()
		self.fxGlitch1700:close()
		self.fxGlitch1600:close()
		self.fxGlitch1500:close()
		self.fxGlitch1400:close()
		self.fxGlitch1300:close()
		self.fxGlitch1200:close()
		self.fxGlitch1100:close()
		self.BMLineLightFX:close()
		self.BMTriangleLightFX:close()
		self.LootDecryptionImage:close()
		self.LootDecryptionFakeImageCycle:close()
		self.BMLockItem:close()
		self.BMPixelFX:close()
		self.BMPixel02FX:close()
		self.BMPixel03FX:close()
		self.BMPixel04FX:close()
		self.BMFlyEmberFX:close()
		self.BMFlyEmberFX0:close()
		self.itemHintText:close()
		self.BMDateTimeAndTotalCount:close()
		self.lootRarityText:close()
		self.lootRaritySet:close()
		self.lootCategory:close()
		self.lootName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

