require( "ui.uieditor.menus.CAC.Popups.ClassOptions" )
require( "ui.uieditor.widgets.CAC.cac_BlackFadeIn" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassButtonList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	LUI.OverrideFunction_CallOriginalFirst( self, "setModel", function ( element, controller )
		element:processEvent( {
			name = "update_state",
			menu = element
		} )
	end )
	if CoD.isCampaign then
		CoD.CACUtility.SetDefaultCACRoot( controller )
		if Gunsmith_IsEnabled( self, controller ) then
			CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
		end
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	if CoD.CACUtility.FromCustomClass then
		f3_arg0:playSound( "cac_reenter" )
		CoD.CACUtility.FromCustomClass = false
	else
		f3_arg0:playSound( "cac_enter" )
	end
	f3_arg0.buttonList.navigation = {
		right = nil
	}
	f3_arg0.chooseClassWidget.m_inputDisabled = true
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f3_arg1 )
	end
	CoD.CACUtility.CreateUnlockTokenModels( f3_arg1 )
	CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f3_arg1 )
	CoD.CACUtility.SetCACMenuHeroInfoModels( f3_arg1 )
	Engine.SendClientScriptNotify( f3_arg1, "choose_class_preview", "opened", Engine.GetEquippedHero( f3_arg1, Enum.eModes.MODE_MULTIPLAYER ) )
end

