require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeName" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Set_CountWidget" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.CallingCards_BlackMarket_Set_Widget = InheritFrom( LUI.UIElement )
CoD.CallingCards_BlackMarket_Set_Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_BlackMarket_Set_Widget )
	self.id = "CallingCards_BlackMarket_Set_Widget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 453 )
	self:setTopBottom( 0, 0, 0, 202 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CallingCardImage = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardImage:setLeftRight( 0, 0, -134, 586 )
	CallingCardImage:setTopBottom( 0, 0, 12, 192 )
	CallingCardImage.CardIconFrame:setScale( 0.62 )
	CallingCardImage:linkToElementModel( self, nil, false, function ( model )
		CallingCardImage:setModel( model, controller )
	end )
	self:addElement( CallingCardImage )
	self.CallingCardImage = CallingCardImage
	
	local CallingCardName = LUI.UITightText.new()
	CallingCardName:setLeftRight( 0, 0, 4, 304 )
	CallingCardName:setTopBottom( 1, 1, -33, -3 )
	CallingCardName:setTTF( "fonts/default.ttf" )
	CallingCardName:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CallingCardName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( CallingCardName )
	self.CallingCardName = CallingCardName
	
	local CallingCardRarityName = CoD.CryptokeyTypeName.new( menu, controller )
	CallingCardRarityName:setLeftRight( 1, 1, -146, -2 )
	CallingCardRarityName:setTopBottom( 0, 0, 4.5, 37.5 )
	CallingCardRarityName:setAlpha( 0.9 )
	CallingCardRarityName:setScale( 0.9 )
	CallingCardRarityName:linkToElementModel( self, "rarityType", false, function ( model )
		CallingCardRarityName:setModel( model, controller )
	end )
	self:addElement( CallingCardRarityName )
	self.CallingCardRarityName = CallingCardRarityName
	
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
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0, 1, 15, -15 )
	BMGoldBarMed:setTopBottom( 0.5, 0.5, -10, 10 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 193, -197 )
	black:setTopBottom( 0.5, 0.5, -5, 5 )
	black:setRGB( 0.11, 0.11, 0.11 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0.5, 0.5, -36, 33 )
	blackMarketBrandIcon:setTopBottom( 0.5, 0.5, -34.5, 34.5 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local setWidget = CoD.CallingCards_BlackMarket_Set_CountWidget.new( menu, controller )
	setWidget:setLeftRight( 0, 0, 6, 90 )
	setWidget:setTopBottom( 0, 0, 3, 41 )
	setWidget:linkToElementModel( self, nil, false, function ( model )
		setWidget:setModel( model, controller )
	end )
	self:addElement( setWidget )
	self.setWidget = setWidget
	
	self.resetProperties = function ()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		CallingCardName:completeAnimation()
		CallingCardImage:completeAnimation()
		BMGoldBarMed:completeAnimation()
		black:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		CallingCardRarityName:completeAnimation()
		setWidget:completeAnimation()
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		CallingCardName:setAlpha( 1 )
		CallingCardImage:setAlpha( 1 )
		BMGoldBarMed:setAlpha( 0 )
		black:setAlpha( 0 )
		blackMarketBrandIcon:setAlpha( 0 )
		CallingCardRarityName:setLeftRight( 1, 1, -146, -2 )
		CallingCardRarityName:setTopBottom( 0, 0, 4.5, 37.5 )
		CallingCardRarityName:setAlpha( 0.9 )
		setWidget:setLeftRight( 0, 0, 6, 90 )
		setWidget:setTopBottom( 0, 0, 3, 41 )
		setWidget:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
		isBMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				CallingCardImage:completeAnimation()
				self.CallingCardImage:setAlpha( 0 )
				self.clipFinished( CallingCardImage, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 0 )
				self.clipFinished( CallingCardName, {} )
				CallingCardRarityName:completeAnimation()
				self.CallingCardRarityName:setAlpha( 0 )
				self.clipFinished( CallingCardRarityName, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0.8 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0.8 )
				self.clipFinished( blackMarketBrandIcon, {} )
				setWidget:completeAnimation()
				self.setWidget:setAlpha( 0 )
				self.clipFinished( setWidget, {} )
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
		CommonSet = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				CallingCardImage:completeAnimation()
				self.CallingCardImage:setAlpha( 0 )
				self.clipFinished( CallingCardImage, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 0 )
				self.clipFinished( CallingCardName, {} )
				CallingCardRarityName:completeAnimation()
				self.CallingCardRarityName:setLeftRight( 0.5, 0.5, -72, 72 )
				self.CallingCardRarityName:setTopBottom( 0, 0, 70.5, 103.5 )
				self.clipFinished( CallingCardRarityName, {} )
				setWidget:completeAnimation()
				self.setWidget:setLeftRight( 0.5, 0.5, -44, 40 )
				self.setWidget:setTopBottom( 0, 0, 106, 144 )
				self.clipFinished( setWidget, {} )
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
			stateName = "isBMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isSetBMClassified" )
			end
		},
		{
			stateName = "CommonSet",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "commonSet" )
			end
		}
	} )
	self:linkToElementModel( self, "isSetBMClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSetBMClassified"
		} )
	end )
	CallingCardImage.id = "CallingCardImage"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.CallingCardImage:close()
		self.CallingCardRarityName:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.BMGoldBarMed:close()
		self.setWidget:close()
		self.CallingCardName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

