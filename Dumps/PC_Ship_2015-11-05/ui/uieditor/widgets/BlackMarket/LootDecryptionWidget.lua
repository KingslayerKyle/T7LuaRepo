require( "ui.uieditor.widgets.BlackMarket.BM_FocusGlow" )
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
require( "ui.uieditor.widgets.BlackMarket.BM_FlyEmberFX" )

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
	
	local BMFocusGlow = CoD.BM_FocusGlow.new( menu, controller )
	BMFocusGlow:setLeftRight( false, false, -201.47, 191.7 )
	BMFocusGlow:setTopBottom( false, true, -378.44, 169.69 )
	BMFocusGlow:setAlpha( 0 )
	self:addElement( BMFocusGlow )
	self.BMFocusGlow = BMFocusGlow
	
	local FocusBar3 = LUI.UIImage.new()
	FocusBar3:setLeftRight( false, false, -83.43, 72.57 )
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
			lootRarityText:setText( Engine.Localize( LocalizeToUpperString( rarityName ) ) )
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
			lootCategory:setText( Engine.Localize( LocalizeToUpperString( categoryName ) ) )
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
			lootName:setText( Engine.Localize( LocalizeToUpperString( displayText ) ) )
		end
	end )
	self:addElement( lootName )
	self.lootName = lootName
	
	local LootDecryptionImage = CoD.LootDecryptionImage.new( menu, controller )
	LootDecryptionImage:setLeftRight( true, false, -5, 249 )
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
	GLOWrare:setLeftRight( true, true, -66, 66 )
	GLOWrare:setTopBottom( true, true, -64, 68.5 )
	GLOWrare:setAlpha( 0 )
	GLOWrare:setImage( RegisterImage( "uie_t7_blackmarket_backing_glow100" ) )
	self:addElement( GLOWrare )
	self.GLOWrare = GLOWrare
	
	local GLOWLengendary = LUI.UIImage.new()
	GLOWLengendary:setLeftRight( true, true, -69, 69 )
	GLOWLengendary:setTopBottom( true, true, -64, 70 )
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
	GLOWcommon:setTopBottom( true, true, -60, 66 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )
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
			end,
			StartFuzz = function ()
				self:setupElementClipCounter( 17 )
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
				local f15_local1 = function ( f49_arg0, f49_arg1 )
					local f49_local0 = function ( f50_arg0, f50_arg1 )
						local f50_local0 = function ( f51_arg0, f51_arg1 )
							local f51_local0 = function ( f52_arg0, f52_arg1 )
								local f52_local0 = function ( f53_arg0, f53_arg1 )
									local f53_local0 = function ( f54_arg0, f54_arg1 )
										local f54_local0 = function ( f55_arg0, f55_arg1 )
											local f55_local0 = function ( f56_arg0, f56_arg1 )
												local f56_local0 = function ( f57_arg0, f57_arg1 )
													local f57_local0 = function ( f58_arg0, f58_arg1 )
														local f58_local0 = function ( f59_arg0, f59_arg1 )
															local f59_local0 = function ( f60_arg0, f60_arg1 )
																local f60_local0 = function ( f61_arg0, f61_arg1 )
																	local f61_local0 = function ( f62_arg0, f62_arg1 )
																		local f62_local0 = function ( f63_arg0, f63_arg1 )
																			if not f63_arg1.interrupted then
																				f63_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			end
																			f63_arg0:setAlpha( 0 )
																			if f63_arg1.interrupted then
																				self.clipFinished( f63_arg0, f63_arg1 )
																			else
																				f63_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
																			end
																		end
																		
																		if f62_arg1.interrupted then
																			f62_local0( f62_arg0, f62_arg1 )
																			return 
																		else
																			f62_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																			f62_arg0:setAlpha( 0.16 )
																			f62_arg0:registerEventHandler( "transition_complete_keyframe", f62_local0 )
																		end
																	end
																	
																	if f61_arg1.interrupted then
																		f61_local0( f61_arg0, f61_arg1 )
																		return 
																	else
																		f61_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
																		f61_arg0:setAlpha( 0.19 )
																		f61_arg0:registerEventHandler( "transition_complete_keyframe", f61_local0 )
																	end
																end
																
																if f60_arg1.interrupted then
																	f60_local0( f60_arg0, f60_arg1 )
																	return 
																else
																	f60_arg0:beginAnimation( "keyframe", 179, false, false, CoD.TweenType.Linear )
																	f60_arg0:registerEventHandler( "transition_complete_keyframe", f60_local0 )
																end
															end
															
															if f59_arg1.interrupted then
																f59_local0( f59_arg0, f59_arg1 )
																return 
															else
																f59_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
																f59_arg0:setAlpha( 0 )
																f59_arg0:registerEventHandler( "transition_complete_keyframe", f59_local0 )
															end
														end
														
														if f58_arg1.interrupted then
															f58_local0( f58_arg0, f58_arg1 )
															return 
														else
															f58_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
															f58_arg0:setAlpha( 0.51 )
															f58_arg0:registerEventHandler( "transition_complete_keyframe", f58_local0 )
														end
													end
													
													if f57_arg1.interrupted then
														f57_local0( f57_arg0, f57_arg1 )
														return 
													else
														f57_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														f57_arg0:setAlpha( 1 )
														f57_arg0:registerEventHandler( "transition_complete_keyframe", f57_local0 )
													end
												end
												
												if f56_arg1.interrupted then
													f56_local0( f56_arg0, f56_arg1 )
													return 
												else
													f56_arg0:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
													f56_arg0:registerEventHandler( "transition_complete_keyframe", f56_local0 )
												end
											end
											
											if f55_arg1.interrupted then
												f55_local0( f55_arg0, f55_arg1 )
												return 
											else
												f55_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												f55_arg0:setAlpha( 0 )
												f55_arg0:registerEventHandler( "transition_complete_keyframe", f55_local0 )
											end
										end
										
										if f54_arg1.interrupted then
											f54_local0( f54_arg0, f54_arg1 )
											return 
										else
											f54_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
											f54_arg0:registerEventHandler( "transition_complete_keyframe", f54_local0 )
										end
									end
									
									if f53_arg1.interrupted then
										f53_local0( f53_arg0, f53_arg1 )
										return 
									else
										f53_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										f53_arg0:setAlpha( 1 )
										f53_arg0:registerEventHandler( "transition_complete_keyframe", f53_local0 )
									end
								end
								
								if f52_arg1.interrupted then
									f52_local0( f52_arg0, f52_arg1 )
									return 
								else
									f52_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
									f52_arg0:registerEventHandler( "transition_complete_keyframe", f52_local0 )
								end
							end
							
							if f51_arg1.interrupted then
								f51_local0( f51_arg0, f51_arg1 )
								return 
							else
								f51_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								f51_arg0:setAlpha( 0 )
								f51_arg0:registerEventHandler( "transition_complete_keyframe", f51_local0 )
							end
						end
						
						if f50_arg1.interrupted then
							f50_local0( f50_arg0, f50_arg1 )
							return 
						else
							f50_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f50_arg0:setAlpha( 0.16 )
							f50_arg0:registerEventHandler( "transition_complete_keyframe", f50_local0 )
						end
					end
					
					if f49_arg1.interrupted then
						f49_local0( f49_arg0, f49_arg1 )
						return 
					else
						f49_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f49_arg0:setAlpha( 0.19 )
						f49_arg0:registerEventHandler( "transition_complete_keyframe", f49_local0 )
					end
				end
				
				fxGlitch1700:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				fxGlitch1700:setAlpha( 0 )
				fxGlitch1700:registerEventHandler( "transition_complete_keyframe", f15_local1 )
				local f15_local2 = function ( f64_arg0, f64_arg1 )
					local f64_local0 = function ( f65_arg0, f65_arg1 )
						local f65_local0 = function ( f66_arg0, f66_arg1 )
							local f66_local0 = function ( f67_arg0, f67_arg1 )
								local f67_local0 = function ( f68_arg0, f68_arg1 )
									if not f68_arg1.interrupted then
										f68_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									f68_arg0:setAlpha( 0 )
									if f68_arg1.interrupted then
										self.clipFinished( f68_arg0, f68_arg1 )
									else
										f68_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f67_arg1.interrupted then
									f67_local0( f67_arg0, f67_arg1 )
									return 
								else
									f67_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									f67_arg0:setAlpha( 0.28 )
									f67_arg0:registerEventHandler( "transition_complete_keyframe", f67_local0 )
								end
							end
							
							if f66_arg1.interrupted then
								f66_local0( f66_arg0, f66_arg1 )
								return 
							else
								f66_arg0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
								f66_arg0:registerEventHandler( "transition_complete_keyframe", f66_local0 )
							end
						end
						
						if f65_arg1.interrupted then
							f65_local0( f65_arg0, f65_arg1 )
							return 
						else
							f65_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f65_arg0:setAlpha( 0 )
							f65_arg0:registerEventHandler( "transition_complete_keyframe", f65_local0 )
						end
					end
					
					if f64_arg1.interrupted then
						f64_local0( f64_arg0, f64_arg1 )
						return 
					else
						f64_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f64_arg0:setAlpha( 0.28 )
						f64_arg0:registerEventHandler( "transition_complete_keyframe", f64_local0 )
					end
				end
				
				fxGlitch1600:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
				fxGlitch1600:setAlpha( 0 )
				fxGlitch1600:registerEventHandler( "transition_complete_keyframe", f15_local2 )
				local f15_local3 = function ( f69_arg0, f69_arg1 )
					local f69_local0 = function ( f70_arg0, f70_arg1 )
						local f70_local0 = function ( f71_arg0, f71_arg1 )
							if not f71_arg1.interrupted then
								f71_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f71_arg0:setAlpha( 0 )
							if f71_arg1.interrupted then
								self.clipFinished( f71_arg0, f71_arg1 )
							else
								f71_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f70_arg1.interrupted then
							f70_local0( f70_arg0, f70_arg1 )
							return 
						else
							f70_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f70_arg0:setAlpha( 0.8 )
							f70_arg0:registerEventHandler( "transition_complete_keyframe", f70_local0 )
						end
					end
					
					if f69_arg1.interrupted then
						f69_local0( f69_arg0, f69_arg1 )
						return 
					else
						f69_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f69_arg0:setAlpha( 0.18 )
						f69_arg0:registerEventHandler( "transition_complete_keyframe", f69_local0 )
					end
				end
				
				fxGlitch1500:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				fxGlitch1500:setAlpha( 0 )
				fxGlitch1500:registerEventHandler( "transition_complete_keyframe", f15_local3 )
				local f15_local4 = function ( f72_arg0, f72_arg1 )
					local f72_local0 = function ( f73_arg0, f73_arg1 )
						local f73_local0 = function ( f74_arg0, f74_arg1 )
							local f74_local0 = function ( f75_arg0, f75_arg1 )
								local f75_local0 = function ( f76_arg0, f76_arg1 )
									local f76_local0 = function ( f77_arg0, f77_arg1 )
										local f77_local0 = function ( f78_arg0, f78_arg1 )
											local f78_local0 = function ( f79_arg0, f79_arg1 )
												local f79_local0 = function ( f80_arg0, f80_arg1 )
													if not f80_arg1.interrupted then
														f80_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													end
													f80_arg0:setAlpha( 0 )
													if f80_arg1.interrupted then
														self.clipFinished( f80_arg0, f80_arg1 )
													else
														f80_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if f79_arg1.interrupted then
													f79_local0( f79_arg0, f79_arg1 )
													return 
												else
													f79_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
													f79_arg0:setAlpha( 0.33 )
													f79_arg0:registerEventHandler( "transition_complete_keyframe", f79_local0 )
												end
											end
											
											if f78_arg1.interrupted then
												f78_local0( f78_arg0, f78_arg1 )
												return 
											else
												f78_arg0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
												f78_arg0:registerEventHandler( "transition_complete_keyframe", f78_local0 )
											end
										end
										
										if f77_arg1.interrupted then
											f77_local0( f77_arg0, f77_arg1 )
											return 
										else
											f77_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											f77_arg0:registerEventHandler( "transition_complete_keyframe", f77_local0 )
										end
									end
									
									if f76_arg1.interrupted then
										f76_local0( f76_arg0, f76_arg1 )
										return 
									else
										f76_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										f76_arg0:setAlpha( 0 )
										f76_arg0:registerEventHandler( "transition_complete_keyframe", f76_local0 )
									end
								end
								
								if f75_arg1.interrupted then
									f75_local0( f75_arg0, f75_arg1 )
									return 
								else
									f75_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									f75_arg0:setAlpha( 1 )
									f75_arg0:registerEventHandler( "transition_complete_keyframe", f75_local0 )
								end
							end
							
							if f74_arg1.interrupted then
								f74_local0( f74_arg0, f74_arg1 )
								return 
							else
								f74_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
								f74_arg0:registerEventHandler( "transition_complete_keyframe", f74_local0 )
							end
						end
						
						if f73_arg1.interrupted then
							f73_local0( f73_arg0, f73_arg1 )
							return 
						else
							f73_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f73_arg0:setAlpha( 0 )
							f73_arg0:registerEventHandler( "transition_complete_keyframe", f73_local0 )
						end
					end
					
					if f72_arg1.interrupted then
						f72_local0( f72_arg0, f72_arg1 )
						return 
					else
						f72_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						f72_arg0:setAlpha( 0.33 )
						f72_arg0:registerEventHandler( "transition_complete_keyframe", f72_local0 )
					end
				end
				
				fxGlitch1400:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
				fxGlitch1400:setAlpha( 0 )
				fxGlitch1400:registerEventHandler( "transition_complete_keyframe", f15_local4 )
				local f15_local5 = function ( f81_arg0, f81_arg1 )
					local f81_local0 = function ( f82_arg0, f82_arg1 )
						local f82_local0 = function ( f83_arg0, f83_arg1 )
							if not f83_arg1.interrupted then
								f83_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f83_arg0:setAlpha( 0 )
							if f83_arg1.interrupted then
								self.clipFinished( f83_arg0, f83_arg1 )
							else
								f83_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f82_arg1.interrupted then
							f82_local0( f82_arg0, f82_arg1 )
							return 
						else
							f82_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f82_arg0:setAlpha( 1 )
							f82_arg0:registerEventHandler( "transition_complete_keyframe", f82_local0 )
						end
					end
					
					if f81_arg1.interrupted then
						f81_local0( f81_arg0, f81_arg1 )
						return 
					else
						f81_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f81_arg0:setAlpha( 0.25 )
						f81_arg0:registerEventHandler( "transition_complete_keyframe", f81_local0 )
					end
				end
				
				fxGlitch1300:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				fxGlitch1300:setAlpha( 0 )
				fxGlitch1300:registerEventHandler( "transition_complete_keyframe", f15_local5 )
				local f15_local6 = function ( f84_arg0, f84_arg1 )
					local f84_local0 = function ( f85_arg0, f85_arg1 )
						local f85_local0 = function ( f86_arg0, f86_arg1 )
							if not f86_arg1.interrupted then
								f86_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							end
							f86_arg0:setAlpha( 0 )
							if f86_arg1.interrupted then
								self.clipFinished( f86_arg0, f86_arg1 )
							else
								f86_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f85_arg1.interrupted then
							f85_local0( f85_arg0, f85_arg1 )
							return 
						else
							f85_arg0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							f85_arg0:registerEventHandler( "transition_complete_keyframe", f85_local0 )
						end
					end
					
					if f84_arg1.interrupted then
						f84_local0( f84_arg0, f84_arg1 )
						return 
					else
						f84_arg0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
						f84_arg0:setAlpha( 1 )
						f84_arg0:registerEventHandler( "transition_complete_keyframe", f84_local0 )
					end
				end
				
				fxGlitch1100:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
				fxGlitch1100:setAlpha( 0 )
				fxGlitch1100:registerEventHandler( "transition_complete_keyframe", f15_local6 )
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
					if not event.interrupted then
						LootDecryptionFakeImageCycle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					LootDecryptionFakeImageCycle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LootDecryptionFakeImageCycle, event )
					else
						LootDecryptionFakeImageCycle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				LootDecryptionFakeImageCycleFrame2( LootDecryptionFakeImageCycle, {} )
				self.nextClip = "StartFuzz"
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			RevealedCommon = function ()
				self:setupElementClipCounter( 12 )
				local f89_local0 = function ( f90_arg0, f90_arg1 )
					local f90_local0 = function ( f91_arg0, f91_arg1 )
						if not f91_arg1.interrupted then
							f91_arg0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						f91_arg0:setAlpha( 0 )
						if f91_arg1.interrupted then
							self.clipFinished( f91_arg0, f91_arg1 )
						else
							f91_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f90_arg1.interrupted then
						f90_local0( f90_arg0, f90_arg1 )
						return 
					else
						f90_arg0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						f90_arg0:setAlpha( 1 )
						f90_arg0:registerEventHandler( "transition_complete_keyframe", f90_local0 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", f89_local0 )
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
				local f89_local2 = function ( f94_arg0, f94_arg1 )
					if not f94_arg1.interrupted then
						f94_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f94_arg0:setAlpha( 1 )
					if f94_arg1.interrupted then
						self.clipFinished( f94_arg0, f94_arg1 )
					else
						f94_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", f89_local2 )
				local f89_local3 = function ( f95_arg0, f95_arg1 )
					if not f95_arg1.interrupted then
						f95_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f95_arg0:setAlpha( 1 )
					if f95_arg1.interrupted then
						self.clipFinished( f95_arg0, f95_arg1 )
					else
						f95_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f89_local3 )
				local f89_local4 = function ( f96_arg0, f96_arg1 )
					if not f96_arg1.interrupted then
						f96_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f96_arg0:setAlpha( 1 )
					if f96_arg1.interrupted then
						self.clipFinished( f96_arg0, f96_arg1 )
					else
						f96_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f89_local4 )
				local f89_local5 = function ( f97_arg0, f97_arg1 )
					if not f97_arg1.interrupted then
						f97_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f97_arg0:setAlpha( 1 )
					if f97_arg1.interrupted then
						self.clipFinished( f97_arg0, f97_arg1 )
					else
						f97_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f89_local5 )
				local f89_local6 = function ( f98_arg0, f98_arg1 )
					if not f98_arg1.interrupted then
						f98_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f98_arg0:setLeftRight( false, false, -127.5, 126.5 )
					f98_arg0:setTopBottom( true, false, -57, 292 )
					f98_arg0:setAlpha( 1 )
					if f98_arg1.interrupted then
						self.clipFinished( f98_arg0, f98_arg1 )
					else
						f98_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f89_local6 )
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
			end,
			RevealedRare = function ()
				self:setupElementClipCounter( 14 )
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
				local f105_local1 = function ( f108_arg0, f108_arg1 )
					if not f108_arg1.interrupted then
						f108_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f108_arg0:setAlpha( 1 )
					if f108_arg1.interrupted then
						self.clipFinished( f108_arg0, f108_arg1 )
					else
						f108_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", f105_local1 )
				local f105_local2 = function ( f109_arg0, f109_arg1 )
					if not f109_arg1.interrupted then
						f109_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f109_arg0:setAlpha( 1 )
					if f109_arg1.interrupted then
						self.clipFinished( f109_arg0, f109_arg1 )
					else
						f109_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f105_local2 )
				local f105_local3 = function ( f110_arg0, f110_arg1 )
					if not f110_arg1.interrupted then
						f110_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f110_arg0:setAlpha( 1 )
					if f110_arg1.interrupted then
						self.clipFinished( f110_arg0, f110_arg1 )
					else
						f110_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f105_local3 )
				local f105_local4 = function ( f111_arg0, f111_arg1 )
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
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f105_local4 )
				local f105_local5 = function ( f112_arg0, f112_arg1 )
					if not f112_arg1.interrupted then
						f112_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f112_arg0:setLeftRight( false, false, -127.5, 126.5 )
					f112_arg0:setTopBottom( true, false, -57, 292 )
					f112_arg0:setAlpha( 1 )
					if f112_arg1.interrupted then
						self.clipFinished( f112_arg0, f112_arg1 )
					else
						f112_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f105_local5 )
				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				local f105_local6 = function ( f113_arg0, f113_arg1 )
					local f113_local0 = function ( f114_arg0, f114_arg1 )
						if not f114_arg1.interrupted then
							f114_arg0:beginAnimation( "keyframe", 539, false, false, CoD.TweenType.Linear )
						end
						f114_arg0:setAlpha( 0 )
						if f114_arg1.interrupted then
							self.clipFinished( f114_arg0, f114_arg1 )
						else
							f114_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f113_arg1.interrupted then
						f113_local0( f113_arg0, f113_arg1 )
						return 
					else
						f113_arg0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						f113_arg0:setAlpha( 1 )
						f113_arg0:registerEventHandler( "transition_complete_keyframe", f113_local0 )
					end
				end
				
				GLOWrare:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWrare:setAlpha( 0 )
				GLOWrare:registerEventHandler( "transition_complete_keyframe", f105_local6 )
				local f105_local7 = function ( f115_arg0, f115_arg1 )
					local f115_local0 = function ( f116_arg0, f116_arg1 )
						if not f116_arg1.interrupted then
							f116_arg0:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						end
						f116_arg0:setRGB( 0.22, 0.93, 0.93 )
						f116_arg0:setAlpha( 0 )
						f116_arg0:setScale( 1.2 )
						if f116_arg1.interrupted then
							self.clipFinished( f116_arg0, f116_arg1 )
						else
							f116_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f115_arg1.interrupted then
						f115_local0( f115_arg0, f115_arg1 )
						return 
					else
						f115_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f115_arg0:setAlpha( 1 )
						f115_arg0:setScale( 1.05 )
						f115_arg0:registerEventHandler( "transition_complete_keyframe", f115_local0 )
					end
				end
				
				blurbox:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				blurbox:setRGB( 0.22, 0.93, 0.93 )
				blurbox:setAlpha( 0 )
				blurbox:setScale( 1 )
				blurbox:registerEventHandler( "transition_complete_keyframe", f105_local7 )
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
				self:setupElementClipCounter( 21 )
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
				local f121_local1 = function ( f124_arg0, f124_arg1 )
					if not f124_arg1.interrupted then
						f124_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f124_arg0:setAlpha( 1 )
					if f124_arg1.interrupted then
						self.clipFinished( f124_arg0, f124_arg1 )
					else
						f124_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", f121_local1 )
				local f121_local2 = function ( f125_arg0, f125_arg1 )
					if not f125_arg1.interrupted then
						f125_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f125_arg0:setAlpha( 1 )
					if f125_arg1.interrupted then
						self.clipFinished( f125_arg0, f125_arg1 )
					else
						f125_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f121_local2 )
				local f121_local3 = function ( f126_arg0, f126_arg1 )
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
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f121_local3 )
				local f121_local4 = function ( f127_arg0, f127_arg1 )
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
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f121_local4 )
				local f121_local5 = function ( f128_arg0, f128_arg1 )
					if not f128_arg1.interrupted then
						f128_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f128_arg0:setLeftRight( false, false, -127.5, 126.5 )
					f128_arg0:setTopBottom( true, false, -57, 292 )
					f128_arg0:setAlpha( 1 )
					if f128_arg1.interrupted then
						self.clipFinished( f128_arg0, f128_arg1 )
					else
						f128_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( false, false, -127.5, 126.5 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f121_local5 )
				LootDecryptionFakeImageCycle:completeAnimation()
				self.LootDecryptionFakeImageCycle:setAlpha( 0 )
				self.clipFinished( LootDecryptionFakeImageCycle, {} )
				GLOWrare:completeAnimation()
				self.GLOWrare:setAlpha( 0 )
				self.clipFinished( GLOWrare, {} )
				local f121_local6 = function ( f129_arg0, f129_arg1 )
					local f129_local0 = function ( f130_arg0, f130_arg1 )
						if not f130_arg1.interrupted then
							f130_arg0:beginAnimation( "keyframe", 489, false, false, CoD.TweenType.Linear )
						end
						f130_arg0:setAlpha( 0 )
						if f130_arg1.interrupted then
							self.clipFinished( f130_arg0, f130_arg1 )
						else
							f130_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f129_arg1.interrupted then
						f129_local0( f129_arg0, f129_arg1 )
						return 
					else
						f129_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f129_arg0:setAlpha( 1 )
						f129_arg0:registerEventHandler( "transition_complete_keyframe", f129_local0 )
					end
				end
				
				GLOWLengendary:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWLengendary:setAlpha( 0 )
				GLOWLengendary:registerEventHandler( "transition_complete_keyframe", f121_local6 )
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
				local f121_local12 = function ( f142_arg0, f142_arg1 )
					local f142_local0 = function ( f143_arg0, f143_arg1 )
						local f143_local0 = function ( f144_arg0, f144_arg1 )
							local f144_local0 = function ( f145_arg0, f145_arg1 )
								local f145_local0 = function ( f146_arg0, f146_arg1 )
									if not f146_arg1.interrupted then
										f146_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									end
									f146_arg0:setAlpha( 0 )
									f146_arg0:setScale( 2 )
									if f146_arg1.interrupted then
										self.clipFinished( f146_arg0, f146_arg1 )
									else
										f146_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if f145_arg1.interrupted then
									f145_local0( f145_arg0, f145_arg1 )
									return 
								else
									f145_arg0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
									f145_arg0:setScale( 1.86 )
									f145_arg0:registerEventHandler( "transition_complete_keyframe", f145_local0 )
								end
							end
							
							if f144_arg1.interrupted then
								f144_local0( f144_arg0, f144_arg1 )
								return 
							else
								f144_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
								f144_arg0:setAlpha( 0 )
								f144_arg0:setScale( 1.62 )
								f144_arg0:registerEventHandler( "transition_complete_keyframe", f144_local0 )
							end
						end
						
						if f143_arg1.interrupted then
							f143_local0( f143_arg0, f143_arg1 )
							return 
						else
							f143_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f143_arg0:setAlpha( 1 )
							f143_arg0:setScale( 1.22 )
							f143_arg0:registerEventHandler( "transition_complete_keyframe", f143_local0 )
						end
					end
					
					if f142_arg1.interrupted then
						f142_local0( f142_arg0, f142_arg1 )
						return 
					else
						f142_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						f142_arg0:setAlpha( 0.2 )
						f142_arg0:registerEventHandler( "transition_complete_keyframe", f142_local0 )
					end
				end
				
				LegendaryEmber1:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber1:setAlpha( 0 )
				LegendaryEmber1:setScale( 1 )
				LegendaryEmber1:registerEventHandler( "transition_complete_keyframe", f121_local12 )
				local f121_local13 = function ( f147_arg0, f147_arg1 )
					local f147_local0 = function ( f148_arg0, f148_arg1 )
						local f148_local0 = function ( f149_arg0, f149_arg1 )
							local f149_local0 = function ( f150_arg0, f150_arg1 )
								if not f150_arg1.interrupted then
									f150_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								f150_arg0:setAlpha( 0 )
								f150_arg0:setScale( 1.5 )
								if f150_arg1.interrupted then
									self.clipFinished( f150_arg0, f150_arg1 )
								else
									f150_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f149_arg1.interrupted then
								f149_local0( f149_arg0, f149_arg1 )
								return 
							else
								f149_arg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
								f149_arg0:setAlpha( 0 )
								f149_arg0:setScale( 1.46 )
								f149_arg0:registerEventHandler( "transition_complete_keyframe", f149_local0 )
							end
						end
						
						if f148_arg1.interrupted then
							f148_local0( f148_arg0, f148_arg1 )
							return 
						else
							f148_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f148_arg0:setAlpha( 1 )
							f148_arg0:setScale( 1.26 )
							f148_arg0:registerEventHandler( "transition_complete_keyframe", f148_local0 )
						end
					end
					
					if f147_arg1.interrupted then
						f147_local0( f147_arg0, f147_arg1 )
						return 
					else
						f147_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						f147_arg0:setAlpha( 0.2 )
						f147_arg0:registerEventHandler( "transition_complete_keyframe", f147_local0 )
					end
				end
				
				LegendaryEmber2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber2:setAlpha( 0 )
				LegendaryEmber2:setScale( 1.2 )
				LegendaryEmber2:registerEventHandler( "transition_complete_keyframe", f121_local13 )
				local f121_local14 = function ( f151_arg0, f151_arg1 )
					local f151_local0 = function ( f152_arg0, f152_arg1 )
						if not f152_arg1.interrupted then
							f152_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						f152_arg0:setAlpha( 0 )
						f152_arg0:setScale( 1.5 )
						if f152_arg1.interrupted then
							self.clipFinished( f152_arg0, f152_arg1 )
						else
							f152_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f151_arg1.interrupted then
						f151_local0( f151_arg0, f151_arg1 )
						return 
					else
						f151_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f151_arg0:setAlpha( 1 )
						f151_arg0:setScale( 1.3 )
						f151_arg0:registerEventHandler( "transition_complete_keyframe", f151_local0 )
					end
				end
				
				LegendaryEmber3:beginAnimation( "keyframe", 270, false, false, CoD.TweenType.Linear )
				LegendaryEmber3:setAlpha( 0 )
				LegendaryEmber3:setScale( 1.1 )
				LegendaryEmber3:registerEventHandler( "transition_complete_keyframe", f121_local14 )
				local f121_local15 = function ( f153_arg0, f153_arg1 )
					local f153_local0 = function ( f154_arg0, f154_arg1 )
						local f154_local0 = function ( f155_arg0, f155_arg1 )
							local f155_local0 = function ( f156_arg0, f156_arg1 )
								if not f156_arg1.interrupted then
									f156_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
								end
								f156_arg0:setLeftRight( true, false, -74.86, 317.08 )
								f156_arg0:setTopBottom( true, false, -78.35, 424.35 )
								f156_arg0:setAlpha( 0 )
								f156_arg0:setScale( 1.8 )
								if f156_arg1.interrupted then
									self.clipFinished( f156_arg0, f156_arg1 )
								else
									f156_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f155_arg1.interrupted then
								f155_local0( f155_arg0, f155_arg1 )
								return 
							else
								f155_arg0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
								f155_arg0:setAlpha( 0 )
								f155_arg0:setScale( 1.45 )
								f155_arg0:registerEventHandler( "transition_complete_keyframe", f155_local0 )
							end
						end
						
						if f154_arg1.interrupted then
							f154_local0( f154_arg0, f154_arg1 )
							return 
						else
							f154_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
							f154_arg0:setAlpha( 1 )
							f154_arg0:setScale( 0.96 )
							f154_arg0:registerEventHandler( "transition_complete_keyframe", f154_local0 )
						end
					end
					
					if f153_arg1.interrupted then
						f153_local0( f153_arg0, f153_arg1 )
						return 
					else
						f153_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
						f153_arg0:setAlpha( 0.2 )
						f153_arg0:registerEventHandler( "transition_complete_keyframe", f153_local0 )
					end
				end
				
				LegendaryEmber5:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				LegendaryEmber5:setLeftRight( true, false, -74.86, 317.08 )
				LegendaryEmber5:setTopBottom( true, false, -78.35, 424.35 )
				LegendaryEmber5:setAlpha( 0 )
				LegendaryEmber5:setScale( 0.8 )
				LegendaryEmber5:registerEventHandler( "transition_complete_keyframe", f121_local15 )
			end,
			RevealedEpic = function ()
				self:setupElementClipCounter( 25 )
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
				local f157_local1 = function ( f160_arg0, f160_arg1 )
					if not f160_arg1.interrupted then
						f160_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f160_arg0:setAlpha( 1 )
					if f160_arg1.interrupted then
						self.clipFinished( f160_arg0, f160_arg1 )
					else
						f160_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRarityText:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRarityText:setAlpha( 0 )
				lootRarityText:registerEventHandler( "transition_complete_keyframe", f157_local1 )
				local f157_local2 = function ( f161_arg0, f161_arg1 )
					if not f161_arg1.interrupted then
						f161_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f161_arg0:setAlpha( 1 )
					if f161_arg1.interrupted then
						self.clipFinished( f161_arg0, f161_arg1 )
					else
						f161_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootRaritySet:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootRaritySet:setAlpha( 0 )
				lootRaritySet:registerEventHandler( "transition_complete_keyframe", f157_local2 )
				local f157_local3 = function ( f162_arg0, f162_arg1 )
					if not f162_arg1.interrupted then
						f162_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f162_arg0:setAlpha( 1 )
					if f162_arg1.interrupted then
						self.clipFinished( f162_arg0, f162_arg1 )
					else
						f162_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootCategory:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootCategory:setAlpha( 0 )
				lootCategory:registerEventHandler( "transition_complete_keyframe", f157_local3 )
				local f157_local4 = function ( f163_arg0, f163_arg1 )
					if not f163_arg1.interrupted then
						f163_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f163_arg0:setAlpha( 1 )
					if f163_arg1.interrupted then
						self.clipFinished( f163_arg0, f163_arg1 )
					else
						f163_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lootName:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				lootName:setAlpha( 0 )
				lootName:registerEventHandler( "transition_complete_keyframe", f157_local4 )
				local f157_local5 = function ( f164_arg0, f164_arg1 )
					if not f164_arg1.interrupted then
						f164_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
					end
					f164_arg0:setLeftRight( true, false, -5, 249 )
					f164_arg0:setTopBottom( true, false, -57, 292 )
					f164_arg0:setAlpha( 1 )
					if f164_arg1.interrupted then
						self.clipFinished( f164_arg0, f164_arg1 )
					else
						f164_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LootDecryptionImage:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				LootDecryptionImage:setLeftRight( true, false, -5, 249 )
				LootDecryptionImage:setTopBottom( true, false, -57, 292 )
				LootDecryptionImage:setAlpha( 0 )
				LootDecryptionImage:registerEventHandler( "transition_complete_keyframe", f157_local5 )
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
				local f157_local7 = function ( f166_arg0, f166_arg1 )
					local f166_local0 = function ( f167_arg0, f167_arg1 )
						if not f167_arg1.interrupted then
							f167_arg0:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						end
						f167_arg0:setAlpha( 0 )
						if f167_arg1.interrupted then
							self.clipFinished( f167_arg0, f167_arg1 )
						else
							f167_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f166_arg1.interrupted then
						f166_local0( f166_arg0, f166_arg1 )
						return 
					else
						f166_arg0:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						f166_arg0:setAlpha( 1 )
						f166_arg0:registerEventHandler( "transition_complete_keyframe", f166_local0 )
					end
				end
				
				GLOWEpic:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				GLOWEpic:setAlpha( 0 )
				GLOWEpic:registerEventHandler( "transition_complete_keyframe", f157_local7 )
				local f157_local8 = function ( f168_arg0, f168_arg1 )
					local f168_local0 = function ( f169_arg0, f169_arg1 )
						if not f169_arg1.interrupted then
							f169_arg0:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
						end
						f169_arg0:setRGB( 1, 0.67, 0 )
						f169_arg0:setAlpha( 0 )
						f169_arg0:setScale( 1.2 )
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
						f168_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f168_arg0:setAlpha( 1 )
						f168_arg0:setScale( 1.04 )
						f168_arg0:registerEventHandler( "transition_complete_keyframe", f168_local0 )
					end
				end
				
				blurbox:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				blurbox:setRGB( 1, 0.67, 0 )
				blurbox:setAlpha( 0 )
				blurbox:setScale( 1 )
				blurbox:registerEventHandler( "transition_complete_keyframe", f157_local8 )
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
				local f157_local13 = function ( f174_arg0, f174_arg1 )
					local f174_local0 = function ( f175_arg0, f175_arg1 )
						local f175_local0 = function ( f176_arg0, f176_arg1 )
							if not f176_arg1.interrupted then
								f176_arg0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							f176_arg0:setLeftRight( true, false, -74.86, 317.08 )
							f176_arg0:setTopBottom( true, false, -78.35, 424.35 )
							f176_arg0:setAlpha( 0 )
							f176_arg0:setScale( 1.8 )
							if f176_arg1.interrupted then
								self.clipFinished( f176_arg0, f176_arg1 )
							else
								f176_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f175_arg1.interrupted then
							f175_local0( f175_arg0, f175_arg1 )
							return 
						else
							f175_arg0:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
							f175_arg0:setAlpha( 0 )
							f175_arg0:setScale( 1.45 )
							f175_arg0:registerEventHandler( "transition_complete_keyframe", f175_local0 )
						end
					end
					
					if f174_arg1.interrupted then
						f174_local0( f174_arg0, f174_arg1 )
						return 
					else
						f174_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f174_arg0:setAlpha( 1 )
						f174_arg0:setScale( 0.98 )
						f174_arg0:registerEventHandler( "transition_complete_keyframe", f174_local0 )
					end
				end
				
				EpicEmber5:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				EpicEmber5:setLeftRight( true, false, -74.86, 317.08 )
				EpicEmber5:setTopBottom( true, false, -78.35, 424.35 )
				EpicEmber5:setAlpha( 0 )
				EpicEmber5:setScale( 0.8 )
				EpicEmber5:registerEventHandler( "transition_complete_keyframe", f157_local13 )
				local f157_local14 = function ( f177_arg0, f177_arg1 )
					local f177_local0 = function ( f178_arg0, f178_arg1 )
						if not f178_arg1.interrupted then
							f178_arg0:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						end
						f178_arg0:setAlpha( 0 )
						f178_arg0:setScale( 1.5 )
						if f178_arg1.interrupted then
							self.clipFinished( f178_arg0, f178_arg1 )
						else
							f178_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f177_arg1.interrupted then
						f177_local0( f177_arg0, f177_arg1 )
						return 
					else
						f177_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f177_arg0:setAlpha( 1 )
						f177_arg0:setScale( 1.3 )
						f177_arg0:registerEventHandler( "transition_complete_keyframe", f177_local0 )
					end
				end
				
				EpicEmber3:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				EpicEmber3:setAlpha( 0 )
				EpicEmber3:setScale( 1.1 )
				EpicEmber3:registerEventHandler( "transition_complete_keyframe", f157_local14 )
				local f157_local15 = function ( f179_arg0, f179_arg1 )
					local f179_local0 = function ( f180_arg0, f180_arg1 )
						local f180_local0 = function ( f181_arg0, f181_arg1 )
							local f181_local0 = function ( f182_arg0, f182_arg1 )
								local f182_local0 = function ( f183_arg0, f183_arg1 )
									local f183_local0 = function ( f184_arg0, f184_arg1 )
										if not f184_arg1.interrupted then
											f184_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
										end
										f184_arg0:setAlpha( 0 )
										f184_arg0:setScale( 1.4 )
										if f184_arg1.interrupted then
											self.clipFinished( f184_arg0, f184_arg1 )
										else
											f184_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if f183_arg1.interrupted then
										f183_local0( f183_arg0, f183_arg1 )
										return 
									else
										f183_arg0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
										f183_arg0:setScale( 1.38 )
										f183_arg0:registerEventHandler( "transition_complete_keyframe", f183_local0 )
									end
								end
								
								if f182_arg1.interrupted then
									f182_local0( f182_arg0, f182_arg1 )
									return 
								else
									f182_arg0:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
									f182_arg0:setAlpha( 0 )
									f182_arg0:setScale( 1.36 )
									f182_arg0:registerEventHandler( "transition_complete_keyframe", f182_local0 )
								end
							end
							
							if f181_arg1.interrupted then
								f181_local0( f181_arg0, f181_arg1 )
								return 
							else
								f181_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
								f181_arg0:setScale( 1.33 )
								f181_arg0:registerEventHandler( "transition_complete_keyframe", f181_local0 )
							end
						end
						
						if f180_arg1.interrupted then
							f180_local0( f180_arg0, f180_arg1 )
							return 
						else
							f180_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							f180_arg0:setScale( 1.3 )
							f180_arg0:registerEventHandler( "transition_complete_keyframe", f180_local0 )
						end
					end
					
					if f179_arg1.interrupted then
						f179_local0( f179_arg0, f179_arg1 )
						return 
					else
						f179_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
						f179_arg0:setAlpha( 1 )
						f179_arg0:setScale( 1.2 )
						f179_arg0:registerEventHandler( "transition_complete_keyframe", f179_local0 )
					end
				end
				
				EpicEmber2:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				EpicEmber2:setAlpha( 0 )
				EpicEmber2:setScale( 1.1 )
				EpicEmber2:registerEventHandler( "transition_complete_keyframe", f157_local15 )
				local f157_local16 = function ( f185_arg0, f185_arg1 )
					local f185_local0 = function ( f186_arg0, f186_arg1 )
						local f186_local0 = function ( f187_arg0, f187_arg1 )
							local f187_local0 = function ( f188_arg0, f188_arg1 )
								local f188_local0 = function ( f189_arg0, f189_arg1 )
									local f189_local0 = function ( f190_arg0, f190_arg1 )
										local f190_local0 = function ( f191_arg0, f191_arg1 )
											if not f191_arg1.interrupted then
												f191_arg0:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
											end
											f191_arg0:setAlpha( 0 )
											f191_arg0:setScale( 1.4 )
											if f191_arg1.interrupted then
												self.clipFinished( f191_arg0, f191_arg1 )
											else
												f191_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if f190_arg1.interrupted then
											f190_local0( f190_arg0, f190_arg1 )
											return 
										else
											f190_arg0:beginAnimation( "keyframe", 169, false, false, CoD.TweenType.Linear )
											f190_arg0:setScale( 1.39 )
											f190_arg0:registerEventHandler( "transition_complete_keyframe", f190_local0 )
										end
									end
									
									if f189_arg1.interrupted then
										f189_local0( f189_arg0, f189_arg1 )
										return 
									else
										f189_arg0:beginAnimation( "keyframe", 130, false, false, CoD.TweenType.Linear )
										f189_arg0:setScale( 1.36 )
										f189_arg0:registerEventHandler( "transition_complete_keyframe", f189_local0 )
									end
								end
								
								if f188_arg1.interrupted then
									f188_local0( f188_arg0, f188_arg1 )
									return 
								else
									f188_arg0:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
									f188_arg0:setAlpha( 0 )
									f188_arg0:setScale( 1.34 )
									f188_arg0:registerEventHandler( "transition_complete_keyframe", f188_local0 )
								end
							end
							
							if f187_arg1.interrupted then
								f187_local0( f187_arg0, f187_arg1 )
								return 
							else
								f187_arg0:beginAnimation( "keyframe", 350, false, false, CoD.TweenType.Linear )
								f187_arg0:setScale( 1.3 )
								f187_arg0:registerEventHandler( "transition_complete_keyframe", f187_local0 )
							end
						end
						
						if f186_arg1.interrupted then
							f186_local0( f186_arg0, f186_arg1 )
							return 
						else
							f186_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							f186_arg0:setAlpha( 1 )
							f186_arg0:setScale( 1.24 )
							f186_arg0:registerEventHandler( "transition_complete_keyframe", f186_local0 )
						end
					end
					
					if f185_arg1.interrupted then
						f185_local0( f185_arg0, f185_arg1 )
						return 
					else
						f185_arg0:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
						f185_arg0:setScale( 1.22 )
						f185_arg0:registerEventHandler( "transition_complete_keyframe", f185_local0 )
					end
				end
				
				EpicEmber1:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
				EpicEmber1:setAlpha( 0 )
				EpicEmber1:setScale( 1.2 )
				EpicEmber1:registerEventHandler( "transition_complete_keyframe", f157_local16 )
				local epicSkullFrame2 = function ( epicSkull, event )
					local epicSkullFrame3 = function ( epicSkull, event )
						local epicSkullFrame4 = function ( epicSkull, event )
							local epicSkullFrame5 = function ( epicSkull, event )
								local epicSkullFrame6 = function ( epicSkull, event )
									local epicSkullFrame7 = function ( epicSkull, event )
										local epicSkullFrame8 = function ( epicSkull, event )
											local epicSkullFrame9 = function ( epicSkull, event )
												if not event.interrupted then
													epicSkull:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
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
												epicSkullFrame9( epicSkull, event )
												return 
											else
												epicSkull:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
												epicSkull:setShaderVector( 1, 35, 0, 0, 0 )
												epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame9 )
											end
										end
										
										if event.interrupted then
											epicSkullFrame8( epicSkull, event )
											return 
										else
											epicSkull:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
											epicSkull:setShaderVector( 1, 17.5, 0, 0, 0 )
											epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame8 )
										end
									end
									
									if event.interrupted then
										epicSkullFrame7( epicSkull, event )
										return 
									else
										epicSkull:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										epicSkull:setAlpha( 0 )
										epicSkull:setShaderVector( 1, 0, 0, 0, 0 )
										epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame7 )
									end
								end
								
								if event.interrupted then
									epicSkullFrame6( epicSkull, event )
									return 
								else
									epicSkull:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
									epicSkull:setShaderVector( 1, 26.99, 0, 0, 0 )
									epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame6 )
								end
							end
							
							if event.interrupted then
								epicSkullFrame5( epicSkull, event )
								return 
							else
								epicSkull:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
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
							epicSkull:setShaderVector( 1, 0.49, 0, 0, 0 )
							epicSkull:registerEventHandler( "transition_complete_keyframe", epicSkullFrame4 )
						end
					end
					
					if event.interrupted then
						epicSkullFrame3( epicSkull, event )
						return 
					else
						epicSkull:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
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
				local f157_local18 = function ( f200_arg0, f200_arg1 )
					if not f200_arg1.interrupted then
						f200_arg0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
					end
					f200_arg0:setAlpha( 1 )
					if f200_arg1.interrupted then
						self.clipFinished( f200_arg0, f200_arg1 )
					else
						f200_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFlyEmberFX:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				BMFlyEmberFX:setAlpha( 0 )
				BMFlyEmberFX:registerEventHandler( "transition_complete_keyframe", f157_local18 )
				local f157_local19 = function ( f201_arg0, f201_arg1 )
					if not f201_arg1.interrupted then
						f201_arg0:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
					end
					f201_arg0:setAlpha( 1 )
					if f201_arg1.interrupted then
						self.clipFinished( f201_arg0, f201_arg1 )
					else
						f201_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFlyEmberFX0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
				BMFlyEmberFX0:setAlpha( 0 )
				BMFlyEmberFX0:registerEventHandler( "transition_complete_keyframe", f157_local19 )
			end
		},
		RevealedCommon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 0 )
				self.clipFinished( BMFocusGlow, {} )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 39.07, 195.07 )
				self.FocusBar3:setTopBottom( true, false, 380.92, 406.92 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
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
				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
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
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
				self.BMLockItem:setAlpha( 1 )
				self.BMLockItem:setScale( 1 )
				self.clipFinished( BMLockItem, {} )
				GLOWcommon:completeAnimation()
				self.GLOWcommon:setAlpha( 0 )
				self.clipFinished( GLOWcommon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 16 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					local BMFocusGlowFrame3 = function ( BMFocusGlow, event )
						if not event.interrupted then
							BMFocusGlow:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						BMFocusGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMFocusGlow, event )
						else
							BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMFocusGlowFrame3( BMFocusGlow, event )
						return 
					else
						BMFocusGlow:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						BMFocusGlow:setAlpha( 0.64 )
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", BMFocusGlowFrame3 )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 1 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 360, 387 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
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
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 15 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					if not event.interrupted then
						BMFocusGlow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMFocusGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMFocusGlow, event )
					else
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 0 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -79, 77 )
					FocusBar3:setTopBottom( true, false, 360, 387 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 380, 406 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
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
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 15 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					if not event.interrupted then
						BMFocusGlow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMFocusGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BMFocusGlow, event )
					else
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 1 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -79, 77 )
					FocusBar3:setTopBottom( true, false, 380.92, 406.92 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 363.92, 389.92 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
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
			end
		},
		RevealedRare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 0 )
				self.clipFinished( BMFocusGlow, {} )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 380, 406 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
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
				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
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
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
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
				self:setupElementClipCounter( 16 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					local BMFocusGlowFrame3 = function ( BMFocusGlow, event )
						if not event.interrupted then
							BMFocusGlow:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						BMFocusGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMFocusGlow, event )
						else
							BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMFocusGlowFrame3( BMFocusGlow, event )
						return 
					else
						BMFocusGlow:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						BMFocusGlow:setAlpha( 0.64 )
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", BMFocusGlowFrame3 )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 1 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 43.5, 199.5 )
				self.FocusBar3:setTopBottom( true, false, 360, 387 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
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
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 17 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					if not event.interrupted then
						BMFocusGlow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMFocusGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMFocusGlow, event )
					else
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 0 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -79, 77 )
					FocusBar3:setTopBottom( true, false, 360, 387 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 380, 406 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
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
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 16 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					if not event.interrupted then
						BMFocusGlow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMFocusGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BMFocusGlow, event )
					else
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 1 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -79, 77 )
					FocusBar3:setTopBottom( true, false, 380, 406 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 360, 387 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
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
			end
		},
		RevealedLegendary = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 0 )
				self.clipFinished( BMFocusGlow, {} )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -83.43, 72.57 )
				self.FocusBar3:setTopBottom( true, false, 380.92, 406.92 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
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
				self.BMTriangleLightFX:setLeftRight( true, true, -27, 28 )
				self.BMTriangleLightFX:setTopBottom( true, true, -22, 28 )
				self.BMTriangleLightFX:setRGB( 0.67, 0.2, 1 )
				self.BMTriangleLightFX:setAlpha( 1 )
				self.BMTriangleLightFX:setScale( 1 )
				self.clipFinished( BMTriangleLightFX, {} )
				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
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
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
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
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					local BMFocusGlowFrame3 = function ( BMFocusGlow, event )
						if not event.interrupted then
							BMFocusGlow:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						BMFocusGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMFocusGlow, event )
						else
							BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMFocusGlowFrame3( BMFocusGlow, event )
						return 
					else
						BMFocusGlow:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						BMFocusGlow:setAlpha( 0.64 )
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", BMFocusGlowFrame3 )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 1 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 360, 387 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
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
				self.LootDecryptionImage:setLeftRight( true, false, -4, 250 )
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
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 19 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					if not event.interrupted then
						BMFocusGlow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMFocusGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMFocusGlow, event )
					else
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 0 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( true, false, 43.5, 199.5 )
					FocusBar3:setTopBottom( true, false, 360, 387 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 43.5, 199.5 )
				self.FocusBar3:setTopBottom( true, false, 380, 406 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
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
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 17 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					if not event.interrupted then
						BMFocusGlow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMFocusGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BMFocusGlow, event )
					else
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 1 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( false, false, -79, 77 )
					FocusBar3:setTopBottom( true, false, 380, 406 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( false, false, -79, 77 )
				self.FocusBar3:setTopBottom( true, false, 360, 387 )
				self.FocusBar3:setAlpha( 1 )
				self.FocusBar3:setScale( 1 )
				FocusBar3Frame2( FocusBar3, {} )
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
			end
		},
		RevealedEpic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 23 )
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 0 )
				self.clipFinished( BMFocusGlow, {} )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 39.07, 195.07 )
				self.FocusBar3:setTopBottom( true, false, 380.92, 406.92 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
				self.clipFinished( FocusBar3, {} )
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
				lootRarityText:completeAnimation()
				self.lootRarityText:setAlpha( 1 )
				self.lootRarityText:setScale( 1 )
				self.clipFinished( lootRarityText, {} )
				lootRaritySet:completeAnimation()
				self.lootRaritySet:setLeftRight( true, true, 0, 0 )
				self.lootRaritySet:setTopBottom( false, false, 89, 109 )
				self.lootRaritySet:setAlpha( 1 )
				self.lootRaritySet:setScale( 1 )
				self.clipFinished( lootRaritySet, {} )
				lootCategory:completeAnimation()
				self.lootCategory:setLeftRight( true, true, -1, 0 )
				self.lootCategory:setTopBottom( false, false, 51, 71 )
				self.lootCategory:setAlpha( 1 )
				self.lootCategory:setScale( 1 )
				self.clipFinished( lootCategory, {} )
				lootName:completeAnimation()
				self.lootName:setLeftRight( true, true, -1, 0 )
				self.lootName:setTopBottom( false, false, 31, 51 )
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
				self.BMLockItem:setLeftRight( true, true, 0, -0.94 )
				self.BMLockItem:setTopBottom( true, true, 244.56, -48.44 )
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
			end,
			Focus = function ()
				self:setupElementClipCounter( 20 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					local BMFocusGlowFrame3 = function ( BMFocusGlow, event )
						if not event.interrupted then
							BMFocusGlow:beginAnimation( "keyframe", 659, false, false, CoD.TweenType.Linear )
						end
						BMFocusGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BMFocusGlow, event )
						else
							BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BMFocusGlowFrame3( BMFocusGlow, event )
						return 
					else
						BMFocusGlow:beginAnimation( "keyframe", 610, false, false, CoD.TweenType.Linear )
						BMFocusGlow:setAlpha( 0.64 )
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", BMFocusGlowFrame3 )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 1 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 43.5, 199.5 )
				self.FocusBar3:setTopBottom( true, false, 360, 387 )
				self.FocusBar3:setAlpha( 1 )
				self.clipFinished( FocusBar3, {} )
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
				self.nextClip = "Focus"
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 18 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					if not event.interrupted then
						BMFocusGlow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMFocusGlow:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMFocusGlow, event )
					else
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 0 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( true, false, 43.5, 199.5 )
					FocusBar3:setTopBottom( true, false, 360, 387 )
					FocusBar3:setAlpha( 1 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 43.5, 199.5 )
				self.FocusBar3:setTopBottom( true, false, 380, 406 )
				self.FocusBar3:setAlpha( 0 )
				self.FocusBar3:setScale( 1 )
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
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 20 )
				local BMFocusGlowFrame2 = function ( BMFocusGlow, event )
					if not event.interrupted then
						BMFocusGlow:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					BMFocusGlow:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BMFocusGlow, event )
					else
						BMFocusGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMFocusGlow:completeAnimation()
				self.BMFocusGlow:setAlpha( 1 )
				BMFocusGlowFrame2( BMFocusGlow, {} )
				local FocusBar3Frame2 = function ( FocusBar3, event )
					if not event.interrupted then
						FocusBar3:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
					end
					FocusBar3:setLeftRight( true, false, 43.5, 199.5 )
					FocusBar3:setTopBottom( true, false, 380, 406 )
					FocusBar3:setAlpha( 0 )
					FocusBar3:setScale( 1 )
					if event.interrupted then
						self.clipFinished( FocusBar3, event )
					else
						FocusBar3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBar3:completeAnimation()
				self.FocusBar3:setLeftRight( true, false, 43.5, 199.5 )
				self.FocusBar3:setTopBottom( true, false, 360, 387 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMFocusGlow:close()
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
		element.BMFlyEmberFX:close()
		element.BMFlyEmberFX0:close()
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

