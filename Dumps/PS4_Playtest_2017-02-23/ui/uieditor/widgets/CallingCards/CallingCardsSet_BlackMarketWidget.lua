require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BlackMarket.DuplicateCounter" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.CallingCardsSet_BlackMarketWidget = InheritFrom( LUI.UIElement )
CoD.CallingCardsSet_BlackMarketWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCardsSet_BlackMarketWidget )
	self.id = "CallingCardsSet_BlackMarketWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 126 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local textBg = LUI.UIImage.new()
	textBg:setLeftRight( 0, 0, 0, 360 )
	textBg:setTopBottom( 0, 0, 90, 128 )
	textBg:setAlpha( 0.1 )
	self:addElement( textBg )
	self.textBg = textBg
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 0, 6, 354 )
	text:setTopBottom( 0, 0, 95, 123 )
	text:setAlpha( 0.85 )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text:setLetterSpacing( 0.5 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, -33 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 0, 0 )
	bgImage:setTopBottom( 0, 1, 0, -36 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0, 1, 32, -32 )
	BMGoldBarMed:setTopBottom( 0, 0, 35, 55 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0.5, 0.5, -34.5, 34.5 )
	black:setTopBottom( 0, 0, 35, 55 )
	black:setRGB( 0.11, 0.11, 0.11 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0.5, 0.5, -34.5, 34.5 )
	blackMarketBrandIcon:setTopBottom( 0, 0, 11, 80 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local CardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	CardIcon:setLeftRight( 0, 0, -180, 540 )
	CardIcon:setTopBottom( 0, 0, -45, 135 )
	CardIcon.CardIconFrame:setScale( 0.5 )
	CardIcon:linkToElementModel( self, nil, false, function ( model )
		CardIcon:setModel( model, controller )
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local BoxButtonLrgInactiveDiag0 = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag0:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag0:setTopBottom( 0, 0, -3, 93 )
	BoxButtonLrgInactiveDiag0:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag0 )
	self.BoxButtonLrgInactiveDiag0 = BoxButtonLrgInactiveDiag0
	
	local featlineleft0000 = LUI.UIImage.new()
	featlineleft0000:setLeftRight( 0, 0, 180, 186 )
	featlineleft0000:setTopBottom( 0, 0, -60, 314 )
	featlineleft0000:setZRot( -90 )
	featlineleft0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0000 )
	self.featlineleft0000 = featlineleft0000
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0, 0, 162, 210 )
	lockedIcon:setTopBottom( 0, 0, 18, 66 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -3, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( 0.5, 0.5, -81, 81 )
	IconNew:setTopBottom( 0.5, 0.5, -36, 0 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	local DuplicateCounter = CoD.DuplicateCounter.new( menu, controller )
	DuplicateCounter:setLeftRight( 0, 0, 3, 33 )
	DuplicateCounter:setTopBottom( 0, 0, 0, 30 )
	DuplicateCounter:linkToElementModel( self, "rarityType", false, function ( model )
		DuplicateCounter:setModel( model, controller )
	end )
	self:addElement( DuplicateCounter )
	self.DuplicateCounter = DuplicateCounter
	
	self.resetProperties = function ()
		lockedIcon:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		CardIcon:completeAnimation()
		BMGoldBarMed:completeAnimation()
		black:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		DuplicateCounter:completeAnimation()
		IconNew:completeAnimation()
		lockedIcon:setAlpha( 1 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		CardIcon:setAlpha( 1 )
		BMGoldBarMed:setAlpha( 0 )
		black:setAlpha( 0 )
		blackMarketBrandIcon:setAlpha( 0 )
		DuplicateCounter:setAlpha( 1 )
		IconNew:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0.65 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0.65 )
				self.clipFinished( blackMarketBrandIcon, {} )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0 )
				self.clipFinished( CardIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				DuplicateCounter:completeAnimation()
				self.DuplicateCounter:setAlpha( 0 )
				self.clipFinished( DuplicateCounter, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0 )
				self.clipFinished( CardIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
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
			stateName = "New",
			condition = function ( menu, element, event )
				return CallingCards_IsNew( element, controller )
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
	CardIcon.id = "CardIcon"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BMGoldBarMed:close()
		self.CardIcon:close()
		self.BoxButtonLrgInactiveDiag0:close()
		self.lockedIcon:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.IconNew:close()
		self.DuplicateCounter:close()
		self.text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