LUI.createMenu.chooseClass = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "chooseClass" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "chooseClass.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, true, 0, 0 )
	Fullscreen:setTopBottom( true, true, 0, 0 )
	Fullscreen:setRGB( 0, 0, 0 )
	Fullscreen:setAlpha( 0 )
	Fullscreen:setImage( RegisterImage( "uie_default_black_0" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	local cacBlackFadeIn = CoD.cac_BlackFadeIn.new( self, controller )
	cacBlackFadeIn:setLeftRight( true, true, 0, 0 )
	cacBlackFadeIn:setTopBottom( true, true, 0, 0 )
	self:addElement( cacBlackFadeIn )
	self.cacBlackFadeIn = cacBlackFadeIn
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( false, false, -576, -262 )
	LeftPanel:setTopBottom( true, true, 78, -582.02 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0.09 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local chooseClassWidget = CoD.chooseClassWidget.new( self, controller )
	chooseClassWidget:setLeftRight( false, false, -247.5, 93.5 )
	chooseClassWidget:setTopBottom( true, false, 85, 684 )
	chooseClassWidget:setAlpha( 0 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local buttonList = CoD.chooseClassButtonList.new( self, controller )
	buttonList:setLeftRight( false, false, -563, -283 )
	buttonList:setTopBottom( true, false, 136, 474 )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, true, 86, -16.75 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local CustomClasspreviewWidget = CoD.InfopanePreviewWidget.new( self, controller )
	CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
	CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
	CustomClasspreviewWidget:setAlpha( 0.43 )
	CustomClasspreviewWidget:linkToElementModel( self, nil, false, function ( model )
		CustomClasspreviewWidget:setModel( model, controller )
	end )
	self:addElement( CustomClasspreviewWidget )
	self.CustomClasspreviewWidget = CustomClasspreviewWidget
	
	local feFooterContainer = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainer:setLeftRight( true, true, 0, 0 )
	feFooterContainer:setTopBottom( false, true, -65, 0 )
	feFooterContainer:registerEventHandler( "menu_loaded", function ( element, event )
		local f6_local0 = nil
		SizeToSafeArea( element, controller )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	feFooterContainer:mergeStateConditions( {
		{
			stateName = "WithHeroesHead",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( feFooterContainer )
	self.feFooterContainer = feFooterContainer
	
	local background = CoD.CACBackgroundNew.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS_CAPS" ) ) ) )
	self:addElement( background )
	self.background = background
	
	local PregameTimerOverlay = CoD.Pregame_TimerOverlay.new( self, controller )
	PregameTimerOverlay:setLeftRight( true, true, 0, 0 )
	PregameTimerOverlay:setTopBottom( true, true, 0, 0 )
	PregameTimerOverlay:mergeStateConditions( {
		{
			stateName = "ChooseClass",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	PregameTimerOverlay:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		self:updateElementState( PregameTimerOverlay, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	self:addElement( PregameTimerOverlay )
	self.PregameTimerOverlay = PregameTimerOverlay
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( false, false, 161.5, 921.5 )
	XCamMouseControl:setTopBottom( true, true, 124, -86 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	chooseClassWidget:linkToElementModel( buttonList.buttonList, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	background:linkToElementModel( buttonList.buttonList, nil, false, function ( model )
		background:setModel( model, controller )
	end )
	chooseClassWidget.navigation = {
		left = buttonList
	}
	buttonList.navigation = {
		right = chooseClassWidget
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 0 )
				self.clipFinished( Fullscreen, {} )
				cacBlackFadeIn:completeAnimation()
				self.cacBlackFadeIn:setAlpha( 1 )
				self.clipFinished( cacBlackFadeIn, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 1 )
				self.chooseClassWidget:setZoom( 0 )
				self.clipFinished( chooseClassWidget, {} )
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( false, false, -563, -283 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				self.buttonList:setZoom( 0 )
				self.clipFinished( buttonList, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				background:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background:setAlpha( 1 )
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS_CAPS" ) ) ) )
				self.clipFinished( background, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( false, false, -576, 117.5 )
							LeftPanel:setTopBottom( true, true, 756, -636 )
							LeftPanel:setAlpha( 0.9 )
							if event.interrupted then
								self.clipFinished( LeftPanel, event )
							else
								LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LeftPanelFrame4( LeftPanel, event )
							return 
						else
							LeftPanel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							LeftPanel:setTopBottom( true, true, 573, -636 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( false, false, -576, 117.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -636 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					local chooseClassWidgetFrame3 = function ( chooseClassWidget, event )
						local chooseClassWidgetFrame4 = function ( chooseClassWidget, event )
							if not event.interrupted then
								chooseClassWidget:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
							end
							chooseClassWidget:setAlpha( 1 )
							chooseClassWidget:setZoom( 0 )
							if event.interrupted then
								self.clipFinished( chooseClassWidget, event )
							else
								chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							chooseClassWidgetFrame4( chooseClassWidget, event )
							return 
						else
							chooseClassWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Bounce )
							chooseClassWidget:setAlpha( 1 )
							chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame4 )
						end
					end
					
					if event.interrupted then
						chooseClassWidgetFrame3( chooseClassWidget, event )
						return 
					else
						chooseClassWidget:beginAnimation( "keyframe", 439, false, false, CoD.TweenType.Linear )
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", chooseClassWidgetFrame3 )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 0 )
				self.chooseClassWidget:setZoom( 0 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
						end
						buttonList:setLeftRight( false, false, -563, -283 )
						buttonList:setTopBottom( true, false, 136, 304 )
						buttonList:setAlpha( 1 )
						buttonList:setZoom( 0 )
						if event.interrupted then
							self.clipFinished( buttonList, event )
						else
							buttonList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonListFrame3( buttonList, event )
						return 
					else
						buttonList:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( false, false, -563, -283 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 0 )
				self.buttonList:setZoom( 0 )
				buttonListFrame2( buttonList, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.clipFinished( CustomClasspreviewWidget, {} )
			end,
			Back = function ()
				self:setupElementClipCounter( 4 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( false, false, -576, 117.5 )
							LeftPanel:setTopBottom( true, true, 756, -636 )
							LeftPanel:setAlpha( 0.9 )
							if event.interrupted then
								self.clipFinished( LeftPanel, event )
							else
								LeftPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							LeftPanelFrame4( LeftPanel, event )
							return 
						else
							LeftPanel:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
							LeftPanel:setTopBottom( true, true, 573, -636 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( false, false, -576, 117.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -636 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
					chooseClassWidget:setTopBottom( true, false, 80, 679 )
					chooseClassWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( false, false, -643, -143 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 679 )
				self.chooseClassWidget:setAlpha( 1 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
						end
						buttonList:setLeftRight( false, false, -563, -283 )
						buttonList:setTopBottom( true, false, 136, 304 )
						buttonList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( buttonList, event )
						else
							buttonList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonListFrame3( buttonList, event )
						return 
					else
						buttonList:beginAnimation( "keyframe", 479, false, false, CoD.TweenType.Linear )
						buttonList:registerEventHandler( "transition_complete_keyframe", buttonListFrame3 )
					end
				end
				
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( false, false, -1086, -806 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				buttonListFrame2( buttonList, {} )
				local CustomClasspreviewWidgetFrame2 = function ( CustomClasspreviewWidget, event )
					if not event.interrupted then
						CustomClasspreviewWidget:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					CustomClasspreviewWidget:setLeftRight( false, false, 73, 923 )
					CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
					CustomClasspreviewWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClasspreviewWidget, event )
					else
						CustomClasspreviewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, -210, 640 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.CustomClasspreviewWidget:setAlpha( 1 )
				CustomClasspreviewWidgetFrame2( CustomClasspreviewWidget, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 8 )
				local FullscreenFrame2 = function ( Fullscreen, event )
					if not event.interrupted then
						Fullscreen:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					Fullscreen:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Fullscreen, event )
					else
						Fullscreen:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 1 )
				FullscreenFrame2( Fullscreen, {} )
				cacBlackFadeIn:completeAnimation()
				self.cacBlackFadeIn:setAlpha( 0 )
				self.clipFinished( cacBlackFadeIn, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setAlpha( 0 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setAlpha( 0 )
				self.clipFinished( chooseClassWidget, {} )
				buttonList:completeAnimation()
				self.buttonList:setAlpha( 0 )
				self.clipFinished( buttonList, {} )
				FEMenuLeftGraphics:completeAnimation()
				self.FEMenuLeftGraphics:setAlpha( 0 )
				self.clipFinished( FEMenuLeftGraphics, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				Fullscreen:completeAnimation()
				self.Fullscreen:setAlpha( 0 )
				self.clipFinished( Fullscreen, {} )
				cacBlackFadeIn:completeAnimation()
				self.cacBlackFadeIn:setAlpha( 1 )
				self.clipFinished( cacBlackFadeIn, {} )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( false, false, -576, -262 )
				self.LeftPanel:setTopBottom( true, true, 78, -53 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( false, false, -244.5, 96.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.chooseClassWidget:setAlpha( 0 )
				self.chooseClassWidget:setZoom( 0 )
				self.clipFinished( chooseClassWidget, {} )
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( false, false, -563, -283 )
				self.buttonList:setTopBottom( true, false, 136, 474 )
				self.buttonList:setAlpha( 0.29 )
				self.buttonList:setZoom( 0 )
				self.clipFinished( buttonList, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, false, 71, 921 )
				self.CustomClasspreviewWidget:setTopBottom( false, false, -236, 360 )
				self.CustomClasspreviewWidget:setAlpha( 0.43 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				background:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background:setAlpha( 1 )
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MENU_CHOOSE_LOADOUT" ) ) ) )
				self.clipFinished( background, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "update_class", function ( self, event )
		local f33_local0 = nil
		if not f33_local0 then
			f33_local0 = self:dispatchEventToChildren( event )
		end
		return f33_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f34_local0 = nil
		if IsCampaign() and TestAndSetFirstTimeMenu( controller, "com_firsttime_armory" ) then
			OpenGenericLargePopup( self, controller, "MENU_FIRSTTIME_ARMORY", "MENU_FIRSTTIME_ARMORY2", "com_firsttime_armory_image", "MENU_FIRSTTIME_ARMORY_BUTTONTEXT", "", "" )
		else
			SetElementStateByElementName( self, "background", controller, "Intro" )
			PlayClipOnElement( self, {
				elementName = "cacElemsSideListCustomClass0",
				clipName = "Intro"
			}, controller )
			PlayClip( self, "Intro", controller )
		end
		if not f34_local0 then
			f34_local0 = self:dispatchEventToChildren( event )
		end
		return f34_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f35_local0 = nil
		if IsInGame() then
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			LockInput( self, controller, true )
			SetCharacterModeToCurrentSessionMode( self, self, controller )
			RefreshCharacterCustomization( self, self, controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			PlayClipOnElement( self, {
				elementName = "cacBlackFadeIn",
				clipName = "Intro"
			}, controller )
			ShowHeaderKickerAndIcon( self )
			PrepareOpenMenuInSafehouse( controller )
			SetHeadingKickerText( "MENU_CAMPAIGN" )
		else
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			SetCharacterModeToCurrentSessionMode( self, self, controller )
			RefreshCharacterCustomization( self, self, controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToGameMode( "MPUI_PUBLIC_MATCH_LOBBY" )
			PlayClipOnElement( self, {
				elementName = "chooseClassWidget",
				clipName = "WildcardDefault"
			}, controller )
		end
		if not f35_local0 then
			f35_local0 = self:dispatchEventToChildren( event )
		end
		return f35_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsInGame() then
			SendOwnMenuResponse( menu, controller, "closed" )
			Close( self, controller )
			ClearSavedState( self, controller )
			SaveLoadout( self, controller )
			ResetCustomClassStartingFocus( self, element, controller, true )
			LockInput( self, controller, false )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			PrepareCloseMenuInSafehouse( controller )
			UploadStats( self, controller )
			return true
		else
			PartyHostSetState( self, controller, CoD.PARTYHOST_STATE_NONE )
			ClearSavedState( self, controller )
			SaveLoadout( self, controller )
			UploadStats( self, controller )
			ResetCustomClassStartingFocus( self, element, controller, true )
			MarkCACPaintshopDataDirty( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			ForceNotifyPregameUpdate( self, element, controller )
			SetPerControllerTableProperty( controller, "updateNewBreadcrumbs", true )
			GoBack( self, controller )
			ForceLobbyButtonUpdate( controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if not IsPerControllerTablePropertyValue( controller, "enableClassOptions", false ) then
			OpenPopup( self, "ClassOptions", controller )
			PlaySoundSetSound( self, "menu_sub" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_CLASS_OPTIONS" )
		if not IsPerControllerTablePropertyValue( controller, "enableClassOptions", false ) then
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	chooseClassWidget.id = "chooseClassWidget"
	buttonList.id = "buttonList"
	feFooterContainer:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.buttonList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacBlackFadeIn:close()
		element.LeftPanel:close()
		element.chooseClassWidget:close()
		element.buttonList:close()
		element.FEMenuLeftGraphics:close()
		element.CustomClasspreviewWidget:close()
		element.feFooterContainer:close()
		element.background:close()
		element.PregameTimerOverlay:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "chooseClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

