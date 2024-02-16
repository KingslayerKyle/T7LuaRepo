require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )

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
end

LUI.createMenu.OutOfUnlockTokens = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "OutOfUnlockTokens" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC_Overcapacity"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "OutOfUnlockTokens.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( menu, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "MENU_OUT_OF_UNLOCK_TOKENS" ) )
	self:addElement( background )
	self.background = background
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, false, 507, 1044 )
	description:setTopBottom( true, false, 223.25, 248.25 )
	description:setRGB( 0.5, 0.51, 0.52 )
	description:setText( Engine.Localize( GetTokenUnlockDescription( controller, "MENU_OUT_OF_UNLOCK_TOKENS_DESC" ) ) )
	description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( description )
	self.description = description
	
	local tokenImage = LUI.UIImage.new()
	tokenImage:setLeftRight( true, false, 84, 348 )
	tokenImage:setTopBottom( true, false, 216.19, 474.19 )
	tokenImage:setImage( RegisterImage( "uie_t7_menu_cacselection_icontokeninactivexl" ) )
	self:addElement( tokenImage )
	self.tokenImage = tokenImage
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 10, 46 )
	Image3:setTopBottom( false, false, 99.5, 103 )
	Image3:setZRot( 180 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 10, 46 )
	Image4:setTopBottom( false, false, -136.75, -133.25 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( true, false, 25.5, 30.5 )
	LineSide0:setTopBottom( true, false, 230, 460.38 )
	LineSide0:setAlpha( 0.8 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( true, false, 7, 23 )
	Image40:setTopBottom( true, false, 295, 347 )
	Image40:setZoom( -5 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelc" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, 1231, 1267 )
	Image30:setTopBottom( false, false, 99.5, 103 )
	Image30:setZRot( 180 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, 1231, 1267 )
	Image41:setTopBottom( false, false, -136.75, -133.25 )
	Image41:setZRot( 180 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( true, false, 1246.5, 1251.5 )
	LineSide00:setTopBottom( true, false, 230, 460.38 )
	LineSide00:setAlpha( 0.8 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( menu, controller )
	UnlockTokensWidget:setLeftRight( false, true, -499, -260 )
	UnlockTokensWidget:setTopBottom( true, false, 148, 192 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local XpBarContainer = CoD.XpBarContainer.new( menu, controller )
	XpBarContainer:setLeftRight( true, false, 450, 1085.62 )
	XpBarContainer:setTopBottom( true, false, 405.29, 459.5 )
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
			XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( LocalizeIntoString( "MENU_NEXT_LEVEL_XP_ARG", modelValue ) ) )
		end
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetModelFromPerControllerTable( controller, self, "UnlockTokenInfo" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.background:close()
		self.UnlockTokensWidget:close()
		self.XpBarContainer:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "OutOfUnlockTokens.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

