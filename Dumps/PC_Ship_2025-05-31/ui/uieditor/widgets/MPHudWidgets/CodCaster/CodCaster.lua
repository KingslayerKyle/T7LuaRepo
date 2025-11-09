require( "ui.uieditor.menus.CodCaster.CodCasterSettingsSideBar" )
require( "ui.uieditor.menus.CodCaster.CodCasterQuickSettingsSideBar" )
require( "ui.uieditor.menus.CodCaster.CodCasterKeyboardShortcuts" )
require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterSpectate" )
require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterButtonBar" )
require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterHeaderWidget" )
require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerList" )
require( "ui.uieditor.widgets.MPHudWidgets.CodCaster.CodCasterMap" )
require( "ui.uieditor.widgets.CodCaster.CodCasterMiniMap" )

local PreLoadFunc = function ( self, controller )
	self.m_focusable = true
	self.m_disableNavigation = true
	Engine.CreateModel( Engine.GetGlobalModel(), "consoleKeyboardConnected" )
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if not CoD.ShoutcasterProfileVarBool( f2_arg0, "shoutcaster_qs_listen_in" ) then
		return 
	elseif f2_arg1 < 0 then
		return 
	end
	local f2_local0 = Engine.GetTeamID( f2_arg0, f2_arg1 )
	if f2_local0 ~= -1 then
		Engine.Exec( f2_arg0, "shoutcastSetListenInTeam " .. f2_local0 )
	end
end

local f0_local2 = function ( f3_arg0 )
	if not CoD.ShoutcasterProfileVarBool( f3_arg0, "shoutcaster_qs_listen_in" ) then
		Engine.Exec( f3_arg0, "shoutcastSetListenInTeam " .. Enum.team_t.TEAM_NEUTRAL )
		return 
	end
	local f3_local0 = Engine.GetModel( Engine.GetModelForController( f3_arg0 ), "deadSpectator.playerIndex" )
	if f3_local0 then
		f0_local1( f3_arg0, Engine.GetModelValue( f3_local0 ) )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		self:processEvent( {
			name = "input_source_changed"
		} )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "deadSpectator.playerIndex" ), function ( model )
		f0_local1( controller, Engine.GetModelValue( model ) )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		f0_local2( controller )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
		self:gainFocus( {
			controller = controller
		} )
	end )
end

