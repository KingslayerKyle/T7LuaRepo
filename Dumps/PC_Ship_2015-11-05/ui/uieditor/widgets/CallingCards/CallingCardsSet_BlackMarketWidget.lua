require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )

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
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 84 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local textBg = LUI.UIImage.new()
	textBg:setLeftRight( true, false, 0, 240 )
	textBg:setTopBottom( true, false, 60, 85 )
	textBg:setAlpha( 0.1 )
	self:addElement( textBg )
	self.textBg = textBg
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 4, 236 )
	text:setTopBottom( true, false, 63, 82 )
	text:setAlpha( 0.85 )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text:setLetterSpacing( 0.5 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			text:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, -22 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, -24 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( true, true, 21, -21 )
	BMGoldBarMed:setTopBottom( true, false, 23.5, 36.5 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( false, false, -23, 23 )
	black:setTopBottom( true, false, 23.5, 36.5 )
	black:setRGB( 0.11, 0.11, 0.11 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -23, 23 )
	blackMarketBrandIcon:setTopBottom( true, false, 7, 53 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local CardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	CardIcon:setLeftRight( true, false, -120, 360 )
	CardIcon:setTopBottom( true, false, -30, 90 )
	CardIcon.CardIconFrame:setScale( 0.5 )
	CardIcon:linkToElementModel( self, nil, false, function ( model )
		CardIcon:setModel( model, controller )
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local BoxButtonLrgInactiveDiag0 = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag0:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag0:setTopBottom( true, false, -2, 62 )
	BoxButtonLrgInactiveDiag0:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag0 )
	self.BoxButtonLrgInactiveDiag0 = BoxButtonLrgInactiveDiag0
	
	local featlineleft0000 = LUI.UIImage.new()
	featlineleft0000:setLeftRight( true, false, 120, 124 )
	featlineleft0000:setTopBottom( true, false, -40, 209 )
	featlineleft0000:setZRot( -90 )
	featlineleft0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0000 )
	self.featlineleft0000 = featlineleft0000
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 108, 140 )
	lockedIcon:setTopBottom( true, false, 12, 44 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -2, 2 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -2, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( false, false, -54, 54 )
	IconNew:setTopBottom( false, false, -24, 0 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
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
				self:setupElementClipCounter( 11 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
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
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
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
				self:setupElementClipCounter( 10 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 1 )
				self.clipFinished( CardIcon, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.BMGoldBarMed:close()
		element.CardIcon:close()
		element.BoxButtonLrgInactiveDiag0:close()
		element.lockedIcon:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.IconNew:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

