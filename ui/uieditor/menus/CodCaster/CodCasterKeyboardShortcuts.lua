-- 3e48ac0a4136de6bbc2f369bd3e677d4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_alertStatusBar" )
require( "ui.uieditor.widgets.FooterButtonPromptWithPCKey" )
require( "ui.uieditor.widgets.CodCaster.CodCasterKeyboardButtonPromptInfo" )

LUI.createMenu.CodCasterKeyboardShortcuts = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CodCasterKeyboardShortcuts" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCasterKeyboardShortcuts.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local darkbg = LUI.UIImage.new()
	darkbg:setLeftRight( true, true, 2, 0 )
	darkbg:setTopBottom( true, true, -20, 0 )
	darkbg:setRGB( 0, 0, 0 )
	darkbg:setAlpha( 0.85 )
	self:addElement( darkbg )
	self.darkbg = darkbg
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( f1_local1, controller )
	scorestreakVignetteContainer:setLeftRight( true, true, 2, 0 )
	scorestreakVignetteContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, false, 180, 538 )
	backing:setRGB( 0.07, 0.07, 0.08 )
	backing:setAlpha( 0.8 )
	self:addElement( backing )
	self.backing = backing
	
	local Smokebkg = LUI.UIImage.new()
	Smokebkg:setLeftRight( false, false, -640, 640 )
	Smokebkg:setTopBottom( true, false, 184, 506.07 )
	Smokebkg:setRGB( 0.63, 0.61, 0.61 )
	Smokebkg:setAlpha( 0.5 )
	Smokebkg:setImage( RegisterImage( "uie_t7_icon_master_overlays_bkg" ) )
	self:addElement( Smokebkg )
	self.Smokebkg = Smokebkg
	
	local buttonBacking = LUI.UIImage.new()
	buttonBacking:setLeftRight( true, true, 0, 0 )
	buttonBacking:setTopBottom( false, true, -214, -182 )
	buttonBacking:setRGB( 0.13, 0.11, 0.12 )
	buttonBacking:setAlpha( 0 )
	self:addElement( buttonBacking )
	self.buttonBacking = buttonBacking
	
	local alertStatusBar = CoD.systemOverlay_alertStatusBar.new( f1_local1, controller )
	alertStatusBar:setLeftRight( true, true, 0, 0 )
	alertStatusBar:setTopBottom( true, false, 180, 184 )
	alertStatusBar:linkToElementModel( self, nil, false, function ( model )
		alertStatusBar:setModel( model, controller )
	end )
	self:addElement( alertStatusBar )
	self.alertStatusBar = alertStatusBar
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, 0, 0 )
	LineLeft:setTopBottom( false, true, -216, -211.85 )
	LineLeft:setAlpha( 0.9 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	local Close = CoD.FooterButtonPromptWithPCKey.new( f1_local1, controller )
	Close:setLeftRight( true, false, 386, 486 )
	Close:setTopBottom( true, false, 508.15, 540.15 )
	Close.label:setText( Engine.Localize( "MENU_CLOSE" ) )
	Close.keyPrompt.keybind:setText( Engine.Localize( "K" ) )
	Close:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			Close.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	Close:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "DisabledPC",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( Close )
	self.Close = Close
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 399, 974 )
	Title:setTopBottom( true, false, 190, 220 )
	Title:setText( LocalizeToUpperString( "CODCASTER_KEYBOARD_SHORTCUTS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Esc = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	Esc:setLeftRight( true, false, 400, 511 )
	Esc:setTopBottom( true, false, 227.76, 259.76 )
	Esc.Text:setText( Engine.Localize( "MPUI_MENU" ) )
	Esc.keyPrompt.keybind:setText( Engine.Localize( "ESC" ) )
	self:addElement( Esc )
	self.Esc = Esc
	
	local F1 = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	F1:setLeftRight( true, false, 400, 511 )
	F1:setTopBottom( true, false, 265.76, 297.76 )
	F1.Text:setText( Engine.Localize( "CODCASTER_QS_PLAYER_LIST" ) )
	F1.keyPrompt.keybind:setText( Engine.Localize( "F1" ) )
	self:addElement( F1 )
	self.F1 = F1
	
	local F2 = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	F2:setLeftRight( true, false, 400, 511 )
	F2:setTopBottom( true, false, 304.76, 336.76 )
	F2.Text:setText( Engine.Localize( "CODCASTER_QS_SCORE_PANEL" ) )
	F2.keyPrompt.keybind:setText( Engine.Localize( "F2" ) )
	self:addElement( F2 )
	self.F2 = F2
	
	local F3 = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	F3:setLeftRight( true, false, 400, 511 )
	F3:setTopBottom( true, false, 345.04, 377.04 )
	F3.Text:setText( Engine.Localize( "CODCASTER_QS_PLAYER_CARD" ) )
	F3.keyPrompt.keybind:setText( Engine.Localize( "F3" ) )
	self:addElement( F3 )
	self.F3 = F3
	
	local F4 = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	F4:setLeftRight( true, false, 400, 511 )
	F4:setTopBottom( true, false, 385, 417 )
	F4.Text:setText( Engine.Localize( "CODCASTER_QS_PLAYER_HUD" ) )
	F4.keyPrompt.keybind:setText( Engine.Localize( "F4" ) )
	self:addElement( F4 )
	self.F4 = F4
	
	local Team1Players = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	Team1Players:setLeftRight( true, false, 400, 511 )
	Team1Players:setTopBottom( true, false, 425, 457 )
	Team1Players.Text:setText( Engine.Localize( "CODCASTER_TEAM1_PLAYERS" ) )
	Team1Players.keyPrompt.keybind:setText( Engine.Localize( "1-4" ) )
	self:addElement( Team1Players )
	self.Team1Players = Team1Players
	
	local Team2Players = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	Team2Players:setLeftRight( true, false, 400, 511 )
	Team2Players:setTopBottom( true, false, 465, 497 )
	Team2Players.Text:setText( Engine.Localize( "CODCASTER_TEAM2_PLAYERS" ) )
	Team2Players.keyPrompt.keybind:setText( Engine.Localize( "5-8" ) )
	self:addElement( Team2Players )
	self.Team2Players = Team2Players
	
	local TAB = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	TAB:setLeftRight( true, false, 623, 734 )
	TAB:setTopBottom( true, false, 227.76, 259.76 )
	TAB.Text:setText( Engine.Localize( "CODCASTER_TOOLBAR" ) )
	TAB.keyPrompt.keybind:setText( Engine.Localize( "TAB" ) )
	self:addElement( TAB )
	self.TAB = TAB
	
	local Q = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	Q:setLeftRight( true, false, 623, 734 )
	Q:setTopBottom( true, false, 265.76, 297.76 )
	Q.Text:setText( Engine.Localize( "CODCASTER_QUICK_SETTINGS" ) )
	Q.keyPrompt.keybind:setText( Engine.Localize( "Q" ) )
	self:addElement( Q )
	self.Q = Q
	
	local W = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	W:setLeftRight( true, false, 623, 734 )
	W:setTopBottom( true, false, 304.76, 336.76 )
	W.Text:setText( Engine.Localize( "CODCASTER_SETTINGS" ) )
	W.keyPrompt.keybind:setText( Engine.Localize( "W" ) )
	self:addElement( W )
	self.W = W
	
	local E = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	E:setLeftRight( true, false, 623, 734 )
	E:setTopBottom( true, false, 345.04, 377.04 )
	E.Text:setText( Engine.Localize( "CODCASTER_LOADOUT_SETTINGS" ) )
	E.keyPrompt.keybind:setText( Engine.Localize( "E" ) )
	self:addElement( E )
	self.E = E
	
	local T = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	T:setLeftRight( true, false, 623, 734 )
	T:setTopBottom( true, false, 385, 417 )
	T.Text:setText( Engine.Localize( "CODCASTER_QS_THIRD_PERSON" ) )
	T.keyPrompt.keybind:setText( Engine.Localize( "T" ) )
	self:addElement( T )
	self.T = T
	
	local P = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	P:setLeftRight( true, false, 623, 734 )
	P:setTopBottom( true, false, 425, 457 )
	P.Text:setText( Engine.Localize( "CODCASTER_LS_PERKS" ) )
	P.keyPrompt.keybind:setText( Engine.Localize( "P" ) )
	self:addElement( P )
	self.P = P
	
	local S = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	S:setLeftRight( true, false, 623, 734 )
	S:setTopBottom( true, false, 465, 497 )
	S.Text:setText( Engine.Localize( "MENU_SCOREBOARD" ) )
	S.keyPrompt.keybind:setText( Engine.Localize( "S" ) )
	self:addElement( S )
	self.S = S
	
	local L = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	L:setLeftRight( true, false, 872, 983 )
	L:setTopBottom( true, false, 227.76, 259.76 )
	L.Text:setText( Engine.Localize( "CODCASTER_LOADOUT" ) )
	L.keyPrompt.keybind:setText( Engine.Localize( "L" ) )
	self:addElement( L )
	self.L = L
	
	local X = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	X:setLeftRight( true, false, 872, 983 )
	X:setTopBottom( true, false, 265.76, 297.76 )
	X.Text:setText( Engine.Localize( "CODCASTER_DS_XRAY" ) )
	X.keyPrompt.keybind:setText( Engine.Localize( "X" ) )
	self:addElement( X )
	self.X = X
	
	local N = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	N:setLeftRight( true, false, 872, 983 )
	N:setTopBottom( true, false, 304.76, 336.76 )
	N.Text:setText( Engine.Localize( "CODCASTER_QS_PLAYER_NUMBERS" ) )
	N.keyPrompt.keybind:setText( Engine.Localize( "N" ) )
	self:addElement( N )
	self.N = N
	
	local M = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	M:setLeftRight( true, false, 872, 983 )
	M:setTopBottom( true, false, 345.04, 377.04 )
	M.Text:setText( Engine.Localize( "MENU_MAP" ) )
	M.keyPrompt.keybind:setText( Engine.Localize( "M" ) )
	self:addElement( M )
	self.M = M
	
	local PrevPlayer = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	PrevPlayer:setLeftRight( true, false, 872, 983 )
	PrevPlayer:setTopBottom( true, false, 385, 417 )
	PrevPlayer.Text:setText( Engine.Localize( "MENU_DEMO_CONTROLS_PREV_PLAYER" ) )
	PrevPlayer.keyPrompt.keybind:setText( Engine.Localize( "," ) )
	self:addElement( PrevPlayer )
	self.PrevPlayer = PrevPlayer
	
	local NextPlayer = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	NextPlayer:setLeftRight( true, false, 872, 983 )
	NextPlayer:setTopBottom( true, false, 425, 457 )
	NextPlayer.Text:setText( Engine.Localize( "MENU_DEMO_CONTROLS_NEXT_PLAYER" ) )
	NextPlayer.keyPrompt.keybind:setText( Engine.Localize( "." ) )
	self:addElement( NextPlayer )
	self.NextPlayer = NextPlayer
	
	local Space = CoD.CodCasterKeyboardButtonPromptInfo.new( f1_local1, controller )
	Space:setLeftRight( true, false, 872, 983 )
	Space:setTopBottom( true, false, 465, 497 )
	Space.Text:setText( Engine.Localize( "CODCASTER_JUMP_TO_NEXT_LIVE_PLAYER" ) )
	Space.keyPrompt.keybind:setText( Engine.Localize( "SPC" ) )
	self:addElement( Space )
	self.Space = Space
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				local darkbgFrame2 = function ( darkbg, event )
					local darkbgFrame3 = function ( darkbg, event )
						if not event.interrupted then
							darkbg:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						darkbg:setAlpha( 0.85 )
						if event.interrupted then
							self.clipFinished( darkbg, event )
						else
							darkbg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						darkbgFrame3( darkbg, event )
						return 
					else
						darkbg:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						darkbg:setAlpha( 0.75 )
						darkbg:registerEventHandler( "transition_complete_keyframe", darkbgFrame3 )
					end
				end
				
				darkbg:completeAnimation()
				self.darkbg:setAlpha( 0 )
				darkbgFrame2( darkbg, {} )
				local scorestreakVignetteContainerFrame2 = function ( scorestreakVignetteContainer, event )
					local scorestreakVignetteContainerFrame3 = function ( scorestreakVignetteContainer, event )
						if not event.interrupted then
							scorestreakVignetteContainer:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						scorestreakVignetteContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( scorestreakVignetteContainer, event )
						else
							scorestreakVignetteContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						scorestreakVignetteContainerFrame3( scorestreakVignetteContainer, event )
						return 
					else
						scorestreakVignetteContainer:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						scorestreakVignetteContainer:setAlpha( 0.5 )
						scorestreakVignetteContainer:registerEventHandler( "transition_complete_keyframe", scorestreakVignetteContainerFrame3 )
					end
				end
				
				scorestreakVignetteContainer:completeAnimation()
				self.scorestreakVignetteContainer:setAlpha( 0 )
				scorestreakVignetteContainerFrame2( scorestreakVignetteContainer, {} )
				local backingFrame2 = function ( backing, event )
					local backingFrame3 = function ( backing, event )
						local backingFrame4 = function ( backing, event )
							if not event.interrupted then
								backing:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							end
							backing:setLeftRight( true, true, 0, 0 )
							backing:setTopBottom( true, false, 180, 540 )
							backing:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( backing, event )
							else
								backing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							backingFrame4( backing, event )
							return 
						else
							backing:beginAnimation( "keyframe", 30, true, false, CoD.TweenType.Linear )
							backing:setAlpha( 1 )
							backing:registerEventHandler( "transition_complete_keyframe", backingFrame4 )
						end
					end
					
					if event.interrupted then
						backingFrame3( backing, event )
						return 
					else
						backing:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						backing:registerEventHandler( "transition_complete_keyframe", backingFrame3 )
					end
				end
				
				backing:completeAnimation()
				self.backing:setLeftRight( true, true, 0, 0 )
				self.backing:setTopBottom( true, false, 180, 540 )
				self.backing:setAlpha( 0 )
				backingFrame2( backing, {} )
				local SmokebkgFrame2 = function ( Smokebkg, event )
					local SmokebkgFrame3 = function ( Smokebkg, event )
						if not event.interrupted then
							Smokebkg:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						Smokebkg:setAlpha( 0.75 )
						if event.interrupted then
							self.clipFinished( Smokebkg, event )
						else
							Smokebkg:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SmokebkgFrame3( Smokebkg, event )
						return 
					else
						Smokebkg:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						Smokebkg:setAlpha( 0.5 )
						Smokebkg:registerEventHandler( "transition_complete_keyframe", SmokebkgFrame3 )
					end
				end
				
				Smokebkg:completeAnimation()
				self.Smokebkg:setAlpha( 0 )
				SmokebkgFrame2( Smokebkg, {} )
				local buttonBackingFrame2 = function ( buttonBacking, event )
					local buttonBackingFrame3 = function ( buttonBacking, event )
						if not event.interrupted then
							buttonBacking:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						buttonBacking:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( buttonBacking, event )
						else
							buttonBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						buttonBackingFrame3( buttonBacking, event )
						return 
					else
						buttonBacking:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						buttonBacking:registerEventHandler( "transition_complete_keyframe", buttonBackingFrame3 )
					end
				end
				
				buttonBacking:completeAnimation()
				self.buttonBacking:setAlpha( 0 )
				buttonBackingFrame2( buttonBacking, {} )
				local alertStatusBarFrame2 = function ( alertStatusBar, event )
					local alertStatusBarFrame3 = function ( alertStatusBar, event )
						if not event.interrupted then
							alertStatusBar:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						alertStatusBar:setLeftRight( true, true, 0, 0 )
						alertStatusBar:setTopBottom( true, false, 180, 184 )
						alertStatusBar:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( alertStatusBar, event )
						else
							alertStatusBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						alertStatusBarFrame3( alertStatusBar, event )
						return 
					else
						alertStatusBar:beginAnimation( "keyframe", 70, true, false, CoD.TweenType.Linear )
						alertStatusBar:setTopBottom( true, false, 180, 184 )
						alertStatusBar:setAlpha( 1 )
						alertStatusBar:registerEventHandler( "transition_complete_keyframe", alertStatusBarFrame3 )
					end
				end
				
				alertStatusBar:completeAnimation()
				self.alertStatusBar:setLeftRight( true, true, 0, 0 )
				self.alertStatusBar:setTopBottom( true, false, -12, -8 )
				self.alertStatusBar:setAlpha( 0 )
				alertStatusBarFrame2( alertStatusBar, {} )
				local LineLeftFrame2 = function ( LineLeft, event )
					local LineLeftFrame3 = function ( LineLeft, event )
						if not event.interrupted then
							LineLeft:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
						end
						LineLeft:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LineLeft, event )
						else
							LineLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LineLeftFrame3( LineLeft, event )
						return 
					else
						LineLeft:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						LineLeft:registerEventHandler( "transition_complete_keyframe", LineLeftFrame3 )
					end
				end
				
				LineLeft:completeAnimation()
				self.LineLeft:setAlpha( 0 )
				LineLeftFrame2( LineLeft, {} )
			end
		}
	}
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "K", function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
		GoBack( self, f24_arg2 )
		SetLuiKeyCatcher( false )
		return true
	end, function ( f25_arg0, f25_arg1, f25_arg2 )
		CoD.Menu.SetButtonLabel( f25_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.scorestreakVignetteContainer:close()
		element.alertStatusBar:close()
		element.Close:close()
		element.Esc:close()
		element.F1:close()
		element.F2:close()
		element.F3:close()
		element.F4:close()
		element.Team1Players:close()
		element.Team2Players:close()
		element.TAB:close()
		element.Q:close()
		element.W:close()
		element.E:close()
		element.T:close()
		element.P:close()
		element.S:close()
		element.L:close()
		element.X:close()
		element.N:close()
		element.M:close()
		element.PrevPlayer:close()
		element.NextPlayer:close()
		element.Space:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCasterKeyboardShortcuts.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

