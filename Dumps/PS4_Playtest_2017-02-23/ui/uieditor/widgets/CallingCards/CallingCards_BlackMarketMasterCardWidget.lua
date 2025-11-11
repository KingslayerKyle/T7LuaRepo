require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

CoD.CallingCards_BlackMarketMasterCardWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_BlackMarketMasterCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_BlackMarketMasterCardWidget )
	self.id = "CallingCards_BlackMarketMasterCardWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1131 )
	self:setTopBottom( 0, 0, 0, 147 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, -2 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 1, 1, -507, -12 )
	BoxButtonLrgInactive:setTopBottom( 0, 0, 9, 137 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local MasterCallingCardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	MasterCallingCardIcon:setLeftRight( 1, 1, -503, -15 )
	MasterCallingCardIcon:setTopBottom( 0.5, 0.5, -61, 61 )
	MasterCallingCardIcon.CardIconFrame:setScale( 0.68 )
	MasterCallingCardIcon:linkToElementModel( self, nil, false, function ( model )
		MasterCallingCardIcon:setModel( model, controller )
	end )
	self:addElement( MasterCallingCardIcon )
	self.MasterCallingCardIcon = MasterCallingCardIcon
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 1, 1, -508, -10 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 0, 9, 137 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local bgImage0 = LUI.UIImage.new()
	bgImage0:setLeftRight( 1, 1, -504, -14 )
	bgImage0:setTopBottom( 0.5, 0.5, -62, 62 )
	bgImage0:setRGB( 0.11, 0.11, 0.11 )
	bgImage0:setAlpha( 0 )
	self:addElement( bgImage0 )
	self.bgImage0 = bgImage0
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( 0, 1, 642, -22 )
	BMGoldBarMed:setTopBottom( 0.5, 0.5, -10, 10 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0.5, 0.5, 272, 341 )
	black:setTopBottom( 0, 0, 64, 84 )
	black:setRGB( 0.11, 0.11, 0.11 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( 0.5, 0.5, 272, 341 )
	blackMarketBrandIcon:setTopBottom( 0, 0, 39, 108 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( 0, 0, 19, 476 )
	EmblemName:setTopBottom( 0, 0, 21, 60 )
	EmblemName:subscribeToGlobalModel( controller, "CallingCardsBlackMarketMasterCard", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( 0, 0, 18, 476 )
	EmblemSubtitle:setTopBottom( 0, 0, 68, 98 )
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
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 1, 1, -507, -14 )
	FocusBarT:setTopBottom( 0, 0, 9, 15 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 1, 1, -507, -14 )
	FocusBarB:setTopBottom( 1, 1, -17, -13 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( 1, 1, -335, -173 )
	IconNew:setTopBottom( 0.5, 0.5, -18, 18 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	self.resetProperties = function ()
		bgImage0:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		MasterCallingCardIcon:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		BMGoldBarMed:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		black:completeAnimation()
		IconNew:completeAnimation()
		bgImage0:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		MasterCallingCardIcon:setAlpha( 1 )
		BoxButtonLrgInactiveDiag:setAlpha( 0 )
		BMGoldBarMed:setAlpha( 0 )
		blackMarketBrandIcon:setAlpha( 0 )
		black:setAlpha( 0 )
		IconNew:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0.5 )
				self.clipFinished( bgImage0, {} )
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
				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 0 )
				self.clipFinished( MasterCallingCardIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.2 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0.5 )
				self.clipFinished( bgImage0, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0.65 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0.65 )
				self.clipFinished( blackMarketBrandIcon, {} )
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
		New = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0.5 )
				self.clipFinished( bgImage0, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
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
	MasterCallingCardIcon.id = "MasterCallingCardIcon"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.BoxButtonLrgInactive:close()
		self.MasterCallingCardIcon:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.BMGoldBarMed:close()
		self.EmblemName:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.IconNew:close()
		self.EmblemSubtitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

