require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenInactiveXLarge" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )

local PostLoadFunc = function ( self, controller )
	local animTime = CoD.AARUtility.XPBarAnimTime
	local xpBar = self.XpBarContainer.XpBar
	local xpBarInfoModel = self:getModel( controller, "xpBarInfo" )
	local currentRank = Engine.GetModelValue( Engine.GetModel( xpBarInfoModel, "currLevel" ) )
	local currRankXP = Engine.GetModelValue( Engine.GetModel( xpBarInfoModel, "rankXP" ) )
	local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( currentRank - 1, controller )
	local startValue = 0
	local endValue = (currRankXP - minXP) / math.max( 1, maxXP - minXP )
	xpBar.XpBarCurrXPBg:setShaderVector( 0, startValue, 0, 0, 0 )
	xpBar.XpBarEarnedXPBg:setShaderVector( 0, startValue, 0, 0, 0 )
	xpBar.XpBarEarnedXPBg:beginAnimation( "animate_bar", animTime, true, true )
	xpBar.XpBarEarnedXPBg:setShaderVector( 0, endValue, 0, 0, 0 )
	if tonumber( currentRank ) == CoD.AARUtility.MaxRank then
		self.description:setText( Engine.Localize( GetTokenUnlockDescription( controller, "MENU_OUT_OF_UNLOCK_TOKENS_HIGHESTRANK_DESC" ) ) )
	else
		self.description:setText( Engine.Localize( GetTokenUnlockDescription( controller, "MENU_OUT_OF_UNLOCK_TOKENS_DESC" ) ) )
	end
end

LUI.createMenu.OutOfUnlockTokens = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "OutOfUnlockTokens" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "OutOfUnlockTokens.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( self, controller )
	background:setLeftRight( 0, 0, 0, 1920 )
	background:setTopBottom( 0, 0, 0, 1080 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( GetStringforGameMode( "CPUI_OUT_OF_FABRICATION_KITS", "MENU_OUT_OF_UNLOCK_TOKENS", "MENU_OUT_OF_UNLOCK_TOKENS", "MENU_OUT_OF_UNLOCK_TOKENS" ) ) )
	self:addElement( background )
	self.background = background
	
	local description = LUI.UIText.new()
	description:setLeftRight( 0, 0, 760, 1566 )
	description:setTopBottom( 0, 0, 335, 373 )
	description:setRGB( 0.5, 0.51, 0.52 )
	description:setText( Engine.Localize( GetTokenUnlockDescription( controller, "MENU_OUT_OF_UNLOCK_TOKENS_DESC" ) ) )
	description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( description )
	self.description = description
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, 15, 69 )
	Image3:setTopBottom( 0.5, 0.5, 149, 154 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( 0, 0, 15, 69 )
	Image4:setTopBottom( 0.5, 0.5, -205, -200 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0, 0, 38, 46 )
	LineSide0:setTopBottom( 0, 0, 345, 691 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( 0, 0, 10, 34 )
	Image40:setTopBottom( 0, 0, 443, 521 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 0, 1847, 1901 )
	Image30:setTopBottom( 0.5, 0.5, 149, 154 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( 0, 0, 1847, 1901 )
	Image41:setTopBottom( 0.5, 0.5, -205, -200 )
	Image41:setZRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( 0, 0, 1870, 1878 )
	LineSide00:setTopBottom( 0, 0, 345, 691 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( self, controller )
	UnlockTokensWidget:setLeftRight( 1, 1, -748, -390 )
	UnlockTokensWidget:setTopBottom( 0, 0, 222, 288 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local XpBarContainer = CoD.XpBarContainer.new( self, controller )
	XpBarContainer:setLeftRight( 0, 0, 675, 1724 )
	XpBarContainer:setTopBottom( 0, 0, 608, 689 )
	XpBarContainer.XPEarnedDisplay:setAlpha( 0 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription:setAlpha( 1 )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer:linkToElementModel( self, "xpBarInfo", false, function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	XpBarContainer:linkToElementModel( self, "xpBarInfo.xpNeeded", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			XpBarContainer.NextLevelDisplay.SubTitle:setText( LocalizeIntoString( "MENU_NEXT_LEVEL_XP_ARG", modelValue ) )
		end
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local cacIconTokenInactiveXLarge0 = CoD.cac_IconTokenInactiveXLarge.new( self, controller )
	cacIconTokenInactiveXLarge0:setLeftRight( 0, 0, 126, 522 )
	cacIconTokenInactiveXLarge0:setTopBottom( 0, 0, 324.5, 711.5 )
	self:addElement( cacIconTokenInactiveXLarge0 )
	self.cacIconTokenInactiveXLarge0 = cacIconTokenInactiveXLarge0
	
	self.resetProperties = function ()
		description:completeAnimation()
		UnlockTokensWidget:completeAnimation()
		description:setLeftRight( 0, 0, 760, 1566 )
		description:setTopBottom( 0, 0, 335, 373 )
		UnlockTokensWidget:setLeftRight( 1, 1, -748, -390 )
		UnlockTokensWidget:setTopBottom( 0, 0, 222, 288 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				XpBarContainer:completeAnimation()
				self.clipFinished( XpBarContainer, {} )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				description:completeAnimation()
				self.description:setLeftRight( 0, 0, 769, 1575 )
				self.description:setTopBottom( 0, 0, 405, 443 )
				self.clipFinished( description, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( 1, 1, -748, -390 )
				self.UnlockTokensWidget:setTopBottom( 0, 0, 312, 378 )
				self.clipFinished( UnlockTokensWidget, {} )
				XpBarContainer:completeAnimation()
				self.clipFinished( XpBarContainer, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Arabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		}
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetModelFromPerControllerTable( controller, self, "UnlockTokenInfo" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.background:close()
		self.UnlockTokensWidget:close()
		self.XpBarContainer:close()
		self.cacIconTokenInactiveXLarge0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "OutOfUnlockTokens.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

