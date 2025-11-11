require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_GestureOptions" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_TauntCategoryList" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_TauntOptions" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

local spacerRows = {}
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
end

local PostLoadFunc = function ( self, controller )
	local lastFocus = nil
	self.updateMode = function ( newMode, updateList, gestureOrTauntType )
		CoD.PlayerRoleUtility.TauntsData.EdittingTauntOrGestureType = nil
		if newMode == CoD.PlayerRoleUtility.TauntsData.Modes.ExploringTaunts then
			CoD.SwapFocusableElements( controller, lastFocus, self.categoryList )
			if self.currentMode == CoD.PlayerRoleUtility.TauntsData.Modes.EdittingTaunt then
				self.categoryList:processEvent( {
					name = "lose_focus",
					controller = controller
				} )
				self.categoryList.tauntList:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			elseif self.currentMode == CoD.PlayerRoleUtility.TauntsData.Modes.EdittingGesture then
				self.categoryList:processEvent( {
					name = "lose_focus",
					controller = controller
				} )
				self.categoryList.gestureList:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			end
			if updateList then
				if self.currentMode == CoD.PlayerRoleUtility.TauntsData.Modes.EdittingTaunt then
					self.categoryList.tauntList:updateDataSource()
				elseif self.currentMode == CoD.PlayerRoleUtility.TauntsData.Modes.EdittingGesture then
					self.categoryList.gestureList:updateDataSource()
				end
			end
			lastFocus = self.categoryList
			self:setState( "DefaultState" )
		elseif newMode == CoD.PlayerRoleUtility.TauntsData.Modes.EdittingGesture then
			CoD.PlayerRoleUtility.TauntsData.EdittingTauntOrGestureType = gestureOrTauntType
			CoD.SwapFocusableElements( controller, lastFocus, self.gestureOptionsList )
			lastFocus = self.gestureOptionsList
			self:setState( "SelectingGesture" )
		elseif newMode == CoD.PlayerRoleUtility.TauntsData.Modes.EdittingTaunt then
			CoD.PlayerRoleUtility.TauntsData.EdittingTauntOrGestureType = gestureOrTauntType
			CoD.SwapFocusableElements( controller, lastFocus, self.tauntOptionsList )
			lastFocus = self.tauntOptionsList
			self:setState( "SelectingTaunt" )
		end
		self.currentMode = newMode
		UpdateAllMenuButtonPrompts( self, controller )
	end
	
	self.updateMode( CoD.PlayerRoleUtility.TauntsData.Modes.ExploringTaunts )
end

