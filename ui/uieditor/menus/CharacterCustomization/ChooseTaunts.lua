-- 093dc23f8fd50420b0bf5727139d72a8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_TauntCategoryList" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_TauntOptions" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseTaunts_GestureOptions" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local f0_local0 = {}
local PreLoadFunc = function ( self, controller )
	self.disableBlur = true
	self.disableDarkenElement = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = nil
	f2_arg0.updateMode = function ( f3_arg0, f3_arg1, f3_arg2 )
		CoD.CCUtility.TauntsData.EdittingTauntOrGestureType = nil
		if f3_arg0 == CoD.CCUtility.TauntsData.Modes.ExploringTaunts then
			CoD.SwapFocusableElements( f2_arg1, f2_local0, f2_arg0.categoryList )
			if f2_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingTaunt then
				f2_arg0.categoryList:processEvent( {
					name = "lose_focus",
					controller = f2_arg1
				} )
				f2_arg0.categoryList.tauntList:processEvent( {
					name = "gain_focus",
					controller = f2_arg1
				} )
			elseif f2_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingGesture then
				f2_arg0.categoryList:processEvent( {
					name = "lose_focus",
					controller = f2_arg1
				} )
				f2_arg0.categoryList.gestureList:processEvent( {
					name = "gain_focus",
					controller = f2_arg1
				} )
			end
			if f3_arg1 then
				if f2_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingTaunt then
					f2_arg0.categoryList.tauntList:updateDataSource()
				elseif f2_arg0.currentMode == CoD.CCUtility.TauntsData.Modes.EdittingGesture then
					f2_arg0.categoryList.gestureList:updateDataSource()
				end
			end
			f2_local0 = f2_arg0.categoryList
			f2_arg0:setState( "DefaultState" )
		elseif f3_arg0 == CoD.CCUtility.TauntsData.Modes.EdittingGesture then
			CoD.CCUtility.TauntsData.EdittingTauntOrGestureType = f3_arg2
			CoD.SwapFocusableElements( f2_arg1, f2_local0, f2_arg0.gestureOptionsList )
			f2_local0 = f2_arg0.gestureOptionsList
			f2_arg0:setState( "SelectingGesture" )
		elseif f3_arg0 == CoD.CCUtility.TauntsData.Modes.EdittingTaunt then
			CoD.CCUtility.TauntsData.EdittingTauntOrGestureType = f3_arg2
			CoD.SwapFocusableElements( f2_arg1, f2_local0, f2_arg0.tauntOptionsList )
			f2_local0 = f2_arg0.tauntOptionsList
			f2_arg0:setState( "SelectingTaunt" )
		end
		f2_arg0.currentMode = f3_arg0
		UpdateAllMenuButtonPrompts( f2_arg0, f2_arg1 )
	end
	
	f2_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts )
end

