-- ea9a5cac7a29c500c3e4d22f2c7070b7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_LabelNew" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_LockBars" )

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
	self:setLeftRight( true, false, 0, 754 )
	self:setTopBottom( true, false, 0, 98 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( false, true, -337.8, -8 )
	BoxButtonLrgInactive:setTopBottom( true, false, 6, 91.5 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local MasterCallingCardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	MasterCallingCardIcon:setLeftRight( false, true, -335, -10 )
	MasterCallingCardIcon:setTopBottom( false, false, -40.75, 40.75 )
	MasterCallingCardIcon.CardIconFrame:setScale( 0.68 )
	MasterCallingCardIcon:linkToElementModel( self, nil, false, function ( model )
		MasterCallingCardIcon:setModel( model, controller )
	end )
	self:addElement( MasterCallingCardIcon )
	self.MasterCallingCardIcon = MasterCallingCardIcon
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( false, true, -338.8, -7 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, false, 6, 91.5 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local bgImage0 = LUI.UIImage.new()
	bgImage0:setLeftRight( false, true, -336, -9 )
	bgImage0:setTopBottom( false, false, -41.5, 41.5 )
	bgImage0:setRGB( 0.11, 0.11, 0.11 )
	bgImage0:setAlpha( 0 )
	self:addElement( bgImage0 )
	self.bgImage0 = bgImage0
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( true, true, 428, -14 )
	BMGoldBarMed:setTopBottom( false, false, -6.5, 6.5 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local black = LUI.UIImage.new()
	black:setLeftRight( false, false, 181.5, 227.5 )
	black:setTopBottom( true, false, 42.5, 55.5 )
	black:setRGB( 0.11, 0.11, 0.11 )
	black:setAlpha( 0 )
	self:addElement( black )
	self.black = black
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, 181.5, 227.5 )
	blackMarketBrandIcon:setTopBottom( true, false, 26, 72 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( true, false, 12.92, 317.42 )
	EmblemName:setTopBottom( true, false, 14, 40 )
	EmblemName:subscribeToGlobalModel( controller, "CallingCardsBlackMarketMasterCard", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			EmblemName.weaponNameLabel:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( true, false, 11.92, 317.42 )
	EmblemSubtitle:setTopBottom( true, false, 45.58, 65.58 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EmblemSubtitle:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			EmblemSubtitle:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( false, true, -337.8, -9 )
	FocusBarT:setTopBottom( true, false, 6, 10 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( false, true, -337.8, -9 )
	FocusBarB:setTopBottom( false, true, -11.5, -8.5 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local IconNew = CoD.cac_LabelNew.new( menu, controller )
	IconNew:setLeftRight( false, true, -223, -115 )
	IconNew:setTopBottom( false, false, -12, 12 )
	IconNew:setAlpha( 0 )
	self:addElement( IconNew )
	self.IconNew = IconNew
	
	local BMContractsLockBars = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars:setLeftRight( true, false, 589.8, 749.8 )
	BMContractsLockBars:setTopBottom( true, false, 31, 66 )
	BMContractsLockBars:setAlpha( 0 )
	self:addElement( BMContractsLockBars )
	self.BMContractsLockBars = BMContractsLockBars
	
	local BMContractsLockBars0 = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars0:setLeftRight( true, false, 418, 573.8 )
	BMContractsLockBars0:setTopBottom( true, false, 31, 66 )
	BMContractsLockBars0:setAlpha( 0 )
	BMContractsLockBars0:setYRot( 180 )
	self:addElement( BMContractsLockBars0 )
	self.BMContractsLockBars0 = BMContractsLockBars0
	
	local bmContractBrandIcon = LUI.UIImage.new()
	bmContractBrandIcon:setLeftRight( true, false, 549, 613 )
	bmContractBrandIcon:setTopBottom( true, false, 18, 82 )
	bmContractBrandIcon:setAlpha( 0 )
	bmContractBrandIcon:setImage( RegisterImage( "uie_t7_bm_special_contracts_logo" ) )
	self:addElement( bmContractBrandIcon )
	self.bmContractBrandIcon = bmContractBrandIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 1 )
				self.clipFinished( MasterCallingCardIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0.5 )
				self.clipFinished( bgImage0, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
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
				self:setupElementClipCounter( 3 )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0 )
				self.clipFinished( bgImage0, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 0 )
				self.clipFinished( MasterCallingCardIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0 )
				self.clipFinished( bgImage0, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setAlpha( 0 )
				self.clipFinished( EmblemName, {} )
				EmblemSubtitle:completeAnimation()
				self.EmblemSubtitle:setAlpha( 0 )
				self.clipFinished( EmblemSubtitle, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0 )
				self.clipFinished( bmContractBrandIcon, {} )
			end
		},
		BMClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
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
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
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
				self:setupElementClipCounter( 5 )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0 )
				self.clipFinished( bgImage0, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 1 )
				self.clipFinished( blackMarketBrandIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		ContractClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
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
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 0 )
				self.clipFinished( IconNew, {} )
				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setAlpha( 0.65 )
				self.clipFinished( BMContractsLockBars, {} )
				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setAlpha( 0.65 )
				self.clipFinished( BMContractsLockBars0, {} )
				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setAlpha( 0.65 )
				self.clipFinished( bmContractBrandIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0 )
				self.clipFinished( bgImage0, {} )
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
		New = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				MasterCallingCardIcon:completeAnimation()
				self.MasterCallingCardIcon:setAlpha( 1 )
				self.clipFinished( MasterCallingCardIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0.5 )
				self.clipFinished( bgImage0, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				IconNew:completeAnimation()
				self.IconNew:setAlpha( 1 )
				self.clipFinished( IconNew, {} )
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
				bgImage0:completeAnimation()
				self.bgImage0:setAlpha( 0 )
				self.clipFinished( bgImage0, {} )
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
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f14_local0 = BlackMarketHideMasterCallingCards()
				if f14_local0 then
					if not IsViewingSideBetCallingCardSet( controller ) then
						f14_local0 = not IsViewingSpecialContractCallingCardSet( controller )
					else
						f14_local0 = false
					end
				end
				return f14_local0
			end
		},
		{
			stateName = "BMClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
		},
		{
			stateName = "ContractClassified",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isContractClassified" )
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
	self:linkToElementModel( self, "isContractClassified", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isContractClassified"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.BoxButtonLrgInactive:close()
		element.MasterCallingCardIcon:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.BMGoldBarMed:close()
		element.EmblemName:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.IconNew:close()
		element.BMContractsLockBars:close()
		element.BMContractsLockBars0:close()
		element.EmblemSubtitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