CoD.CodCaster = InheritFrom( LUI.UIElement )
CoD.CodCaster.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCaster )
	self.id = "CodCaster"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local CodCasterSpectate = CoD.CodCasterSpectate.new( menu, controller )
	CodCasterSpectate:setLeftRight( true, false, -1, 283 )
	CodCasterSpectate:setTopBottom( false, true, -106, -32 )
	self:addElement( CodCasterSpectate )
	self.CodCasterSpectate = CodCasterSpectate
	
	local CodCasterButtonBar = CoD.CodCasterButtonBar.new( menu, controller )
	CodCasterButtonBar:setLeftRight( false, false, -640, 640 )
	CodCasterButtonBar:setTopBottom( false, true, -32, 0 )
	self:addElement( CodCasterButtonBar )
	self.CodCasterButtonBar = CodCasterButtonBar
	
	local CodCasterHeaderWidget = CoD.CodCasterHeaderWidget.new( menu, controller )
	CodCasterHeaderWidget:setLeftRight( false, false, -276, 276 )
	CodCasterHeaderWidget:setTopBottom( true, false, 0, 195 )
	CodCasterHeaderWidget:registerEventHandler( "list_item_gain_focus", function ( element, event )
		return nil
	end )
	self:addElement( CodCasterHeaderWidget )
	self.CodCasterHeaderWidget = CodCasterHeaderWidget
	
	local CodCasterPlayerList = CoD.CodCasterPlayerList.new( menu, controller )
	CodCasterPlayerList:setLeftRight( false, true, -307, 1 )
	CodCasterPlayerList:setTopBottom( true, false, 25, 596 )
	CodCasterPlayerList:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f10_local0
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not IsModelValueEqualTo( controller, "CodCaster.showSettingsSideBar", 1 ) then
					f10_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_qs_playerlist", 1 )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	CodCasterPlayerList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	CodCasterPlayerList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	CodCasterPlayerList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showSettingsSideBar" ), function ( model )
		menu:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showSettingsSideBar"
		} )
	end )
	CodCasterPlayerList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( CodCasterPlayerList, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( CodCasterPlayerList )
	self.CodCasterPlayerList = CodCasterPlayerList
	
	local OverheadMap = CoD.CodCasterMap.new( menu, controller )
	OverheadMap:setLeftRight( false, false, -640, 640 )
	OverheadMap:setTopBottom( false, false, -360, 360 )
	OverheadMap:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "CodCaster.showFullScreenMap" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	OverheadMap:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showFullScreenMap" ), function ( model )
		menu:updateElementState( OverheadMap, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showFullScreenMap"
		} )
	end )
	OverheadMap:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( OverheadMap, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( OverheadMap )
	self.OverheadMap = OverheadMap
	
	local CodCasterMiniMap = CoD.CodCasterMiniMap.new( menu, controller )
	CodCasterMiniMap:setLeftRight( true, false, -60, 418 )
	CodCasterMiniMap:setTopBottom( true, false, -45, 263 )
	CodCasterMiniMap:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f18_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_minimap", Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_FULL )
				if f18_local0 then
					if not IsModelValueTrue( controller, "CodCaster.showFullScreenMap" ) and not IsModelValueEqualTo( controller, "CodCaster.showQuickSettingsSideBar", 1 ) then
						f18_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
					else
						f18_local0 = false
					end
				end
				return f18_local0
			end
		}
	} )
	CodCasterMiniMap:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( CodCasterMiniMap, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	CodCasterMiniMap:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showFullScreenMap" ), function ( model )
		menu:updateElementState( CodCasterMiniMap, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showFullScreenMap"
		} )
	end )
	CodCasterMiniMap:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showQuickSettingsSideBar" ), function ( model )
		menu:updateElementState( CodCasterMiniMap, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showQuickSettingsSideBar"
		} )
	end )
	CodCasterMiniMap:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( CodCasterMiniMap, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( CodCasterMiniMap )
	self.CodCasterMiniMap = CodCasterMiniMap
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				CodCasterSpectate:completeAnimation()
				self.CodCasterSpectate:setAlpha( 1 )
				self.clipFinished( CodCasterSpectate, {} )
				CodCasterButtonBar:completeAnimation()
				self.CodCasterButtonBar:setAlpha( 1 )
				self.clipFinished( CodCasterButtonBar, {} )
				CodCasterHeaderWidget:completeAnimation()
				self.CodCasterHeaderWidget:setAlpha( 1 )
				self.clipFinished( CodCasterHeaderWidget, {} )
				CodCasterPlayerList:completeAnimation()
				self.CodCasterPlayerList:setAlpha( 1 )
				self.clipFinished( CodCasterPlayerList, {} )
				OverheadMap:completeAnimation()
				self.OverheadMap:setLeftRight( false, false, -640, 640 )
				self.OverheadMap:setTopBottom( false, false, -360, 360 )
				self.OverheadMap:setAlpha( 1 )
				self.clipFinished( OverheadMap, {} )
				CodCasterMiniMap:completeAnimation()
				self.CodCasterMiniMap:setAlpha( 1 )
				self.clipFinished( CodCasterMiniMap, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				CodCasterSpectate:completeAnimation()
				self.CodCasterSpectate:setAlpha( 0 )
				self.clipFinished( CodCasterSpectate, {} )
				CodCasterButtonBar:completeAnimation()
				self.CodCasterButtonBar:setAlpha( 0 )
				self.clipFinished( CodCasterButtonBar, {} )
				CodCasterHeaderWidget:completeAnimation()
				self.CodCasterHeaderWidget:setAlpha( 0 )
				self.clipFinished( CodCasterHeaderWidget, {} )
				CodCasterPlayerList:completeAnimation()
				self.CodCasterPlayerList:setAlpha( 0 )
				self.clipFinished( CodCasterPlayerList, {} )
				OverheadMap:completeAnimation()
				self.OverheadMap:setLeftRight( false, false, -640, 640 )
				self.OverheadMap:setTopBottom( false, false, -360, 360 )
				self.OverheadMap:setAlpha( 0 )
				self.clipFinished( OverheadMap, {} )
				CodCasterMiniMap:completeAnimation()
				self.CodCasterMiniMap:setAlpha( 0 )
				self.clipFinished( CodCasterMiniMap, {} )
			end
		},
		HiddenCopy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				CodCasterSpectate:completeAnimation()
				self.CodCasterSpectate:setAlpha( 0 )
				self.clipFinished( CodCasterSpectate, {} )
				CodCasterButtonBar:completeAnimation()
				self.CodCasterButtonBar:setAlpha( 0 )
				self.clipFinished( CodCasterButtonBar, {} )
				CodCasterHeaderWidget:completeAnimation()
				self.CodCasterHeaderWidget:setAlpha( 0 )
				self.clipFinished( CodCasterHeaderWidget, {} )
				CodCasterPlayerList:completeAnimation()
				self.CodCasterPlayerList:setAlpha( 0 )
				self.clipFinished( CodCasterPlayerList, {} )
				OverheadMap:completeAnimation()
				self.OverheadMap:setLeftRight( false, false, -640, 640 )
				self.OverheadMap:setTopBottom( false, false, -360, 360 )
				self.OverheadMap:setAlpha( 0 )
				self.clipFinished( OverheadMap, {} )
				CodCasterMiniMap:completeAnimation()
				self.CodCasterMiniMap:setAlpha( 0 )
				self.clipFinished( CodCasterMiniMap, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM )
				if not f26_local0 then
					f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM )
					if not f26_local0 then
						f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f26_local0 then
							f26_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
						end
					end
				end
				return f26_local0
			end
		},
		{
			stateName = "HiddenCopy",
			condition = function ( menu, element, event )
				return ShouldHideCodCasterHud( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_ROUND_END_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team1.count" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboard.team1.count"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "scoreboard.team2.count" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "scoreboard.team2.count"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showFullScreenMap" ), function ( model )
		local f34_local0 = self
		local f34_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showFullScreenMap"
		}
		CoD.Menu.UpdateButtonShownState( f34_local0, menu, controller, Enum.LUIButton.LUI_KEY_BACK )
		CoD.Menu.UpdateButtonShownState( f34_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showSettingsSideBar" ), function ( model )
		local f35_local0 = self
		local f35_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showSettingsSideBar"
		}
		CoD.Menu.UpdateButtonShownState( f35_local0, menu, controller, Enum.LUIButton.LUI_KEY_BACK )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local f36_local0 = self
		local f36_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( f36_local0, menu, controller, Enum.LUIButton.LUI_KEY_RTRIG )
		CoD.Menu.UpdateButtonShownState( f36_local0, menu, controller, Enum.LUIButton.LUI_KEY_LTRIG )
		CoD.Menu.UpdateButtonShownState( f36_local0, menu, controller, Enum.LUIButton.LUI_KEY_NONE )
	end )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, function ( element, menu, controller, model )
		if not IsModelValueTrue( controller, "CodCaster.showFullScreenMap" ) and not IsModelValueEqualTo( controller, "CodCaster.showSettingsSideBar", 1 ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueNumber( controller, "forceScoreboard" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsModelValueTrue( controller, "CodCaster.showFullScreenMap" ) and not IsModelValueEqualTo( controller, "CodCaster.showSettingsSideBar", 1 ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "M", function ( element, menu, controller, model )
		if not IsModelValueTrue( controller, "CodCaster.showFullScreenMap" ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( controller, "CodCaster.showFullScreenMap" )
			SetControllerModelValue( controller, "forceScoreboard", 0 )
			return true
		elseif not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( controller, "CodCaster.showFullScreenMap" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsModelValueTrue( controller, "CodCaster.showFullScreenMap" ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		elseif not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "SPACE", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterProfileValue( controller, "shoutcaster_toolbar" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "R", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( controller, "CodCaster.showLoadout" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, "S", function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( controller ) and not GameEnded( controller ) then
			ToggleControllerModelValueNumber( controller, "CodCaster.showSettingsSideBar" )
			SetPerControllerTableProperty( controller, "codcasterSettingsSideBarPrimaryTab", "displaySettings" )
			OpenPopupWithPriority( self, "CodCasterSettingsSideBar", controller, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( controller ) and not GameEnded( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "Q", function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( controller ) and not GameEnded( controller ) then
			ToggleControllerModelValueNumber( controller, "CodCaster.showQuickSettingsSideBar" )
			OpenPopupWithPriority( self, "CodCasterQuickSettingsSideBar", controller, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( controller ) and not GameEnded( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LTRIG, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( element, menu, controller, model )
		SendButtonPressToSiblingMenu( menu, "T7HudMenuGameMode", controller, model, Enum.LUIButton.LUI_KEY_DOWN )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_DOWN, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( element, menu, controller, model )
		SendButtonPressToSiblingMenu( menu, "T7HudMenuGameMode", controller, model, Enum.LUIButton.LUI_KEY_UP )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_UP, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "K", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			OpenPopupWithPriority( self, "CodCasterKeyboardShortcuts", controller, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "SPACE", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateNextAlivePlayer( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "ESCAPE", function ( element, menu, controller, model )
		ToggleInGamePauseMenu( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "F1", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, element, controller, "shoutcaster_qs_playerlist" )
			ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "F2", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, element, controller, "shoutcaster_qs_scorepanel" )
			ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "F3", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, element, controller, "shoutcaster_qs_playercard" )
			ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "F4", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, element, controller, "shoutcaster_qs_playerhud" )
			ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "1", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team1", "0" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_END", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team1", "0" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "2", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team1", "1" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_DOWNARROW", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team1", "1" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "3", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team1", "2" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_PGDN", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team1", "2" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "4", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team1", "3" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_LEFTARROW", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team1", "3" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "5", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team2", "0" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_5", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team2", "0" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "6", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team2", "1" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_RIGHTARROW", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team2", "1" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "7", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team2", "2" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_HOME", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team2", "2" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "8", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team2", "3" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_UPARROW", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( controller, "team2", "3" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "TAB", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterProfileValue( controller, "shoutcaster_toolbar" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "Q", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( controller ) and not GameEnded( controller ) then
			ToggleControllerModelValueNumber( controller, "codcaster.showQuickSettingsSideBar" )
			OpenPopupWithPriority( self, "CodCasterQuickSettingsSideBar", controller, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( controller ) and not GameEnded( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "W", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( controller ) and not GameEnded( controller ) then
			ToggleControllerModelValueNumber( controller, "codcaster.showSettingsSideBar" )
			SetPerControllerTableProperty( controller, "codcasterSettingsSideBarPrimaryTab", "displaySettings" )
			OpenPopupWithPriority( self, "CodCasterSettingsSideBar", controller, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( controller ) and not GameEnded( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "E", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueNumber( controller, "codcaster.showSettingsSideBar" )
			SetPerControllerTableProperty( controller, "codcasterSettingsSideBarPrimaryTab", "loadoutSettings" )
			OpenPopupWithPriority( self, "CodCasterSettingsSideBar", controller, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "T", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, element, controller, "shoutcaster_qs_thirdperson" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "P", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterProfileValue( controller, "shoutcaster_lo_perks" )
			ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "S", function ( element, menu, controller, model )
		ToggleScoreboard( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "L", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( controller, "CodCaster.showLoadout" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "X", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, element, controller, "shoutcaster_qs_xray" )
			ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "N", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, element, controller, "shoutcaster_qs_playernumbers" )
			ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "M", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( controller, "CodCaster.showFullScreenMap" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "O", function ( element, menu, controller, model )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterProfileValue( controller, "shoutcaster_playernames" )
			ToggleControllerModelValueNumber( controller, "CodCaster.profileSettingsUpdated" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	CodCasterButtonBar:setModel( menu.buttonModel, controller )
	CodCasterPlayerList.id = "CodCasterPlayerList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CodCasterSpectate:close()
		element.CodCasterButtonBar:close()
		element.CodCasterHeaderWidget:close()
		element.CodCasterPlayerList:close()
		element.OverheadMap:close()
		element.CodCasterMiniMap:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