LUI.createMenu.ChooseTaunts = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseTaunts" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ChooseTaunts.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( f4_local1, controller )
	LeftPanel:setLeftRight( true, false, 64, 597 )
	LeftPanel:setTopBottom( true, false, 78, 667 )
	LeftPanel:setRGB( 0.14, 0.14, 0.14 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local LeftPanel0 = CoD.FE_ButtonPanelShaderContainer.new( f4_local1, controller )
	LeftPanel0:setLeftRight( true, false, 64, 496 )
	LeftPanel0:setTopBottom( true, false, 78, 667 )
	LeftPanel0:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( LeftPanel0 )
	self.LeftPanel0 = LeftPanel0
	
	local Frame = CoD.GenericMenuFrame.new( f4_local1, controller )
	Frame:setLeftRight( true, true, 0, 0 )
	Frame:setTopBottom( true, true, 0, 0 )
	Frame.titleLabel:setText( Engine.Localize( "HEROES_TAUNTS_AND_GESTURES_CAPS" ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "HEROES_TAUNTS_AND_GESTURES_CAPS" ) )
	Frame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( Frame )
	self.Frame = Frame
	
	local categoryList = CoD.ChooseTaunts_TauntCategoryList.new( f4_local1, controller )
	categoryList:setLeftRight( true, false, 75, 585 )
	categoryList:setTopBottom( true, false, 115, 686 )
	self:addElement( categoryList )
	self.categoryList = categoryList
	
	local tauntOptionsList = CoD.ChooseTaunts_TauntOptions.new( f4_local1, controller )
	tauntOptionsList:setLeftRight( true, false, 77, 285 )
	tauntOptionsList:setTopBottom( true, false, 115, 686 )
	tauntOptionsList:setAlpha( 0 )
	self:addElement( tauntOptionsList )
	self.tauntOptionsList = tauntOptionsList
	
	local gestureOptionsList = CoD.ChooseTaunts_GestureOptions.new( f4_local1, controller )
	gestureOptionsList:setLeftRight( true, false, 77, 285 )
	gestureOptionsList:setTopBottom( true, false, 115, 686 )
	gestureOptionsList:setAlpha( 0 )
	self:addElement( gestureOptionsList )
	self.gestureOptionsList = gestureOptionsList
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( f4_local1, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 84, 701 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	local f4_local9 = nil
	if IsPC() then
		f4_local9 = CoD.XCamMouseControl.new( f4_local1, controller )
	else
		f4_local9 = LUI.UIElement.createFake()
	end
	f4_local9:setLeftRight( true, false, 507.08, 1216 )
	f4_local9:setTopBottom( true, false, 84, 667 )
	if IsPC() then
		self:addElement( f4_local9 )
	end
	self.XCamMouseControl = f4_local9
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
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 1 )
				self.clipFinished( categoryList, {} )
				tauntOptionsList:completeAnimation()
				self.tauntOptionsList:setAlpha( 0 )
				self.clipFinished( tauntOptionsList, {} )
				gestureOptionsList:completeAnimation()
				self.gestureOptionsList:setAlpha( 0 )
				self.clipFinished( gestureOptionsList, {} )
			end,
			SelectingTaunt = function ()
				self:setupElementClipCounter( 3 )
				local LeftPanel0Frame2 = function ( LeftPanel0, event )
					if not event.interrupted then
						LeftPanel0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					LeftPanel0:setLeftRight( true, false, 64, 300 )
					LeftPanel0:setTopBottom( true, false, 78, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel0, event )
					else
						LeftPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( true, false, 64, 496 )
				self.LeftPanel0:setTopBottom( true, false, 78, 667 )
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
					tauntOptionsList:setLeftRight( true, false, 77, 285 )
					tauntOptionsList:setTopBottom( true, false, 115, 679 )
					tauntOptionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( tauntOptionsList, event )
					else
						tauntOptionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tauntOptionsList:completeAnimation()
				self.tauntOptionsList:setLeftRight( true, false, -348, 0 )
				self.tauntOptionsList:setTopBottom( true, false, 115, 679 )
				self.tauntOptionsList:setAlpha( 0 )
				tauntOptionsListFrame2( tauntOptionsList, {} )
			end,
			SelectingGesture = function ()
				self:setupElementClipCounter( 3 )
				local LeftPanel0Frame2 = function ( LeftPanel0, event )
					if not event.interrupted then
						LeftPanel0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					LeftPanel0:setLeftRight( true, false, 64, 300 )
					LeftPanel0:setTopBottom( true, false, 78, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel0, event )
					else
						LeftPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( true, false, 64, 496 )
				self.LeftPanel0:setTopBottom( true, false, 78, 667 )
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
					gestureOptionsList:setLeftRight( true, false, 77, 285 )
					gestureOptionsList:setTopBottom( true, false, 115, 679 )
					gestureOptionsList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( gestureOptionsList, event )
					else
						gestureOptionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gestureOptionsList:completeAnimation()
				self.gestureOptionsList:setLeftRight( true, false, -348, 0 )
				self.gestureOptionsList:setTopBottom( true, false, 115, 679 )
				self.gestureOptionsList:setAlpha( 0 )
				gestureOptionsListFrame2( gestureOptionsList, {} )
			end
		},
		SelectingTaunt = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( true, false, 64, 300 )
				self.LeftPanel0:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel0, {} )
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 0 )
				self.clipFinished( categoryList, {} )
				tauntOptionsList:completeAnimation()
				self.tauntOptionsList:setAlpha( 1 )
				self.clipFinished( tauntOptionsList, {} )
				gestureOptionsList:completeAnimation()
				self.gestureOptionsList:setAlpha( 0 )
				self.clipFinished( gestureOptionsList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local LeftPanel0Frame2 = function ( LeftPanel0, event )
					if not event.interrupted then
						LeftPanel0:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					LeftPanel0:setLeftRight( true, false, 64, 496 )
					LeftPanel0:setTopBottom( true, false, 78, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel0, event )
					else
						LeftPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( true, false, 64, 300 )
				self.LeftPanel0:setTopBottom( true, false, 78, 667 )
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
					tauntOptionsList:setLeftRight( true, false, -347.5, 0.5 )
					tauntOptionsList:setTopBottom( true, false, 115, 686 )
					tauntOptionsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( tauntOptionsList, event )
					else
						tauntOptionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				tauntOptionsList:completeAnimation()
				self.tauntOptionsList:setLeftRight( true, false, 77, 423 )
				self.tauntOptionsList:setTopBottom( true, false, 115, 686 )
				self.tauntOptionsList:setAlpha( 1 )
				tauntOptionsListFrame2( tauntOptionsList, {} )
			end
		},
		SelectingGesture = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( true, false, 64, 300 )
				self.LeftPanel0:setTopBottom( true, false, 78, 667 )
				self.clipFinished( LeftPanel0, {} )
				categoryList:completeAnimation()
				self.categoryList:setAlpha( 0 )
				self.clipFinished( categoryList, {} )
				tauntOptionsList:completeAnimation()
				self.tauntOptionsList:setAlpha( 0 )
				self.clipFinished( tauntOptionsList, {} )
				gestureOptionsList:completeAnimation()
				self.gestureOptionsList:setLeftRight( true, false, 77, 285 )
				self.gestureOptionsList:setTopBottom( true, false, 115, 686 )
				self.gestureOptionsList:setAlpha( 1 )
				self.clipFinished( gestureOptionsList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )
				local LeftPanel0Frame2 = function ( LeftPanel0, event )
					if not event.interrupted then
						LeftPanel0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					LeftPanel0:setLeftRight( true, false, 64, 496 )
					LeftPanel0:setTopBottom( true, false, 78, 667 )
					if event.interrupted then
						self.clipFinished( LeftPanel0, event )
					else
						LeftPanel0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LeftPanel0:completeAnimation()
				self.LeftPanel0:setLeftRight( true, false, 64, 300 )
				self.LeftPanel0:setTopBottom( true, false, 78, 667 )
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
					gestureOptionsList:setLeftRight( true, false, -348, 0 )
					gestureOptionsList:setTopBottom( true, false, 115, 686 )
					gestureOptionsList:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( gestureOptionsList, event )
					else
						gestureOptionsList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gestureOptionsList:completeAnimation()
				self.gestureOptionsList:setLeftRight( true, false, 77, 285 )
				self.gestureOptionsList:setTopBottom( true, false, 115, 686 )
				self.gestureOptionsList:setAlpha( 1 )
				gestureOptionsListFrame2( gestureOptionsList, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( f4_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f26_local0 = nil
		SendClientScriptMenuChangeNotify( controller, f4_local1, true )
		ShowHeaderKickerAndIcon( f4_local1 )
		DisableNavigation( self, "categoryList" )
		DisableNavigation( self, "gestureOptionsList" )
		DisableNavigation( self, "tauntOptionsList" )
		if not f26_local0 then
			f26_local0 = element:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		if IsExploringTaunts( f27_arg1 ) then
			SaveLoadout( self, f27_arg2 )
			SendClientScriptMenuChangeNotify( f27_arg2, f27_arg1, false )
			GoBack( self, f27_arg2 )
			ClearSavedState( self, f27_arg2 )
			return true
		elseif IsEdittingGestureOption( f27_arg1 ) then
			CancelChoosingGestureOption( f27_arg1 )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		elseif IsEdittingTaunt( f27_arg1 ) then
			CancelChoosingTauntOption( f27_arg1 )
			PlaySoundSetSound( self, "menu_go_back" )
			return true
		else
			
		end
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		if IsExploringTaunts( f28_arg1 ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif IsEdittingGestureOption( f28_arg1 ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		elseif IsEdittingTaunt( f28_arg1 ) then
			CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
			return true
		else
			return false
		end
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
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.categoryList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LeftPanel:close()
		element.LeftPanel0:close()
		element.Frame:close()
		element.categoryList:close()
		element.tauntOptionsList:close()
		element.gestureOptionsList:close()
		element.FEMenuLeftGraphics:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChooseTaunts.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

