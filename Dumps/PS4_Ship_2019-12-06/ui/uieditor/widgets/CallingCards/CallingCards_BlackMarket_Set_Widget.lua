require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeName" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_Set_CountWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_LockBars" )

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
	self:setLeftRight( true, false, 0, 302 )
	self:setTopBottom( true, false, 0, 135 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, 2 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CallingCardImage = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardImage:setLeftRight( true, false, -89, 391 )
	CallingCardImage:setTopBottom( true, false, 8, 128 )
	CallingCardImage.CardIconFrame:setScale( 0.63 )
	CallingCardImage:linkToElementModel( self, nil, false, function ( model )
		CallingCardImage:setModel( model, controller )
	end )
	self:addElement( CallingCardImage )
	self.CallingCardImage = CallingCardImage
	
	local CallingCardName = LUI.UITightText.new()
	CallingCardName:setLeftRight( true, false, 3, 203 )
	CallingCardName:setTopBottom( false, true, -22, -2 )
	CallingCardName:setTTF( "fonts/default.ttf" )
	CallingCardName:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			CallingCardName:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( CallingCardName )
	self.CallingCardName = CallingCardName
	
	local CallingCardRarityName = CoD.CryptokeyTypeName.new( menu, controller )
	CallingCardRarityName:setLeftRight( false, true, -97, -1 )
	CallingCardRarityName:setTopBottom( true, false, 3, 25 )
	CallingCardRarityName:setAlpha( 0.9 )
	CallingCardRarityName:setScale( 0.9 )
	CallingCardRarityName:linkToElementModel( self, "rarityType", false, function ( model )
		CallingCardRarityName:setModel( model, controller )
	end )
	self:addElement( CallingCardRarityName )
	self.CallingCardRarityName = CallingCardRarityName
	
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
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( true, true, 10, -10 )
	BMGoldBarMed:setTopBottom( false, false, -6.5, 6.5 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 129, -131 )
	black:setTopBottom( false, false, -3.5, 3.5 )
	black:setRGB( 0.11, 0.11, 0.11 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -24, 22 )
	blackMarketBrandIcon:setTopBottom( false, false, -23, 23 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local setWidget = CoD.CallingCards_BlackMarket_Set_CountWidget.new( menu, controller )
	setWidget:setLeftRight( true, false, 4, 60 )
	setWidget:setTopBottom( true, false, 2, 27 )
	setWidget:linkToElementModel( self, nil, false, function ( model )
		setWidget:setModel( model, controller )
	end )
	self:addElement( setWidget )
	self.setWidget = setWidget
	
	local BMContractsLockBars = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars:setLeftRight( true, false, 158.8, 301 )
	BMContractsLockBars:setTopBottom( true, false, 49, 84 )
	BMContractsLockBars:setAlpha( 0 )
	self:addElement( BMContractsLockBars )
	self.BMContractsLockBars = BMContractsLockBars
	
	local BMContractsLockBars0 = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars0:setLeftRight( true, false, 0, 142.8 )
	BMContractsLockBars0:setTopBottom( true, false, 49, 84 )
	BMContractsLockBars0:setAlpha( 0 )
	BMContractsLockBars0:setYRot( 180 )
	self:addElement( BMContractsLockBars0 )
	self.BMContractsLockBars0 = BMContractsLockBars0
	
	local bmContractBrandIcon = LUI.UIImage.new()
	bmContractBrandIcon:setLeftRight( true, false, 118, 182 )
	bmContractBrandIcon:setTopBottom( true, false, 36, 100 )
	bmContractBrandIcon:setAlpha( 0 )
	bmContractBrandIcon:setImage( RegisterImage( "uie_t7_bm_special_contracts_logo" ) )
	self:addElement( bmContractBrandIcon )
	self.bmContractBrandIcon = bmContractBrandIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				CallingCardImage:completeAnimation()
				self.CallingCardImage:setAlpha( 1 )
				self.clipFinished( CallingCardImage, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 1 )
				self.clipFinished( CallingCardName, {} )
				CallingCardRarityName:completeAnimation()
				self.CallingCardRarityName:setLeftRight( false, true, -97, -1 )
				self.CallingCardRarityName:setTopBottom( true, false, 3, 25 )
				self.CallingCardRarityName:setAlpha( 0.9 )
				self.clipFinished( CallingCardRarityName, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				setWidget:completeAnimation()
				self.setWidget:setLeftRight( true, false, 4, 60 )
				self.setWidget:setTopBottom( true, false, 2, 27 )
				self.setWidget:setAlpha( 1 )
				self.clipFinished( setWidget, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
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
				self:setupElementClipCounter( 12 )
				CallingCardImage:completeAnimation()
				self.CallingCardImage:setAlpha( 0 )
				self.clipFinished( CallingCardImage, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 0 )
				self.clipFinished( CallingCardName, {} )
				CallingCardRarityName:completeAnimation()
				self.CallingCardRarityName:setAlpha( 0 )
				self.clipFinished( CallingCardRarityName, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
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
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
			end
		},
		isContractClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				CallingCardImage:completeAnimation()
				self.CallingCardImage:setAlpha( 0 )
				self.clipFinished( CallingCardImage, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 0 )
				self.clipFinished( CallingCardName, {} )
				CallingCardRarityName:completeAnimation()
				self.CallingCardRarityName:setAlpha( 0 )
				self.clipFinished( CallingCardRarityName, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				setWidget:completeAnimation()
				self.setWidget:setAlpha( 0 )
				self.clipFinished( setWidget, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0.8 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0.8 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0.8 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 1 )
				self.clipFinished( bmContractBrandIcon, {} )
			end
		},
		CommonSet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				CallingCardImage:completeAnimation()
				self.CallingCardImage:setAlpha( 0 )
				self.clipFinished( CallingCardImage, {} )
				CallingCardName:completeAnimation()
				self.CallingCardName:setAlpha( 0 )
				self.clipFinished( CallingCardName, {} )
				CallingCardRarityName:completeAnimation()
				self.CallingCardRarityName:setLeftRight( false, false, -48, 48 )
				self.CallingCardRarityName:setTopBottom( true, false, 47, 69 )
				self.CallingCardRarityName:setAlpha( 0.9 )
				self.clipFinished( CallingCardRarityName, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				setWidget:completeAnimation()
				self.setWidget:setLeftRight( false, false, -29, 27 )
				self.setWidget:setTopBottom( true, false, 71, 96 )
				self.setWidget:setAlpha( 1 )
				self.clipFinished( setWidget, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
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
			stateName = "isContractClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isSetContractClassified" )
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
	self:linkToElementModel( self, "isSetContractClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSetContractClassified"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.CallingCardImage:close()
		element.CallingCardRarityName:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.BMGoldBarMed:close()
		element.setWidget:close()
		element.BMContractsLockBars:close()
		element.BMContractsLockBars0:close()
		element.CallingCardName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

