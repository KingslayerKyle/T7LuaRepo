require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeName" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CallingCards_BlackMarket_Profiler = InheritFrom( LUI.UIElement )
CoD.CallingCards_BlackMarket_Profiler.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_BlackMarket_Profiler )
	self.id = "CallingCards_BlackMarket_Profiler"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 690 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( 0, 0, 2, 138 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 5, -3 )
	bgImage:setTopBottom( 0, 0, 5, 134 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local SelectedCardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	SelectedCardIcon:setLeftRight( 0, 0, -97, 623 )
	SelectedCardIcon:setTopBottom( 0, 0, -21, 159 )
	SelectedCardIcon.CardIconFrame:setScale( 0.72 )
	SelectedCardIcon:linkToElementModel( self, nil, false, function ( model )
		SelectedCardIcon:setModel( model, controller )
	end )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0, 0, 4, 522 )
	BMGoldBarMed:setTopBottom( 0, 0, 49, 94 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0.5, 0.5, -54, 49 )
	blackMarketBrandIcon:setTopBottom( 0, 0, 18, 121 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 0, 2, 140 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( 0, 0, 28, 506 )
	EmblemName:setTopBottom( 0, 0, 154.5, 205.5 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( 0, 0, 30, 507 )
	EmblemSubtitle:setTopBottom( 0, 0, 211, 241 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EmblemSubtitle:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemSubtitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( 0, 0, 263, 269 )
	featlineleft0:setTopBottom( 0, 0, -175, 363 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( 0, 0, 263, 269 )
	featlineleft000:setTopBottom( 0, 0, -220, 318 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local LootRarityType = CoD.CryptokeyTypeName.new( menu, controller )
	LootRarityType:setLeftRight( 0, 0, 30, 174 )
	LootRarityType:setTopBottom( 1, 1, -109.5, -76.5 )
	LootRarityType:linkToElementModel( self, "rarityType", false, function ( model )
		LootRarityType:setModel( model, controller )
	end )
	self:addElement( LootRarityType )
	self.LootRarityType = LootRarityType
	
	self.resetProperties = function ()
		BoxButtonLrgInactiveDiag:completeAnimation()
		featlineleft0:completeAnimation()
		featlineleft000:completeAnimation()
		SelectedCardIcon:completeAnimation()
		bgImage:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		BMGoldBarMed:completeAnimation()
		BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
		featlineleft0:setAlpha( 1 )
		featlineleft000:setAlpha( 1 )
		SelectedCardIcon:setAlpha( 1 )
		bgImage:setAlpha( 0 )
		blackMarketBrandIcon:setLeftRight( 0.5, 0.5, -54, 49 )
		blackMarketBrandIcon:setTopBottom( 0, 0, 18, 121 )
		blackMarketBrandIcon:setAlpha( 0 )
		BMGoldBarMed:setLeftRight( 0, 0, 4, 522 )
		BMGoldBarMed:setTopBottom( 0, 0, 49, 94 )
		BMGoldBarMed:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
			end
		},
		BMClassfied = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0 )
				self.clipFinished( SelectedCardIcon, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setLeftRight( 0, 0, 23.5, 500.5 )
				self.BMGoldBarMed:setTopBottom( 0, 0, 48, 93 )
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setLeftRight( 0.5, 0.5, -43, 54 )
				self.blackMarketBrandIcon:setTopBottom( 0, 0, 21, 118 )
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BMClassfied",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
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
	SelectedCardIcon.id = "SelectedCardIcon"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.StartMenuframenoBG0:close()
		self.SelectedCardIcon:close()
		self.BMGoldBarMed:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.EmblemName:close()
		self.LootRarityType:close()
		self.EmblemSubtitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

