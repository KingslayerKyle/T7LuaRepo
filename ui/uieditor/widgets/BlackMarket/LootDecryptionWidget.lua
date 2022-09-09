-- 9564408c79f65a79315fbdc1ed011407
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Effects.fxGlitch1_8" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_7" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_6" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_5" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_4" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_3" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_2" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_1" )
require( "ui.uieditor.widgets.BlackMarket.BM_LineLightFX" )
require( "ui.uieditor.widgets.BlackMarket.BM_LineLight2FX" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionImage" )
require( "ui.uieditor.widgets.BlackMarket.LootDecryptionFakeImageCycle" )
require( "ui.uieditor.widgets.BlackMarket.BM_LockItem" )
require( "ui.uieditor.widgets.BlackMarket.BM_PixelFX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Pixel02FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Pixel03FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Pixel04FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Pixel05FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Pixel06FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Circuits02FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_Circuits01FX" )
require( "ui.uieditor.widgets.BlackMarket.BM_FlyEmberFX" )
require( "ui.uieditor.widgets.BlackMarket.BM_ItemHintText" )
require( "ui.uieditor.widgets.BlackMarket.BM_TimeAndLootBanner" )

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
	self:setLeftRight( true, false, 0, 245 )
	self:setTopBottom( true, false, 0, 340 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FocusBar3 = LUI.UIImage.new()
	FocusBar3:setLeftRight( true, false, 39.07, 195.07 )
	FocusBar3:setTopBottom( true, false, 360.92, 386.92 )
	FocusBar3:setAlpha( 0 )
	FocusBar3:setImage( RegisterImage( "uie_t7_blackmarket_focusglow3" ) )
	self:addElement( FocusBar3 )
	self.FocusBar3 = FocusBar3
	
	local fxGlitch1800 = CoD.fxGlitch1_8.new( menu, controller )
	fxGlitch1800:setLeftRight( false, false, -127, 127 )
	fxGlitch1800:setTopBottom( true, false, 149.78, 149.13 )
	fxGlitch1800:setAlpha( 0 )
	self:addElement( fxGlitch1800 )
	self.fxGlitch1800 = fxGlitch1800
	
	local fxGlitch1700 = CoD.fxGlitch1_7.new( menu, controller )
	fxGlitch1700:setLeftRight( false, false, -127, 127 )
	fxGlitch1700:setTopBottom( true, false, 167.78, 167.13 )
	fxGlitch1700:setAlpha( 0 )
	self:addElement( fxGlitch1700 )
	self.fxGlitch1700 = fxGlitch1700
	
	local fxGlitch1600 = CoD.fxGlitch1_6.new( menu, controller )
	fxGlitch1600:setLeftRight( false, false, -126.94, 126.65 )
	fxGlitch1600:setTopBottom( true, false, 122.96, 190.8 )
	fxGlitch1600:setAlpha( 0 )
	self:addElement( fxGlitch1600 )
	self.fxGlitch1600 = fxGlitch1600
	
	local fxGlitch1500 = CoD.fxGlitch1_5.new( menu, controller )
	fxGlitch1500:setLeftRight( false, false, -65.78, 45.78 )
	fxGlitch1500:setTopBottom( true, false, 114.54, 199.88 )
	fxGlitch1500:setAlpha( 0 )
	self:addElement( fxGlitch1500 )
	self.fxGlitch1500 = fxGlitch1500
	
	local fxGlitch1400 = CoD.fxGlitch1_4.new( menu, controller )
	fxGlitch1400:setLeftRight( false, false, -127.78, 126 )
	fxGlitch1400:setTopBottom( true, false, 122.96, 207.67 )
	fxGlitch1400:setAlpha( 0 )
	self:addElement( fxGlitch1400 )
	self.fxGlitch1400 = fxGlitch1400
	
	local fxGlitch1300 = CoD.fxGlitch1_3.new( menu, controller )
	fxGlitch1300:setLeftRight( false, false, -127, 126 )
	fxGlitch1300:setTopBottom( true, false, 91.25, 253.57 )
	fxGlitch1300:setAlpha( 0 )
	self:addElement( fxGlitch1300 )
	self.fxGlitch1300 = fxGlitch1300
	
	local fxGlitch1200 = CoD.fxGlitch1_2.new( menu, controller )
	fxGlitch1200:setLeftRight( false, false, -128.78, 126 )
	fxGlitch1200:setTopBottom( true, false, 106.9, 237.93 )
	fxGlitch1200:setAlpha( 0 )
	self:addElement( fxGlitch1200 )
	self.fxGlitch1200 = fxGlitch1200
	
	local fxGlitch1100 = CoD.fxGlitch1_1.new( menu, controller )
	fxGlitch1100:setLeftRight( false, false, -126.94, 126 )
	fxGlitch1100:setTopBottom( true, false, 114.54, 216.09 )
	fxGlitch1100:setAlpha( 0 )
	self:addElement( fxGlitch1100 )
	self.fxGlitch1100 = fxGlitch1100
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( false, false, -157.5, 155.5 )
	Glow:setTopBottom( false, false, -199.25, 199.25 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_blackmarket_backing_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local LimitedBackglow = LUI.UIImage.new()
	LimitedBackglow:setLeftRight( true, false, -18.37, 263.08 )
	LimitedBackglow:setTopBottom( true, false, 30.25, 368 )
	LimitedBackglow:setAlpha( 0 )
	LimitedBackglow:setScale( 1.55 )
	LimitedBackglow:setImage( RegisterImage( "uie_t7_blackmarket_limited_backglow" ) )
	self:addElement( LimitedBackglow )
	self.LimitedBackglow = LimitedBackglow
	
	local LimitedBacking = LUI.UIImage.new()
	LimitedBacking:setLeftRight( true, true, -30, 29 )
	LimitedBacking:setTopBottom( true, true, -22, 27 )
	LimitedBacking:setAlpha( 0 )
	LimitedBacking:setImage( RegisterImage( "uie_t7_blackmarket_limited_backing" ) )
	self:addElement( LimitedBacking )
	self.LimitedBacking = LimitedBacking
	
	local LimitedBackingGlint = LUI.UIImage.new()
	LimitedBackingGlint:setLeftRight( true, true, -30, 29 )
	LimitedBackingGlint:setTopBottom( true, true, -22, 27 )
	LimitedBackingGlint:setAlpha( 0 )
	LimitedBackingGlint:setImage( RegisterImage( "uie_t7_blackmarket_limited_backing_glint" ) )
	LimitedBackingGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
	LimitedBackingGlint:setShaderVector( 0, 0, 0, 0, 0 )
	self:addElement( LimitedBackingGlint )
	self.LimitedBackingGlint = LimitedBackingGlint
	
	local EpicBacking = LUI.UIImage.new()
	EpicBacking:setLeftRight( true, true, -30, 29 )
	EpicBacking:setTopBottom( true, true, -22, 27 )
	EpicBacking:setAlpha( 0 )
	EpicBacking:setImage( RegisterImage( "uie_t7_blackmarket_epic_backing" ) )
	self:addElement( EpicBacking )
	self.EpicBacking = EpicBacking
	
	local LegendaryBacking = LUI.UIImage.new()
	LegendaryBacking:setLeftRight( false, false, -152.5, 151.5 )
	LegendaryBacking:setTopBottom( true, false, -22, 367 )
	LegendaryBacking:setAlpha( 0 )
	LegendaryBacking:setImage( RegisterImage( "uie_t7_blackmarket_legendary_backing" ) )
	self:addElement( LegendaryBacking )
	self.LegendaryBacking = LegendaryBacking
	
	local RareBacking = LUI.UIImage.new()
	RareBacking:setLeftRight( true, true, -30, 29 )
	RareBacking:setTopBottom( true, true, -22, 27 )
	RareBacking:setAlpha( 0 )
	RareBacking:setImage( RegisterImage( "uie_t7_blackmarket_rare_backing" ) )
	self:addElement( RareBacking )
	self.RareBacking = RareBacking
	
	local CommonBacking = LUI.UIImage.new()
	CommonBacking:setLeftRight( true, true, -30, 29 )
	CommonBacking:setTopBottom( true, true, -22, 27 )
	CommonBacking:setAlpha( 0 )
	CommonBacking:setImage( RegisterImage( "uie_t7_blackmarket_common_backing" ) )
	self:addElement( CommonBacking )
	self.CommonBacking = CommonBacking
	
	local BMLineLightFX = CoD.BM_LineLightFX.new( menu, controller )
	BMLineLightFX:setLeftRight( false, false, -149.5, 150.5 )
	BMLineLightFX:setTopBottom( true, false, -22, 368 )
	BMLineLightFX:setAlpha( 0 )
	BMLineLightFX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMLineLightFX )
	self.BMLineLightFX = BMLineLightFX
	
	local BMTriangleLightFX = CoD.BM_LineLight2FX.new( menu, controller )
	BMTriangleLightFX:setLeftRight( false, false, -150.5, 150.5 )
	BMTriangleLightFX:setTopBottom( true, false, -22, 369 )
	BMTriangleLightFX:setAlpha( 0 )
	BMTriangleLightFX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMTriangleLightFX )
	self.BMTriangleLightFX = BMTriangleLightFX
	
	local lootRarityTextWhite = LUI.UIText.new()
	lootRarityTextWhite:setLeftRight( true, true, 0, -1 )
	lootRarityTextWhite:setTopBottom( false, false, 134, 160 )
	lootRarityTextWhite:setAlpha( 0 )
	lootRarityTextWhite:setTTF( "fonts/escom.ttf" )
	lootRarityTextWhite:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	lootRarityTextWhite:setShaderVector( 0, 0.09, 0, 0, 0 )
	lootRarityTextWhite:setShaderVector( 1, 0.06, 0, 0, 0 )
	lootRarityTextWhite:setShaderVector( 2, 1, 0, 0, 0 )
	lootRarityTextWhite:setLetterSpacing( 1 )
	lootRarityTextWhite:setLineSpacing( 1 )
	lootRarityTextWhite:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootRarityTextWhite:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootRarityTextWhite:linkToElementModel( self, "rarityName", true, function ( model )
		local rarityName = Engine.GetModelValue( model )
		if rarityName then
			lootRarityTextWhite:setText( LocalizeToUpperString( rarityName ) )
		end
	end )
	self:addElement( lootRarityTextWhite )
	self.lootRarityTextWhite = lootRarityTextWhite
	
	local lootRarityText = LUI.UIText.new()
	lootRarityText:setLeftRight( true, true, 0, -1 )
	lootRarityText:setTopBottom( false, false, 133, 159 )
	lootRarityText:setAlpha( 0 )
	lootRarityText:setTTF( "fonts/escom.ttf" )
	lootRarityText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	lootRarityText:setShaderVector( 0, 0.09, 0, 0, 0 )
	lootRarityText:setShaderVector( 1, 0.06, 0, 0, 0 )
	lootRarityText:setShaderVector( 2, 1, 0, 0, 0 )
	lootRarityText:setLetterSpacing( 1 )
	lootRarityText:setLineSpacing( 1 )
	lootRarityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootRarityText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootRarityText:linkToElementModel( self, "rarityName", true, function ( model )
		local rarityName = Engine.GetModelValue( model )
		if rarityName then
			lootRarityText:setText( LocalizeToUpperString( rarityName ) )
		end
	end )
	self:addElement( lootRarityText )
	self.lootRarityText = lootRarityText
	
	local lootRaritySet = LUI.UIText.new()
	lootRaritySet:setLeftRight( true, true, 0, 0 )
	lootRaritySet:setTopBottom( false, false, 89.06, 109.06 )
	lootRaritySet:setAlpha( 0 )
	lootRaritySet:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	lootRaritySet:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootRaritySet:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootRaritySet:linkToElementModel( self, "raritySet", true, function ( model )
		local raritySet = Engine.GetModelValue( model )
		if raritySet then
			lootRaritySet:setText( Engine.Localize( raritySet ) )
		end
	end )
	self:addElement( lootRaritySet )
	self.lootRaritySet = lootRaritySet
	
	local lootCategory = LUI.UIText.new()
	lootCategory:setLeftRight( true, true, -1, 0 )
	lootCategory:setTopBottom( false, false, 51.06, 71.06 )
	lootCategory:setAlpha( 0 )
	lootCategory:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	lootCategory:setLetterSpacing( 0.2 )
	lootCategory:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootCategory:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootCategory:linkToElementModel( self, "categoryName", true, function ( model )
		local categoryName = Engine.GetModelValue( model )
		if categoryName then
			lootCategory:setText( LocalizeToUpperString( categoryName ) )
		end
	end )
	self:addElement( lootCategory )
	self.lootCategory = lootCategory
	
	local lootName = LUI.UIText.new()
	lootName:setLeftRight( true, true, -1, 0 )
	lootName:setTopBottom( false, false, 31.06, 51.06 )
	lootName:setAlpha( 0 )
	lootName:setTTF( "fonts/escom.ttf" )
	lootName:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	lootName:setShaderVector( 0, 0.09, 0, 0, 0 )
	lootName:setShaderVector( 1, 0.06, 0, 0, 0 )
	lootName:setShaderVector( 2, 1, 0, 0, 0 )
	lootName:setLetterSpacing( 1 )
	lootName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	lootName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lootName:linkToElementModel( self, "rarityName", true, function ( model )
		local rarityName = Engine.GetModelValue( model )
		if rarityName then
			lootName:setRGB( RarityToColor( rarityName ) )
		end
	end )
	lootName:linkToElementModel( self, "displayText", true, function ( model )
		local displayText = Engine.GetModelValue( model )
		if displayText then
			lootName:setText( LocalizeToUpperString( displayText ) )
		end
	end )
	self:addElement( lootName )
	self.lootName = lootName
	
	local LootDecryptionImage = CoD.LootDecryptionImage.new( menu, controller )
	LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
	LootDecryptionImage:setTopBottom( true, false, -57, 292 )
	LootDecryptionImage:setAlpha( 0 )
	LootDecryptionImage:linkToElementModel( self, nil, false, function ( model )
		LootDecryptionImage:setModel( model, controller )
	end )
	self:addElement( LootDecryptionImage )
	self.LootDecryptionImage = LootDecryptionImage
	
	local LootDecryptionFakeImageCycle = CoD.LootDecryptionFakeImageCycle.new( menu, controller )
	LootDecryptionFakeImageCycle:setLeftRight( true, true, -9.5, 9.5 )
	LootDecryptionFakeImageCycle:setTopBottom( true, true, 25, -28 )
	LootDecryptionFakeImageCycle:setAlpha( 0 )
	LootDecryptionFakeImageCycle:linkToElementModel( self, nil, false, function ( model )
		LootDecryptionFakeImageCycle:setModel( model, controller )
	end )
	self:addElement( LootDecryptionFakeImageCycle )
	self.LootDecryptionFakeImageCycle = LootDecryptionFakeImageCycle
	
	local BMLockItem = CoD.BM_LockItem.new( menu, controller )
	BMLockItem:setLeftRight( true, true, 0, -0.94 )
	BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
	BMLockItem:setAlpha( 0 )
	BMLockItem:linkToElementModel( self, nil, false, function ( model )
		BMLockItem:setModel( model, controller )
	end )
	BMLockItem:linkToElementModel( self, "lockAvailabilityText", true, function ( model )
		local lockAvailabilityText = Engine.GetModelValue( model )
		if lockAvailabilityText then
			BMLockItem.desc:setText( Engine.Localize( lockAvailabilityText ) )
		end
	end )
	BMLockItem:linkToElementModel( self, "lockItemText", true, function ( model )
		local lockItemText = Engine.GetModelValue( model )
		if lockItemText then
			BMLockItem.title:setText( Engine.Localize( lockItemText ) )
		end
	end )
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
	self:addElement( BMLockItem )
	self.BMLockItem = BMLockItem
	
	local GLOWrare = LUI.UIImage.new()
	GLOWrare:setLeftRight( true, true, -69, 67 )
	GLOWrare:setTopBottom( true, true, -62, 69 )
	GLOWrare:setAlpha( 0 )
	GLOWrare:setImage( RegisterImage( "uie_t7_blackmarket_backing_glow100" ) )
	self:addElement( GLOWrare )
	self.GLOWrare = GLOWrare
	
	local GLOWLengendary = LUI.UIImage.new()
	GLOWLengendary:setLeftRight( true, true, -71, 67 )
	GLOWLengendary:setTopBottom( true, true, -64, 72 )
	GLOWLengendary:setAlpha( 0 )
	GLOWLengendary:setImage( RegisterImage( "uie_t7_blackmarket_backing_glowlegendary" ) )
	self:addElement( GLOWLengendary )
	self.GLOWLengendary = GLOWLengendary
	
	local GLOWEpic = LUI.UIImage.new()
	GLOWEpic:setLeftRight( true, true, -69, 69 )
	GLOWEpic:setTopBottom( true, true, -65, 69 )
	GLOWEpic:setAlpha( 0 )
	GLOWEpic:setImage( RegisterImage( "uie_t7_blackmarket_backing_epicglow" ) )
	self:addElement( GLOWEpic )
	self.GLOWEpic = GLOWEpic
	
	local GLOWcommon = LUI.UIImage.new()
	GLOWcommon:setLeftRight( true, true, -63, 64 )
	GLOWcommon:setTopBottom( true, true, -59, 63 )
	GLOWcommon:setAlpha( 0 )
	GLOWcommon:setImage( RegisterImage( "uie_t7_blackmarket_backing_glow_common" ) )
	self:addElement( GLOWcommon )
	self.GLOWcommon = GLOWcommon
	
	local blurbox = LUI.UIImage.new()
	blurbox:setLeftRight( true, true, -65, 65 )
	blurbox:setTopBottom( true, true, -64, 66 )
	blurbox:setRGB( 1, 0.67, 0 )
	blurbox:setAlpha( 0 )
	blurbox:setScale( 1.2 )
	blurbox:setImage( RegisterImage( "uie_t7_blackmarket_backing_boxblur" ) )
	self:addElement( blurbox )
	self.blurbox = blurbox
	
	local BMPixelFX = CoD.BM_PixelFX.new( menu, controller )
	BMPixelFX:setLeftRight( true, true, -63, 64 )
	BMPixelFX:setTopBottom( true, true, -64, 62 )
	BMPixelFX:setRGB( 1, 0.67, 0 )
	BMPixelFX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixelFX )
	self.BMPixelFX = BMPixelFX
	
	local BMPixel02FX = CoD.BM_Pixel02FX.new( menu, controller )
	BMPixel02FX:setLeftRight( true, true, -63, 64 )
	BMPixel02FX:setTopBottom( true, true, -64, 62 )
	BMPixel02FX:setRGB( 1, 0.67, 0 )
	BMPixel02FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixel02FX )
	self.BMPixel02FX = BMPixel02FX
	
	local BMPixel03FX = CoD.BM_Pixel03FX.new( menu, controller )
	BMPixel03FX:setLeftRight( true, true, -63, 64 )
	BMPixel03FX:setTopBottom( true, true, -64, 62 )
	BMPixel03FX:setRGB( 1, 0.67, 0 )
	BMPixel03FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixel03FX )
	self.BMPixel03FX = BMPixel03FX
	
	local BMPixel04FX = CoD.BM_Pixel04FX.new( menu, controller )
	BMPixel04FX:setLeftRight( true, true, -63, 64 )
	BMPixel04FX:setTopBottom( true, true, -64, 62 )
	BMPixel04FX:setRGB( 1, 0.67, 0 )
	BMPixel04FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixel04FX )
	self.BMPixel04FX = BMPixel04FX
	
	local BMPixel05FX = CoD.BM_Pixel05FX.new( menu, controller )
	BMPixel05FX:setLeftRight( true, true, -68, 59 )
	BMPixel05FX:setTopBottom( true, true, -64, 62 )
	BMPixel05FX:setAlpha( 0 )
	BMPixel05FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixel05FX )
	self.BMPixel05FX = BMPixel05FX
	
	local BMPixel06FX = CoD.BM_Pixel06FX.new( menu, controller )
	BMPixel06FX:setLeftRight( true, true, -68, 59 )
	BMPixel06FX:setTopBottom( true, true, -64, 62 )
	BMPixel06FX:setAlpha( 0 )
	BMPixel06FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMPixel06FX )
	self.BMPixel06FX = BMPixel06FX
	
	local LightCommon = LUI.UIImage.new()
	LightCommon:setLeftRight( true, true, -30, 29 )
	LightCommon:setTopBottom( true, true, -22, 27 )
	LightCommon:setAlpha( 0 )
	LightCommon:setImage( RegisterImage( "uie_t7_blackmarket_common_backing_underglow" ) )
	self:addElement( LightCommon )
	self.LightCommon = LightCommon
	
	local LightRare = LUI.UIImage.new()
	LightRare:setLeftRight( true, true, -30, 29 )
	LightRare:setTopBottom( true, true, -22, 27 )
	LightRare:setAlpha( 0 )
	LightRare:setImage( RegisterImage( "uie_t7_blackmarket_rare_backing_underglow" ) )
	self:addElement( LightRare )
	self.LightRare = LightRare
	
	local LightLegendary = LUI.UIImage.new()
	LightLegendary:setLeftRight( true, true, -30, 29 )
	LightLegendary:setTopBottom( true, true, -22, 27 )
	LightLegendary:setAlpha( 0 )
	LightLegendary:setImage( RegisterImage( "uie_t7_blackmarket_legendary_backing_underglow" ) )
	self:addElement( LightLegendary )
	self.LightLegendary = LightLegendary
	
	local LightEpic = LUI.UIImage.new()
	LightEpic:setLeftRight( true, true, -30, 29 )
	LightEpic:setTopBottom( true, true, -22, 27 )
	LightEpic:setAlpha( 0 )
	LightEpic:setImage( RegisterImage( "uie_t7_blackmarket_epic_backing_underglow" ) )
	self:addElement( LightEpic )
	self.LightEpic = LightEpic
	
	local LightLimited = LUI.UIImage.new()
	LightLimited:setLeftRight( true, true, -30, 29 )
	LightLimited:setTopBottom( true, true, -22, 27 )
	LightLimited:setAlpha( 0 )
	LightLimited:setImage( RegisterImage( "uie_t7_blackmarket_limited_selected" ) )
	self:addElement( LightLimited )
	self.LightLimited = LightLimited
	
	local EpicEmber5 = LUI.UIImage.new()
	EpicEmber5:setLeftRight( true, false, -21.94, 267.94 )
	EpicEmber5:setTopBottom( true, false, -13.4, 358.4 )
	EpicEmber5:setAlpha( 0 )
	EpicEmber5:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember" ) )
	self:addElement( EpicEmber5 )
	self.EpicEmber5 = EpicEmber5
	
	local EpicEmber4 = LUI.UIImage.new()
	EpicEmber4:setLeftRight( true, false, -21.94, 267.94 )
	EpicEmber4:setTopBottom( true, false, -13.4, 358.4 )
	EpicEmber4:setAlpha( 0 )
	EpicEmber4:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember4" ) )
	self:addElement( EpicEmber4 )
	self.EpicEmber4 = EpicEmber4
	
	local EpicEmber3 = LUI.UIImage.new()
	EpicEmber3:setLeftRight( true, false, -21.94, 267.94 )
	EpicEmber3:setTopBottom( true, false, -13.4, 358.4 )
	EpicEmber3:setAlpha( 0 )
	EpicEmber3:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember3" ) )
	self:addElement( EpicEmber3 )
	self.EpicEmber3 = EpicEmber3
	
	local EpicEmber2 = LUI.UIImage.new()
	EpicEmber2:setLeftRight( true, false, -21.94, 267.94 )
	EpicEmber2:setTopBottom( true, false, -13.4, 358.4 )
	EpicEmber2:setAlpha( 0 )
	EpicEmber2:setScale( 2 )
	EpicEmber2:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember-02" ) )
	self:addElement( EpicEmber2 )
	self.EpicEmber2 = EpicEmber2
	
	local EpicEmber1 = LUI.UIImage.new()
	EpicEmber1:setLeftRight( true, false, -21.94, 267.94 )
	EpicEmber1:setTopBottom( true, false, -13.4, 358.4 )
	EpicEmber1:setAlpha( 0 )
	EpicEmber1:setScale( 2 )
	EpicEmber1:setImage( RegisterImage( "uie_t7_blackmarket_epic_ember1" ) )
	self:addElement( EpicEmber1 )
	self.EpicEmber1 = EpicEmber1
	
	local LimitedBackingFocus = LUI.UIImage.new()
	LimitedBackingFocus:setLeftRight( true, true, -30, 29 )
	LimitedBackingFocus:setTopBottom( true, true, -22, 27 )
	LimitedBackingFocus:setAlpha( 0 )
	LimitedBackingFocus:setImage( RegisterImage( "uie_t7_blackmarket_limited_backing_underglow" ) )
	self:addElement( LimitedBackingFocus )
	self.LimitedBackingFocus = LimitedBackingFocus
	
	local LimitedWave1 = LUI.UIImage.new()
	LimitedWave1:setLeftRight( true, false, -57, 303 )
	LimitedWave1:setTopBottom( true, false, -42, 390 )
	LimitedWave1:setAlpha( 0 )
	LimitedWave1:setImage( RegisterImage( "uie_t7_blackmarket_limited_wave1" ) )
	self:addElement( LimitedWave1 )
	self.LimitedWave1 = LimitedWave1
	
	local LimitedWave2 = LUI.UIImage.new()
	LimitedWave2:setLeftRight( true, false, -57, 303 )
	LimitedWave2:setTopBottom( true, false, -42, 390 )
	LimitedWave2:setAlpha( 0 )
	LimitedWave2:setImage( RegisterImage( "uie_t7_blackmarket_limited_wave2" ) )
	self:addElement( LimitedWave2 )
	self.LimitedWave2 = LimitedWave2
	
	local LimitedWave3 = LUI.UIImage.new()
	LimitedWave3:setLeftRight( true, false, -57, 303 )
	LimitedWave3:setTopBottom( true, false, -42, 390 )
	LimitedWave3:setAlpha( 0 )
	LimitedWave3:setImage( RegisterImage( "uie_t7_blackmarket_limited_wave3" ) )
	self:addElement( LimitedWave3 )
	self.LimitedWave3 = LimitedWave3
	
	local BMCircuits02FX = CoD.BM_Circuits02FX.new( menu, controller )
	BMCircuits02FX:setLeftRight( true, true, -68, 59 )
	BMCircuits02FX:setTopBottom( true, true, -64, 62 )
	BMCircuits02FX:setAlpha( 0 )
	BMCircuits02FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMCircuits02FX )
	self.BMCircuits02FX = BMCircuits02FX
	
	local BMCircuits01FX = CoD.BM_Circuits01FX.new( menu, controller )
	BMCircuits01FX:setLeftRight( true, true, -68, 59 )
	BMCircuits01FX:setTopBottom( true, true, -64, 62 )
	BMCircuits01FX:setAlpha( 0 )
	BMCircuits01FX:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BMCircuits01FX )
	self.BMCircuits01FX = BMCircuits01FX
	
	local epicSkull = LUI.UIImage.new()
	epicSkull:setLeftRight( true, false, -25.5, 282 )
	epicSkull:setTopBottom( true, false, -44, 366.05 )
	epicSkull:setAlpha( 0 )
	epicSkull:setImage( RegisterImage( "uie_t7_blackmarket_epic_skull" ) )
	epicSkull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated" ) )
	epicSkull:setShaderVector( 0, 27, 1, 0, 0 )
	epicSkull:setShaderVector( 1, 35, 0, 0, 0 )
	self:addElement( epicSkull )
	self.epicSkull = epicSkull
	
	local LegendaryEmber1 = LUI.UIImage.new()
	LegendaryEmber1:setLeftRight( true, false, -21.94, 267.94 )
	LegendaryEmber1:setTopBottom( true, false, -13.4, 358.4 )
	LegendaryEmber1:setAlpha( 0 )
	LegendaryEmber1:setScale( 2 )
	LegendaryEmber1:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember1" ) )
	self:addElement( LegendaryEmber1 )
	self.LegendaryEmber1 = LegendaryEmber1
	
	local LegendaryEmber2 = LUI.UIImage.new()
	LegendaryEmber2:setLeftRight( true, false, -21.94, 267.94 )
	LegendaryEmber2:setTopBottom( true, false, -13.4, 358.4 )
	LegendaryEmber2:setAlpha( 0 )
	LegendaryEmber2:setScale( 2 )
	LegendaryEmber2:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember2" ) )
	self:addElement( LegendaryEmber2 )
	self.LegendaryEmber2 = LegendaryEmber2
	
	local LegendaryEmber3 = LUI.UIImage.new()
	LegendaryEmber3:setLeftRight( true, false, -21.94, 267.94 )
	LegendaryEmber3:setTopBottom( true, false, -13.4, 358.4 )
	LegendaryEmber3:setAlpha( 0 )
	LegendaryEmber3:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember3" ) )
	self:addElement( LegendaryEmber3 )
	self.LegendaryEmber3 = LegendaryEmber3
	
	local LegendaryEmber4 = LUI.UIImage.new()
	LegendaryEmber4:setLeftRight( true, false, -21.94, 267.94 )
	LegendaryEmber4:setTopBottom( true, false, -13.4, 358.4 )
	LegendaryEmber4:setAlpha( 0 )
	LegendaryEmber4:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember4" ) )
	self:addElement( LegendaryEmber4 )
	self.LegendaryEmber4 = LegendaryEmber4
	
	local LegendaryEmber5 = LUI.UIImage.new()
	LegendaryEmber5:setLeftRight( true, false, -21.94, 267.94 )
	LegendaryEmber5:setTopBottom( true, false, -13.4, 358.4 )
	LegendaryEmber5:setAlpha( 0 )
	LegendaryEmber5:setImage( RegisterImage( "uie_t7_blackmarket_legendary_ember5" ) )
	self:addElement( LegendaryEmber5 )
	self.LegendaryEmber5 = LegendaryEmber5
	
	local BMFlyEmberFX = CoD.BM_FlyEmberFX.new( menu, controller )
	BMFlyEmberFX:setLeftRight( true, false, 189.5, 249.5 )
	BMFlyEmberFX:setTopBottom( true, false, -6, 54 )
	BMFlyEmberFX:setAlpha( 0 )
	self:addElement( BMFlyEmberFX )
	self.BMFlyEmberFX = BMFlyEmberFX
	
	local BMFlyEmberFX0 = CoD.BM_FlyEmberFX.new( menu, controller )
	BMFlyEmberFX0:setLeftRight( true, false, -9.5, 50.5 )
	BMFlyEmberFX0:setTopBottom( true, false, 292, 352 )
	BMFlyEmberFX0:setAlpha( 0 )
	BMFlyEmberFX0:setZRot( 180 )
	self:addElement( BMFlyEmberFX0 )
	self.BMFlyEmberFX0 = BMFlyEmberFX0
	
	local itemHintText = CoD.BM_ItemHintText.new( menu, controller )
	itemHintText:setLeftRight( false, false, -82, 82 )
	itemHintText:setTopBottom( false, true, 22, 52 )
	itemHintText:setAlpha( 0 )
	itemHintText.textCenterAlign:setText( Engine.Localize( "MPUI_EQUIP_PROMPT" ) )
	itemHintText.textCenterAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	itemHintText:linkToElementModel( self, nil, false, function ( model )
		itemHintText:setModel( model, controller )
	end )
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
	self:addElement( itemHintText )
	self.itemHintText = itemHintText
	
	local BMTimeAndLootBanner = CoD.BM_TimeAndLootBanner.new( menu, controller )
	BMTimeAndLootBanner:setLeftRight( true, false, 0, 245 )
	BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
	BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
	BMTimeAndLootBanner:linkToElementModel( self, nil, false, function ( model )
		BMTimeAndLootBanner:setModel( model, controller )
	end )
	BMTimeAndLootBanner:linkToElementModel( self, "dateTime", true, function ( model )
		local dateTime = Engine.GetModelValue( model )
		if dateTime then
			BMTimeAndLootBanner.BMDateTimeAndTotalCount.backing:setAlpha( HideIfEmptyString( dateTime ) )
		end
	end )
	BMTimeAndLootBanner:linkToElementModel( self, "dateTime", true, function ( model )
		local dateTime = Engine.GetModelValue( model )
		if dateTime then
			BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setText( Engine.Localize( dateTime ) )
		end
	end )
	BMTimeAndLootBanner:linkToElementModel( self, "duplicateText", true, function ( model )
		local duplicateText = Engine.GetModelValue( model )
		if duplicateText then
			BMTimeAndLootBanner.BMDateTimeAndTotalCount.TotalCount:setText( Engine.Localize( duplicateText ) )
		end
	end )
	BMTimeAndLootBanner:linkToElementModel( self, "drop", true, function ( model )
		local drop = Engine.GetModelValue( model )
		if drop then
			BMTimeAndLootBanner.LootBannerText:setText( Engine.Localize( GetCurrentContrabandString( controller, drop ) ) )
		end
	end )
	BMTimeAndLootBanner:mergeStateConditions( {
		{
			stateName = "LimitedItemBanner",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "LootBanner",
			condition = function ( menu, element, event )
				return IsLootItemFromCurrentContraband( self, controller )
			end
		}
	} )
	self:addElement( BMTimeAndLootBanner )
	self.BMTimeAndLootBanner = BMTimeAndLootBanner
	
	local Circuits = LUI.UIImage.new()
	Circuits:setLeftRight( true, false, -67.75, 312.25 )
	Circuits:setTopBottom( true, false, -64, 412 )
	Circuits:setAlpha( 0 )
	Circuits:setImage( RegisterImage( "uie_t7_blackmarket_limited_circuits" ) )
	self:addElement( Circuits )
	self.Circuits = Circuits
	
	local CircuitsBright = LUI.UIImage.new()
	CircuitsBright:setLeftRight( true, false, -67.75, 312.25 )
	CircuitsBright:setTopBottom( true, false, -64, 412 )
	CircuitsBright:setAlpha( 0 )
	CircuitsBright:setImage( RegisterImage( "uie_t7_blackmarket_limited_circuits_bright" ) )
	self:addElement( CircuitsBright )
	self.CircuitsBright = CircuitsBright
	
	local CircuitsBrightBlur1 = LUI.UIImage.new()
	CircuitsBrightBlur1:setLeftRight( true, false, -91.16, 338.74 )
	CircuitsBrightBlur1:setTopBottom( true, false, -96.93, 442.55 )
	CircuitsBrightBlur1:setAlpha( 0 )
	CircuitsBrightBlur1:setImage( RegisterImage( "uie_t7_blackmarket_limited_circuits_brightblur1" ) )
	self:addElement( CircuitsBrightBlur1 )
	self.CircuitsBrightBlur1 = CircuitsBrightBlur1
	
	local CircuitsBrightBlur2 = LUI.UIImage.new()
	CircuitsBrightBlur2:setLeftRight( true, false, -91.16, 338.74 )
	CircuitsBrightBlur2:setTopBottom( true, false, -96.93, 442.55 )
	CircuitsBrightBlur2:setAlpha( 0 )
	CircuitsBrightBlur2:setImage( RegisterImage( "uie_t7_blackmarket_limited_circuits_brightblur2" ) )
	self:addElement( CircuitsBrightBlur2 )
	self.CircuitsBrightBlur2 = CircuitsBrightBlur2
	
	local LimitedBackglowFlash = LUI.UIImage.new()
	LimitedBackglowFlash:setLeftRight( true, false, -18.37, 263.08 )
	LimitedBackglowFlash:setTopBottom( true, false, 30.25, 368 )
	LimitedBackglowFlash:setAlpha( 0 )
	LimitedBackglowFlash:setScale( 1.55 )
	LimitedBackglowFlash:setImage( RegisterImage( "uie_t7_blackmarket_limited_backglow" ) )
	self:addElement( LimitedBackglowFlash )
	self.LimitedBackglowFlash = LimitedBackglowFlash
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 25 )

				LimitedBacking:completeAnimation()
				self.LimitedBacking:setAlpha( 0 )
				self.clipFinished( LimitedBacking, {} )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.clipFinished( CommonBacking, {} )

				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setAlpha( 0 )
				self.clipFinished( BMLineLightFX, {} )

				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setAlpha( 0 )
				self.clipFinished( BMTriangleLightFX, {} )

				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setAlpha( 0 )
				self.clipFinished( lootRarityTextWhite, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 0 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 0 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )

				blurbox:completeAnimation()
				self.blurbox:setAlpha( 0 )
				self.clipFinished( blurbox, {} )

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

				BMPixel05FX:completeAnimation()
				self.BMPixel05FX:setAlpha( 0 )
				self.clipFinished( BMPixel05FX, {} )

				BMPixel06FX:completeAnimation()
				self.BMPixel06FX:setAlpha( 0 )
				self.clipFinished( BMPixel06FX, {} )

				LightCommon:completeAnimation()
				self.LightCommon:setAlpha( 0 )
				self.clipFinished( LightCommon, {} )

				LightRare:completeAnimation()
				self.LightRare:setAlpha( 0 )
				self.clipFinished( LightRare, {} )

				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 0 )
				self.clipFinished( LightLegendary, {} )

				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 0 )
				self.clipFinished( LightEpic, {} )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )

				BMTimeAndLootBanner:completeAnimation()
				self.BMTimeAndLootBanner:setAlpha( 0 )
				self.clipFinished( BMTimeAndLootBanner, {} )
			end,
			StartFuzz = function ()
				self:setupElementClipCounter( 21 )

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
				local f28_local1 = function ( f62_arg0, f62_arg1 )
					local f62_local0 = function ( f63_arg0, f63_arg1 )
						local f63_local0 = function ( f64_arg0, f64_arg1 )
							local f64_local0 = function ( f65_arg0, f65_arg1 )
								local f65_local0 = function ( f66_arg0, f66_arg1 )
									local f66_local0 = function ( f67_arg0, f67_arg1 )
										local f67_local0 = function ( f68_arg0, f68_arg1 )
											local f68_local0 = function ( f69_arg0, f69_arg1 )
												local f69_local0 = function ( f70_arg0, f70_arg1 )
													local f70_local0 = function ( f71_arg0, f71_arg1 )
														local f71_local0 = function ( f72_arg0, f72_arg1 )
															local f72_local0 = function ( f73_arg0, f73_arg1 )
																local f73_local0 = function ( f74_arg0, f74_arg1 )
																	local f74_local0 = function ( f75_arg0, f75_arg1 )
																		local f75_local0 = function ( f76_arg0, f76_arg1 )
																			if not f76_arg1.interrupted then
																				f76_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			end
																			f76_arg0:setAlpha( 0 )
																			if f76_arg1.interrupted then
																				self.clipFinished( f76_arg0, f76_arg1 )
																			else
																				f76_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if f75_arg1.interrupted then
																			f75_local0( f75_arg0, f75_arg1 )
																			return 
																		else
																			f75_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			f75_arg0:setAlpha( 0.16 )
																			f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
																		end
																	end
																	
																	if f74_arg1.interrupted then
																		f74_local0( f74_arg0, f74_arg1 )
																		return 
																	else
																		f74_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		f74_arg0:setAlpha( 0.19 )
																		f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
																	end
																end
																
																if f73_arg1.interrupted then
																	f73_local0( f73_arg0, f73_arg1 )
																	return 
																else
																	f73_arg0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																	f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
																end
															end
															
															if f72_arg1.interrupted then
																f72_local0( f72_arg0, f72_arg1 )
																return 
															else
																f72_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																f72_arg0:setAlpha( 0 )
																f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
															end
														end
														
														if f71_arg1.interrupted then
															f71_local0( f71_arg0, f71_arg1 )
															return 
														else
															f71_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															f71_arg0:setAlpha( 0.51 )
															f71_arg0:registerEventHandler( "transition_complete_keyframe", f71_local0 )
														end
													end
													
													if f70_arg1.interrupted then
														f70_local0( f70_arg0, f70_arg1 )
														return 
													else
														f70_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f70_arg0:setAlpha( 1 )
														f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
													end
												end
												
												if f69_arg1.interrupted then
													f69_local0( f69_arg0, f69_arg1 )
													return 
												else
													f69_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
													f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
												end
											end
											
											if f68_arg1.interrupted then
												f68_local0( f68_arg0, f68_arg1 )
												return 
											else
												f68_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f68_arg0:setAlpha( 0 )
												f68_arg0:registerEventHandler( "transition_complete_keyframe", f68_local0 )
											end
										end
										
										if f67_arg1.interrupted then
											f67_local0( f67_arg0, f67_arg1 )
											return 
										else
											f67_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
										end
									end
									
									if f66_arg1.interrupted then
										f66_local0( f66_arg0, f66_arg1 )
										return 
									else
										f66_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f66_arg0:setAlpha( 1 )
										f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
									end
								end
								
								if f65_arg1.interrupted then
									f65_local0( f65_arg0, f65_arg1 )
									return 
								else
									f65_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
								end
							end
							
							if f64_arg1.interrupted then
								f64_local0( f64_arg0, f64_arg1 )
								return 
							else
								f64_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f64_arg0:setAlpha( 0 )
								f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
							end
						end
						
						if f63_arg1.interrupted then
							f63_local0( f63_arg0, f63_arg1 )
							return 
						else
							f63_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f63_arg0:setAlpha( 0.16 )
							f63_arg0:registerEventHandler( "transition_complete_keyframe", f63_local0 )
						end
					end
					
					if f62_arg1.interrupted then
						f62_local0( f62_arg0, f62_arg1 )
						return 
					else
						f62_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f62_arg0:setAlpha( 0.19 )
						f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
					end
				end
				
				fxGlitch1700:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				fxGlitch1700:setAlpha( 0 )
				fxGlitch1700:registerEventHandler( "transition_complete_keyframe", f28_local1 )
				local f28_local2 = function ( f77_arg0, f77_arg1 )
					local f77_local0 = function ( f78_arg0, f78_arg1 )
						local f78_local0 = function ( f79_arg0, f79_arg1 )
							local f79_local0 = function ( f80_arg0, f80_arg1 )
								local f80_local0 = function ( f81_arg0, f81_arg1 )
									if not f81_arg1.interrupted then
										f81_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f81_arg0:setAlpha( 0 )
									if f81_arg1.interrupted then
										self.clipFinished( f81_arg0, f81_arg1 )
									else
										f81_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f80_arg1.interrupted then
									f80_local0( f80_arg0, f80_arg1 )
									return 
								else
									f80_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f80_arg0:setAlpha( 0.28 )
									f80_arg0:registerEventHandler( "transition_complete_keyframe", f80_local0 )
								end
							end
							
							if f79_arg1.interrupted then
								f79_local0( f79_arg0, f79_arg1 )
								return 
							else
								f79_arg0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
								f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
							end
						end
						
						if f78_arg1.interrupted then
							f78_local0( f78_arg0, f78_arg1 )
							return 
						else
							f78_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f78_arg0:setAlpha( 0 )
							f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
						end
					end
					
					if f77_arg1.interrupted then
						f77_local0( f77_arg0, f77_arg1 )
						return 
					else
						f77_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f77_arg0:setAlpha( 0.28 )
						f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
					end
				end
				
				fxGlitch1600:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
				fxGlitch1600:setAlpha( 0 )
				fxGlitch1600:registerEventHandler( "transition_complete_keyframe", f28_local2 )
				local f28_local3 = function ( f82_arg0, f82_arg1 )
					local f82_local0 = function ( f83_arg0, f83_arg1 )
						local f83_local0 = function ( f84_arg0, f84_arg1 )
							if not f84_arg1.interrupted then
								f84_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f84_arg0:setAlpha( 0 )
							if f84_arg1.interrupted then
								self.clipFinished( f84_arg0, f84_arg1 )
							else
								f84_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f83_arg1.interrupted then
							f83_local0( f83_arg0, f83_arg1 )
							return 
						else
							f83_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f83_arg0:setAlpha( 0.8 )
							f83_arg0:registerEventHandler( "transition_complete_keyframe", f83_local0 )
						end
					end
					
					if f82_arg1.interrupted then
						f82_local0( f82_arg0, f82_arg1 )
						return 
					else
						f82_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f82_arg0:setAlpha( 0.18 )
						f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
					end
				end
				
				fxGlitch1500:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				fxGlitch1500:setAlpha( 0 )
				fxGlitch1500:registerEventHandler( "transition_complete_keyframe", f28_local3 )
				local f28_local4 = function ( f85_arg0, f85_arg1 )
					local f85_local0 = function ( f86_arg0, f86_arg1 )
						local f86_local0 = function ( f87_arg0, f87_arg1 )
							local f87_local0 = function ( f88_arg0, f88_arg1 )
								local f88_local0 = function ( f89_arg0, f89_arg1 )
									local f89_local0 = function ( f90_arg0, f90_arg1 )
										local f90_local0 = function ( f91_arg0, f91_arg1 )
											local f91_local0 = function ( f92_arg0, f92_arg1 )
												local f92_local0 = function ( f93_arg0, f93_arg1 )
													if not f93_arg1.interrupted then
														f93_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													f93_arg0:setAlpha( 0 )
													if f93_arg1.interrupted then
														self.clipFinished( f93_arg0, f93_arg1 )
													else
														f93_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f92_arg1.interrupted then
													f92_local0( f92_arg0, f92_arg1 )
													return 
												else
													f92_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f92_arg0:setAlpha( 0.33 )
													f92_arg0:registerEventHandler( "transition_complete_keyframe", f92_local0 )
												end
											end
											
											if f91_arg1.interrupted then
												f91_local0( f91_arg0, f91_arg1 )
												return 
											else
												f91_arg0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
												f91_arg0:registerEventHandler( "transition_complete_keyframe", f91_local0 )
											end
										end
										
										if f90_arg1.interrupted then
											f90_local0( f90_arg0, f90_arg1 )
											return 
										else
											f90_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
										end
									end
									
									if f89_arg1.interrupted then
										f89_local0( f89_arg0, f89_arg1 )
										return 
									else
										f89_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f89_arg0:setAlpha( 0 )
										f89_arg0:registerEventHandler( "transition_complete_keyframe", f89_local0 )
									end
								end
								
								if f88_arg1.interrupted then
									f88_local0( f88_arg0, f88_arg1 )
									return 
								else
									f88_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f88_arg0:setAlpha( 1 )
									f88_arg0:registerEventHandler( "transition_complete_keyframe", f88_local0 )
								end
							end
							
							if f87_arg1.interrupted then
								f87_local0( f87_arg0, f87_arg1 )
								return 
							else
								f87_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								f87_arg0:registerEventHandler( "transition_complete_keyframe", f87_local0 )
							end
						end
						
						if f86_arg1.interrupted then
							f86_local0( f86_arg0, f86_arg1 )
							return 
						else
							f86_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f86_arg0:setAlpha( 0 )
							f86_arg0:registerEventHandler( "transition_complete_keyframe", f86_local0 )
						end
					end
					
					if f85_arg1.interrupted then
						f85_local0( f85_arg0, f85_arg1 )
						return 
					else
						f85_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f85_arg0:setAlpha( 0.33 )
						f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
					end
				end
				
				fxGlitch1400:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
				fxGlitch1400:setAlpha( 0 )
				fxGlitch1400:registerEventHandler( "transition_complete_keyframe", f28_local4 )
				local f28_local5 = function ( f94_arg0, f94_arg1 )
					local f94_local0 = function ( f95_arg0, f95_arg1 )
						local f95_local0 = function ( f96_arg0, f96_arg1 )
							if not f96_arg1.interrupted then
								f96_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f96_arg0:setAlpha( 0 )
							if f96_arg1.interrupted then
								self.clipFinished( f96_arg0, f96_arg1 )
							else
								f96_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f95_arg1.interrupted then
							f95_local0( f95_arg0, f95_arg1 )
							return 
						else
							f95_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f95_arg0:setAlpha( 1 )
							f95_arg0:registerEventHandler( "transition_complete_keyframe", f95_local0 )
						end
					end
					
					if f94_arg1.interrupted then
						f94_local0( f94_arg0, f94_arg1 )
						return 
					else
						f94_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f94_arg0:setAlpha( 0.25 )
						f94_arg0:registerEventHandler( "transition_complete_keyframe", f94_local0 )
					end
				end
				
				fxGlitch1300:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				fxGlitch1300:setAlpha( 0 )
				fxGlitch1300:registerEventHandler( "transition_complete_keyframe", f28_local5 )
				local f28_local6 = function ( f97_arg0, f97_arg1 )
					local f97_local0 = function ( f98_arg0, f98_arg1 )
						local f98_local0 = function ( f99_arg0, f99_arg1 )
							if not f99_arg1.interrupted then
								f99_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f99_arg0:setAlpha( 0 )
							if f99_arg1.interrupted then
								self.clipFinished( f99_arg0, f99_arg1 )
							else
								f99_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f98_arg1.interrupted then
							f98_local0( f98_arg0, f98_arg1 )
							return 
						else
							f98_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f98_arg0:registerEventHandler( "transition_complete_keyframe", f98_local0 )
						end
					end
					
					if f97_arg1.interrupted then
						f97_local0( f97_arg0, f97_arg1 )
						return 
					else
						f97_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f97_arg0:setAlpha( 1 )
						f97_arg0:registerEventHandler( "transition_complete_keyframe", f97_local0 )
					end
				end
				
				fxGlitch1100:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				fxGlitch1100:setAlpha( 0 )
				fxGlitch1100:registerEventHandler( "transition_complete_keyframe", f28_local6 )

				LimitedBacking:completeAnimation()
				self.LimitedBacking:setAlpha( 0 )
				self.clipFinished( LimitedBacking, {} )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.clipFinished( CommonBacking, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 0 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 0 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 0 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setAlpha( 0 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 0 )
				self.clipFinished( LootDecryptionImage, {} )
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

				BMPixel06FX:completeAnimation()
				self.BMPixel06FX:setAlpha( 0 )
				self.clipFinished( BMPixel06FX, {} )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )

				BMTimeAndLootBanner:completeAnimation()
				self.BMTimeAndLootBanner:setAlpha( 0 )
				self.clipFinished( BMTimeAndLootBanner, {} )

				self.nextClip = "StartFuzz"
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			RevealedCommon = function ()
				self:setupElementClipCounter( 15 )

				local f106_local0 = function ( f107_arg0, f107_arg1 )
					local f107_local0 = function ( f108_arg0, f108_arg1 )
						if not f108_arg1.interrupted then
							f108_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						f108_arg0:setAlpha( 0 )
						if f108_arg1.interrupted then
							self.clipFinished( f108_arg0, f108_arg1 )
						else
							f108_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f107_arg1.interrupted then
						f107_local0( f107_arg0, f107_arg1 )
						return 
					else
						f107_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f107_arg0:setAlpha( 1 )
						f107_arg0:registerEventHandler( "transition_complete_keyframe", f107_local0 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", f106_local0 )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.clipFinished( RareBacking, {} )
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
				local f106_local2 = function ( f111_arg0, f111_arg1 )
					if not f111_arg1.interrupted then
						f111_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f111_arg0:setAlpha( 1 )
					if f111_arg1.interrupted then
						self.clipFinished( f111_arg0, f111_arg1 )
					else
						f111_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", f106_local2 )
				local f106_local3 = function ( f112_arg0, f112_arg1 )
					if not f112_arg1.interrupted then
						f112_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f112_arg0:setAlpha( 1 )
					if f112_arg1.interrupted then
						self.clipFinished( f112_arg0, f112_arg1 )
					else
						f112_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f106_local3 )
				local f106_local4 = function ( f113_arg0, f113_arg1 )
					if not f113_arg1.interrupted then
						f113_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f113_arg0:setAlpha( 1 )
					if f113_arg1.interrupted then
						self.clipFinished( f113_arg0, f113_arg1 )
					else
						f113_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f106_local4 )
				local f106_local5 = function ( f114_arg0, f114_arg1 )
					if not f114_arg1.interrupted then
						f114_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f114_arg0:setAlpha( 1 )
					if f114_arg1.interrupted then
						self.clipFinished( f114_arg0, f114_arg1 )
					else
						f114_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f106_local5 )
				local f106_local6 = function ( f115_arg0, f115_arg1 )
					if not f115_arg1.interrupted then
						f115_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f115_arg0:setLeftRight( false, false, -127.5, 126.5 )
					f115_arg0:setTopBottom( true, false, -57, 292 )
					f115_arg0:setAlpha( 1 )
					if f115_arg1.interrupted then
						self.clipFinished( f115_arg0, f115_arg1 )
					else
						f115_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f106_local6 )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setLeftRight( true, true, -30, 29 )
				self.LootDecryptionFakeImageCycle:setTopBottom( true, true, -22, 27 )
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local GLOWcommonFrame2 = function ( GLOWcommon, event )
					local GLOWcommonFrame3 = function ( GLOWcommon, event )
						local GLOWcommonFrame4 = function ( GLOWcommon, event )
							if not event.interrupted then
								GLOWcommon:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
							end
							GLOWcommon:setRGB( 1, 1, 1 )
							GLOWcommon:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( GLOWcommon, event )
							else
								GLOWcommon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							GLOWcommonFrame4( GLOWcommon, event )
							return 
						else
							GLOWcommon:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
							GLOWcommon:setAlpha( 0.75 )
							GLOWcommon:registerEventHandler( "transition_complete_keyframe", GLOWcommonFrame4 )
						end
					end
					
					if event.interrupted then
						GLOWcommonFrame3( GLOWcommon, event )
						return 
					else
						GLOWcommon:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						GLOWcommon:registerEventHandler( "transition_complete_keyframe", GLOWcommonFrame3 )
					end
				end
				
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setRGB( 1, 1, 1 )
				self.GLOWcommon:setAlpha( 0 )
				GLOWcommonFrame2( GLOWcommon, {} )
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

				BMPixel06FX:completeAnimation()
				self.BMPixel06FX:setAlpha( 0 )
				self.clipFinished( BMPixel06FX, {} )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				local f106_local9 = function ( f122_arg0, f122_arg1 )
					if not f122_arg1.interrupted then
						f122_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f122_arg0:setAlpha( 1 )
					if f122_arg1.interrupted then
						self.clipFinished( f122_arg0, f122_arg1 )
					else
						f122_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				BMTimeAndLootBanner:setAlpha( 0 )
				BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", f106_local9 )
			end,
			RevealedRare = function ()
				self:setupElementClipCounter( 17 )

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

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.clipFinished( CommonBacking, {} )
				local f123_local1 = function ( f126_arg0, f126_arg1 )
					if not f126_arg1.interrupted then
						f126_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f126_arg0:setAlpha( 1 )
					if f126_arg1.interrupted then
						self.clipFinished( f126_arg0, f126_arg1 )
					else
						f126_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", f123_local1 )
				local f123_local2 = function ( f127_arg0, f127_arg1 )
					if not f127_arg1.interrupted then
						f127_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f127_arg0:setAlpha( 1 )
					if f127_arg1.interrupted then
						self.clipFinished( f127_arg0, f127_arg1 )
					else
						f127_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f123_local2 )
				local f123_local3 = function ( f128_arg0, f128_arg1 )
					if not f128_arg1.interrupted then
						f128_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f128_arg0:setAlpha( 1 )
					if f128_arg1.interrupted then
						self.clipFinished( f128_arg0, f128_arg1 )
					else
						f128_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f123_local3 )
				local f123_local4 = function ( f129_arg0, f129_arg1 )
					if not f129_arg1.interrupted then
						f129_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f129_arg0:setAlpha( 1 )
					if f129_arg1.interrupted then
						self.clipFinished( f129_arg0, f129_arg1 )
					else
						f129_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f123_local4 )
				local f123_local5 = function ( f130_arg0, f130_arg1 )
					if not f130_arg1.interrupted then
						f130_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f130_arg0:setLeftRight( false, false, -127.5, 126.5 )
					f130_arg0:setTopBottom( true, false, -57, 292 )
					f130_arg0:setAlpha( 1 )
					if f130_arg1.interrupted then
						self.clipFinished( f130_arg0, f130_arg1 )
					else
						f130_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f123_local5 )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local f123_local6 = function ( f131_arg0, f131_arg1 )
					local f131_local0 = function ( f132_arg0, f132_arg1 )
						if not f132_arg1.interrupted then
							f132_arg0:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
						end
						f132_arg0:setAlpha( 0 )
						if f132_arg1.interrupted then
							self.clipFinished( f132_arg0, f132_arg1 )
						else
							f132_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f131_arg1.interrupted then
						f131_local0( f131_arg0, f131_arg1 )
						return 
					else
						f131_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						f131_arg0:setAlpha( 1 )
						f131_arg0:registerEventHandler( "transition_complete_keyframe", f131_local0 )
					end
				end
				
				GLOWrare:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWrare:setAlpha( 0 )
				GLOWrare:registerEventHandler( "transition_complete_keyframe", f123_local6 )
				local f123_local7 = function ( f133_arg0, f133_arg1 )
					local f133_local0 = function ( f134_arg0, f134_arg1 )
						if not f134_arg1.interrupted then
							f134_arg0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						end
						f134_arg0:setRGB( 0.22, 0.93, 0.93 )
						f134_arg0:setAlpha( 0 )
						f134_arg0:setScale( 1.2 )
						if f134_arg1.interrupted then
							self.clipFinished( f134_arg0, f134_arg1 )
						else
							f134_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f133_arg1.interrupted then
						f133_local0( f133_arg0, f133_arg1 )
						return 
					else
						f133_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f133_arg0:setAlpha( 1 )
						f133_arg0:setScale( 1.05 )
						f133_arg0:registerEventHandler( "transition_complete_keyframe", f133_local0 )
					end
				end
				
				blurbox:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				blurbox:setRGB( 0.22, 0.93, 0.93 )
				blurbox:setAlpha( 0 )
				blurbox:setScale( 1 )
				blurbox:registerEventHandler( "transition_complete_keyframe", f123_local7 )
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

				BMPixel06FX:completeAnimation()
				self.BMPixel06FX:setAlpha( 0 )
				self.clipFinished( BMPixel06FX, {} )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				local f123_local12 = function ( f139_arg0, f139_arg1 )
					if not f139_arg1.interrupted then
						f139_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f139_arg0:setAlpha( 1 )
					if f139_arg1.interrupted then
						self.clipFinished( f139_arg0, f139_arg1 )
					else
						f139_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				BMTimeAndLootBanner:setAlpha( 0 )
				BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", f123_local12 )
			end,
			RevealedLegendary = function ()
				self:setupElementClipCounter( 24 )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )
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

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.clipFinished( CommonBacking, {} )
				local f140_local1 = function ( f143_arg0, f143_arg1 )
					if not f143_arg1.interrupted then
						f143_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f143_arg0:setAlpha( 1 )
					if f143_arg1.interrupted then
						self.clipFinished( f143_arg0, f143_arg1 )
					else
						f143_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", f140_local1 )
				local f140_local2 = function ( f144_arg0, f144_arg1 )
					if not f144_arg1.interrupted then
						f144_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f144_arg0:setAlpha( 1 )
					if f144_arg1.interrupted then
						self.clipFinished( f144_arg0, f144_arg1 )
					else
						f144_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f140_local2 )
				local f140_local3 = function ( f145_arg0, f145_arg1 )
					if not f145_arg1.interrupted then
						f145_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f145_arg0:setAlpha( 1 )
					if f145_arg1.interrupted then
						self.clipFinished( f145_arg0, f145_arg1 )
					else
						f145_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f140_local3 )
				local f140_local4 = function ( f146_arg0, f146_arg1 )
					if not f146_arg1.interrupted then
						f146_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f146_arg0:setAlpha( 1 )
					if f146_arg1.interrupted then
						self.clipFinished( f146_arg0, f146_arg1 )
					else
						f146_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f140_local4 )
				local f140_local5 = function ( f147_arg0, f147_arg1 )
					if not f147_arg1.interrupted then
						f147_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f147_arg0:setLeftRight( false, false, -127.5, 126.5 )
					f147_arg0:setTopBottom( true, false, -57, 292 )
					f147_arg0:setAlpha( 1 )
					if f147_arg1.interrupted then
						self.clipFinished( f147_arg0, f147_arg1 )
					else
						f147_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f140_local5 )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				GLOWrare:completeAnimation()
				self.GLOWrare:setAlpha( 0 )
				self.clipFinished( GLOWrare, {} )
				local f140_local6 = function ( f148_arg0, f148_arg1 )
					local f148_local0 = function ( f149_arg0, f149_arg1 )
						if not f149_arg1.interrupted then
							f149_arg0:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Linear )
						end
						f149_arg0:setAlpha( 0 )
						if f149_arg1.interrupted then
							self.clipFinished( f149_arg0, f149_arg1 )
						else
							f149_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f148_arg1.interrupted then
						f148_local0( f148_arg0, f148_arg1 )
						return 
					else
						f148_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f148_arg0:setAlpha( 1 )
						f148_arg0:registerEventHandler( "transition_complete_keyframe", f148_local0 )
					end
				end
				
				GLOWLengendary:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWLengendary:setAlpha( 0 )
				GLOWLengendary:registerEventHandler( "transition_complete_keyframe", f140_local6 )
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

				BMPixel06FX:completeAnimation()
				self.BMPixel06FX:setAlpha( 0 )
				self.clipFinished( BMPixel06FX, {} )
				local f140_local12 = function ( f161_arg0, f161_arg1 )
					local f161_local0 = function ( f162_arg0, f162_arg1 )
						local f162_local0 = function ( f163_arg0, f163_arg1 )
							local f163_local0 = function ( f164_arg0, f164_arg1 )
								local f164_local0 = function ( f165_arg0, f165_arg1 )
									if not f165_arg1.interrupted then
										f165_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									end
									f165_arg0:setAlpha( 0 )
									f165_arg0:setScale( 2 )
									if f165_arg1.interrupted then
										self.clipFinished( f165_arg0, f165_arg1 )
									else
										f165_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f164_arg1.interrupted then
									f164_local0( f164_arg0, f164_arg1 )
									return 
								else
									f164_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									f164_arg0:setScale( 1.86 )
									f164_arg0:registerEventHandler( "transition_complete_keyframe", f164_local0 )
								end
							end
							
							if f163_arg1.interrupted then
								f163_local0( f163_arg0, f163_arg1 )
								return 
							else
								f163_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								f163_arg0:setAlpha( 0 )
								f163_arg0:setScale( 1.62 )
								f163_arg0:registerEventHandler( "transition_complete_keyframe", f163_local0 )
							end
						end
						
						if f162_arg1.interrupted then
							f162_local0( f162_arg0, f162_arg1 )
							return 
						else
							f162_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f162_arg0:setAlpha( 1 )
							f162_arg0:setScale( 1.22 )
							f162_arg0:registerEventHandler( "transition_complete_keyframe", f162_local0 )
						end
					end
					
					if f161_arg1.interrupted then
						f161_local0( f161_arg0, f161_arg1 )
						return 
					else
						f161_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						f161_arg0:setAlpha( 0.2 )
						f161_arg0:registerEventHandler( "transition_complete_keyframe", f161_local0 )
					end
				end
				
				LegendaryEmber1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber1:setAlpha( 0 )
				LegendaryEmber1:setScale( 1 )
				LegendaryEmber1:registerEventHandler( "transition_complete_keyframe", f140_local12 )
				local f140_local13 = function ( f166_arg0, f166_arg1 )
					local f166_local0 = function ( f167_arg0, f167_arg1 )
						local f167_local0 = function ( f168_arg0, f168_arg1 )
							local f168_local0 = function ( f169_arg0, f169_arg1 )
								if not f169_arg1.interrupted then
									f169_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								f169_arg0:setAlpha( 0 )
								f169_arg0:setScale( 1.5 )
								if f169_arg1.interrupted then
									self.clipFinished( f169_arg0, f169_arg1 )
								else
									f169_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f168_arg1.interrupted then
								f168_local0( f168_arg0, f168_arg1 )
								return 
							else
								f168_arg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
								f168_arg0:setAlpha( 0 )
								f168_arg0:setScale( 1.46 )
								f168_arg0:registerEventHandler( "transition_complete_keyframe", f168_local0 )
							end
						end
						
						if f167_arg1.interrupted then
							f167_local0( f167_arg0, f167_arg1 )
							return 
						else
							f167_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f167_arg0:setAlpha( 1 )
							f167_arg0:setScale( 1.26 )
							f167_arg0:registerEventHandler( "transition_complete_keyframe", f167_local0 )
						end
					end
					
					if f166_arg1.interrupted then
						f166_local0( f166_arg0, f166_arg1 )
						return 
					else
						f166_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						f166_arg0:setAlpha( 0.2 )
						f166_arg0:registerEventHandler( "transition_complete_keyframe", f166_local0 )
					end
				end
				
				LegendaryEmber2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber2:setAlpha( 0 )
				LegendaryEmber2:setScale( 1.2 )
				LegendaryEmber2:registerEventHandler( "transition_complete_keyframe", f140_local13 )
				local f140_local14 = function ( f170_arg0, f170_arg1 )
					local f170_local0 = function ( f171_arg0, f171_arg1 )
						if not f171_arg1.interrupted then
							f171_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						f171_arg0:setAlpha( 0 )
						f171_arg0:setScale( 1.5 )
						if f171_arg1.interrupted then
							self.clipFinished( f171_arg0, f171_arg1 )
						else
							f171_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f170_arg1.interrupted then
						f170_local0( f170_arg0, f170_arg1 )
						return 
					else
						f170_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f170_arg0:setAlpha( 1 )
						f170_arg0:setScale( 1.3 )
						f170_arg0:registerEventHandler( "transition_complete_keyframe", f170_local0 )
					end
				end
				
				LegendaryEmber3:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				LegendaryEmber3:setAlpha( 0 )
				LegendaryEmber3:setScale( 1.1 )
				LegendaryEmber3:registerEventHandler( "transition_complete_keyframe", f140_local14 )
				local f140_local15 = function ( f172_arg0, f172_arg1 )
					local f172_local0 = function ( f173_arg0, f173_arg1 )
						local f173_local0 = function ( f174_arg0, f174_arg1 )
							local f174_local0 = function ( f175_arg0, f175_arg1 )
								if not f175_arg1.interrupted then
									f175_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								f175_arg0:setLeftRight( true, false, -74.86, 317.08 )
								f175_arg0:setTopBottom( true, false, -78.35, 424.35 )
								f175_arg0:setAlpha( 0 )
								f175_arg0:setScale( 1.8 )
								if f175_arg1.interrupted then
									self.clipFinished( f175_arg0, f175_arg1 )
								else
									f175_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f174_arg1.interrupted then
								f174_local0( f174_arg0, f174_arg1 )
								return 
							else
								f174_arg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
								f174_arg0:setAlpha( 0 )
								f174_arg0:setScale( 1.45 )
								f174_arg0:registerEventHandler( "transition_complete_keyframe", f174_local0 )
							end
						end
						
						if f173_arg1.interrupted then
							f173_local0( f173_arg0, f173_arg1 )
							return 
						else
							f173_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f173_arg0:setAlpha( 1 )
							f173_arg0:setScale( 0.96 )
							f173_arg0:registerEventHandler( "transition_complete_keyframe", f173_local0 )
						end
					end
					
					if f172_arg1.interrupted then
						f172_local0( f172_arg0, f172_arg1 )
						return 
					else
						f172_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						f172_arg0:setAlpha( 0.2 )
						f172_arg0:registerEventHandler( "transition_complete_keyframe", f172_local0 )
					end
				end
				
				LegendaryEmber5:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber5:setLeftRight( true, false, -74.86, 317.08 )
				LegendaryEmber5:setTopBottom( true, false, -78.35, 424.35 )
				LegendaryEmber5:setAlpha( 0 )
				LegendaryEmber5:setScale( 0.8 )
				LegendaryEmber5:registerEventHandler( "transition_complete_keyframe", f140_local15 )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				local f140_local16 = function ( f176_arg0, f176_arg1 )
					if not f176_arg1.interrupted then
						f176_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f176_arg0:setAlpha( 1 )
					if f176_arg1.interrupted then
						self.clipFinished( f176_arg0, f176_arg1 )
					else
						f176_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				BMTimeAndLootBanner:setAlpha( 0 )
				BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", f140_local16 )
			end,
			RevealedEpic = function ()
				self:setupElementClipCounter( 28 )

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
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 3.5 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.clipFinished( CommonBacking, {} )
				local f177_local1 = function ( f180_arg0, f180_arg1 )
					if not f180_arg1.interrupted then
						f180_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f180_arg0:setAlpha( 1 )
					if f180_arg1.interrupted then
						self.clipFinished( f180_arg0, f180_arg1 )
					else
						f180_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", f177_local1 )
				local f177_local2 = function ( f181_arg0, f181_arg1 )
					if not f181_arg1.interrupted then
						f181_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f181_arg0:setAlpha( 1 )
					if f181_arg1.interrupted then
						self.clipFinished( f181_arg0, f181_arg1 )
					else
						f181_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f177_local2 )
				local f177_local3 = function ( f182_arg0, f182_arg1 )
					if not f182_arg1.interrupted then
						f182_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f182_arg0:setAlpha( 1 )
					if f182_arg1.interrupted then
						self.clipFinished( f182_arg0, f182_arg1 )
					else
						f182_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f177_local3 )
				local f177_local4 = function ( f183_arg0, f183_arg1 )
					if not f183_arg1.interrupted then
						f183_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f183_arg0:setAlpha( 1 )
					if f183_arg1.interrupted then
						self.clipFinished( f183_arg0, f183_arg1 )
					else
						f183_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f177_local4 )
				local f177_local5 = function ( f184_arg0, f184_arg1 )
					if not f184_arg1.interrupted then
						f184_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f184_arg0:setLeftRight( true, false, -5, 249 )
					f184_arg0:setTopBottom( true, false, -57, 292 )
					f184_arg0:setAlpha( 1 )
					if f184_arg1.interrupted then
						self.clipFinished( f184_arg0, f184_arg1 )
					else
						f184_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( true, false, -5, 249 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f177_local5 )
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

				GLOWrare:completeAnimation()
				self.GLOWrare:setAlpha( 0 )
				self.clipFinished( GLOWrare, {} )

				GLOWLengendary:completeAnimation()
				self.GLOWLengendary:setAlpha( 0 )
				self.clipFinished( GLOWLengendary, {} )
				local f177_local7 = function ( f186_arg0, f186_arg1 )
					local f186_local0 = function ( f187_arg0, f187_arg1 )
						if not f187_arg1.interrupted then
							f187_arg0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						end
						f187_arg0:setAlpha( 0 )
						if f187_arg1.interrupted then
							self.clipFinished( f187_arg0, f187_arg1 )
						else
							f187_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f186_arg1.interrupted then
						f186_local0( f186_arg0, f186_arg1 )
						return 
					else
						f186_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f186_arg0:setAlpha( 1 )
						f186_arg0:registerEventHandler( "transition_complete_keyframe", f186_local0 )
					end
				end
				
				GLOWEpic:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWEpic:setAlpha( 0 )
				GLOWEpic:registerEventHandler( "transition_complete_keyframe", f177_local7 )
				local f177_local8 = function ( f188_arg0, f188_arg1 )
					local f188_local0 = function ( f189_arg0, f189_arg1 )
						if not f189_arg1.interrupted then
							f189_arg0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						end
						f189_arg0:setRGB( 1, 0.67, 0 )
						f189_arg0:setAlpha( 0 )
						f189_arg0:setScale( 1.2 )
						if f189_arg1.interrupted then
							self.clipFinished( f189_arg0, f189_arg1 )
						else
							f189_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f188_arg1.interrupted then
						f188_local0( f188_arg0, f188_arg1 )
						return 
					else
						f188_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f188_arg0:setAlpha( 1 )
						f188_arg0:setScale( 1.04 )
						f188_arg0:registerEventHandler( "transition_complete_keyframe", f188_local0 )
					end
				end
				
				blurbox:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				blurbox:setRGB( 1, 0.67, 0 )
				blurbox:setAlpha( 0 )
				blurbox:setScale( 1 )
				blurbox:registerEventHandler( "transition_complete_keyframe", f177_local8 )
				local BMPixelFXFrame2 = function ( BMPixelFX, event )
					if not event.interrupted then
						BMPixelFX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixelFX:setRGB( 1, 0.67, 0 )
					BMPixelFX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixelFX, event )
					else
						BMPixelFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixelFX:completeAnimation()
				self.BMPixelFX:setRGB( 1, 0.67, 0 )
				self.BMPixelFX:setAlpha( 0 )
				BMPixelFXFrame2( BMPixelFX, {} )
				local BMPixel02FXFrame2 = function ( BMPixel02FX, event )
					if not event.interrupted then
						BMPixel02FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel02FX:setRGB( 1, 0.67, 0 )
					BMPixel02FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel02FX, event )
					else
						BMPixel02FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setRGB( 1, 0.67, 0 )
				self.BMPixel02FX:setAlpha( 0 )
				BMPixel02FXFrame2( BMPixel02FX, {} )
				local BMPixel03FXFrame2 = function ( BMPixel03FX, event )
					if not event.interrupted then
						BMPixel03FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel03FX:setRGB( 1, 0.67, 0 )
					BMPixel03FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel03FX, event )
					else
						BMPixel03FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setRGB( 1, 0.67, 0 )
				self.BMPixel03FX:setAlpha( 0 )
				BMPixel03FXFrame2( BMPixel03FX, {} )
				local BMPixel04FXFrame2 = function ( BMPixel04FX, event )
					if not event.interrupted then
						BMPixel04FX:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					BMPixel04FX:setRGB( 1, 0.67, 0 )
					BMPixel04FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel04FX, event )
					else
						BMPixel04FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setRGB( 1, 0.67, 0 )
				self.BMPixel04FX:setAlpha( 0 )
				BMPixel04FXFrame2( BMPixel04FX, {} )

				BMPixel06FX:completeAnimation()
				self.BMPixel06FX:setAlpha( 0 )
				self.clipFinished( BMPixel06FX, {} )
				local f177_local13 = function ( f194_arg0, f194_arg1 )
					local f194_local0 = function ( f195_arg0, f195_arg1 )
						local f195_local0 = function ( f196_arg0, f196_arg1 )
							if not f196_arg1.interrupted then
								f196_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							f196_arg0:setLeftRight( true, false, -74.86, 317.08 )
							f196_arg0:setTopBottom( true, false, -78.35, 424.35 )
							f196_arg0:setAlpha( 0 )
							f196_arg0:setScale( 1.8 )
							if f196_arg1.interrupted then
								self.clipFinished( f196_arg0, f196_arg1 )
							else
								f196_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f195_arg1.interrupted then
							f195_local0( f195_arg0, f195_arg1 )
							return 
						else
							f195_arg0:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
							f195_arg0:setAlpha( 0 )
							f195_arg0:setScale( 1.45 )
							f195_arg0:registerEventHandler( "transition_complete_keyframe", f195_local0 )
						end
					end
					
					if f194_arg1.interrupted then
						f194_local0( f194_arg0, f194_arg1 )
						return 
					else
						f194_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f194_arg0:setAlpha( 1 )
						f194_arg0:setScale( 0.98 )
						f194_arg0:registerEventHandler( "transition_complete_keyframe", f194_local0 )
					end
				end
				
				EpicEmber5:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				EpicEmber5:setLeftRight( true, false, -74.86, 317.08 )
				EpicEmber5:setTopBottom( true, false, -78.35, 424.35 )
				EpicEmber5:setAlpha( 0 )
				EpicEmber5:setScale( 0.8 )
				EpicEmber5:registerEventHandler( "transition_complete_keyframe", f177_local13 )
				local f177_local14 = function ( f197_arg0, f197_arg1 )
					local f197_local0 = function ( f198_arg0, f198_arg1 )
						if not f198_arg1.interrupted then
							f198_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						f198_arg0:setAlpha( 0 )
						f198_arg0:setScale( 1.5 )
						if f198_arg1.interrupted then
							self.clipFinished( f198_arg0, f198_arg1 )
						else
							f198_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f197_arg1.interrupted then
						f197_local0( f197_arg0, f197_arg1 )
						return 
					else
						f197_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f197_arg0:setAlpha( 1 )
						f197_arg0:setScale( 1.3 )
						f197_arg0:registerEventHandler( "transition_complete_keyframe", f197_local0 )
					end
				end
				
				EpicEmber3:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				EpicEmber3:setAlpha( 0 )
				EpicEmber3:setScale( 1.1 )
				EpicEmber3:registerEventHandler( "transition_complete_keyframe", f177_local14 )
				local f177_local15 = function ( f199_arg0, f199_arg1 )
					local f199_local0 = function ( f200_arg0, f200_arg1 )
						local f200_local0 = function ( f201_arg0, f201_arg1 )
							local f201_local0 = function ( f202_arg0, f202_arg1 )
								local f202_local0 = function ( f203_arg0, f203_arg1 )
									local f203_local0 = function ( f204_arg0, f204_arg1 )
										if not f204_arg1.interrupted then
											f204_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										f204_arg0:setAlpha( 0 )
										f204_arg0:setScale( 1.4 )
										if f204_arg1.interrupted then
											self.clipFinished( f204_arg0, f204_arg1 )
										else
											f204_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f203_arg1.interrupted then
										f203_local0( f203_arg0, f203_arg1 )
										return 
									else
										f203_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
										f203_arg0:setScale( 1.38 )
										f203_arg0:registerEventHandler( "transition_complete_keyframe", f203_local0 )
									end
								end
								
								if f202_arg1.interrupted then
									f202_local0( f202_arg0, f202_arg1 )
									return 
								else
									f202_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
									f202_arg0:setAlpha( 0 )
									f202_arg0:setScale( 1.36 )
									f202_arg0:registerEventHandler( "transition_complete_keyframe", f202_local0 )
								end
							end
							
							if f201_arg1.interrupted then
								f201_local0( f201_arg0, f201_arg1 )
								return 
							else
								f201_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								f201_arg0:setScale( 1.33 )
								f201_arg0:registerEventHandler( "transition_complete_keyframe", f201_local0 )
							end
						end
						
						if f200_arg1.interrupted then
							f200_local0( f200_arg0, f200_arg1 )
							return 
						else
							f200_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							f200_arg0:setScale( 1.3 )
							f200_arg0:registerEventHandler( "transition_complete_keyframe", f200_local0 )
						end
					end
					
					if f199_arg1.interrupted then
						f199_local0( f199_arg0, f199_arg1 )
						return 
					else
						f199_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f199_arg0:setAlpha( 1 )
						f199_arg0:setScale( 1.2 )
						f199_arg0:registerEventHandler( "transition_complete_keyframe", f199_local0 )
					end
				end
				
				EpicEmber2:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				EpicEmber2:setAlpha( 0 )
				EpicEmber2:setScale( 1.1 )
				EpicEmber2:registerEventHandler( "transition_complete_keyframe", f177_local15 )
				local f177_local16 = function ( f205_arg0, f205_arg1 )
					local f205_local0 = function ( f206_arg0, f206_arg1 )
						local f206_local0 = function ( f207_arg0, f207_arg1 )
							local f207_local0 = function ( f208_arg0, f208_arg1 )
								local f208_local0 = function ( f209_arg0, f209_arg1 )
									local f209_local0 = function ( f210_arg0, f210_arg1 )
										local f210_local0 = function ( f211_arg0, f211_arg1 )
											if not f211_arg1.interrupted then
												f211_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											end
											f211_arg0:setAlpha( 0 )
											f211_arg0:setScale( 1.4 )
											if f211_arg1.interrupted then
												self.clipFinished( f211_arg0, f211_arg1 )
											else
												f211_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f210_arg1.interrupted then
											f210_local0( f210_arg0, f210_arg1 )
											return 
										else
											f210_arg0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											f210_arg0:setScale( 1.39 )
											f210_arg0:registerEventHandler( "transition_complete_keyframe", f210_local0 )
										end
									end
									
									if f209_arg1.interrupted then
										f209_local0( f209_arg0, f209_arg1 )
										return 
									else
										f209_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
										f209_arg0:setScale( 1.36 )
										f209_arg0:registerEventHandler( "transition_complete_keyframe", f209_local0 )
									end
								end
								
								if f208_arg1.interrupted then
									f208_local0( f208_arg0, f208_arg1 )
									return 
								else
									f208_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
									f208_arg0:setAlpha( 0 )
									f208_arg0:setScale( 1.34 )
									f208_arg0:registerEventHandler( "transition_complete_keyframe", f208_local0 )
								end
							end
							
							if f207_arg1.interrupted then
								f207_local0( f207_arg0, f207_arg1 )
								return 
							else
								f207_arg0:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								f207_arg0:setScale( 1.3 )
								f207_arg0:registerEventHandler( "transition_complete_keyframe", f207_local0 )
							end
						end
						
						if f206_arg1.interrupted then
							f206_local0( f206_arg0, f206_arg1 )
							return 
						else
							f206_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							f206_arg0:setAlpha( 1 )
							f206_arg0:setScale( 1.24 )
							f206_arg0:registerEventHandler( "transition_complete_keyframe", f206_local0 )
						end
					end
					
					if f205_arg1.interrupted then
						f205_local0( f205_arg0, f205_arg1 )
						return 
					else
						f205_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						f205_arg0:setScale( 1.22 )
						f205_arg0:registerEventHandler( "transition_complete_keyframe", f205_local0 )
					end
				end
				
				EpicEmber1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				EpicEmber1:setAlpha( 0 )
				EpicEmber1:setScale( 1.2 )
				EpicEmber1:registerEventHandler( "transition_complete_keyframe", f177_local16 )
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
											epicSkull:setLeftRight( true, false, -58.5, 310 )
											epicSkull:setTopBottom( true, false, -73, 418.4 )
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
				self.epicSkull:setLeftRight( true, false, -58.5, 310 )
				self.epicSkull:setTopBottom( true, false, -73, 418.4 )
				self.epicSkull:setAlpha( 0 )
				self.epicSkull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated" ) )
				self.epicSkull:setShaderVector( 0, 27, 0, 0, 0 )
				self.epicSkull:setShaderVector( 1, 0, 0, 0, 0 )
				epicSkullFrame2( epicSkull, {} )
				local f177_local18 = function ( f219_arg0, f219_arg1 )
					if not f219_arg1.interrupted then
						f219_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f219_arg0:setAlpha( 1 )
					if f219_arg1.interrupted then
						self.clipFinished( f219_arg0, f219_arg1 )
					else
						f219_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFlyEmberFX:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				BMFlyEmberFX:setAlpha( 0 )
				BMFlyEmberFX:registerEventHandler( "transition_complete_keyframe", f177_local18 )
				local f177_local19 = function ( f220_arg0, f220_arg1 )
					if not f220_arg1.interrupted then
						f220_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					f220_arg0:setAlpha( 1 )
					if f220_arg1.interrupted then
						self.clipFinished( f220_arg0, f220_arg1 )
					else
						f220_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFlyEmberFX0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
				BMFlyEmberFX0:setAlpha( 0 )
				BMFlyEmberFX0:registerEventHandler( "transition_complete_keyframe", f177_local19 )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				local f177_local20 = function ( f221_arg0, f221_arg1 )
					if not f221_arg1.interrupted then
						f221_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f221_arg0:setAlpha( 1 )
					if f221_arg1.interrupted then
						self.clipFinished( f221_arg0, f221_arg1 )
					else
						f221_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				BMTimeAndLootBanner:setAlpha( 0 )
				BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", f177_local20 )
			end,
			RevealedLimited = function ()
				self:setupElementClipCounter( 45 )

				local LimitedBackglowFrame2 = function ( LimitedBackglow, event )
					local LimitedBackglowFrame3 = function ( LimitedBackglow, event )
						local LimitedBackglowFrame4 = function ( LimitedBackglow, event )
							local LimitedBackglowFrame5 = function ( LimitedBackglow, event )
								local LimitedBackglowFrame6 = function ( LimitedBackglow, event )
									if not event.interrupted then
										LimitedBackglow:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
									end
									LimitedBackglow:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LimitedBackglow, event )
									else
										LimitedBackglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LimitedBackglowFrame6( LimitedBackglow, event )
									return 
								else
									LimitedBackglow:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									LimitedBackglow:setAlpha( 1 )
									LimitedBackglow:registerEventHandler( "transition_complete_keyframe", LimitedBackglowFrame6 )
								end
							end
							
							if event.interrupted then
								LimitedBackglowFrame5( LimitedBackglow, event )
								return 
							else
								LimitedBackglow:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								LimitedBackglow:setAlpha( 0.64 )
								LimitedBackglow:registerEventHandler( "transition_complete_keyframe", LimitedBackglowFrame5 )
							end
						end
						
						if event.interrupted then
							LimitedBackglowFrame4( LimitedBackglow, event )
							return 
						else
							LimitedBackglow:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							LimitedBackglow:setAlpha( 1 )
							LimitedBackglow:registerEventHandler( "transition_complete_keyframe", LimitedBackglowFrame4 )
						end
					end
					
					if event.interrupted then
						LimitedBackglowFrame3( LimitedBackglow, event )
						return 
					else
						LimitedBackglow:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						LimitedBackglow:registerEventHandler( "transition_complete_keyframe", LimitedBackglowFrame3 )
					end
				end
				
				LimitedBackglow:completeAnimation()
				self.LimitedBackglow:setAlpha( 0 )
				LimitedBackglowFrame2( LimitedBackglow, {} )
				local LimitedBackingFrame2 = function ( LimitedBacking, event )
					local LimitedBackingFrame3 = function ( LimitedBacking, event )
						if not event.interrupted then
							LimitedBacking:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						LimitedBacking:setAlpha( 1 )
						LimitedBacking:setScale( 1 )
						if event.interrupted then
							self.clipFinished( LimitedBacking, event )
						else
							LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LimitedBackingFrame3( LimitedBacking, event )
						return 
					else
						LimitedBacking:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
						LimitedBacking:setAlpha( 1 )
						LimitedBacking:setScale( 2.46 )
						LimitedBacking:registerEventHandler( "transition_complete_keyframe", LimitedBackingFrame3 )
					end
				end
				
				LimitedBacking:completeAnimation()
				self.LimitedBacking:setAlpha( 0 )
				self.LimitedBacking:setScale( 3.5 )
				LimitedBackingFrame2( LimitedBacking, {} )
				local f222_local2 = function ( f230_arg0, f230_arg1 )
					local f230_local0 = function ( f231_arg0, f231_arg1 )
						if not f231_arg1.interrupted then
							f231_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						end
						f231_arg0:setAlpha( 1 )
						f231_arg0:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
						f231_arg0:setShaderVector( 0, 1.1, 0, 0, 0 )
						if f231_arg1.interrupted then
							self.clipFinished( f231_arg0, f231_arg1 )
						else
							f231_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f230_arg1.interrupted then
						f230_local0( f230_arg0, f230_arg1 )
						return 
					else
						f230_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						f230_arg0:setAlpha( 1 )
						f230_arg0:setShaderVector( 0, 0.39, 0, 0, 0 )
						f230_arg0:registerEventHandler( "transition_complete_keyframe", f230_local0 )
					end
				end
				
				LimitedBackingGlint:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
				LimitedBackingGlint:setAlpha( 0 )
				LimitedBackingGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
				LimitedBackingGlint:setShaderVector( 0, 0, 0, 0, 0 )
				LimitedBackingGlint:registerEventHandler( "transition_complete_keyframe", f222_local2 )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 3.5 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.clipFinished( CommonBacking, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					local lootRarityTextFrame3 = function ( lootRarityText, event )
						if not event.interrupted then
							lootRarityText:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						end
						lootRarityText:setRGB( 0, 0, 0 )
						lootRarityText:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( lootRarityText, event )
						else
							lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						lootRarityTextFrame3( lootRarityText, event )
						return 
					else
						lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						lootRarityText:registerEventHandler( "transition_complete_keyframe", lootRarityTextFrame3 )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setRGB( 0, 0, 0 )
				self.lootRarityText:setAlpha( 0 )
				lootRarityTextFrame2( lootRarityText, {} )
				local f222_local4 = function ( f234_arg0, f234_arg1 )
					if not f234_arg1.interrupted then
						f234_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f234_arg0:setAlpha( 1 )
					if f234_arg1.interrupted then
						self.clipFinished( f234_arg0, f234_arg1 )
					else
						f234_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f222_local4 )
				local f222_local5 = function ( f235_arg0, f235_arg1 )
					if not f235_arg1.interrupted then
						f235_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f235_arg0:setAlpha( 1 )
					if f235_arg1.interrupted then
						self.clipFinished( f235_arg0, f235_arg1 )
					else
						f235_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f222_local5 )
				local f222_local6 = function ( f236_arg0, f236_arg1 )
					if not f236_arg1.interrupted then
						f236_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f236_arg0:setAlpha( 1 )
					if f236_arg1.interrupted then
						self.clipFinished( f236_arg0, f236_arg1 )
					else
						f236_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f222_local6 )
				local f222_local7 = function ( f237_arg0, f237_arg1 )
					if not f237_arg1.interrupted then
						f237_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f237_arg0:setLeftRight( false, false, -127.5, 126.5 )
					f237_arg0:setTopBottom( true, false, -57, 292 )
					f237_arg0:setAlpha( 1 )
					if f237_arg1.interrupted then
						self.clipFinished( f237_arg0, f237_arg1 )
					else
						f237_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f222_local7 )
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

				GLOWrare:completeAnimation()
				self.GLOWrare:setAlpha( 0 )
				self.clipFinished( GLOWrare, {} )

				GLOWLengendary:completeAnimation()
				self.GLOWLengendary:setAlpha( 0 )
				self.clipFinished( GLOWLengendary, {} )
				local f222_local9 = function ( f239_arg0, f239_arg1 )
					local f239_local0 = function ( f240_arg0, f240_arg1 )
						if not f240_arg1.interrupted then
							f240_arg0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						end
						f240_arg0:setAlpha( 0 )
						if f240_arg1.interrupted then
							self.clipFinished( f240_arg0, f240_arg1 )
						else
							f240_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f239_arg1.interrupted then
						f239_local0( f239_arg0, f239_arg1 )
						return 
					else
						f239_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f239_arg0:setAlpha( 1 )
						f239_arg0:registerEventHandler( "transition_complete_keyframe", f239_local0 )
					end
				end
				
				GLOWEpic:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWEpic:setAlpha( 0 )
				GLOWEpic:registerEventHandler( "transition_complete_keyframe", f222_local9 )

				blurbox:completeAnimation()
				self.blurbox:setRGB( 1, 0.67, 0 )
				self.blurbox:setAlpha( 0 )
				self.blurbox:setScale( 1 )
				self.clipFinished( blurbox, {} )

				BMPixelFX:completeAnimation()
				self.BMPixelFX:setRGB( 1, 0.67, 0 )
				self.BMPixelFX:setAlpha( 0 )
				self.clipFinished( BMPixelFX, {} )

				BMPixel02FX:completeAnimation()
				self.BMPixel02FX:setRGB( 1, 0.67, 0 )
				self.BMPixel02FX:setAlpha( 0 )
				self.clipFinished( BMPixel02FX, {} )

				BMPixel03FX:completeAnimation()
				self.BMPixel03FX:setRGB( 1, 0.67, 0 )
				self.BMPixel03FX:setAlpha( 0 )
				self.clipFinished( BMPixel03FX, {} )

				BMPixel04FX:completeAnimation()
				self.BMPixel04FX:setRGB( 1, 0.67, 0 )
				self.BMPixel04FX:setAlpha( 0 )
				self.clipFinished( BMPixel04FX, {} )
				local BMPixel05FXFrame2 = function ( BMPixel05FX, event )
					if not event.interrupted then
						BMPixel05FX:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					BMPixel05FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel05FX, event )
					else
						BMPixel05FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel05FX:completeAnimation()
				self.BMPixel05FX:setAlpha( 1 )
				BMPixel05FXFrame2( BMPixel05FX, {} )
				local BMPixel06FXFrame2 = function ( BMPixel06FX, event )
					if not event.interrupted then
						BMPixel06FX:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					BMPixel06FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMPixel06FX, event )
					else
						BMPixel06FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMPixel06FX:completeAnimation()
				self.BMPixel06FX:setAlpha( 1 )
				BMPixel06FXFrame2( BMPixel06FX, {} )
				local LightLimitedFrame2 = function ( LightLimited, event )
					local LightLimitedFrame3 = function ( LightLimited, event )
						local LightLimitedFrame4 = function ( LightLimited, event )
							if not event.interrupted then
								LightLimited:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							end
							LightLimited:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( LightLimited, event )
							else
								LightLimited:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LightLimitedFrame4( LightLimited, event )
							return 
						else
							LightLimited:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							LightLimited:setAlpha( 1 )
							LightLimited:registerEventHandler( "transition_complete_keyframe", LightLimitedFrame4 )
						end
					end
					
					if event.interrupted then
						LightLimitedFrame3( LightLimited, event )
						return 
					else
						LightLimited:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						LightLimited:registerEventHandler( "transition_complete_keyframe", LightLimitedFrame3 )
					end
				end
				
				LightLimited:completeAnimation()
				self.LightLimited:setAlpha( 0 )
				LightLimitedFrame2( LightLimited, {} )

				EpicEmber5:completeAnimation()
				self.EpicEmber5:setAlpha( 0 )
				self.clipFinished( EpicEmber5, {} )

				EpicEmber4:completeAnimation()
				self.EpicEmber4:setAlpha( 0 )
				self.clipFinished( EpicEmber4, {} )

				EpicEmber3:completeAnimation()
				self.EpicEmber3:setAlpha( 0 )
				self.clipFinished( EpicEmber3, {} )

				EpicEmber2:completeAnimation()
				self.EpicEmber2:setAlpha( 0 )
				self.clipFinished( EpicEmber2, {} )

				EpicEmber1:completeAnimation()
				self.EpicEmber1:setAlpha( 0 )
				self.clipFinished( EpicEmber1, {} )
				local LimitedBackingFocusFrame2 = function ( LimitedBackingFocus, event )
					local LimitedBackingFocusFrame3 = function ( LimitedBackingFocus, event )
						local LimitedBackingFocusFrame4 = function ( LimitedBackingFocus, event )
							local LimitedBackingFocusFrame5 = function ( LimitedBackingFocus, event )
								local LimitedBackingFocusFrame6 = function ( LimitedBackingFocus, event )
									if not event.interrupted then
										LimitedBackingFocus:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
									end
									LimitedBackingFocus:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( LimitedBackingFocus, event )
									else
										LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									LimitedBackingFocusFrame6( LimitedBackingFocus, event )
									return 
								else
									LimitedBackingFocus:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
									LimitedBackingFocus:setAlpha( 1 )
									LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", LimitedBackingFocusFrame6 )
								end
							end
							
							if event.interrupted then
								LimitedBackingFocusFrame5( LimitedBackingFocus, event )
								return 
							else
								LimitedBackingFocus:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
								LimitedBackingFocus:setAlpha( 0.5 )
								LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", LimitedBackingFocusFrame5 )
							end
						end
						
						if event.interrupted then
							LimitedBackingFocusFrame4( LimitedBackingFocus, event )
							return 
						else
							LimitedBackingFocus:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							LimitedBackingFocus:setAlpha( 1 )
							LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", LimitedBackingFocusFrame4 )
						end
					end
					
					if event.interrupted then
						LimitedBackingFocusFrame3( LimitedBackingFocus, event )
						return 
					else
						LimitedBackingFocus:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", LimitedBackingFocusFrame3 )
					end
				end
				
				LimitedBackingFocus:completeAnimation()
				self.LimitedBackingFocus:setAlpha( 0 )
				LimitedBackingFocusFrame2( LimitedBackingFocus, {} )
				local f222_local14 = function ( f251_arg0, f251_arg1 )
					local f251_local0 = function ( f252_arg0, f252_arg1 )
						local f252_local0 = function ( f253_arg0, f253_arg1 )
							if not f253_arg1.interrupted then
								f253_arg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							end
							f253_arg0:setAlpha( 0 )
							f253_arg0:setScale( 1.5 )
							if f253_arg1.interrupted then
								self.clipFinished( f253_arg0, f253_arg1 )
							else
								f253_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f252_arg1.interrupted then
							f252_local0( f252_arg0, f252_arg1 )
							return 
						else
							f252_arg0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							f252_arg0:setAlpha( 0.41 )
							f252_arg0:setScale( 1.49 )
							f252_arg0:registerEventHandler( "transition_complete_keyframe", f252_local0 )
						end
					end
					
					if f251_arg1.interrupted then
						f251_local0( f251_arg0, f251_arg1 )
						return 
					else
						f251_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f251_arg0:setAlpha( 1 )
						f251_arg0:registerEventHandler( "transition_complete_keyframe", f251_local0 )
					end
				end
				
				LimitedWave1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				LimitedWave1:setAlpha( 0 )
				LimitedWave1:setScale( 1.39 )
				LimitedWave1:registerEventHandler( "transition_complete_keyframe", f222_local14 )
				local f222_local15 = function ( f254_arg0, f254_arg1 )
					local f254_local0 = function ( f255_arg0, f255_arg1 )
						local f255_local0 = function ( f256_arg0, f256_arg1 )
							if not f256_arg1.interrupted then
								f256_arg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
							end
							f256_arg0:setAlpha( 0 )
							f256_arg0:setScale( 1.6 )
							if f256_arg1.interrupted then
								self.clipFinished( f256_arg0, f256_arg1 )
							else
								f256_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f255_arg1.interrupted then
							f255_local0( f255_arg0, f255_arg1 )
							return 
						else
							f255_arg0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
							f255_arg0:setAlpha( 0.41 )
							f255_arg0:setScale( 1.34 )
							f255_arg0:registerEventHandler( "transition_complete_keyframe", f255_local0 )
						end
					end
					
					if f254_arg1.interrupted then
						f254_local0( f254_arg0, f254_arg1 )
						return 
					else
						f254_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f254_arg0:setAlpha( 1 )
						f254_arg0:registerEventHandler( "transition_complete_keyframe", f254_local0 )
					end
				end
				
				LimitedWave2:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				LimitedWave2:setAlpha( 0 )
				LimitedWave2:setScale( 1.3 )
				LimitedWave2:registerEventHandler( "transition_complete_keyframe", f222_local15 )
				local f222_local16 = function ( f257_arg0, f257_arg1 )
					local f257_local0 = function ( f258_arg0, f258_arg1 )
						local f258_local0 = function ( f259_arg0, f259_arg1 )
							local f259_local0 = function ( f260_arg0, f260_arg1 )
								if not f260_arg1.interrupted then
									f260_arg0:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
								end
								f260_arg0:setAlpha( 0 )
								f260_arg0:setScale( 1.5 )
								if f260_arg1.interrupted then
									self.clipFinished( f260_arg0, f260_arg1 )
								else
									f260_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f259_arg1.interrupted then
								f259_local0( f259_arg0, f259_arg1 )
								return 
							else
								f259_arg0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
								f259_arg0:setAlpha( 1 )
								f259_arg0:setScale( 1.11 )
								f259_arg0:registerEventHandler( "transition_complete_keyframe", f259_local0 )
							end
						end
						
						if f258_arg1.interrupted then
							f258_local0( f258_arg0, f258_arg1 )
							return 
						else
							f258_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
							f258_arg0:setAlpha( 0 )
							f258_arg0:registerEventHandler( "transition_complete_keyframe", f258_local0 )
						end
					end
					
					if f257_arg1.interrupted then
						f257_local0( f257_arg0, f257_arg1 )
						return 
					else
						f257_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
						f257_arg0:setAlpha( 1 )
						f257_arg0:registerEventHandler( "transition_complete_keyframe", f257_local0 )
					end
				end
				
				LimitedWave3:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				LimitedWave3:setAlpha( 0 )
				LimitedWave3:setScale( 1 )
				LimitedWave3:registerEventHandler( "transition_complete_keyframe", f222_local16 )
				local BMCircuits02FXFrame2 = function ( BMCircuits02FX, event )
					if not event.interrupted then
						BMCircuits02FX:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
					end
					BMCircuits02FX:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMCircuits02FX, event )
					else
						BMCircuits02FX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMCircuits02FX:completeAnimation()
				self.BMCircuits02FX:setAlpha( 1 )
				BMCircuits02FXFrame2( BMCircuits02FX, {} )

				BMCircuits01FX:completeAnimation()
				self.BMCircuits01FX:setAlpha( 1 )
				self.clipFinished( BMCircuits01FX, {} )

				epicSkull:completeAnimation()
				self.epicSkull:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_animated" ) )
				self.epicSkull:setShaderVector( 0, 27, 0, 0, 0 )
				self.epicSkull:setShaderVector( 1, 0, 0, 0, 0 )
				self.clipFinished( epicSkull, {} )

				BMFlyEmberFX:completeAnimation()
				self.BMFlyEmberFX:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX, {} )

				BMFlyEmberFX0:completeAnimation()
				self.BMFlyEmberFX0:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX0, {} )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				local f222_local18 = function ( f262_arg0, f262_arg1 )
					if not f262_arg1.interrupted then
						f262_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f262_arg0:setAlpha( 1 )
					if f262_arg1.interrupted then
						self.clipFinished( f262_arg0, f262_arg1 )
					else
						f262_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				BMTimeAndLootBanner:setAlpha( 0 )
				BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", f222_local18 )
				local f222_local19 = function ( f263_arg0, f263_arg1 )
					local f263_local0 = function ( f264_arg0, f264_arg1 )
						if not f264_arg1.interrupted then
							f264_arg0:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						end
						f264_arg0:setAlpha( 0 )
						if f264_arg1.interrupted then
							self.clipFinished( f264_arg0, f264_arg1 )
						else
							f264_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f263_arg1.interrupted then
						f263_local0( f263_arg0, f263_arg1 )
						return 
					else
						f263_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
						f263_arg0:setAlpha( 1 )
						f263_arg0:registerEventHandler( "transition_complete_keyframe", f263_local0 )
					end
				end
				
				Circuits:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				Circuits:setAlpha( 0 )
				Circuits:registerEventHandler( "transition_complete_keyframe", f222_local19 )
				local CircuitsBrightFrame2 = function ( CircuitsBright, event )
					local CircuitsBrightFrame3 = function ( CircuitsBright, event )
						local CircuitsBrightFrame4 = function ( CircuitsBright, event )
							local CircuitsBrightFrame5 = function ( CircuitsBright, event )
								if not event.interrupted then
									CircuitsBright:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
								end
								CircuitsBright:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CircuitsBright, event )
								else
									CircuitsBright:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CircuitsBrightFrame5( CircuitsBright, event )
								return 
							else
								CircuitsBright:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
								CircuitsBright:setAlpha( 0.75 )
								CircuitsBright:registerEventHandler( "transition_complete_keyframe", CircuitsBrightFrame5 )
							end
						end
						
						if event.interrupted then
							CircuitsBrightFrame4( CircuitsBright, event )
							return 
						else
							CircuitsBright:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							CircuitsBright:setAlpha( 1 )
							CircuitsBright:registerEventHandler( "transition_complete_keyframe", CircuitsBrightFrame4 )
						end
					end
					
					if event.interrupted then
						CircuitsBrightFrame3( CircuitsBright, event )
						return 
					else
						CircuitsBright:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						CircuitsBright:registerEventHandler( "transition_complete_keyframe", CircuitsBrightFrame3 )
					end
				end
				
				CircuitsBright:completeAnimation()
				self.CircuitsBright:setAlpha( 0 )
				CircuitsBrightFrame2( CircuitsBright, {} )
				local CircuitsBrightBlur1Frame2 = function ( CircuitsBrightBlur1, event )
					local CircuitsBrightBlur1Frame3 = function ( CircuitsBrightBlur1, event )
						local CircuitsBrightBlur1Frame4 = function ( CircuitsBrightBlur1, event )
							local CircuitsBrightBlur1Frame5 = function ( CircuitsBrightBlur1, event )
								if not event.interrupted then
									CircuitsBrightBlur1:beginAnimation( "keyframe", 369, false, false, CoD.TweenType.Linear )
								end
								CircuitsBrightBlur1:setAlpha( 0 )
								CircuitsBrightBlur1:setScale( 1.2 )
								if event.interrupted then
									self.clipFinished( CircuitsBrightBlur1, event )
								else
									CircuitsBrightBlur1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CircuitsBrightBlur1Frame5( CircuitsBrightBlur1, event )
								return 
							else
								CircuitsBrightBlur1:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
								CircuitsBrightBlur1:setScale( 1.05 )
								CircuitsBrightBlur1:registerEventHandler( "transition_complete_keyframe", CircuitsBrightBlur1Frame5 )
							end
						end
						
						if event.interrupted then
							CircuitsBrightBlur1Frame4( CircuitsBrightBlur1, event )
							return 
						else
							CircuitsBrightBlur1:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							CircuitsBrightBlur1:setAlpha( 1 )
							CircuitsBrightBlur1:registerEventHandler( "transition_complete_keyframe", CircuitsBrightBlur1Frame4 )
						end
					end
					
					if event.interrupted then
						CircuitsBrightBlur1Frame3( CircuitsBrightBlur1, event )
						return 
					else
						CircuitsBrightBlur1:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						CircuitsBrightBlur1:registerEventHandler( "transition_complete_keyframe", CircuitsBrightBlur1Frame3 )
					end
				end
				
				CircuitsBrightBlur1:completeAnimation()
				self.CircuitsBrightBlur1:setAlpha( 0 )
				self.CircuitsBrightBlur1:setScale( 1 )
				CircuitsBrightBlur1Frame2( CircuitsBrightBlur1, {} )
				local CircuitsBrightBlur2Frame2 = function ( CircuitsBrightBlur2, event )
					local CircuitsBrightBlur2Frame3 = function ( CircuitsBrightBlur2, event )
						local CircuitsBrightBlur2Frame4 = function ( CircuitsBrightBlur2, event )
							local CircuitsBrightBlur2Frame5 = function ( CircuitsBrightBlur2, event )
								if not event.interrupted then
									CircuitsBrightBlur2:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
								end
								CircuitsBrightBlur2:setAlpha( 0 )
								CircuitsBrightBlur2:setScale( 1.4 )
								if event.interrupted then
									self.clipFinished( CircuitsBrightBlur2, event )
								else
									CircuitsBrightBlur2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CircuitsBrightBlur2Frame5( CircuitsBrightBlur2, event )
								return 
							else
								CircuitsBrightBlur2:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
								CircuitsBrightBlur2:setAlpha( 0.93 )
								CircuitsBrightBlur2:setScale( 1.15 )
								CircuitsBrightBlur2:registerEventHandler( "transition_complete_keyframe", CircuitsBrightBlur2Frame5 )
							end
						end
						
						if event.interrupted then
							CircuitsBrightBlur2Frame4( CircuitsBrightBlur2, event )
							return 
						else
							CircuitsBrightBlur2:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							CircuitsBrightBlur2:setAlpha( 1 )
							CircuitsBrightBlur2:registerEventHandler( "transition_complete_keyframe", CircuitsBrightBlur2Frame4 )
						end
					end
					
					if event.interrupted then
						CircuitsBrightBlur2Frame3( CircuitsBrightBlur2, event )
						return 
					else
						CircuitsBrightBlur2:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
						CircuitsBrightBlur2:registerEventHandler( "transition_complete_keyframe", CircuitsBrightBlur2Frame3 )
					end
				end
				
				CircuitsBrightBlur2:completeAnimation()
				self.CircuitsBrightBlur2:setAlpha( 0 )
				self.CircuitsBrightBlur2:setScale( 1 )
				CircuitsBrightBlur2Frame2( CircuitsBrightBlur2, {} )
				local f222_local23 = function ( f277_arg0, f277_arg1 )
					local f277_local0 = function ( f278_arg0, f278_arg1 )
						local f278_local0 = function ( f279_arg0, f279_arg1 )
							local f279_local0 = function ( f280_arg0, f280_arg1 )
								if not f280_arg1.interrupted then
									f280_arg0:beginAnimation( "keyframe", 579, false, false, CoD.TweenType.Linear )
								end
								f280_arg0:setAlpha( 0 )
								if f280_arg1.interrupted then
									self.clipFinished( f280_arg0, f280_arg1 )
								else
									f280_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f279_arg1.interrupted then
								f279_local0( f279_arg0, f279_arg1 )
								return 
							else
								f279_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								f279_arg0:setAlpha( 0.7 )
								f279_arg0:registerEventHandler( "transition_complete_keyframe", f279_local0 )
							end
						end
						
						if f278_arg1.interrupted then
							f278_local0( f278_arg0, f278_arg1 )
							return 
						else
							f278_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f278_arg0:setAlpha( 0.4 )
							f278_arg0:registerEventHandler( "transition_complete_keyframe", f278_local0 )
						end
					end
					
					if f277_arg1.interrupted then
						f277_local0( f277_arg0, f277_arg1 )
						return 
					else
						f277_arg0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
						f277_arg0:setAlpha( 0.65 )
						f277_arg0:registerEventHandler( "transition_complete_keyframe", f277_local0 )
					end
				end
				
				LimitedBackglowFlash:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				LimitedBackglowFlash:setAlpha( 0 )
				LimitedBackglowFlash:registerEventHandler( "transition_complete_keyframe", f222_local23 )
			end
		},
		RevealedCommon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -83.43, 72.57 )
				self.FocusBar3:setTopBottom( true, false, 380.92, 406.92 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 1 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setAlpha( 0 )
				self.clipFinished( lootRarityTextWhite, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( true, false, -5, 249 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )

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

				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.clipFinished( BMTimeAndLootBanner, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 17 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 1 )
				self.CommonBacking:setScale( 1.08 )
				self.clipFinished( CommonBacking, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( true, false, -5, 249 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )
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

				LightRare:completeAnimation()
				self.LightRare:setAlpha( 0 )
				self.clipFinished( LightRare, {} )

				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.clipFinished( BMTimeAndLootBanner, {} )

				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 17 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -110, 110 )
					FocusBar3:setTopBottom( true, false, 350, 409 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -80, 80 )
				self.FocusBar3:setTopBottom( true, false, 364, 408 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )
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
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 146, 172 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 133, 159 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 98, 118 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 55, 75 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 35, 55 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
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
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 22, 52 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 29.5, 59.5 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
					BMTimeAndLootBanner:setScale( 1.08 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
				self.BMTimeAndLootBanner:setScale( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 17 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -80, 80 )
					FocusBar3:setTopBottom( true, false, 364, 408 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )
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
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 133, 159 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 89, 109 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 51, 71 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 31, 51 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
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
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 29.5, 59.5 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 22, 52 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
					BMTimeAndLootBanner:setScale( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )
			end
		},
		RevealedRare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 380, 406 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setLeftRight( true, true, -30, 29 )
				self.EpicBacking:setTopBottom( true, true, -22, 27 )
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 1 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.65, 0.88, 1 )
				self.BMLineLightFX:setAlpha( 1 )
				self.clipFinished( BMLineLightFX, {} )

				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setAlpha( 0 )
				self.clipFinished( BMTriangleLightFX, {} )

				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setAlpha( 0 )
				self.clipFinished( lootRarityTextWhite, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )

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
				self:setupElementClipCounter( 17 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 1 )
				self.RareBacking:setScale( 1.08 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.65, 0.88, 1 )
				self.BMLineLightFX:setAlpha( 1 )
				self.BMLineLightFX:setScale( 1.08 )
				self.clipFinished( BMLineLightFX, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )
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

				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
				self.clipFinished( BMTimeAndLootBanner, {} )

				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 19 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -110, 110 )
					FocusBar3:setTopBottom( true, false, 350, 409 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -80, 80 )
				self.FocusBar3:setTopBottom( true, false, 364, 408 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )
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

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )
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
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 146, 172 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 133, 159 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 98, 118 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 55, 75 )
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
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setRGB( 1, 1, 1 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 35, 55 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( true, false, -5, 249 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( true, false, -5, 249 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
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

				LightCommon:completeAnimation()
				self.LightCommon:setAlpha( 0 )
				self.clipFinished( LightCommon, {} )
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
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 22, 52 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 29.5, 59.5 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
					BMTimeAndLootBanner:setScale( 1.08 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
				self.BMTimeAndLootBanner:setScale( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 18 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -80, 80 )
					FocusBar3:setTopBottom( true, false, 364, 408 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.clipFinished( LegendaryBacking, {} )
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

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )
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
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 133, 159 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 89, 109 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 51, 71 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 31, 51 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
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
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 29.5, 59.5 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 22, 52 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
					BMTimeAndLootBanner:setScale( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0, 0.57, 0.82 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )
			end
		},
		RevealedLegendary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 39.07, 195.07 )
				self.FocusBar3:setTopBottom( true, false, 380.92, 406.92 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 0.86, 0.74, 1 )
				self.BMLineLightFX:setAlpha( 1 )
				self.clipFinished( BMLineLightFX, {} )

				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setLeftRight( false, false, -149.5, 150.5 )
				self.BMTriangleLightFX:setTopBottom( true, false, -22, 368 )
				self.BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.BMTriangleLightFX:setScale( 1 )
				self.clipFinished( BMTriangleLightFX, {} )

				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setAlpha( 0 )
				self.clipFinished( lootRarityTextWhite, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )

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

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 18 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 1 )
				self.LegendaryBacking:setScale( 1.08 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

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
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )
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

				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
				self.clipFinished( BMTimeAndLootBanner, {} )

				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 21 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -110, 110 )
					FocusBar3:setTopBottom( true, false, 350, 409 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -80, 80 )
				self.FocusBar3:setTopBottom( true, false, 364, 408 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )
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

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )
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
					BMTriangleLightFX:setAlpha( 0 )
					BMTriangleLightFX:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMTriangleLightFX, event )
					else
						BMTriangleLightFX:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
				self.BMTriangleLightFX:setAlpha( 0 )
				self.BMTriangleLightFX:setScale( 1 )
				BMTriangleLightFXFrame2( BMTriangleLightFX, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 146, 172 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 133, 159 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 98, 118 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 55, 75 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 35, 55 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( true, false, -5, 249 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( true, false, -5, 249 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
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

				LightCommon:completeAnimation()
				self.LightCommon:setAlpha( 0 )
				self.clipFinished( LightCommon, {} )

				LightRare:completeAnimation()
				self.LightRare:setAlpha( 0 )
				self.clipFinished( LightRare, {} )
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
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 22, 52 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 29.5, 59.5 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
					BMTimeAndLootBanner:setScale( 1.08 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
				self.BMTimeAndLootBanner:setScale( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 19 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -80, 80 )
					FocusBar3:setTopBottom( true, false, 364, 408 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )
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

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )
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
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 133, 159 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 89, 109 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 51, 71 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 31, 51 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
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
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 29.5, 59.5 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 22, 52 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
					BMTimeAndLootBanner:setScale( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 0.67, 0.2, 1 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )
			end
		},
		RevealedEpic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 25 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 39.07, 195.07 )
				self.FocusBar3:setTopBottom( true, false, 380.92, 406.92 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 1 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 1, 0.87, 0.61 )
				self.BMLineLightFX:setAlpha( 1 )
				self.clipFinished( BMLineLightFX, {} )

				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 1, 0.67, 0 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.clipFinished( BMTriangleLightFX, {} )

				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setAlpha( 0 )
				self.clipFinished( lootRarityTextWhite, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )

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

				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 0 )
				self.clipFinished( LightEpic, {} )

				BMFlyEmberFX:completeAnimation()
				self.BMFlyEmberFX:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX, {} )

				BMFlyEmberFX0:completeAnimation()
				self.BMFlyEmberFX0:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX0, {} )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 21 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 1 )
				self.EpicBacking:setScale( 1.08 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 1, 0.67, 0 )
				self.BMLineLightFX:setAlpha( 1 )
				self.BMLineLightFX:setScale( 1.08 )
				self.clipFinished( BMLineLightFX, {} )

				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setLeftRight( false, false, -150.5, 150.5 )
				self.BMTriangleLightFX:setTopBottom( true, false, -22, 369 )
				self.BMTriangleLightFX:setRGB( 1, 0.67, 0 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.BMTriangleLightFX:setScale( 1.08 )
				self.clipFinished( BMTriangleLightFX, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )

				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 0 )
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

				BMFlyEmberFX:completeAnimation()
				self.BMFlyEmberFX:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX, {} )

				BMFlyEmberFX0:completeAnimation()
				self.BMFlyEmberFX0:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX0, {} )

				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				self.clipFinished( BMTimeAndLootBanner, {} )

				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 20 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -110, 110 )
					FocusBar3:setTopBottom( true, false, 350, 409 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -80, 80 )
				self.FocusBar3:setTopBottom( true, false, 364, 408 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )
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
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 146, 172 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 133, 159 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 98, 118 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 55, 75 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 35, 55 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
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

				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 0 )
				self.LightLegendary:setScale( 1 )
				self.clipFinished( LightLegendary, {} )
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
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 22, 52 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 29.5, 59.5 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
					BMTimeAndLootBanner:setScale( 1.08 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
				self.BMTimeAndLootBanner:setScale( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 22 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -80, 80 )
					FocusBar3:setTopBottom( true, false, 364, 408 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				LimitedBacking:beginAnimation( "keyframe", 1279, false, false, CoD.TweenType.Linear )
				LimitedBacking:setAlpha( 0 )
				LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
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

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )
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
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 133, 159 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 90, 110 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 51, 71 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 31, 51 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
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

				BMFlyEmberFX:completeAnimation()
				self.BMFlyEmberFX:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX, {} )

				BMFlyEmberFX0:completeAnimation()
				self.BMFlyEmberFX0:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX0, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 29.5, 59.5 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 22, 52 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
					BMTimeAndLootBanner:setScale( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )
			end
		},
		RevealedLimited = {
			DefaultClip = function ()
				self:setupElementClipCounter( 34 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 39.07, 195.07 )
				self.FocusBar3:setTopBottom( true, false, 380.92, 406.92 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
				local LimitedBackglowFrame2 = function ( LimitedBackglow, event )
					local LimitedBackglowFrame3 = function ( LimitedBackglow, event )
						if not event.interrupted then
							LimitedBackglow:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						LimitedBackglow:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( LimitedBackglow, event )
						else
							LimitedBackglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LimitedBackglowFrame3( LimitedBackglow, event )
						return 
					else
						LimitedBackglow:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						LimitedBackglow:setAlpha( 1 )
						LimitedBackglow:registerEventHandler( "transition_complete_keyframe", LimitedBackglowFrame3 )
					end
				end
				
				LimitedBackglow:completeAnimation()
				self.LimitedBackglow:setAlpha( 0.5 )
				LimitedBackglowFrame2( LimitedBackglow, {} )

				LimitedBacking:completeAnimation()
				self.LimitedBacking:setAlpha( 1 )
				self.clipFinished( LimitedBacking, {} )

				LimitedBackingGlint:completeAnimation()
				self.LimitedBackingGlint:setAlpha( 1 )
				self.clipFinished( LimitedBackingGlint, {} )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 1, 0.87, 0.61 )
				self.BMLineLightFX:setAlpha( 1 )
				self.clipFinished( BMLineLightFX, {} )

				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setRGB( 1, 0.67, 0 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.clipFinished( BMTriangleLightFX, {} )

				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setLeftRight( true, true, 0, -1 )
				self.lootRarityTextWhite:setTopBottom( false, false, 134, 160 )
				self.lootRarityTextWhite:setRGB( 1, 1, 1 )
				self.lootRarityTextWhite:setAlpha( 1 )
				self.lootRarityTextWhite:setScale( 1 )
				self.clipFinished( lootRarityTextWhite, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setRGB( 0, 0, 0 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )

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

				BMPixel05FX:completeAnimation()
				self.BMPixel05FX:setAlpha( 1 )
				self.clipFinished( BMPixel05FX, {} )

				BMPixel06FX:completeAnimation()
				self.BMPixel06FX:setAlpha( 1 )
				self.clipFinished( BMPixel06FX, {} )

				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 0 )
				self.clipFinished( LightEpic, {} )

				LightLimited:completeAnimation()
				self.LightLimited:setAlpha( 0 )
				self.clipFinished( LightLimited, {} )

				LimitedBackingFocus:completeAnimation()
				self.LimitedBackingFocus:setAlpha( 0 )
				self.clipFinished( LimitedBackingFocus, {} )

				BMCircuits02FX:completeAnimation()
				self.BMCircuits02FX:setAlpha( 1 )
				self.clipFinished( BMCircuits02FX, {} )

				BMCircuits01FX:completeAnimation()
				self.BMCircuits01FX:setAlpha( 0 )
				self.clipFinished( BMCircuits01FX, {} )

				BMFlyEmberFX:completeAnimation()
				self.BMFlyEmberFX:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX, {} )

				BMFlyEmberFX0:completeAnimation()
				self.BMFlyEmberFX0:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX0, {} )

				itemHintText:completeAnimation()
				self.itemHintText:setAlpha( 0 )
				self.clipFinished( itemHintText, {} )
				local CircuitsFrame2 = function ( Circuits, event )
					local CircuitsFrame3 = function ( Circuits, event )
						if not event.interrupted then
							Circuits:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
						end
						Circuits:setAlpha( 0.25 )
						if event.interrupted then
							self.clipFinished( Circuits, event )
						else
							Circuits:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CircuitsFrame3( Circuits, event )
						return 
					else
						Circuits:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Circuits:setAlpha( 1 )
						Circuits:registerEventHandler( "transition_complete_keyframe", CircuitsFrame3 )
					end
				end
				
				Circuits:completeAnimation()
				self.Circuits:setAlpha( 0.25 )
				CircuitsFrame2( Circuits, {} )

				self.nextClip = "DefaultClip"
			end,
			Focus = function ()
				self:setupElementClipCounter( 32 )

				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
				local LimitedBackglowFrame2 = function ( LimitedBackglow, event )
					local LimitedBackglowFrame3 = function ( LimitedBackglow, event )
						if not event.interrupted then
							LimitedBackglow:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						LimitedBackglow:setAlpha( 1 )
						LimitedBackglow:setScale( 1.6 )
						if event.interrupted then
							self.clipFinished( LimitedBackglow, event )
						else
							LimitedBackglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LimitedBackglowFrame3( LimitedBackglow, event )
						return 
					else
						LimitedBackglow:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						LimitedBackglow:setAlpha( 0.5 )
						LimitedBackglow:registerEventHandler( "transition_complete_keyframe", LimitedBackglowFrame3 )
					end
				end
				
				LimitedBackglow:completeAnimation()
				self.LimitedBackglow:setAlpha( 1 )
				self.LimitedBackglow:setScale( 1.6 )
				LimitedBackglowFrame2( LimitedBackglow, {} )

				LimitedBacking:completeAnimation()
				self.LimitedBacking:setAlpha( 1 )
				self.LimitedBacking:setScale( 1.08 )
				self.clipFinished( LimitedBacking, {} )

				LimitedBackingGlint:completeAnimation()
				self.LimitedBackingGlint:setAlpha( 1 )
				self.LimitedBackingGlint:setScale( 1.08 )
				self.clipFinished( LimitedBackingGlint, {} )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )

				BMLineLightFX:completeAnimation()
				self.BMLineLightFX:setRGB( 1, 0.67, 0 )
				self.BMLineLightFX:setAlpha( 1 )
				self.BMLineLightFX:setScale( 1.08 )
				self.clipFinished( BMLineLightFX, {} )

				BMTriangleLightFX:completeAnimation()
				self.BMTriangleLightFX:setLeftRight( false, false, -150.5, 150.5 )
				self.BMTriangleLightFX:setTopBottom( true, false, -22, 369 )
				self.BMTriangleLightFX:setRGB( 1, 0.67, 0 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.BMTriangleLightFX:setScale( 1.08 )
				self.clipFinished( BMTriangleLightFX, {} )

				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setLeftRight( true, true, 0, -1 )
				self.lootRarityTextWhite:setTopBottom( false, false, 147, 173 )
				self.lootRarityTextWhite:setAlpha( 1 )
				self.lootRarityTextWhite:setScale( 1.08 )
				self.clipFinished( lootRarityTextWhite, {} )

				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setRGB( 0, 0, 0 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				self.clipFinished( lootRarityText, {} )

				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				self.clipFinished( lootRaritySet, {} )

				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				self.clipFinished( lootCategory, {} )

				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				self.clipFinished( lootName, {} )

				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( true, false, -5, 249 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				self.clipFinished( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )

				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1.08 )
				self.clipFinished( BMLockItem, {} )

				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )

				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 0 )
				self.LightLegendary:setScale( 1.08 )
				self.clipFinished( LightLegendary, {} )

				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 0 )
				self.LightEpic:setScale( 1.08 )
				self.clipFinished( LightEpic, {} )
				local LightLimitedFrame2 = function ( LightLimited, event )
					local LightLimitedFrame3 = function ( LightLimited, event )
						if not event.interrupted then
							LightLimited:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						LightLimited:setAlpha( 1 )
						LightLimited:setScale( 1.08 )
						if event.interrupted then
							self.clipFinished( LightLimited, event )
						else
							LightLimited:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LightLimitedFrame3( LightLimited, event )
						return 
					else
						LightLimited:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						LightLimited:setAlpha( 0.65 )
						LightLimited:registerEventHandler( "transition_complete_keyframe", LightLimitedFrame3 )
					end
				end
				
				LightLimited:completeAnimation()
				self.LightLimited:setAlpha( 1 )
				self.LightLimited:setScale( 1.08 )
				LightLimitedFrame2( LightLimited, {} )
				local LimitedBackingFocusFrame2 = function ( LimitedBackingFocus, event )
					local LimitedBackingFocusFrame3 = function ( LimitedBackingFocus, event )
						if not event.interrupted then
							LimitedBackingFocus:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						LimitedBackingFocus:setAlpha( 1 )
						LimitedBackingFocus:setScale( 1.08 )
						if event.interrupted then
							self.clipFinished( LimitedBackingFocus, event )
						else
							LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LimitedBackingFocusFrame3( LimitedBackingFocus, event )
						return 
					else
						LimitedBackingFocus:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						LimitedBackingFocus:setAlpha( 0.75 )
						LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", LimitedBackingFocusFrame3 )
					end
				end
				
				LimitedBackingFocus:completeAnimation()
				self.LimitedBackingFocus:setAlpha( 1 )
				self.LimitedBackingFocus:setScale( 1.08 )
				LimitedBackingFocusFrame2( LimitedBackingFocus, {} )

				LimitedWave1:completeAnimation()
				self.LimitedWave1:setAlpha( 0 )
				self.clipFinished( LimitedWave1, {} )

				LimitedWave2:completeAnimation()
				self.LimitedWave2:setAlpha( 0 )
				self.clipFinished( LimitedWave2, {} )

				LimitedWave3:completeAnimation()
				self.LimitedWave3:setAlpha( 0 )
				self.clipFinished( LimitedWave3, {} )

				BMCircuits02FX:completeAnimation()
				self.BMCircuits02FX:setAlpha( 0 )
				self.clipFinished( BMCircuits02FX, {} )

				BMCircuits01FX:completeAnimation()
				self.BMCircuits01FX:setAlpha( 0 )
				self.clipFinished( BMCircuits01FX, {} )

				BMFlyEmberFX:completeAnimation()
				self.BMFlyEmberFX:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX, {} )

				BMFlyEmberFX0:completeAnimation()
				self.BMFlyEmberFX0:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX0, {} )

				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				self.clipFinished( BMTimeAndLootBanner, {} )

				Circuits:completeAnimation()
				self.Circuits:setAlpha( 0.25 )
				self.clipFinished( Circuits, {} )

				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 28 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -110, 110 )
					FocusBar3:setTopBottom( true, false, 350, 409 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -80, 80 )
				self.FocusBar3:setTopBottom( true, false, 364, 408 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				local LimitedBackglowFrame2 = function ( LimitedBackglow, event )
					if not event.interrupted then
						LimitedBackglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LimitedBackglow:setAlpha( 1 )
					LimitedBackglow:setScale( 1.6 )
					if event.interrupted then
						self.clipFinished( LimitedBackglow, event )
					else
						LimitedBackglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LimitedBackglow:completeAnimation()
				self.LimitedBackglow:setAlpha( 0 )
				self.LimitedBackglow:setScale( 1.55 )
				LimitedBackglowFrame2( LimitedBackglow, {} )
				local LimitedBackingFrame2 = function ( LimitedBacking, event )
					if not event.interrupted then
						LimitedBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LimitedBacking:setAlpha( 1 )
					LimitedBacking:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LimitedBacking, event )
					else
						LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LimitedBacking:completeAnimation()
				self.LimitedBacking:setAlpha( 1 )
				self.LimitedBacking:setScale( 1 )
				LimitedBackingFrame2( LimitedBacking, {} )
				local LimitedBackingGlintFrame2 = function ( LimitedBackingGlint, event )
					if not event.interrupted then
						LimitedBackingGlint:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LimitedBackingGlint:setAlpha( 1 )
					LimitedBackingGlint:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LimitedBackingGlint, event )
					else
						LimitedBackingGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LimitedBackingGlint:completeAnimation()
				self.LimitedBackingGlint:setAlpha( 1 )
				self.LimitedBackingGlint:setScale( 1 )
				LimitedBackingGlintFrame2( LimitedBackingGlint, {} )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )
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
				local lootRarityTextWhiteFrame2 = function ( lootRarityTextWhite, event )
					if not event.interrupted then
						lootRarityTextWhite:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityTextWhite:setLeftRight( true, true, 0, -1 )
					lootRarityTextWhite:setTopBottom( false, false, 147, 173 )
					lootRarityTextWhite:setAlpha( 1 )
					lootRarityTextWhite:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityTextWhite, event )
					else
						lootRarityTextWhite:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setLeftRight( true, true, 0, -1 )
				self.lootRarityTextWhite:setTopBottom( false, false, 134, 160 )
				self.lootRarityTextWhite:setAlpha( 1 )
				self.lootRarityTextWhite:setScale( 1 )
				lootRarityTextWhiteFrame2( lootRarityTextWhite, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 146, 172 )
					lootRarityText:setRGB( 0, 0, 0 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 133, 159 )
				self.lootRarityText:setRGB( 0, 0, 0 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 98, 118 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 55, 75 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 35, 55 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
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

				LightLegendary:completeAnimation()
				self.LightLegendary:setAlpha( 0 )
				self.LightLegendary:setScale( 1 )
				self.clipFinished( LightLegendary, {} )

				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 0 )
				self.LightEpic:setScale( 1 )
				self.clipFinished( LightEpic, {} )
				local LightLimitedFrame2 = function ( LightLimited, event )
					if not event.interrupted then
						LightLimited:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightLimited:setAlpha( 1 )
					LightLimited:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LightLimited, event )
					else
						LightLimited:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightLimited:completeAnimation()
				self.LightLimited:setAlpha( 0 )
				self.LightLimited:setScale( 1 )
				LightLimitedFrame2( LightLimited, {} )
				local LimitedBackingFocusFrame2 = function ( LimitedBackingFocus, event )
					if not event.interrupted then
						LimitedBackingFocus:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LimitedBackingFocus:setAlpha( 1 )
					LimitedBackingFocus:setScale( 1.08 )
					if event.interrupted then
						self.clipFinished( LimitedBackingFocus, event )
					else
						LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LimitedBackingFocus:completeAnimation()
				self.LimitedBackingFocus:setAlpha( 0 )
				self.LimitedBackingFocus:setScale( 1 )
				LimitedBackingFocusFrame2( LimitedBackingFocus, {} )

				BMCircuits02FX:completeAnimation()
				self.BMCircuits02FX:setAlpha( 0 )
				self.clipFinished( BMCircuits02FX, {} )

				BMCircuits01FX:completeAnimation()
				self.BMCircuits01FX:setAlpha( 0 )
				self.clipFinished( BMCircuits01FX, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 22, 52 )
					itemHintText:setAlpha( 1 )
					itemHintText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 29.5, 59.5 )
				self.itemHintText:setAlpha( 0 )
				self.itemHintText:setScale( 0.7 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
					BMTimeAndLootBanner:setScale( 1.08 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
				self.BMTimeAndLootBanner:setScale( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )

				Circuits:completeAnimation()
				self.Circuits:setAlpha( 0.25 )
				self.clipFinished( Circuits, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 30 )

				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -80, 80 )
					FocusBar3:setTopBottom( true, false, 364, 408 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -110, 110 )
				self.FocusBar3:setTopBottom( true, false, 350, 409 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
				local LimitedBackglowFrame2 = function ( LimitedBackglow, event )
					if not event.interrupted then
						LimitedBackglow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LimitedBackglow:setAlpha( 0 )
					LimitedBackglow:setScale( 1.55 )
					if event.interrupted then
						self.clipFinished( LimitedBackglow, event )
					else
						LimitedBackglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LimitedBackglow:completeAnimation()
				self.LimitedBackglow:setAlpha( 1 )
				self.LimitedBackglow:setScale( 1.6 )
				LimitedBackglowFrame2( LimitedBackglow, {} )
				local LimitedBackingFrame2 = function ( LimitedBacking, event )
					if not event.interrupted then
						LimitedBacking:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LimitedBacking:setAlpha( 1 )
					LimitedBacking:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LimitedBacking, event )
					else
						LimitedBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LimitedBacking:completeAnimation()
				self.LimitedBacking:setAlpha( 1 )
				self.LimitedBacking:setScale( 1.08 )
				LimitedBackingFrame2( LimitedBacking, {} )
				local LimitedBackingGlintFrame2 = function ( LimitedBackingGlint, event )
					if not event.interrupted then
						LimitedBackingGlint:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LimitedBackingGlint:setAlpha( 1 )
					LimitedBackingGlint:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LimitedBackingGlint, event )
					else
						LimitedBackingGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LimitedBackingGlint:completeAnimation()
				self.LimitedBackingGlint:setAlpha( 1 )
				self.LimitedBackingGlint:setScale( 1.08 )
				LimitedBackingGlintFrame2( LimitedBackingGlint, {} )

				EpicBacking:completeAnimation()
				self.EpicBacking:setAlpha( 0 )
				self.clipFinished( EpicBacking, {} )

				LegendaryBacking:completeAnimation()
				self.LegendaryBacking:setAlpha( 0 )
				self.LegendaryBacking:setScale( 1 )
				self.clipFinished( LegendaryBacking, {} )

				RareBacking:completeAnimation()
				self.RareBacking:setAlpha( 0 )
				self.RareBacking:setScale( 1 )
				self.clipFinished( RareBacking, {} )

				CommonBacking:completeAnimation()
				self.CommonBacking:setAlpha( 0 )
				self.CommonBacking:setScale( 1 )
				self.clipFinished( CommonBacking, {} )
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
				local lootRarityTextWhiteFrame2 = function ( lootRarityTextWhite, event )
					if not event.interrupted then
						lootRarityTextWhite:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityTextWhite:setLeftRight( true, true, 0, -1 )
					lootRarityTextWhite:setTopBottom( false, false, 134, 160 )
					lootRarityTextWhite:setAlpha( 1 )
					lootRarityTextWhite:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityTextWhite, event )
					else
						lootRarityTextWhite:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityTextWhite:completeAnimation()
				self.lootRarityTextWhite:setLeftRight( true, true, 0, -1 )
				self.lootRarityTextWhite:setTopBottom( false, false, 147, 173 )
				self.lootRarityTextWhite:setAlpha( 1 )
				self.lootRarityTextWhite:setScale( 1.08 )
				lootRarityTextWhiteFrame2( lootRarityTextWhite, {} )
				local lootRarityTextFrame2 = function ( lootRarityText, event )
					if not event.interrupted then
						lootRarityText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRarityText:setLeftRight( true, true, 0, -1 )
					lootRarityText:setTopBottom( false, false, 133, 159 )
					lootRarityText:setRGB( 0, 0, 0 )
					lootRarityText:setAlpha( 1 )
					lootRarityText:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRarityText, event )
					else
						lootRarityText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:completeAnimation()
				self.lootRarityText:setLeftRight( true, true, 0, -1 )
				self.lootRarityText:setTopBottom( false, false, 146, 172 )
				self.lootRarityText:setRGB( 0, 0, 0 )
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1.08 )
				lootRarityTextFrame2( lootRarityText, {} )
				local lootRaritySetFrame2 = function ( lootRaritySet, event )
					if not event.interrupted then
						lootRaritySet:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootRaritySet:setLeftRight( true, true, 0, 0 )
					lootRaritySet:setTopBottom( false, false, 90, 110 )
					lootRaritySet:setAlpha( 1 )
					lootRaritySet:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootRaritySet, event )
					else
						lootRaritySet:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 98, 118 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1.08 )
				lootRaritySetFrame2( lootRaritySet, {} )
				local lootCategoryFrame2 = function ( lootCategory, event )
					if not event.interrupted then
						lootCategory:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootCategory:setLeftRight( true, true, -1, 0 )
					lootCategory:setTopBottom( false, false, 51, 71 )
					lootCategory:setAlpha( 1 )
					lootCategory:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootCategory, event )
					else
						lootCategory:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 55, 75 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1.08 )
				lootCategoryFrame2( lootCategory, {} )
				local lootNameFrame2 = function ( lootName, event )
					if not event.interrupted then
						lootName:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					lootName:setLeftRight( true, true, -1, 0 )
					lootName:setTopBottom( false, false, 31, 51 )
					lootName:setAlpha( 1 )
					lootName:setScale( 1 )
					if event.interrupted then
						self.clipFinished( lootName, event )
					else
						lootName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 35, 55 )
				self.lootName:setAlpha( 1 )
				self.lootName:setScale( 1.08 )
				lootNameFrame2( lootName, {} )
				local LootDecryptionImageFrame2 = function ( LootDecryptionImage, event )
					if not event.interrupted then
						LootDecryptionImage:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionImage:setLeftRight( true, false, -5, 249 )
					LootDecryptionImage:setTopBottom( true, false, -57, 292 )
					LootDecryptionImage:setAlpha( 1 )
					LootDecryptionImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionImage, event )
					else
						LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:completeAnimation()
				self.LootDecryptionImage:setLeftRight( true, false, -5, 249 )
				self.LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				self.LootDecryptionImage:setAlpha( 1 )
				self.LootDecryptionImage:setScale( 1.08 )
				LootDecryptionImageFrame2( LootDecryptionImage, {} )

				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local BMLockItemFrame2 = function ( BMLockItem, event )
					if not event.interrupted then
						BMLockItem:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMLockItem:setLeftRight( true, true, 0, -0.94 )
					BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
					BMLockItem:setAlpha( 1 )
					BMLockItem:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BMLockItem, event )
					else
						BMLockItem:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMLockItem:completeAnimation()
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 253.56, -39.44 )
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

				LightEpic:completeAnimation()
				self.LightEpic:setAlpha( 0 )
				self.LightEpic:setScale( 1.08 )
				self.clipFinished( LightEpic, {} )
				local LightLimitedFrame2 = function ( LightLimited, event )
					if not event.interrupted then
						LightLimited:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LightLimited:setAlpha( 0 )
					LightLimited:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LightLimited, event )
					else
						LightLimited:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LightLimited:completeAnimation()
				self.LightLimited:setAlpha( 1 )
				self.LightLimited:setScale( 1.08 )
				LightLimitedFrame2( LightLimited, {} )
				local LimitedBackingFocusFrame2 = function ( LimitedBackingFocus, event )
					if not event.interrupted then
						LimitedBackingFocus:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					LimitedBackingFocus:setAlpha( 0 )
					LimitedBackingFocus:setScale( 1 )
					if event.interrupted then
						self.clipFinished( LimitedBackingFocus, event )
					else
						LimitedBackingFocus:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LimitedBackingFocus:completeAnimation()
				self.LimitedBackingFocus:setAlpha( 1 )
				self.LimitedBackingFocus:setScale( 1.08 )
				LimitedBackingFocusFrame2( LimitedBackingFocus, {} )

				BMCircuits02FX:completeAnimation()
				self.BMCircuits02FX:setAlpha( 0 )
				self.clipFinished( BMCircuits02FX, {} )

				BMCircuits01FX:completeAnimation()
				self.BMCircuits01FX:setAlpha( 0 )
				self.clipFinished( BMCircuits01FX, {} )

				BMFlyEmberFX:completeAnimation()
				self.BMFlyEmberFX:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX, {} )

				BMFlyEmberFX0:completeAnimation()
				self.BMFlyEmberFX0:setAlpha( 0 )
				self.clipFinished( BMFlyEmberFX0, {} )
				local itemHintTextFrame2 = function ( itemHintText, event )
					if not event.interrupted then
						itemHintText:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					itemHintText:setLeftRight( false, false, -82, 82 )
					itemHintText:setTopBottom( false, true, 29.5, 59.5 )
					itemHintText:setAlpha( 0 )
					itemHintText:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( itemHintText, event )
					else
						itemHintText:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				itemHintText:completeAnimation()
				self.itemHintText:setLeftRight( false, false, -82, 82 )
				self.itemHintText:setTopBottom( false, true, 22, 52 )
				self.itemHintText:setAlpha( 1 )
				self.itemHintText:setScale( 1 )
				itemHintTextFrame2( itemHintText, {} )
				local BMTimeAndLootBannerFrame2 = function ( BMTimeAndLootBanner, event )
					if not event.interrupted then
						BMTimeAndLootBanner:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
						BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:beginAnimation( "subkeyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
					BMTimeAndLootBanner:setTopBottom( true, false, 3, 41 )
					BMTimeAndLootBanner:setScale( 1 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 0 )
					BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
					if event.interrupted then
						self.clipFinished( BMTimeAndLootBanner, event )
					else
						BMTimeAndLootBanner:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMTimeAndLootBanner:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount:completeAnimation()

				BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:completeAnimation()
				self.BMTimeAndLootBanner:setLeftRight( true, false, -2, 245 )
				self.BMTimeAndLootBanner:setTopBottom( true, false, -10, 33 )
				self.BMTimeAndLootBanner:setScale( 1.08 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount:setAlpha( 1 )
				self.BMTimeAndLootBanner.BMDateTimeAndTotalCount.dateTimeReceived:setRGB( 1, 0.67, 0 )
				BMTimeAndLootBannerFrame2( BMTimeAndLootBanner, {} )

				Circuits:completeAnimation()
				self.Circuits:setAlpha( 0.25 )
				self.clipFinished( Circuits, {} )
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
		},
		{
			stateName = "RevealedLimited",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "rarityName", "MPUI_BM_LIMITED" ) and IsSelfModelValueTrue( element, controller, "reveal" )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fxGlitch1800:close()
		element.fxGlitch1700:close()
		element.fxGlitch1600:close()
		element.fxGlitch1500:close()
		element.fxGlitch1400:close()
		element.fxGlitch1300:close()
		element.fxGlitch1200:close()
		element.fxGlitch1100:close()
		element.BMLineLightFX:close()
		element.BMTriangleLightFX:close()
		element.LootDecryptionImage:close()
		element.LootDecryptionFakeImageCycle:close()
		element.BMLockItem:close()
		element.BMPixelFX:close()
		element.BMPixel02FX:close()
		element.BMPixel03FX:close()
		element.BMPixel04FX:close()
		element.BMPixel05FX:close()
		element.BMPixel06FX:close()
		element.BMCircuits02FX:close()
		element.BMCircuits01FX:close()
		element.BMFlyEmberFX:close()
		element.BMFlyEmberFX0:close()
		element.itemHintText:close()
		element.BMTimeAndLootBanner:close()
		element.lootRarityTextWhite:close()
		element.lootRarityText:close()
		element.lootRaritySet:close()
		element.lootCategory:close()
		element.lootName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
