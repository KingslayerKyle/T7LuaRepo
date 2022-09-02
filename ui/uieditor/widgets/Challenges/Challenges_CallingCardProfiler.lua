-- 9930f364e73155b97ec6fe6f28d94f3f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.Challenges.Challenges_TierIcon" )
require( "ui.uieditor.widgets.Challenges.Challenges_XPIndicator" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_LockBars" )

DataSources.TierIconList = DataSourceHelpers.ListSetup( "TierIconList", function ( f1_arg0 )
	local f1_local0 = {}
	local f1_local1 = Engine.GetModel( Engine.GetGlobalModel(), "maxTier" )
	local f1_local2 = Engine.GetModel( Engine.GetGlobalModel(), "currentTier" )
	local f1_local3 = Engine.GetModel( Engine.GetGlobalModel(), "tierXP" )
	if f1_local1 == nil or f1_local2 == nil or f1_local3 == nil then
		return f1_local0
	end
	local f1_local4 = Engine.GetModelValue( f1_local1 )
	local f1_local5 = Engine.GetModelValue( f1_local2 )
	local f1_local6 = Engine.GetModelValue( f1_local3 )
	if f1_local4 == nil or f1_local5 == nil or f1_local6 == nil then
		return f1_local0
	end
	local f1_local7 = true
	for f1_local8 = 0, f1_local4, 1 do
		table.insert( f1_local0, {
			models = {
				tierText = Engine.Localize( "CHALLENGE_TIER_" .. f1_local8 ),
				isReached = f1_local7,
				isCurrentTier = f1_local8 == f1_local5,
				tierXP = f1_local6
			},
			properties = {}
		} )
		if f1_local8 == f1_local5 then
			f1_local7 = false
		end
	end
	return f1_local0
end, true )
CoD.Challenges_CallingCardProfiler = InheritFrom( LUI.UIElement )
CoD.Challenges_CallingCardProfiler.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_CallingCardProfiler )
	self.id = "Challenges_CallingCardProfiler"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 460 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
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
	SelectedCardIcon:setLeftRight( false, false, 0, 0 )
	SelectedCardIcon:setTopBottom( false, false, -196, -196 )
	SelectedCardIcon.CardIconFrame:setScale( 0.72 )
	SelectedCardIcon:linkToElementModel( self, nil, false, function ( model )
		SelectedCardIcon:setModel( model, controller )
	end )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local SubTitle = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	SubTitle:setLeftRight( true, false, 16, 134 )
	SubTitle:setTopBottom( true, false, 324.5, 350.5 )
	SubTitle.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SubTitle:linkToElementModel( self, "tierStatus", true, function ( model )
		local tierStatus = Engine.GetModelValue( model )
		if tierStatus then
			SubTitle.SubTitle:setText( Engine.Localize( tierStatus ) )
		end
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
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
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( true, false, 20.5, 327 )
	ProgressBar:setTopBottom( true, false, 255.5, 267.5 )
	ProgressBar:setRGB( 1, 0.35, 0 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressBar:linkToElementModel( self, "statPercent", true, function ( model )
		local statPercent = Engine.GetModelValue( model )
		if statPercent then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( statPercent, 1 ), CoD.GetVectorComponentFromString( statPercent, 2 ), CoD.GetVectorComponentFromString( statPercent, 3 ), CoD.GetVectorComponentFromString( statPercent, 4 ) )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( true, true, 19, -23 )
	ProgressBarBorder:setTopBottom( true, false, 255.5, 267.5 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressFraction = LUI.UITightText.new()
	ProgressFraction:setLeftRight( true, false, 20.5, 46.5 )
	ProgressFraction:setTopBottom( true, false, 276.5, 296.5 )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	ProgressFraction:linkToElementModel( self, "statFractionText", true, function ( model )
		local statFractionText = Engine.GetModelValue( model )
		if statFractionText then
			ProgressFraction:setText( Engine.Localize( statFractionText ) )
		end
	end )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local TierList = LUI.GridLayout.new( menu, controller, false, 0, 0, -61, 0, nil, nil, false, false, 0, 0, false, true )
	TierList:setLeftRight( true, false, 16, 252 )
	TierList:setTopBottom( true, false, 354.5, 430.5 )
	TierList:setWidgetType( CoD.Challenges_TierIcon )
	TierList:setHorizontalCount( 5 )
	TierList:setSpacing( -61 )
	TierList:setDataSource( "TierIconList" )
	self:addElement( TierList )
	self.TierList = TierList
	
	local XPIndicator = CoD.Challenges_XPIndicator.new( menu, controller )
	XPIndicator:setLeftRight( true, false, 236, 327 )
	XPIndicator:setTopBottom( true, false, 270.5, 302.5 )
	XPIndicator:linkToElementModel( self, nil, false, function ( model )
		XPIndicator:setModel( model, controller )
	end )
	XPIndicator:linkToElementModel( self, "xp", true, function ( model )
		local xp = Engine.GetModelValue( model )
		if xp then
			XPIndicator.XPText:setText( LocalizeIntoString( "CPUI_XP_BONUS", xp ) )
		end
	end )
	XPIndicator:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "xp" )
			end
		}
	} )
	XPIndicator:linkToElementModel( XPIndicator, "xp", true, function ( model )
		menu:updateElementState( XPIndicator, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "xp"
		} )
	end )
	self:addElement( XPIndicator )
	self.XPIndicator = XPIndicator
	
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
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, false, 1, 349 )
	TitleBg:setTopBottom( true, false, 32.5, 62.4 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( true, false, 175, 179 )
	featlineleft:setTopBottom( true, false, 136, 495 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local featlineleft1 = LUI.UIImage.new()
	featlineleft1:setLeftRight( true, false, 175, 179 )
	featlineleft1:setTopBottom( true, false, 39, 398 )
	featlineleft1:setZRot( -90 )
	featlineleft1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft1 )
	self.featlineleft1 = featlineleft1
	
	local TierText = LUI.UIText.new()
	TierText:setLeftRight( true, false, 151, 300 )
	TierText:setTopBottom( true, false, 38, 60 )
	TierText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TierText:linkToElementModel( self, "maxTier", true, function ( model )
		local maxTier = Engine.GetModelValue( model )
		if maxTier then
			TierText:setText( Engine.Localize( PrependLocalizeString( "CHALLENGE_TIER", LocalizeString( PrependString( "CHALLENGE_TIER_", maxTier ) ) ) ) )
		end
	end )
	self:addElement( TierText )
	self.TierText = TierText
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( true, false, 117, 149 )
	LockedIcon:setTopBottom( true, false, 31.95, 63.95 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
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
	
	BMContractsLockBars.navigation = {
		left = BMContractsLockBars0
	}
	BMContractsLockBars0.navigation = {
		right = BMContractsLockBars
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 21 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 1 )
				self.clipFinished( SelectedCardIcon, {} )

				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )

				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )

				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 0 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 0 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 0 )
				self.clipFinished( TierList, {} )

				XPIndicator:completeAnimation()
				self.XPIndicator:setAlpha( 0 )
				self.clipFinished( XPIndicator, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )

				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )

				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 0 )
				self.clipFinished( featlineleft1, {} )

				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )

				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )

				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )

				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )

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
				self:setupElementClipCounter( 19 )

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

				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )

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

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 0 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 0 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 0 )
				self.clipFinished( TierList, {} )

				XPIndicator:completeAnimation()
				self.XPIndicator:setAlpha( 0 )
				self.clipFinished( XPIndicator, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )

				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )

				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 0 )
				self.clipFinished( featlineleft1, {} )

				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )

				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )

				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )

				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
			end
		},
		ContractClassified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 22 )

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

				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )

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

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 0 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 0 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 0 )
				self.clipFinished( TierList, {} )

				XPIndicator:completeAnimation()
				self.XPIndicator:setAlpha( 0 )
				self.clipFinished( XPIndicator, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )

				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )

				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 0 )
				self.clipFinished( featlineleft1, {} )

				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )

				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )

				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )

				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )

				BMContractsLockBars:completeAnimation()
				self.BMContractsLockBars:setLeftRight( true, false, 179.8, 341.8 )
				self.BMContractsLockBars:setTopBottom( true, false, 28, 63 )
				self.BMContractsLockBars:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars, {} )

				BMContractsLockBars0:completeAnimation()
				self.BMContractsLockBars0:setLeftRight( true, false, 10.8, 163.8 )
				self.BMContractsLockBars0:setTopBottom( true, false, 28, 63 )
				self.BMContractsLockBars0:setAlpha( 1 )
				self.clipFinished( BMContractsLockBars0, {} )

				bmContractBrandIcon:completeAnimation()
				self.bmContractBrandIcon:setLeftRight( true, false, 129.5, 216.95 )
				self.bmContractBrandIcon:setTopBottom( true, false, 4, 91.45 )
				self.bmContractBrandIcon:setAlpha( 1 )
				self.clipFinished( bmContractBrandIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 20 )

				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )

				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0.7 )
				self.clipFinished( SelectedCardIcon, {} )

				SubTitle:completeAnimation()
				self.SubTitle:setLeftRight( true, false, 16, 134 )
				self.SubTitle:setTopBottom( true, false, 324.5, 350.5 )
				self.SubTitle:setAlpha( 1 )
				self.clipFinished( SubTitle, {} )

				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )

				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )

				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 1 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 1 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setLeftRight( true, false, 20.5, 80.5 )
				self.ProgressFraction:setTopBottom( true, false, 276.5, 296.5 )
				self.ProgressFraction:setAlpha( 1 )
				self.clipFinished( ProgressFraction, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 1 )
				self.clipFinished( TierList, {} )

				XPIndicator:completeAnimation()
				self.XPIndicator:setAlpha( 0 )
				self.clipFinished( XPIndicator, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )

				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 1 )
				self.clipFinished( featlineleft, {} )

				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 1 )
				self.clipFinished( featlineleft1, {} )

				TierText:completeAnimation()
				self.TierText:setLeftRight( true, false, 151, 300 )
				self.TierText:setTopBottom( true, false, 38, 60 )
				self.TierText:setAlpha( 1 )
				self.clipFinished( TierText, {} )

				LockedIcon:completeAnimation()
				self.LockedIcon:setLeftRight( true, false, 117, 149 )
				self.LockedIcon:setTopBottom( true, false, 31.95, 63.95 )
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )

				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 1 )
				self.clipFinished( featlineleft0, {} )

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
		LockedOneTier = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0.7 )
				self.clipFinished( SelectedCardIcon, {} )

				SubTitle:completeAnimation()
				self.SubTitle:setLeftRight( true, false, 16, 134 )
				self.SubTitle:setTopBottom( true, false, 225.5, 251.5 )
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )

				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )

				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 1 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 1 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setLeftRight( true, false, 20.5, 80.5 )
				self.ProgressFraction:setTopBottom( true, false, 276.5, 296.5 )
				self.ProgressFraction:setAlpha( 1 )
				self.clipFinished( ProgressFraction, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 0 )
				self.clipFinished( TierList, {} )

				XPIndicator:completeAnimation()
				self.XPIndicator:setAlpha( 1 )
				self.clipFinished( XPIndicator, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )

				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 1 )
				self.clipFinished( featlineleft, {} )

				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 1 )
				self.clipFinished( featlineleft1, {} )

				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )

				LockedIcon:completeAnimation()
				self.LockedIcon:setLeftRight( true, false, 153, 185 )
				self.LockedIcon:setTopBottom( true, false, 32.5, 64.5 )
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )

				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 1 )
				self.clipFinished( featlineleft0, {} )

				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 1 )
				self.clipFinished( featlineleft000, {} )

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
		LockedHideProgress = {
			DefaultClip = function ()
				self:setupElementClipCounter( 19 )

				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0.7 )
				self.clipFinished( SelectedCardIcon, {} )

				SubTitle:completeAnimation()
				self.SubTitle:setLeftRight( true, false, 16, 134 )
				self.SubTitle:setTopBottom( true, false, 225.5, 251.5 )
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )

				BMGoldBarMed:completeAnimation()
				self.BMGoldBarMed:setAlpha( 0 )
				self.clipFinished( BMGoldBarMed, {} )

				blackMarketBrandIcon:completeAnimation()
				self.blackMarketBrandIcon:setAlpha( 0 )
				self.clipFinished( blackMarketBrandIcon, {} )

				ProgressBar:completeAnimation()
				self.ProgressBar:setAlpha( 0 )
				self.clipFinished( ProgressBar, {} )

				ProgressBarBorder:completeAnimation()
				self.ProgressBarBorder:setAlpha( 0 )
				self.clipFinished( ProgressBarBorder, {} )

				ProgressFraction:completeAnimation()
				self.ProgressFraction:setLeftRight( true, false, 20.5, 80.5 )
				self.ProgressFraction:setTopBottom( true, false, 276.5, 296.5 )
				self.ProgressFraction:setAlpha( 0 )
				self.clipFinished( ProgressFraction, {} )

				TierList:completeAnimation()
				self.TierList:setAlpha( 0 )
				self.clipFinished( TierList, {} )

				XPIndicator:completeAnimation()
				self.XPIndicator:setAlpha( 0 )
				self.clipFinished( XPIndicator, {} )

				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )

				featlineleft:completeAnimation()
				self.featlineleft:setAlpha( 0 )
				self.clipFinished( featlineleft, {} )

				featlineleft1:completeAnimation()
				self.featlineleft1:setAlpha( 0 )
				self.clipFinished( featlineleft1, {} )

				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )

				LockedIcon:completeAnimation()
				self.LockedIcon:setLeftRight( true, false, 153, 185 )
				self.LockedIcon:setTopBottom( true, false, 32.5, 64.5 )
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )

				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 1 )
				self.clipFinished( featlineleft0, {} )

				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 1 )
				self.clipFinished( featlineleft000, {} )

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
				return AlwaysFalse()
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				local f22_local0 = IsSelfModelValueTrue( element, controller, "isLocked" )
				if f22_local0 then
					if not IsSelfModelValueTrue( element, controller, "hideProgress" ) then
						f22_local0 = IsSelfModelValueGreaterThan( element, controller, "maxTier", 0 )
					else
						f22_local0 = false
					end
				end
				return f22_local0
			end
		},
		{
			stateName = "LockedOneTier",
			condition = function ( menu, element, event )
				local f23_local0 = IsSelfModelValueTrue( element, controller, "isLocked" )
				if f23_local0 then
					if not IsSelfModelValueTrue( element, controller, "hideProgress" ) then
						f23_local0 = IsSelfModelValueEqualTo( element, controller, "maxTier", 0 )
					else
						f23_local0 = false
					end
				end
				return f23_local0
			end
		},
		{
			stateName = "LockedHideProgress",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" ) and IsSelfModelValueTrue( element, controller, "hideProgress" )
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
	self:linkToElementModel( self, "hideProgress", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideProgress"
		} )
	end )
	self:linkToElementModel( self, "maxTier", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "maxTier"
		} )
	end )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	BMContractsLockBars.id = "BMContractsLockBars"
	BMContractsLockBars0.id = "BMContractsLockBars0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.BMContractsLockBars:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.StartMenuframenoBG0:close()
		element.SelectedCardIcon:close()
		element.SubTitle:close()
		element.BMGoldBarMed:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.ProgressBarBorder:close()
		element.TierList:close()
		element.XPIndicator:close()
		element.EmblemName:close()
		element.LockedIcon:close()
		element.BMContractsLockBars:close()
		element.BMContractsLockBars0:close()
		element.ProgressBar:close()
		element.ProgressFraction:close()
		element.EmblemSubtitle:close()
		element.TierText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