LUI.createMenu.ChooseTaunts = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseTaunts" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseTaunts.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel:setLeftRight( 0, 0, 96, 896 )
	LeftPanel:setTopBottom( 0, 0, 117, 1001 )
	LeftPanel:setRGB( 0.14, 0.14, 0.14 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local LeftPanel0 = CoD.FE_ButtonPanelShaderContainer.new( self, controller )
	LeftPanel0:setLeftRight( 0, 0, 96, 744 )
	LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
	LeftPanel0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel0 )
	self.LeftPanel0 = LeftPanel0
	
	local Frame = CoD.GenericMenuFrame.new( self, controller )
	Frame:setLeftRight( 0, 1, 0, 0 )
	Frame:setTopBottom( 0, 1, 0, 0 )
	Frame.titleLabel:setText( Engine.Localize( "HEROES_TAUNTS_AND_GESTURES_CAPS" ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_TAUNTS_AND_GESTURES_CAPS" ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local categoryList = CoD.ChooseTaunts_TauntCategoryList.new( self, controller )
	categoryList:setLeftRight( 0, 0, 113, 878 )
	categoryList:setTopBottom( 0, 0, 173, 1029 )
	self:addElement( categoryList )
	self.categoryList = categoryList
	
	local tauntOptionsList = CoD.ChooseTaunts_TauntOptions.new( self, controller )
	tauntOptionsList:setLeftRight( 0, 0, 116, 428 )
	tauntOptionsList:setTopBottom( 0, 0, 173, 1029 )
	tauntOptionsList:setAlpha( 0 )
	self:addElement( tauntOptionsList )
	self.tauntOptionsList = tauntOptionsList
	
	local gestureOptionsList = CoD.ChooseTaunts_GestureOptions.new( self, controller )
	gestureOptionsList:setLeftRight( 0, 0, 116, 428 )
	gestureOptionsList:setTopBottom( 0, 0, 173, 1029 )
	gestureOptionsList:setAlpha( 0 )
	self:addElement( gestureOptionsList )
	self.gestureOptionsList = gestureOptionsList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics:setTopBottom( 0, 0, 126, 1052 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	tauntOptionsList:linkToElementModel( categoryList.tauntList, nil, false, function ( model )
		tauntOptionsList:setModel( model, controller )
	end )
	gestureOptionsList:linkToElementModel( categoryList.gestureList, nil, false, function ( model )
		gestureOptionsList:setModel( model, controller )
	end )
	categoryList.navigation = {
		left = {
			tauntOptionsList,
			gestureOptionsList
		}
	}
	tauntOptionsList.navigation = {
		right = categoryList
	}
	gestureOptionsList.navigation = {
		right = categoryList
	}
	self.resetProperties = function ()
		tauntOptionsList:completeAnimation()
		categoryList:completeAnimation()
		LeftPanel0:completeAnimation()
		gestureOptionsList:completeAnimation()
		tauntOptionsList:setLeftRight( 0, 0, 116, 428 )
		tauntOptionsList:setTopBottom( 0, 0, 173, 1029 )
		tauntOptionsList:setAlpha( 0 )
		categoryList:setAlpha( 1 )
		LeftPanel0:setLeftRight( 0, 0, 96, 744 )
		LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
		gestureOptionsList:setLeftRight( 0, 0, 116, 428 )
		gestureOptionsList:setTopBottom( 0, 0, 173, 1029 )
		gestureOptionsList:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			SelectingTaunt = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local LeftPanel0Frame2 = function ( LeftPanel0, event )
					if not event.interrupted then
						LeftPanel0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					LeftPanel0:setLeftRight( 0, 0, 96, 450 )
					LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
					if event.interrupted then
						self.clipFinished( LeftPanel0, event )
					else
						LeftPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( 0, 0, 96, 744 )
				self.LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
				LeftPanel0Frame2( LeftPanel0, {} )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 1 )
				categoryListFrame2( categoryList, {} )
				local tauntOptionsListFrame2 = function ( tauntOptionsList, event )
					if not event.interrupted then
						tauntOptionsList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					tauntOptionsList:setLeftRight( 0, 0, 116, 428 )
					tauntOptionsList:setTopBottom( 0, 0, 173, 1019 )
					tauntOptionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tauntOptionsList, event )
					else
						tauntOptionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tauntOptionsList:completeAnimation()
				self.tauntOptionsList:setLeftRight( 0, 0, -522, 0 )
				self.tauntOptionsList:setTopBottom( 0, 0, 173, 1019 )
				self.tauntOptionsList:setAlpha( 0 )
				tauntOptionsListFrame2( tauntOptionsList, {} )
			end,
			SelectingGesture = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local LeftPanel0Frame2 = function ( LeftPanel0, event )
					if not event.interrupted then
						LeftPanel0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					LeftPanel0:setLeftRight( 0, 0, 96, 450 )
					LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
					if event.interrupted then
						self.clipFinished( LeftPanel0, event )
					else
						LeftPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( 0, 0, 96, 744 )
				self.LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
				LeftPanel0Frame2( LeftPanel0, {} )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 1 )
				categoryListFrame2( categoryList, {} )
				local gestureOptionsListFrame2 = function ( gestureOptionsList, event )
					if not event.interrupted then
						gestureOptionsList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					gestureOptionsList:setLeftRight( 0, 0, 116, 428 )
					gestureOptionsList:setTopBottom( 0, 0, 173, 1019 )
					gestureOptionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( gestureOptionsList, event )
					else
						gestureOptionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gestureOptionsList:completeAnimation()
				self.gestureOptionsList:setLeftRight( 0, 0, -522, 0 )
				self.gestureOptionsList:setTopBottom( 0, 0, 173, 1019 )
				self.gestureOptionsList:setAlpha( 0 )
				gestureOptionsListFrame2( gestureOptionsList, {} )
			end
		},
		SelectingTaunt = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( 0, 0, 96, 450 )
				self.LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
				self.clipFinished( LeftPanel0, {} )
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 0 )
				self.clipFinished( categoryList, {} )
				tauntOptionsList:completeAnimation()
				self.tauntOptionsList:setAlpha( 1 )
				self.clipFinished( tauntOptionsList, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local LeftPanel0Frame2 = function ( LeftPanel0, event )
					if not event.interrupted then
						LeftPanel0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LeftPanel0:setLeftRight( 0, 0, 96, 744 )
					LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
					if event.interrupted then
						self.clipFinished( LeftPanel0, event )
					else
						LeftPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( 0, 0, 96, 450 )
				self.LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
				LeftPanel0Frame2( LeftPanel0, {} )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 0 )
				categoryListFrame2( categoryList, {} )
				local tauntOptionsListFrame2 = function ( tauntOptionsList, event )
					if not event.interrupted then
						tauntOptionsList:beginAnimation( "keyframe", 150, false, true, CoD.TweenType.Linear )
					end
					tauntOptionsList:setLeftRight( 0, 0, -521, 1 )
					tauntOptionsList:setTopBottom( 0, 0, 173, 1029 )
					tauntOptionsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( tauntOptionsList, event )
					else
						tauntOptionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tauntOptionsList:completeAnimation()
				self.tauntOptionsList:setLeftRight( 0, 0, 115.5, 634.5 )
				self.tauntOptionsList:setTopBottom( 0, 0, 173, 1029 )
				self.tauntOptionsList:setAlpha( 1 )
				tauntOptionsListFrame2( tauntOptionsList, {} )
			end
		},
		SelectingGesture = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( 0, 0, 96, 450 )
				self.LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
				self.clipFinished( LeftPanel0, {} )
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 0 )
				self.clipFinished( categoryList, {} )
				gestureOptionsList:completeAnimation()
				self.gestureOptionsList:setAlpha( 1 )
				self.clipFinished( gestureOptionsList, {} )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local LeftPanel0Frame2 = function ( LeftPanel0, event )
					if not event.interrupted then
						LeftPanel0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					LeftPanel0:setLeftRight( 0, 0, 96, 744 )
					LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
					if event.interrupted then
						self.clipFinished( LeftPanel0, event )
					else
						LeftPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( 0, 0, 96, 450 )
				self.LeftPanel0:setTopBottom( 0, 0, 117, 1001 )
				LeftPanel0Frame2( LeftPanel0, {} )
				local categoryListFrame2 = function ( categoryList, event )
					if not event.interrupted then
						categoryList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					categoryList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( categoryList, event )
					else
						categoryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 0 )
				categoryListFrame2( categoryList, {} )
				local gestureOptionsListFrame2 = function ( gestureOptionsList, event )
					if not event.interrupted then
						gestureOptionsList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					gestureOptionsList:setLeftRight( 0, 0, -522, 0 )
					gestureOptionsList:setTopBottom( 0, 0, 173, 1029 )
					gestureOptionsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( gestureOptionsList, event )
					else
						gestureOptionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gestureOptionsList:completeAnimation()
				self.gestureOptionsList:setLeftRight( 0, 0, 116, 428 )
				self.gestureOptionsList:setTopBottom( 0, 0, 173, 1029 )
				self.gestureOptionsList:setAlpha( 1 )
				gestureOptionsListFrame2( gestureOptionsList, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		ShowHeaderKickerAndIcon( self )
		DisableNavigation( self, "categoryList" )
		DisableNavigation( self, "gestureOptionsList" )
		DisableNavigation( self, "tauntOptionsList" )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		if IsExploringTaunts( menu ) then
			SaveLoadout( self, controller )
			SendClientScriptMenuChangeNotify( controller, menu, false )
			GoBack( self, controller )
			ClearSavedState( self, controller )
			return true
		elseif IsEdittingGestureOption( menu ) then
			CancelChoosingGestureOption( menu )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		elseif IsEdittingTaunt( menu ) then
			CancelChoosingTauntOption( menu )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsExploringTaunts( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		elseif IsEdittingGestureOption( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		elseif IsEdittingTaunt( menu ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
		return true
	end, false )
	Frame:setModel( self.buttonModel, controller )
	categoryList.id = "categoryList"
	tauntOptionsList.id = "tauntOptionsList"
	gestureOptionsList.id = "gestureOptionsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.categoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LeftPanel:close()
		self.LeftPanel0:close()
		self.Frame:close()
		self.categoryList:close()
		self.tauntOptionsList:close()
		self.gestureOptionsList:close()
		self.FEMenuLeftGraphics:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseTaunts.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

