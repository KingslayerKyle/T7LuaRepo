require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.BlackMarket.DuplicateCounter" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "gain_focus", function ( self, event )
		local model = self:getModel()
		local maxTierModel = Engine.GetModel( model, "maxTier" )
		local currentTierModel = Engine.GetModel( model, "currentTier" )
		local tierXPModel = Engine.GetModel( model, "xp" )
		if maxTierModel and currentTierModel and tierXPModel then
			SetGlobalModelValue( "maxTier", Engine.GetModelValue( maxTierModel ) )
			SetGlobalModelValue( "currentTier", Engine.GetModelValue( currentTierModel ) )
			SetGlobalModelValue( "tierXP", Engine.GetModelValue( tierXPModel ) )
			self:dispatchEventToParent( {
				name = "update_tier_list",
				controller = controller
			} )
		end
	end )
end

CoD.CallingCards_CardWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_CardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_CardWidget )
	self.id = "CallingCards_CardWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setAlpha( 0.8 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0.11, 0.11, 0.11 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( 0, 1, 0, 0 )
	bgImage:setTopBottom( 0, 1, 0, 0 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0, 0, 31, 328 )
	BMGoldBarMed:setTopBottom( 0, 0, 35, 55 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 0, 145, 214 )
	black:setTopBottom( 0, 0, 35, 55 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0, 0, 145, 214 )
	blackMarketBrandIcon:setTopBottom( 0, 0, 11, 80 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( 0.5, 0.5, 0, 0 )
	CallingCardsFrameWidget:setTopBottom( 0.5, 0.5, 0, 0 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.5 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.15 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( 0.5, 0.5, -24, 24 )
	LockedIcon:setTopBottom( 0.5, 0.5, -24, 24 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -1, 1 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -1, 1 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( 0.5, 0.5, -81, 81 )
	IconNew:setTopBottom( 0.5, 0.5, -17, 19 )
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
		LockedIcon:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		Background:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		CallingCardsFrameWidget:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		BMGoldBarMed:completeAnimation()
		black:completeAnimation()
		DuplicateCounter:completeAnimation()
		IconNew:completeAnimation()
		LockedIcon:setAlpha( 1 )
		BoxButtonLrgInactive:setAlpha( 0.8 )
		BoxButtonLrgInactiveDiag:setAlpha( 0.15 )
		Background:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		CallingCardsFrameWidget:setAlpha( 1 )
		blackMarketBrandIcon:setAlpha( 0 )
		BMGoldBarMed:setAlpha( 0 )
		black:setLeftRight( 0, 0, 145, 214 )
		black:setTopBottom( 0, 0, 35, 55 )
		black:setRGB( 1, 1, 1 )
		black:setAlpha( 0 )
		DuplicateCounter:setAlpha( 1 )
		IconNew:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( Background, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0.9 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setLeftRight( 0, 0, 149.5, 209.5 )
				self.black:setTopBottom( 0, 0, 40, 50 )
				self.black:setRGB( 0.11, 0.11, 0.11 )
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0.9 )
				self.clipFinished( blackMarketBrandIcon, {} )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 0 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				DuplicateCounter:completeAnimation()
				self.DuplicateCounter:setAlpha( 0 )
				self.clipFinished( DuplicateCounter, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setLeftRight( 0, 0, 136.5, 222.5 )
				self.black:setTopBottom( 0, 0, 35, 55 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 0 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 0 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				DuplicateCounter:completeAnimation()
				self.DuplicateCounter:setAlpha( 0 )
				self.clipFinished( DuplicateCounter, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 0 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		New = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
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
				return IsSelfModelValueTrue( element, controller, "isLocked" )
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
	self:linkToElementModel( self, "isLocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	CallingCardsFrameWidget.id = "CallingCardsFrameWidget"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BMGoldBarMed:close()
		self.CallingCardsFrameWidget:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.LockedIcon:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.IconNew:close()
		self.DuplicateCounter:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

