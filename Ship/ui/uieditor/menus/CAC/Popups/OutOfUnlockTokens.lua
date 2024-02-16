-- 8840b41298136ba506d8d5c290b29430
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BackgroundFrames.CACFullPopupBackground" )
require( "ui.uieditor.widgets.CAC.UnlockTokensWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.XpBarContainer" )
require( "ui.uieditor.widgets.CAC.cac_IconTokenInactiveXLarge" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.AARUtility.XPBarAnimTime
	local f1_local1 = f1_arg0.XpBarContainer.XpBar
	local f1_local2 = f1_arg0:getModel( f1_arg1, "xpBarInfo" )
	local f1_local3 = Engine.GetModelValue( Engine.GetModel( f1_local2, "currLevel" ) )
	local f1_local4 = Engine.GetModelValue( Engine.GetModel( f1_local2, "rankXP" ) )
	local f1_local5, f1_local6 = CoD.AARUtility.GetMinMaxXPForRank( f1_local3 - 1, f1_arg1 )
	local f1_local7 = 0
	local f1_local8 = (f1_local4 - f1_local5) / math.max( 1, f1_local6 - f1_local5 )
	f1_local1.XpBarCurrXPBg:setShaderVector( 0, f1_local7, 0, 0, 0 )
	f1_local1.XpBarEarnedXPBg:setShaderVector( 0, f1_local7, 0, 0, 0 )
	f1_local1.XpBarEarnedXPBg:beginAnimation( "animate_bar", f1_local0, true, true )
	f1_local1.XpBarEarnedXPBg:setShaderVector( 0, f1_local8, 0, 0, 0 )
	if tonumber( f1_local3 ) == CoD.AARUtility.MaxRank then
		f1_arg0.description:setText( Engine.Localize( GetTokenUnlockDescription( f1_arg1, "MENU_OUT_OF_UNLOCK_TOKENS_HIGHESTRANK_DESC" ) ) )
	else
		f1_arg0.description:setText( Engine.Localize( GetTokenUnlockDescription( f1_arg1, "MENU_OUT_OF_UNLOCK_TOKENS_DESC" ) ) )
	end
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
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "OutOfUnlockTokens.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = CoD.CACFullPopupBackground.new( f2_local1, controller )
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background.StartMenuTitlePopup.StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( GetStringforGameMode( "CPUI_OUT_OF_FABRICATION_KITS", "MENU_OUT_OF_UNLOCK_TOKENS", "MENU_OUT_OF_UNLOCK_TOKENS", "MENU_OUT_OF_UNLOCK_TOKENS" ) ) )
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
	
	local UnlockTokensWidget = CoD.UnlockTokensWidget.new( f2_local1, controller )
	UnlockTokensWidget:setLeftRight( false, true, -499, -260 )
	UnlockTokensWidget:setTopBottom( true, false, 148, 192 )
	UnlockTokensWidget.tokenLabel:setTTF( "fonts/escom.ttf" )
	self:addElement( UnlockTokensWidget )
	self.UnlockTokensWidget = UnlockTokensWidget
	
	local XpBarContainer = CoD.XpBarContainer.new( f2_local1, controller )
	XpBarContainer:setLeftRight( true, false, 450, 1149.62 )
	XpBarContainer:setTopBottom( true, false, 405.29, 459.5 )
	XpBarContainer.XPEarnedDisplay:setAlpha( 0 )
	XpBarContainer.XPEarnedDisplay.SubTitle:setText( Engine.Localize( "MENU_XP_EARNED_CAPS" ) )
	XpBarContainer.ProgressDescription:setAlpha( 1 )
	XpBarContainer.ProgressDescription.SubTitle:setText( Engine.Localize( "MENU_PROGRESS_TO_NEXT_LEVEL_CAPS" ) )
	XpBarContainer:linkToElementModel( self, "xpBarInfo", false, function ( model )
		XpBarContainer:setModel( model, controller )
	end )
	XpBarContainer:linkToElementModel( self, "xpBarInfo.xpNeeded", true, function ( model )
		local xpBarInfoXpNeeded = Engine.GetModelValue( model )
		if xpBarInfoXpNeeded then
			XpBarContainer.NextLevelDisplay.SubTitle:setText( Engine.Localize( LocalizeIntoString( "MENU_NEXT_LEVEL_XP_ARG", xpBarInfoXpNeeded ) ) )
		end
	end )
	self:addElement( XpBarContainer )
	self.XpBarContainer = XpBarContainer
	
	local cacIconTokenInactiveXLarge0 = CoD.cac_IconTokenInactiveXLarge.new( f2_local1, controller )
	cacIconTokenInactiveXLarge0:setLeftRight( true, false, 84, 348 )
	cacIconTokenInactiveXLarge0:setTopBottom( true, false, 216.19, 474.19 )
	self:addElement( cacIconTokenInactiveXLarge0 )
	self.cacIconTokenInactiveXLarge0 = cacIconTokenInactiveXLarge0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				XpBarContainer:completeAnimation()
				self.clipFinished( XpBarContainer, {} )
			end
		},
		Arabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				description:completeAnimation()
				self.description:setLeftRight( true, false, 512.5, 1049.5 )
				self.description:setTopBottom( true, false, 270, 295 )
				self.clipFinished( description, {} )
				UnlockTokensWidget:completeAnimation()
				self.UnlockTokensWidget:setLeftRight( false, true, -499, -260 )
				self.UnlockTokensWidget:setTopBottom( true, false, 208, 252 )
				self.clipFinished( UnlockTokensWidget, {} )
				XpBarContainer:completeAnimation()
				XpBarContainer.ProgressDescription:completeAnimation()
				self.XpBarContainer.ProgressDescription:setAlpha( 1 )
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
		local f8_local0 = nil
		SetModelFromPerControllerTable( controller, self, "UnlockTokenInfo" )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		GoBack( self, f9_arg2 )
		PlaySoundSetSound( self, "menu_no_selection" )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	background:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.background:close()
		element.UnlockTokensWidget:close()
		element.XpBarContainer:close()
		element.cacIconTokenInactiveXLarge0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "OutOfUnlockTokens.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

