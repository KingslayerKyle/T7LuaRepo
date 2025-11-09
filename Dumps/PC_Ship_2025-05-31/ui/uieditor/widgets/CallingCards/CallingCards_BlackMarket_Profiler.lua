require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeName" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_BlackMarket_SideBetExplaination" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_LockBars" )

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
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 460 )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( true, false, 1, 92 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 3, -2 )
	bgImage:setTopBottom( true, false, 3, 89 )
	bgImage:setRGB( 0.11, 0.11, 0.11 )
	bgImage:setAlpha( 0 )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local SelectedCardIcon = CoD.CallingCards_FrameWidget.new( menu, controller )
	SelectedCardIcon:setLeftRight( true, false, -64.5, 415.5 )
	SelectedCardIcon:setTopBottom( true, false, -14, 106 )
	SelectedCardIcon.CardIconFrame:setScale( 0.72 )
	SelectedCardIcon:linkToElementModel( self, nil, false, function ( model )
		SelectedCardIcon:setModel( model, controller )
	end )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local BMGoldBarMed = CoD.BM_GoldBarMed.new( menu, controller )
	BMGoldBarMed:setLeftRight( true, false, 3, 348 )
	BMGoldBarMed:setTopBottom( true, false, 32.5, 62.4 )
	BMGoldBarMed:setAlpha( 0 )
	self:addElement( BMGoldBarMed )
	self.BMGoldBarMed = BMGoldBarMed
	
	local blackMarketBrandIcon = LUI.UIImage.new()
	blackMarketBrandIcon:setLeftRight( false, false, -36.25, 32.25 )
	blackMarketBrandIcon:setTopBottom( true, false, 11.75, 80.25 )
	blackMarketBrandIcon:setAlpha( 0 )
	blackMarketBrandIcon:setImage( RegisterImage( "uie_t7_icon_blackmarket_encryptedicon_large" ) )
	self:addElement( blackMarketBrandIcon )
	self.blackMarketBrandIcon = blackMarketBrandIcon
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, false, 1, 93.25 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( true, false, 19, 337.5 )
	EmblemName:setTopBottom( true, false, 103, 137 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			EmblemName.weaponNameLabel:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( true, false, 20, 338 )
	EmblemSubtitle:setTopBottom( true, false, 141, 161 )
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
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( true, false, 175, 179 )
	featlineleft0:setTopBottom( true, false, -117, 242 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( true, false, 175, 179 )
	featlineleft000:setTopBottom( true, false, -147, 212 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local LootRarityType = CoD.CryptokeyTypeName.new( menu, controller )
	LootRarityType:setLeftRight( true, false, 20, 116 )
	LootRarityType:setTopBottom( false, true, -73, -51 )
	LootRarityType:linkToElementModel( self, "rarityType", false, function ( model )
		LootRarityType:setModel( model, controller )
	end )
	self:addElement( LootRarityType )
	self.LootRarityType = LootRarityType
	
	local CallingCardsBlackMarketSideBetExplaination0 = CoD.CallingCards_BlackMarket_SideBetExplaination.new( menu, controller )
	CallingCardsBlackMarketSideBetExplaination0:setLeftRight( true, false, 19, 338 )
	CallingCardsBlackMarketSideBetExplaination0:setTopBottom( false, true, -190, 10 )
	self:addElement( CallingCardsBlackMarketSideBetExplaination0 )
	self.CallingCardsBlackMarketSideBetExplaination0 = CallingCardsBlackMarketSideBetExplaination0
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, true, 1, -1 )
	TitleBg:setTopBottom( true, false, 32.5, 62.4 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( true, false, 159, 191 )
	LockedIcon:setTopBottom( true, false, 31.95, 63.95 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local BMContractsLockBars = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars:setLeftRight( true, false, 179.8, 341.8 )
	BMContractsLockBars:setTopBottom( true, false, 28, 63 )
	BMContractsLockBars:setAlpha( 0 )
	self:addElement( BMContractsLockBars )
	self.BMContractsLockBars = BMContractsLockBars
	
	local BMContractsLockBars0 = CoD.BM_Contracts_LockBars.new( menu, controller )
	BMContractsLockBars0:setLeftRight( true, false, 10.8, 163.8 )
	BMContractsLockBars0:setTopBottom( true, false, 28, 63 )
	BMContractsLockBars0:setAlpha( 0 )
	BMContractsLockBars0:setYRot( 180 )
	self:addElement( BMContractsLockBars0 )
	self.BMContractsLockBars0 = BMContractsLockBars0
	
	local bmContractBrandIcon = LUI.UIImage.new()
	bmContractBrandIcon:setLeftRight( true, false, 129.5, 216.95 )
	bmContractBrandIcon:setTopBottom( true, false, 4, 91.45 )
	bmContractBrandIcon:setAlpha( 0 )
	bmContractBrandIcon:setImage( RegisterImage( "uie_t7_bm_special_contracts_logo" ) )
	self:addElement( bmContractBrandIcon )
	self.bmContractBrandIcon = bmContractBrandIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 1 )
				self.clipFinished( SelectedCardIcon, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
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
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
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
		BMClassfied = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				bgImage:completeAnimation()
				self.bgImage:setLeftRight( true, true, 3, -2 )
				self.bgImage:setTopBottom( true, false, 3, 89 )
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0 )
				self.clipFinished( SelectedCardIcon, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setLeftRight( true, false, 16, 334 )
				self.BMGoldBarMed:setTopBottom( true, false, 32.18, 62.08 )
				self.BMGoldBarMed:setAlpha( 1 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setLeftRight( false, false, -28.25, 36.25 )
				self.blackMarketBrandIcon:setTopBottom( true, false, 13.75, 78.25 )
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
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
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
		ContractClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				bgImage:completeAnimation()
				self.bgImage:setLeftRight( true, true, 3, -2 )
				self.bgImage:setTopBottom( true, false, 3, 89 )
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0 )
				self.clipFinished( SelectedCardIcon, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setLeftRight( true, false, 16, 334 )
				self.BMGoldBarMed:setTopBottom( true, false, 32.18, 62.08 )
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setLeftRight( false, false, -28.25, 36.25 )
				self.blackMarketBrandIcon:setTopBottom( true, false, 13.75, 78.25 )
				self.blackMarketBrandIcon:setAlpha( 0 )
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
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
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
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0.7 )
				self.clipFinished( SelectedCardIcon, {} )
				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )
				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 1 )
				self.clipFinished( featlineleft0, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 1 )
				self.clipFinished( featlineleft000, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )
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
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "BMClassfied",
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
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
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
	self:linkToElementModel( self, "isLocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.StartMenuframenoBG0:close()
		element.SelectedCardIcon:close()
		element.BMGoldBarMed:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.EmblemName:close()
		element.LootRarityType:close()
		element.CallingCardsBlackMarketSideBetExplaination0:close()
		element.LockedIcon:close()
		element.BMContractsLockBars:close()
		element.BMContractsLockBars0:close()
		element.EmblemSubtitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

