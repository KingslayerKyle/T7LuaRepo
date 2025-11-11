require( "ui.uieditor.widgets.BlackMarket.BM_GoldBarMed" )
require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_TierIcon" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )

DataSources.TierIconList = DataSourceHelpers.ListSetup( "TierIconList", function ( controller )
	local optionsTable = {}
	local maxTierModel = Engine.GetModel( Engine.GetGlobalModel(), "maxTier" )
	local currentTierModel = Engine.GetModel( Engine.GetGlobalModel(), "currentTier" )
	local tierXPModel = Engine.GetModel( Engine.GetGlobalModel(), "tierXP" )
	if maxTierModel == nil or currentTierModel == nil or tierXPModel == nil then
		return optionsTable
	end
	local maxTier = Engine.GetModelValue( maxTierModel )
	local currentTier = Engine.GetModelValue( currentTierModel )
	local tierXP = Engine.GetModelValue( tierXPModel )
	if maxTier == nil or currentTier == nil or tierXP == nil then
		return optionsTable
	end
	local isReached = true
	for tierIndex = 0, maxTier, 1 do
		table.insert( optionsTable, {
			models = {
				tierText = Engine.Localize( "CHALLENGE_TIER_" .. tierIndex ),
				isReached = isReached,
				isCurrentTier = tierIndex == currentTier,
				tierXP = tierXP
			},
			properties = {}
		} )
		if tierIndex == currentTier then
			isReached = false
		end
	end
	return optionsTable
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
	
	local SelectedCardIcon = LUI.UIImage.new()
	SelectedCardIcon:setLeftRight( 0, 1, 5, -3 )
	SelectedCardIcon:setTopBottom( 0, 0, 5, 134 )
	SelectedCardIcon:linkToElementModel( self, "iconId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SelectedCardIcon:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local SubTitle = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	SubTitle:setLeftRight( 0, 0, 24, 201 )
	SubTitle:setTopBottom( 0, 0, 487, 526 )
	SubTitle.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	SubTitle:linkToElementModel( self, "tierStatus", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SubTitle.SubTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( SubTitle )
	self.SubTitle = SubTitle
	
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
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( 0, 0, 31, 491 )
	ProgressBar:setTopBottom( 0, 0, 383, 401 )
	ProgressBar:setRGB( 1, 0.35, 0 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 4, 0, 0, 0, 0 )
	ProgressBar:linkToElementModel( self, "statPercent", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local ProgressBarBorder = CoD.Border.new( menu, controller )
	ProgressBarBorder:setLeftRight( 0, 1, 29, -35 )
	ProgressBarBorder:setTopBottom( 0, 0, 383, 401 )
	self:addElement( ProgressBarBorder )
	self.ProgressBarBorder = ProgressBarBorder
	
	local ProgressFraction = LUI.UITightText.new()
	ProgressFraction:setLeftRight( 0, 0, 31, 70 )
	ProgressFraction:setTopBottom( 0, 0, 415, 445 )
	ProgressFraction:setTTF( "fonts/default.ttf" )
	ProgressFraction:linkToElementModel( self, "statFractionText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressFraction:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ProgressFraction )
	self.ProgressFraction = ProgressFraction
	
	local TierList = LUI.GridLayout.new( menu, controller, false, 0, 0, -92, 0, nil, nil, false, false, 0, 0, false, false )
	TierList:setLeftRight( 0, 0, 25, 377 )
	TierList:setTopBottom( 0, 0, 532, 646 )
	TierList:setWidgetType( CoD.Challenges_TierIcon )
	TierList:setHorizontalCount( 5 )
	TierList:setSpacing( -92 )
	TierList:setDataSource( "TierIconList" )
	self:addElement( TierList )
	self.TierList = TierList
	
	local XPIcon = LUI.UIImage.new()
	XPIcon:setLeftRight( 0, 0, 354, 402 )
	XPIcon:setTopBottom( 0, 0, 406, 454 )
	XPIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XPIcon )
	self.XPIcon = XPIcon
	
	local XPText = LUI.UITightText.new()
	XPText:setLeftRight( 0, 0, 408, 490 )
	XPText:setTopBottom( 0, 0, 415, 445 )
	XPText:setTTF( "fonts/default.ttf" )
	XPText:linkToElementModel( self, "xp", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XPText:setText( LocalizeIntoString( "CPUI_XP_BONUS", modelValue ) )
		end
	end )
	self:addElement( XPText )
	self.XPText = XPText
	
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
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 0, 0, 1, 523 )
	TitleBg:setTopBottom( 0, 0, 49, 94 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( 0, 0, 263, 269 )
	featlineleft:setTopBottom( 0, 0, 204, 742 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local featlineleft1 = LUI.UIImage.new()
	featlineleft1:setLeftRight( 0, 0, 263, 269 )
	featlineleft1:setTopBottom( 0, 0, 59, 597 )
	featlineleft1:setZRot( -90 )
	featlineleft1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft1 )
	self.featlineleft1 = featlineleft1
	
	local TierText = LUI.UIText.new()
	TierText:setLeftRight( 0, 0, 226, 450 )
	TierText:setTopBottom( 0, 0, 57, 90 )
	TierText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TierText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TierText:linkToElementModel( self, "maxTier", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TierText:setText( Engine.Localize( PrependLocalizeString( "CHALLENGE_TIER", LocalizeString( PrependString( "CHALLENGE_TIER_", modelValue ) ) ) ) )
		end
	end )
	self:addElement( TierText )
	self.TierText = TierText
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( 0, 0, 176, 224 )
	LockedIcon:setTopBottom( 0, 0, 48, 96 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
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
	
	self.resetProperties = function ()
		ProgressBarBorder:completeAnimation()
		ProgressBar:completeAnimation()
		TierText:completeAnimation()
		TierList:completeAnimation()
		XPIcon:completeAnimation()
		LockedIcon:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		TitleBg:completeAnimation()
		featlineleft0:completeAnimation()
		featlineleft1:completeAnimation()
		featlineleft:completeAnimation()
		featlineleft000:completeAnimation()
		SubTitle:completeAnimation()
		ProgressFraction:completeAnimation()
		XPText:completeAnimation()
		SelectedCardIcon:completeAnimation()
		bgImage:completeAnimation()
		blackMarketBrandIcon:completeAnimation()
		BMGoldBarMed:completeAnimation()
		ProgressBarBorder:setAlpha( 1 )
		ProgressBar:setAlpha( 1 )
		TierText:setAlpha( 1 )
		TierList:setAlpha( 1 )
		XPIcon:setLeftRight( 0, 0, 354, 402 )
		XPIcon:setTopBottom( 0, 0, 406, 454 )
		XPIcon:setAlpha( 1 )
		LockedIcon:setLeftRight( 0, 0, 176, 224 )
		LockedIcon:setTopBottom( 0, 0, 48, 96 )
		LockedIcon:setAlpha( 1 )
		BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
		TitleBg:setAlpha( 0.4 )
		featlineleft0:setAlpha( 1 )
		featlineleft1:setAlpha( 1 )
		featlineleft:setAlpha( 1 )
		featlineleft000:setAlpha( 1 )
		SubTitle:setLeftRight( 0, 0, 24, 201 )
		SubTitle:setTopBottom( 0, 0, 487, 526 )
		SubTitle:setAlpha( 1 )
		ProgressFraction:setLeftRight( 0, 0, 31, 70 )
		ProgressFraction:setTopBottom( 0, 0, 415, 445 )
		ProgressFraction:setAlpha( 1 )
		XPText:setAlpha( 1 )
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
				self:setupElementClipCounter( 15 )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )
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
				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 0 )
				self.clipFinished( XPIcon, {} )
				XPText:completeAnimation()
				self.XPText:setAlpha( 0 )
				self.clipFinished( XPText, {} )
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
		BMClassfied = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 19 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 1 )
				self.clipFinished( bgImage, {} )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0 )
				self.clipFinished( SelectedCardIcon, {} )
				SubTitle:completeAnimation()
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )
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
				XPIcon:completeAnimation()
				self.XPIcon:setAlpha( 0 )
				self.clipFinished( XPIcon, {} )
				XPText:completeAnimation()
				self.XPText:setAlpha( 0 )
				self.clipFinished( XPText, {} )
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
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0.7 )
				self.clipFinished( SelectedCardIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setLeftRight( 0, 0, 30.5, 120.5 )
				self.ProgressFraction:setTopBottom( 0, 0, 415, 445 )
				self.clipFinished( ProgressFraction, {} )
				XPIcon:completeAnimation()
				self.XPIcon:setLeftRight( 0, 0, 26, 74 )
				self.XPIcon:setTopBottom( 0, 0, 415, 463 )
				self.XPIcon:setAlpha( 0 )
				self.clipFinished( XPIcon, {} )
				XPText:completeAnimation()
				self.XPText:setAlpha( 0 )
				self.clipFinished( XPText, {} )
			end
		},
		LockedOneTier = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0.7 )
				self.clipFinished( SelectedCardIcon, {} )
				SubTitle:completeAnimation()
				self.SubTitle:setLeftRight( 0, 0, 24, 201 )
				self.SubTitle:setTopBottom( 0, 0, 338, 377 )
				self.SubTitle:setAlpha( 0 )
				self.clipFinished( SubTitle, {} )
				ProgressFraction:completeAnimation()
				self.ProgressFraction:setLeftRight( 0, 0, 30.5, 120.5 )
				self.ProgressFraction:setTopBottom( 0, 0, 415, 445 )
				self.clipFinished( ProgressFraction, {} )
				TierList:completeAnimation()
				self.TierList:setAlpha( 0 )
				self.clipFinished( TierList, {} )
				TierText:completeAnimation()
				self.TierText:setAlpha( 0 )
				self.clipFinished( TierText, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setLeftRight( 0, 0, 230, 278 )
				self.LockedIcon:setTopBottom( 0, 0, 49, 97 )
				self.clipFinished( LockedIcon, {} )
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
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" ) and IsSelfModelValueGreaterThan( element, controller, "maxTier", 0 )
			end
		},
		{
			stateName = "LockedOneTier",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" ) and IsSelfModelValueEqualTo( element, controller, "maxTier", 0 )
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
	self:linkToElementModel( self, "maxTier", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "maxTier"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.StartMenuframenoBG0:close()
		self.SubTitle:close()
		self.BMGoldBarMed:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.ProgressBarBorder:close()
		self.TierList:close()
		self.EmblemName:close()
		self.LockedIcon:close()
		self.SelectedCardIcon:close()
		self.ProgressBar:close()
		self.ProgressFraction:close()
		self.XPText:close()
		self.EmblemSubtitle:close()
		self.TierText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

