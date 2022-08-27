-- 77ec1b426dbeb21672e7939dfd244af5
-- This hash is used for caching, delete to decompile the file again

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
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
		if not IsModelValueTrue( f37_arg2, "CodCaster.showFullScreenMap" ) and not IsModelValueEqualTo( f37_arg2, "CodCaster.showSettingsSideBar", 1 ) and not IsVisibilityBitSet( f37_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueNumber( f37_arg2, "forceScoreboard" )
			return true
		else
			
		end
	end, function ( f38_arg0, f38_arg1, f38_arg2 )
		if not IsModelValueTrue( f38_arg2, "CodCaster.showFullScreenMap" ) and not IsModelValueEqualTo( f38_arg2, "CodCaster.showSettingsSideBar", 1 ) and not IsVisibilityBitSet( f38_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f38_arg1, Enum.LUIButton.LUI_KEY_BACK, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "M", function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3 )
		if not IsModelValueTrue( f39_arg2, "CodCaster.showFullScreenMap" ) and not IsVisibilityBitSet( f39_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( f39_arg2, "CodCaster.showFullScreenMap" )
			SetControllerModelValue( f39_arg2, "forceScoreboard", 0 )
			return true
		elseif not IsVisibilityBitSet( f39_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( f39_arg2, "CodCaster.showFullScreenMap" )
			return true
		else
			
		end
	end, function ( f40_arg0, f40_arg1, f40_arg2 )
		if not IsModelValueTrue( f40_arg2, "CodCaster.showFullScreenMap" ) and not IsVisibilityBitSet( f40_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		elseif not IsVisibilityBitSet( f40_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f40_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "SPACE", function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
		if not IsVisibilityBitSet( f41_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterProfileValue( f41_arg2, "shoutcaster_toolbar" )
			return true
		else
			
		end
	end, function ( f42_arg0, f42_arg1, f42_arg2 )
		if not IsVisibilityBitSet( f42_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f42_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "R", function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
		if not IsVisibilityBitSet( f43_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( f43_arg2, "CodCaster.showLoadout" )
			return true
		else
			
		end
	end, function ( f44_arg0, f44_arg1, f44_arg2 )
		if not IsVisibilityBitSet( f44_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f44_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, "S", function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
		if not IsRepeatButtonPress( f45_arg3 ) and not IsVisibilityBitSet( f45_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( f45_arg2 ) and not GameEnded( f45_arg2 ) then
			ToggleControllerModelValueNumber( f45_arg2, "CodCaster.showSettingsSideBar" )
			SetPerControllerTableProperty( f45_arg2, "codcasterSettingsSideBarPrimaryTab", "displaySettings" )
			OpenPopupWithPriority( self, "CodCasterSettingsSideBar", f45_arg2, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( f46_arg0, f46_arg1, f46_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f46_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( f46_arg2 ) and not GameEnded( f46_arg2 ) then
			CoD.Menu.SetButtonLabel( f46_arg1, Enum.LUIButton.LUI_KEY_RTRIG, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "Q", function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
		if not IsRepeatButtonPress( f47_arg3 ) and not IsVisibilityBitSet( f47_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( f47_arg2 ) and not GameEnded( f47_arg2 ) then
			ToggleControllerModelValueNumber( f47_arg2, "CodCaster.showQuickSettingsSideBar" )
			OpenPopupWithPriority( self, "CodCasterQuickSettingsSideBar", f47_arg2, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( f48_arg0, f48_arg1, f48_arg2 )
		if not IsRepeatButtonPress( nil ) and not IsVisibilityBitSet( f48_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( f48_arg2 ) and not GameEnded( f48_arg2 ) then
			CoD.Menu.SetButtonLabel( f48_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "" )
			return false
		else
			return false
		end
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_DOWN, nil, function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
		SendButtonPressToSiblingMenu( f49_arg1, "T7HudMenuGameMode", f49_arg2, f49_arg3, Enum.LUIButton.LUI_KEY_DOWN )
		return true
	end, function ( f50_arg0, f50_arg1, f50_arg2 )
		CoD.Menu.SetButtonLabel( f50_arg1, Enum.LUIButton.LUI_KEY_DOWN, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_UP, nil, function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
		SendButtonPressToSiblingMenu( f51_arg1, "T7HudMenuGameMode", f51_arg2, f51_arg3, Enum.LUIButton.LUI_KEY_UP )
		return true
	end, function ( f52_arg0, f52_arg1, f52_arg2 )
		CoD.Menu.SetButtonLabel( f52_arg1, Enum.LUIButton.LUI_KEY_UP, "" )
		return false
	end, false )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "K", function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3 )
		if not IsVisibilityBitSet( f53_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			OpenPopupWithPriority( self, "CodCasterKeyboardShortcuts", f53_arg2, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( f54_arg0, f54_arg1, f54_arg2 )
		if not IsVisibilityBitSet( f54_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f54_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "SPACE", function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
		if not IsVisibilityBitSet( f55_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateNextAlivePlayer( f55_arg2 )
			return true
		else
			
		end
	end, function ( f56_arg0, f56_arg1, f56_arg2 )
		if not IsVisibilityBitSet( f56_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f56_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "ESCAPE", function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
		ToggleInGamePauseMenu( f57_arg2 )
		return true
	end, function ( f58_arg0, f58_arg1, f58_arg2 )
		CoD.Menu.SetButtonLabel( f58_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "F1", function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3 )
		if not IsVisibilityBitSet( f59_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, f59_arg0, f59_arg2, "shoutcaster_qs_playerlist" )
			ToggleControllerModelValueNumber( f59_arg2, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, f59_arg0, f59_arg2 )
			return true
		else
			
		end
	end, function ( f60_arg0, f60_arg1, f60_arg2 )
		if not IsVisibilityBitSet( f60_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f60_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "F2", function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
		if not IsVisibilityBitSet( f61_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, f61_arg0, f61_arg2, "shoutcaster_qs_scorepanel" )
			ToggleControllerModelValueNumber( f61_arg2, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, f61_arg0, f61_arg2 )
			return true
		else
			
		end
	end, function ( f62_arg0, f62_arg1, f62_arg2 )
		if not IsVisibilityBitSet( f62_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f62_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "F3", function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3 )
		if not IsVisibilityBitSet( f63_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, f63_arg0, f63_arg2, "shoutcaster_qs_playercard" )
			ToggleControllerModelValueNumber( f63_arg2, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, f63_arg0, f63_arg2 )
			return true
		else
			
		end
	end, function ( f64_arg0, f64_arg1, f64_arg2 )
		if not IsVisibilityBitSet( f64_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f64_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "F4", function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
		if not IsVisibilityBitSet( f65_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, f65_arg0, f65_arg2, "shoutcaster_qs_playerhud" )
			ToggleControllerModelValueNumber( f65_arg2, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, f65_arg0, f65_arg2 )
			return true
		else
			
		end
	end, function ( f66_arg0, f66_arg1, f66_arg2 )
		if not IsVisibilityBitSet( f66_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f66_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "1", function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3 )
		if not IsVisibilityBitSet( f67_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f67_arg2, "team1", "0" )
			return true
		else
			
		end
	end, function ( f68_arg0, f68_arg1, f68_arg2 )
		if not IsVisibilityBitSet( f68_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f68_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_END", function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3 )
		if not IsVisibilityBitSet( f69_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f69_arg2, "team1", "0" )
			return true
		else
			
		end
	end, function ( f70_arg0, f70_arg1, f70_arg2 )
		if not IsVisibilityBitSet( f70_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f70_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "2", function ( f71_arg0, f71_arg1, f71_arg2, f71_arg3 )
		if not IsVisibilityBitSet( f71_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f71_arg2, "team1", "1" )
			return true
		else
			
		end
	end, function ( f72_arg0, f72_arg1, f72_arg2 )
		if not IsVisibilityBitSet( f72_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f72_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_DOWNARROW", function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3 )
		if not IsVisibilityBitSet( f73_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f73_arg2, "team1", "1" )
			return true
		else
			
		end
	end, function ( f74_arg0, f74_arg1, f74_arg2 )
		if not IsVisibilityBitSet( f74_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f74_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "3", function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
		if not IsVisibilityBitSet( f75_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f75_arg2, "team1", "2" )
			return true
		else
			
		end
	end, function ( f76_arg0, f76_arg1, f76_arg2 )
		if not IsVisibilityBitSet( f76_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f76_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_PGDN", function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
		if not IsVisibilityBitSet( f77_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f77_arg2, "team1", "2" )
			return true
		else
			
		end
	end, function ( f78_arg0, f78_arg1, f78_arg2 )
		if not IsVisibilityBitSet( f78_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f78_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "4", function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
		if not IsVisibilityBitSet( f79_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f79_arg2, "team1", "3" )
			return true
		else
			
		end
	end, function ( f80_arg0, f80_arg1, f80_arg2 )
		if not IsVisibilityBitSet( f80_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f80_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_LEFTARROW", function ( f81_arg0, f81_arg1, f81_arg2, f81_arg3 )
		if not IsVisibilityBitSet( f81_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f81_arg2, "team1", "3" )
			return true
		else
			
		end
	end, function ( f82_arg0, f82_arg1, f82_arg2 )
		if not IsVisibilityBitSet( f82_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f82_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "5", function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
		if not IsVisibilityBitSet( f83_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f83_arg2, "team2", "0" )
			return true
		else
			
		end
	end, function ( f84_arg0, f84_arg1, f84_arg2 )
		if not IsVisibilityBitSet( f84_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f84_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_5", function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3 )
		if not IsVisibilityBitSet( f85_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f85_arg2, "team2", "0" )
			return true
		else
			
		end
	end, function ( f86_arg0, f86_arg1, f86_arg2 )
		if not IsVisibilityBitSet( f86_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f86_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "6", function ( f87_arg0, f87_arg1, f87_arg2, f87_arg3 )
		if not IsVisibilityBitSet( f87_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f87_arg2, "team2", "1" )
			return true
		else
			
		end
	end, function ( f88_arg0, f88_arg1, f88_arg2 )
		if not IsVisibilityBitSet( f88_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f88_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_RIGHTARROW", function ( f89_arg0, f89_arg1, f89_arg2, f89_arg3 )
		if not IsVisibilityBitSet( f89_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f89_arg2, "team2", "1" )
			return true
		else
			
		end
	end, function ( f90_arg0, f90_arg1, f90_arg2 )
		if not IsVisibilityBitSet( f90_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f90_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "7", function ( f91_arg0, f91_arg1, f91_arg2, f91_arg3 )
		if not IsVisibilityBitSet( f91_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f91_arg2, "team2", "2" )
			return true
		else
			
		end
	end, function ( f92_arg0, f92_arg1, f92_arg2 )
		if not IsVisibilityBitSet( f92_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f92_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_HOME", function ( f93_arg0, f93_arg1, f93_arg2, f93_arg3 )
		if not IsVisibilityBitSet( f93_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f93_arg2, "team2", "2" )
			return true
		else
			
		end
	end, function ( f94_arg0, f94_arg1, f94_arg2 )
		if not IsVisibilityBitSet( f94_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f94_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "8", function ( f95_arg0, f95_arg1, f95_arg2, f95_arg3 )
		if not IsVisibilityBitSet( f95_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f95_arg2, "team2", "3" )
			return true
		else
			
		end
	end, function ( f96_arg0, f96_arg1, f96_arg2 )
		if not IsVisibilityBitSet( f96_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f96_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "KP_UPARROW", function ( f97_arg0, f97_arg1, f97_arg2, f97_arg3 )
		if not IsVisibilityBitSet( f97_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			SpectateScoreboardPlayer( f97_arg2, "team2", "3" )
			return true
		else
			
		end
	end, function ( f98_arg0, f98_arg1, f98_arg2 )
		if not IsVisibilityBitSet( f98_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f98_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "TAB", function ( f99_arg0, f99_arg1, f99_arg2, f99_arg3 )
		if not IsVisibilityBitSet( f99_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterProfileValue( f99_arg2, "shoutcaster_toolbar" )
			return true
		else
			
		end
	end, function ( f100_arg0, f100_arg1, f100_arg2 )
		if not IsVisibilityBitSet( f100_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f100_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "Q", function ( f101_arg0, f101_arg1, f101_arg2, f101_arg3 )
		if not IsVisibilityBitSet( f101_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( f101_arg2 ) and not GameEnded( f101_arg2 ) then
			ToggleControllerModelValueNumber( f101_arg2, "codcaster.showQuickSettingsSideBar" )
			OpenPopupWithPriority( self, "CodCasterQuickSettingsSideBar", f101_arg2, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( f102_arg0, f102_arg1, f102_arg2 )
		if not IsVisibilityBitSet( f102_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( f102_arg2 ) and not GameEnded( f102_arg2 ) then
			CoD.Menu.SetButtonLabel( f102_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "W", function ( f103_arg0, f103_arg1, f103_arg2, f103_arg3 )
		if not IsVisibilityBitSet( f103_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( f103_arg2 ) and not GameEnded( f103_arg2 ) then
			ToggleControllerModelValueNumber( f103_arg2, "codcaster.showSettingsSideBar" )
			SetPerControllerTableProperty( f103_arg2, "codcasterSettingsSideBarPrimaryTab", "displaySettings" )
			OpenPopupWithPriority( self, "CodCasterSettingsSideBar", f103_arg2, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( f104_arg0, f104_arg1, f104_arg2 )
		if not IsVisibilityBitSet( f104_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not ScoreboardVisible( f104_arg2 ) and not GameEnded( f104_arg2 ) then
			CoD.Menu.SetButtonLabel( f104_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "E", function ( f105_arg0, f105_arg1, f105_arg2, f105_arg3 )
		if not IsVisibilityBitSet( f105_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueNumber( f105_arg2, "codcaster.showSettingsSideBar" )
			SetPerControllerTableProperty( f105_arg2, "codcasterSettingsSideBarPrimaryTab", "loadoutSettings" )
			OpenPopupWithPriority( self, "CodCasterSettingsSideBar", f105_arg2, 100 )
			SetLuiKeyCatcher( true )
			return true
		else
			
		end
	end, function ( f106_arg0, f106_arg1, f106_arg2 )
		if not IsVisibilityBitSet( f106_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f106_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "T", function ( f107_arg0, f107_arg1, f107_arg2, f107_arg3 )
		if not IsVisibilityBitSet( f107_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, f107_arg0, f107_arg2, "shoutcaster_qs_thirdperson" )
			return true
		else
			
		end
	end, function ( f108_arg0, f108_arg1, f108_arg2 )
		if not IsVisibilityBitSet( f108_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f108_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "P", function ( f109_arg0, f109_arg1, f109_arg2, f109_arg3 )
		if not IsVisibilityBitSet( f109_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterProfileValue( f109_arg2, "shoutcaster_lo_perks" )
			ToggleControllerModelValueNumber( f109_arg2, "CodCaster.profileSettingsUpdated" )
			return true
		else
			
		end
	end, function ( f110_arg0, f110_arg1, f110_arg2 )
		if not IsVisibilityBitSet( f110_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f110_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "S", function ( f111_arg0, f111_arg1, f111_arg2, f111_arg3 )
		ToggleScoreboard( f111_arg2 )
		return true
	end, function ( f112_arg0, f112_arg1, f112_arg2 )
		CoD.Menu.SetButtonLabel( f112_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
		return false
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "L", function ( f113_arg0, f113_arg1, f113_arg2, f113_arg3 )
		if not IsVisibilityBitSet( f113_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( f113_arg2, "CodCaster.showLoadout" )
			return true
		else
			
		end
	end, function ( f114_arg0, f114_arg1, f114_arg2 )
		if not IsVisibilityBitSet( f114_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f114_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "X", function ( f115_arg0, f115_arg1, f115_arg2, f115_arg3 )
		if not IsVisibilityBitSet( f115_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, f115_arg0, f115_arg2, "shoutcaster_qs_xray" )
			ToggleControllerModelValueNumber( f115_arg2, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, f115_arg0, f115_arg2 )
			return true
		else
			
		end
	end, function ( f116_arg0, f116_arg1, f116_arg2 )
		if not IsVisibilityBitSet( f116_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f116_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "N", function ( f117_arg0, f117_arg1, f117_arg2, f117_arg3 )
		if not IsVisibilityBitSet( f117_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterQuickSettings( self, f117_arg0, f117_arg2, "shoutcaster_qs_playernumbers" )
			ToggleControllerModelValueNumber( f117_arg2, "CodCaster.profileSettingsUpdated" )
			SaveShoutcasterSettings( self, f117_arg0, f117_arg2 )
			return true
		else
			
		end
	end, function ( f118_arg0, f118_arg1, f118_arg2 )
		if not IsVisibilityBitSet( f118_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f118_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "M", function ( f119_arg0, f119_arg1, f119_arg2, f119_arg3 )
		if not IsVisibilityBitSet( f119_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleControllerModelValueBoolean( f119_arg2, "CodCaster.showFullScreenMap" )
			return true
		else
			
		end
	end, function ( f120_arg0, f120_arg1, f120_arg2 )
		if not IsVisibilityBitSet( f120_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f120_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
			return false
		else
			return false
		end
	end, false, true )
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_NONE, "O", function ( f121_arg0, f121_arg1, f121_arg2, f121_arg3 )
		if not IsVisibilityBitSet( f121_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			ToggleCodCasterProfileValue( f121_arg2, "shoutcaster_playernames" )
			ToggleControllerModelValueNumber( f121_arg2, "CodCaster.profileSettingsUpdated" )
			return true
		else
			
		end
	end, function ( f122_arg0, f122_arg1, f122_arg2 )
		if not IsVisibilityBitSet( f122_arg2, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
			CoD.Menu.SetButtonLabel( f122_arg1, Enum.LUIButton.LUI_KEY_NONE, "" )
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

