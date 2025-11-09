require( "ui.uieditor.menus.CAC.Popups.ClassOptions" )
require( "ui.uieditor.widgets.CAC.cac_BlackFadeIn" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.chooseClassWidget" )
require( "ui.uieditor.menus.CAC.CustomClass" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideListCustomClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfopanePreviewWidget" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.BackgroundFrames.CACBackgroundNew" )
require( "ui.uieditor.widgets.Pregame.Pregame_TimerOverlay" )

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
	end
end

local PostLoadFunc = function ( f3_arg0, f3_arg1 )
	if CoD.CACUtility.FromCustomClass then
		f3_arg0:playSound( "cac_reenter" )
		CoD.CACUtility.FromCustomClass = false
	else
		f3_arg0:playSound( "cac_enter" )
	end
	f3_arg0.chooseClassWidget:subscribeToElementModel( f3_arg0.buttonList, nil, function ( f4_arg0 )
		f3_arg0.chooseClassWidget:setModel( f4_arg0, f3_arg1 )
	end )
	f3_arg0:processEvent( {
		name = "update_state",
		controller = f3_arg1
	} )
	f3_arg0.buttonList.navigation = {
		right = nil
	}
	f3_arg0.chooseClassWidget.m_inputDisabled = true
	if not CoD.UnlockablesTable then
		CoD.UnlockablesTable = CoD.GetUnlockablesTable( f3_arg1 )
	end
	CoD.CACUtility.CreateUnlockTokenModels( f3_arg1 )
	CoD.CACUtility.SetCACMenuHeroInfoModels( f3_arg1 )
	Engine.SendClientScriptNotify( f3_arg1, "choose_class_preview", "opened", Engine.GetEquippedHero( f3_arg1, Enum.eModes.MODE_MULTIPLAYER ) )
	if CoD.isSafehouse then
		local f3_local0 = f3_arg0.close
		f3_arg0.close = function ( f5_arg0 )
			f5_arg0:playClip( "Close" )
			f5_arg0:registerEventHandler( "clip_over", f3_local0 )
		end
		
	end
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
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "chooseClass.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, false, 0, 1280 )
	Fullscreen:setTopBottom( true, false, 0, 720 )
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
	LeftPanel:setLeftRight( true, false, 64, 378 )
	LeftPanel:setTopBottom( true, false, 78, 137.98 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0.09 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local chooseClassWidget = CoD.chooseClassWidget.new( self, controller )
	chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
	chooseClassWidget:setTopBottom( true, false, 80, 663 )
	chooseClassWidget:setAlpha( 0 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local buttonList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	buttonList:makeFocusable()
	buttonList:setLeftRight( true, false, 77, 357 )
	buttonList:setTopBottom( true, false, 136, 474 )
	buttonList:setAlpha( 0.29 )
	buttonList:setDataSource( "ChooseClassList" )
	buttonList:setWidgetType( CoD.List1ButtonChooseClass )
	buttonList:setVerticalCount( 10 )
	buttonList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		SetCustomClassNum( self, element, controller )
		ResetCustomClassStartingFocus( self, element, controller, false )
		return f7_local0
	end )
	buttonList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	buttonList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( buttonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SetCustomClassNum( self, element, controller )
		NavigateToMenu( self, "CustomClass", true, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( buttonList )
	self.buttonList = buttonList
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -11, 252.82 )
	CategoryListLine:setTopBottom( true, false, 80, 88 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local cacElemsSideListCustomClass0 = CoD.cac_ElemsSideListCustomClass.new( self, controller )
	cacElemsSideListCustomClass0:setLeftRight( true, false, 19, 417 )
	cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
	self:addElement( cacElemsSideListCustomClass0 )
	self.cacElemsSideListCustomClass0 = cacElemsSideListCustomClass0
	
	local CustomClasspreviewWidget = CoD.InfopanePreviewWidget.new( self, controller )
	CustomClasspreviewWidget:setLeftRight( false, true, -569, 281 )
	CustomClasspreviewWidget:setTopBottom( false, true, -596, 0 )
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
		local f13_local0 = nil
		SizeToSafeArea( element, controller )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
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
	
	background:linkToElementModel( buttonList, nil, false, function ( model )
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
				self:setupElementClipCounter( 6 )
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 378 )
				self.LeftPanel:setTopBottom( true, false, 78, 667 )
				self.LeftPanel:setAlpha( 1 )
				self.clipFinished( LeftPanel, {} )
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.chooseClassWidget:setAlpha( 1 )
				self.chooseClassWidget:setZoom( 0 )
				self.clipFinished( chooseClassWidget, {} )
				buttonList:completeAnimation()
				self.buttonList:setLeftRight( true, false, 77, 357 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				self.buttonList:setZoom( 0 )
				self.clipFinished( buttonList, {} )
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, -11, 1293 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				self.clipFinished( CategoryListLine, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setAlpha( 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
				background:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS_CAPS" ) ) ) )
				self.clipFinished( background, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 6 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( true, false, 64, 757.5 )
							LeftPanel:setTopBottom( true, false, 756, 84 )
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
							LeftPanel:setTopBottom( true, false, 573, 84 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( true, false, 64, 757.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 378 )
				self.LeftPanel:setTopBottom( true, false, 78, 84 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					local chooseClassWidgetFrame3 = function ( chooseClassWidget, event )
						local chooseClassWidgetFrame4 = function ( chooseClassWidget, event )
							if not event.interrupted then
								chooseClassWidget:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Bounce )
							end
							chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
							chooseClassWidget:setTopBottom( true, false, 80, 663 )
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
				self.chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.chooseClassWidget:setAlpha( 0 )
				self.chooseClassWidget:setZoom( 0 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Bounce )
						end
						buttonList:setLeftRight( true, false, 77, 357 )
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
				self.buttonList:setLeftRight( true, false, 77, 357 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 0 )
				self.buttonList:setZoom( 0 )
				buttonListFrame2( buttonList, {} )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					if not event.interrupted then
						CategoryListLine:beginAnimation( "keyframe", 1039, false, true, CoD.TweenType.Linear )
					end
					CategoryListLine:setLeftRight( true, false, -11, 1293 )
					CategoryListLine:setTopBottom( true, false, 80, 88 )
					if event.interrupted then
						self.clipFinished( CategoryListLine, event )
					else
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, -11, 2 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				CategoryListLineFrame2( CategoryListLine, {} )
				cacElemsSideListCustomClass0:completeAnimation()
				self.cacElemsSideListCustomClass0:setLeftRight( true, false, 19, 757.5 )
				self.cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
				self.clipFinished( cacElemsSideListCustomClass0, {} )
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, true, -569, 281 )
				self.CustomClasspreviewWidget:setTopBottom( false, true, -596, 0 )
				self.clipFinished( CustomClasspreviewWidget, {} )
			end,
			Back = function ()
				self:setupElementClipCounter( 6 )
				local LeftPanelFrame2 = function ( LeftPanel, event )
					local LeftPanelFrame3 = function ( LeftPanel, event )
						local LeftPanelFrame4 = function ( LeftPanel, event )
							if not event.interrupted then
								LeftPanel:beginAnimation( "keyframe", 410, false, true, CoD.TweenType.Linear )
							end
							LeftPanel:setLeftRight( true, false, 64, 757.5 )
							LeftPanel:setTopBottom( true, false, 756, 84 )
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
							LeftPanel:setTopBottom( true, false, 573, 84 )
							LeftPanel:setAlpha( 0.5 )
							LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame4 )
						end
					end
					
					if event.interrupted then
						LeftPanelFrame3( LeftPanel, event )
						return 
					else
						LeftPanel:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						LeftPanel:setLeftRight( true, false, 64, 757.5 )
						LeftPanel:registerEventHandler( "transition_complete_keyframe", LeftPanelFrame3 )
					end
				end
				
				LeftPanel:completeAnimation()
				self.LeftPanel:setLeftRight( true, false, 64, 378 )
				self.LeftPanel:setTopBottom( true, false, 78, 84 )
				self.LeftPanel:setAlpha( 0 )
				LeftPanelFrame2( LeftPanel, {} )
				local chooseClassWidgetFrame2 = function ( chooseClassWidget, event )
					if not event.interrupted then
						chooseClassWidget:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					chooseClassWidget:setLeftRight( true, false, 395.5, 736.5 )
					chooseClassWidget:setTopBottom( true, false, 80, 663 )
					chooseClassWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( chooseClassWidget, event )
					else
						chooseClassWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				chooseClassWidget:completeAnimation()
				self.chooseClassWidget:setLeftRight( true, false, -3, 497 )
				self.chooseClassWidget:setTopBottom( true, false, 80, 663 )
				self.chooseClassWidget:setAlpha( 1 )
				chooseClassWidgetFrame2( chooseClassWidget, {} )
				local buttonListFrame2 = function ( buttonList, event )
					local buttonListFrame3 = function ( buttonList, event )
						if not event.interrupted then
							buttonList:beginAnimation( "keyframe", 519, false, true, CoD.TweenType.Linear )
						end
						buttonList:setLeftRight( true, false, 77, 357 )
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
				self.buttonList:setLeftRight( true, false, -446, -166 )
				self.buttonList:setTopBottom( true, false, 136, 304 )
				self.buttonList:setAlpha( 1 )
				buttonListFrame2( buttonList, {} )
				local CategoryListLineFrame2 = function ( CategoryListLine, event )
					if not event.interrupted then
						CategoryListLine:beginAnimation( "keyframe", 1039, false, true, CoD.TweenType.Linear )
					end
					CategoryListLine:setLeftRight( true, false, -11, 1293 )
					CategoryListLine:setTopBottom( true, false, 80, 88 )
					if event.interrupted then
						self.clipFinished( CategoryListLine, event )
					else
						CategoryListLine:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setLeftRight( true, false, -11, 2 )
				self.CategoryListLine:setTopBottom( true, false, 80, 88 )
				CategoryListLineFrame2( CategoryListLine, {} )
				cacElemsSideListCustomClass0:completeAnimation()
				self.cacElemsSideListCustomClass0:setLeftRight( true, false, 19, 748 )
				self.cacElemsSideListCustomClass0:setTopBottom( true, false, -12, 658 )
				self.clipFinished( cacElemsSideListCustomClass0, {} )
				local CustomClasspreviewWidgetFrame2 = function ( CustomClasspreviewWidget, event )
					if not event.interrupted then
						CustomClasspreviewWidget:beginAnimation( "keyframe", 370, true, false, CoD.TweenType.Linear )
					end
					CustomClasspreviewWidget:setLeftRight( false, true, -567, 283 )
					CustomClasspreviewWidget:setTopBottom( false, true, -596, 0 )
					CustomClasspreviewWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CustomClasspreviewWidget, event )
					else
						CustomClasspreviewWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CustomClasspreviewWidget:completeAnimation()
				self.CustomClasspreviewWidget:setLeftRight( false, true, -850, 0 )
				self.CustomClasspreviewWidget:setTopBottom( false, true, -596, 0 )
				self.CustomClasspreviewWidget:setAlpha( 1 )
				CustomClasspreviewWidgetFrame2( CustomClasspreviewWidget, {} )
			end,
			Close = function ()
				self:setupElementClipCounter( 9 )
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
				CategoryListLine:completeAnimation()
				self.CategoryListLine:setAlpha( 0 )
				self.clipFinished( CategoryListLine, {} )
				cacElemsSideListCustomClass0:completeAnimation()
				self.cacElemsSideListCustomClass0:setAlpha( 0 )
				self.clipFinished( cacElemsSideListCustomClass0, {} )
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
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:completeAnimation()
				self.background.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( GetStringforGameMode( "MENU_CHOOSE_LOADOUT", "MPUI_CHOOSE_CLASS", "MPUI_CHOOSE_CLASS", "MENU_CHOOSE_LOADOUT" ) ) ) )
				self.clipFinished( background, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "update_class", function ( self, event )
		local f40_local0 = nil
		if not f40_local0 then
			f40_local0 = self:dispatchEventToChildren( event )
		end
		return f40_local0
	end )
	self:registerEventHandler( "menu_opened", function ( self, event )
		local f41_local0 = nil
		LobbySetLeaderActivity( self, controller, "MODIFYING_CAC" )
		SetElementStateByElementName( self, "background", controller, "Intro" )
		PlayClipOnElement( self, {
			elementName = "cacElemsSideListCustomClass0",
			clipName = "Intro"
		}, controller )
		PlayClip( self, "Intro", controller )
		if not f41_local0 then
			f41_local0 = self:dispatchEventToChildren( event )
		end
		return f41_local0
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f42_local0 = nil
		if IsInGame() then
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			LockInput( self, controller, true )
			SendClientScriptMenuChangeNotify( controller, self, true )
			PlayClipOnElement( self, {
				elementName = "cacBlackFadeIn",
				clipName = "Intro"
			}, controller )
			ShowHeaderKickerAndIcon( self )
		else
			SetElementStateByElementName( self, "background", controller, "Update" )
			PlayClip( self, "Back", controller )
			SendClientScriptMenuChangeNotify( controller, self, true )
			ShowHeaderKickerAndIcon( self )
			SetHeadingKickerTextToGameMode( "" )
		end
		if not f42_local0 then
			f42_local0 = self:dispatchEventToChildren( event )
		end
		return f42_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		if IsInGame() and IsCPAndInSafehouse() then
			SendOwnMenuResponse( menu, controller, "closed" )
			Close( self, controller )
			ClearSavedState( self, controller )
			SaveLoadout( self, controller )
			ResetCustomClassStartingFocus( self, element, controller, true )
			LockInput( self, controller, false )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			UploadStats( self, controller )
			return true
		elseif IsInGame() then
			SendOwnMenuResponse( menu, controller, "closed" )
			Close( self, controller )
			ClearSavedState( self, controller )
			SaveLoadout( self, controller )
			ResetCustomClassStartingFocus( self, element, controller, true )
			LockInput( self, controller, false )
			SendClientScriptMenuChangeNotify( controller, menu, false )
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
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		NavigateToMenu( self, "ClassOptions", true, controller )
		PlaySoundSetSound( self, "menu_sub" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_CLASS_OPTIONS" )
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
		element.cacElemsSideListCustomClass0:close()
		element.CustomClasspreviewWidget:close()
		element.feFooterContainer:close()
		element.background:close()
		element.PregameTimerOverlay:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "chooseClass.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

