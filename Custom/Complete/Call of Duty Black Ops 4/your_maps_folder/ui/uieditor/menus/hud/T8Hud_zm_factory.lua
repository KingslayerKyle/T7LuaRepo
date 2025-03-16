require( "ui.uieditor.widgets.HUD.ZM_Perks.ZMPerksContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_RoundWidget.ZmRndContainer" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmoContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_Score.ZMScr" )
require( "ui.uieditor.widgets.DynamicContainerWidget" )
require( "ui.uieditor.widgets.Notifications.Notification" )
require( "ui.uieditor.widgets.HUD.ZM_NotifFactory.ZmNotifBGB_ContainerFactory" )
require( "ui.uieditor.widgets.HUD.ZM_CursorHint.ZMCursorHint" )
require( "ui.uieditor.widgets.HUD.CenterConsole.CenterConsole" )
require( "ui.uieditor.widgets.HUD.DeadSpectate.DeadSpectate" )
require( "ui.uieditor.widgets.MPHudWidgets.ScorePopup.MPScr" )
require( "ui.uieditor.widgets.HUD.ZM_PrematchCountdown.ZM_PrematchCountdown" )
require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardWidgetCP" )
require( "ui.uieditor.widgets.HUD.ZM_TimeBar.ZM_BeastmodeTimeBarWidget" )
require( "ui.uieditor.widgets.ZMInventory.RocketShieldBluePrint.RocketShieldBlueprintWidget" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.BubbleGumBuffs.BubbleGumPackInGame" )
require( "ui.uieditor.widgets.ZMInventoryStalingrad.GameTimeGroup" )

-- T8 Widgets
require( "ui.uieditor.widgets.HUD.KingslayerPowerupsWidget.KingslayerPowerupsContainer" )
require( "ui.uieditor.widgets.HUD.T8PerksWidget.T8PerksContainer" )
require( "ui.uieditor.widgets.HUD.T8ScoreWidget.T8ScoreContainer" )
require( "ui.uieditor.widgets.HUD.T8AmmoWidget.T8AmmoContainer" )
require( "ui.uieditor.widgets.HUD.T8ScoreboardWidget.T8Scoreboard" )
require( "ui.uieditor.widgets.HUD.T8NotificationWidget.T8Notification" )

CoD.Zombie.CommonHudRequire()

local PreLoadFunc = function ( self, controller )
	CoD.Zombie.CommonPreLoadHud( self, controller )

	-- Your maps name, this is used on the scoreboard.
	CoD.UsermapName = "Replace with your maps name"
end

local PostLoadFunc = function ( self, controller )
	CoD.Zombie.CommonPostLoadHud( self, controller )
end

LUI.createMenu.T7Hud_zm_factory = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_zm_factory" )

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_zm_factory.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	self.DummyFont1 = LUI.UIText.new()
	self.DummyFont1:setLeftRight( true, false, -1280, -1000 )
	self.DummyFont1:setTopBottom( true, false, -720, -700 )
	self.DummyFont1:setTTF( "fonts/0arame_mono_stencil.ttf" )
	self.DummyFont1:setText( "DummyFont" )
	self:addElement( self.DummyFont1 )

	self.DummyFont2 = LUI.UIText.new()
	self.DummyFont2:setLeftRight( true, false, -1280, -1000 )
	self.DummyFont2:setTopBottom( true, false, -720, -700 )
	self.DummyFont2:setTTF( "fonts/dinnext_regular.ttf" )
	self.DummyFont2:setText( "DummyFont" )
	self:addElement( self.DummyFont2 )

	self.DummyFont3 = LUI.UIText.new()
	self.DummyFont3:setLeftRight( true, false, -1280, -1000 )
	self.DummyFont3:setTopBottom( true, false, -720, -700 )
	self.DummyFont3:setTTF( "fonts/notosans_bold.ttf" )
	self.DummyFont3:setText( "DummyFont" )
	self:addElement( self.DummyFont3 )

	self.DummyFont4 = LUI.UIText.new()
	self.DummyFont4:setLeftRight( true, false, -1280, -1000 )
	self.DummyFont4:setTopBottom( true, false, -720, -700 )
	self.DummyFont4:setTTF( "fonts/skorzhen.ttf" )
	self.DummyFont4:setText( "DummyFont" )
	self:addElement( self.DummyFont4 )

	self.DummyFont5 = LUI.UIText.new()
	self.DummyFont5:setLeftRight( true, false, -1280, -1000 )
	self.DummyFont5:setTopBottom( true, false, -720, -700 )
	self.DummyFont5:setTTF( "fonts/ttmussels_demibold.ttf" )
	self.DummyFont5:setText( "DummyFont" )
	self:addElement( self.DummyFont5 )

	self.KingslayerPowerupsContainer = CoD.KingslayerPowerupsContainer.new( self, controller )
	self.KingslayerPowerupsContainer:setLeftRight( true, true, 0, 0 )
	self.KingslayerPowerupsContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( self.KingslayerPowerupsContainer )

	self.ZMPerksContainerFactory = CoD.T8PerksContainer.new( self, controller )
	self.ZMPerksContainerFactory:setLeftRight( true, true, 0, 0 )
	self.ZMPerksContainerFactory:setTopBottom( true, true, 0, 0 )
	self:addElement( self.ZMPerksContainerFactory )
	
	self.Rounds = CoD.ZmRndContainer.new( self, controller )
	self.Rounds:setLeftRight( true, false, -32, 192 )
	self.Rounds:setTopBottom( true, false, 18, 174 )
	self.Rounds:setScale( 0.8 )
	self:addElement( self.Rounds )
	
	self.Ammo = CoD.T8AmmoContainer.new( self, controller )
	self.Ammo:setLeftRight( true, true, 0, 0 )
	self.Ammo:setTopBottom( true, true, 0, 0 )
	self:addElement( self.Ammo )
	
	self.Score = CoD.T8ScoreContainer.new( self, controller )
	self.Score:setLeftRight( true, true, 0, 0 )
	self.Score:setTopBottom( true, true, 0, 0 )
	self:addElement( self.Score )
	
	self.fullscreenContainer = CoD.DynamicContainerWidget.new( self, controller )
	self.fullscreenContainer:setLeftRight( false, false, -640, 640 )
	self.fullscreenContainer:setTopBottom( false, false, -360, 360 )
	self:addElement( self.fullscreenContainer )
	
	self.Notifications = CoD.Notification.new( self, controller )
	self.Notifications:setLeftRight( true, true, 0, 0 )
	self.Notifications:setTopBottom( true, true, 0, 0 )
	self:addElement( self.Notifications )

	self.T8Notification = CoD.T8Notification.new( self, controller )
	self.T8Notification:setLeftRight( true, true, 0, 0 )
	self.T8Notification:setTopBottom( true, true, 0, 0 )
	self:addElement( self.T8Notification )
	
	self.ZmNotifBGBContainerFactory = CoD.ZmNotifBGB_ContainerFactory.new( self, controller )
	self.ZmNotifBGBContainerFactory:setLeftRight( false, false, -156, 156 )
	self.ZmNotifBGBContainerFactory:setTopBottom( true, false, -6, 247 )
	self.ZmNotifBGBContainerFactory:setScale( 0.75 )
	self.ZmNotifBGBContainerFactory:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		if IsParamModelEqualToString( model, "zombie_bgb_token_notification" ) then
			AddZombieBGBTokenNotification( self, self.ZmNotifBGBContainerFactory, controller, model )
		elseif IsParamModelEqualToString( model, "zombie_bgb_notification" ) then
			AddZombieBGBNotification( self, self.ZmNotifBGBContainerFactory, model )
		end
	end )
	self:addElement( self.ZmNotifBGBContainerFactory )
	
	self.CursorHint = CoD.ZMCursorHint.new( self, controller )
	self.CursorHint:setLeftRight( false, false, -250, 250 )
	self.CursorHint:setTopBottom( true, false, 522, 616 )
	self.CursorHint.cursorhinttext0.CursorHintText:setTTF( "fonts/skorzhen.ttf" )
	self.CursorHint:setScale( 0.8 )
	self.CursorHint:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				if IsCursorHintActive( controller ) then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 1 then
						return false
					else
						return true
					end
				end
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				if IsCursorHintActive( controller ) then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 2 then
						return false
					else
						return true
					end
				end
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				if IsCursorHintActive( controller ) then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					or not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
					or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
					or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 4 then
						return false
					else
						return true
					end
				end
			end
		},
		{
			stateName = "Active_NoImage",
			condition = function ( menu, element, event )
				if IsCursorHintActive( controller ) then
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
					and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT )
					and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
						return true
					else
						return false
					end
				end
			end
		}
	} )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self.CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cursorHintIconRatio" ), function ( model )
		self:updateElementState( self.CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.cursorHintIconRatio"
		} )
	end )
	self:addElement( self.CursorHint )
	
	self.ConsoleCenter = CoD.CenterConsole.new( self, controller )
	self.ConsoleCenter:setLeftRight( false, false, -370, 370 )
	self.ConsoleCenter:setTopBottom( true, false, 68.5, 166.5 )
	self:addElement( self.ConsoleCenter )
	
	self.DeadSpectate = CoD.DeadSpectate.new( self, controller )
	self.DeadSpectate:setLeftRight( false, false, -150, 150 )
	self.DeadSpectate:setTopBottom( false, true, -180, -120 )
	self:addElement( self.DeadSpectate )
	
	self.MPScore = CoD.MPScr.new( self, controller )
	self.MPScore:setLeftRight( false, false, -50, 50 )
	self.MPScore:setTopBottom( true, false, 233.5, 258.5 )
	self.MPScore:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		if IsParamModelEqualToString( model, "score_event" ) and PropertyIsTrue( self, "menuLoaded" ) then
			PlayClipOnElement( self, {
				elementName = "MPScore",
				clipName = "NormalScore"
			}, controller )
			SetMPScoreText( self, self.MPScore, controller, model )
		end
	end )
	self:addElement( self.MPScore )
	
	self.ZMPrematchCountdown0 = CoD.ZM_PrematchCountdown.new( self, controller )
	self.ZMPrematchCountdown0:setLeftRight( false, false, -640, 640 )
	self.ZMPrematchCountdown0:setTopBottom( false, false, -360, 360 )
	self:addElement( self.ZMPrematchCountdown0 )
	
	self.ScoreboardWidget = CoD.T8Scoreboard.new( self, controller )
	self.ScoreboardWidget:setLeftRight( true, true, 0, 0 )
	self.ScoreboardWidget:setTopBottom( true, true, 0, 0 )
	self:addElement( self.ScoreboardWidget )
	
	self.ZMBeastBar = CoD.ZM_BeastmodeTimeBarWidget.new( self, controller )
	self.ZMBeastBar:setLeftRight( false, false, -242.5, 321.5 )
	self.ZMBeastBar:setTopBottom( false, true, -174, -18 )
	self.ZMBeastBar:setScale( 0.7 )
	self:addElement( self.ZMBeastBar )
	
	self.RocketShieldBlueprintWidget = CoD.RocketShieldBlueprintWidget.new( self, controller )
	self.RocketShieldBlueprintWidget:setLeftRight( true, false, -36.5, 277.5 )
	self.RocketShieldBlueprintWidget:setTopBottom( true, false, 104, 233 )
	self.RocketShieldBlueprintWidget:setScale( 0.8 )
	self.RocketShieldBlueprintWidget:mergeStateConditions( {
		{
			stateName = "Scoreboard",
			condition = function ( menu, element, event )
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					return AlwaysFalse()
				end
			end
		}
	} )
	self.RocketShieldBlueprintWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "zmInventory.widget_shield_parts" ), function ( model )
		self:updateElementState( self.RocketShieldBlueprintWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zmInventory.widget_shield_parts"
		} )
	end )
	self.RocketShieldBlueprintWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( self.RocketShieldBlueprintWidget, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( self.RocketShieldBlueprintWidget )
	
	self.IngameChatClientContainer = CoD.IngameChatClientContainer.new( self, controller )
	self.IngameChatClientContainer:setLeftRight( true, false, 0, 360 )
	self.IngameChatClientContainer:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( self.IngameChatClientContainer )
	
	self.IngameChatClientContainer0 = CoD.IngameChatClientContainer.new( self, controller )
	self.IngameChatClientContainer0:setLeftRight( true, false, 0, 360 )
	self.IngameChatClientContainer0:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( self.IngameChatClientContainer0 )
	
	self.BubbleGumPackInGame = CoD.BubbleGumPackInGame.new( self, controller )
	self.BubbleGumPackInGame:setLeftRight( true, false, 1304, 0 )
	self.BubbleGumPackInGame:setTopBottom( true, false, 35, 0 )
	self.BubbleGumPackInGame:setScale( 0.6 )
	self:addElement( self.BubbleGumPackInGame )

	self.GameTimeGroup = CoD.GameTimeGroup.new( self, controller )
	self.GameTimeGroup:setLeftRight( true, false, 20, 0 )
	self.GameTimeGroup:setTopBottom( true, false, 35, 0 )
	self.GameTimeGroup:setScale( 0.8 )
	self.GameTimeGroup:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
				or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
					return true
				else
					return false
				end
			end
		},
		{
			stateName = "InventoryScreen",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self.GameTimeGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		self:updateElementState( self.GameTimeGroup, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self.GameTimeGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( self.GameTimeGroup, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:addElement( self.GameTimeGroup )
	
	self.Score.navigation = {
		up = self.ScoreboardWidget,
		right = self.ScoreboardWidget
	}
	
	self.ScoreboardWidget.navigation = {
		left = self.Score,
		down = self.Score
	}

	CoD.Menu.AddNavigationHandler( self, self, controller )

	self:registerEventHandler( "menu_loaded", function ( element, event )
		SizeToSafeArea( element, controller )
		SetProperty( self, "menuLoaded", true )
		element:dispatchEventToChildren( event )
	end )

	self.Score.id = "Score"
	self.ScoreboardWidget.id = "ScoreboardWidget"

	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )

	self:processEvent( {
		name = "update_state",
		menu = self
	} )

	if not self:restoreState() then
		self.ScoreboardWidget:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DummyFont1:close()
		element.DummyFont2:close()
		element.DummyFont3:close()
		element.DummyFont4:close()
		element.DummyFont5:close()
		element.ZMPerksContainerFactory:close()
		element.Rounds:close()
		element.Ammo:close()
		element.Score:close()
		element.fullscreenContainer:close()
		element.Notifications:close()
		element.T8Notification:close()
		element.ZmNotifBGBContainerFactory:close()
		element.CursorHint:close()
		element.ConsoleCenter:close()
		element.DeadSpectate:close()
		element.MPScore:close()
		element.ZMPrematchCountdown0:close()
		element.ScoreboardWidget:close()
		element.ZMBeastBar:close()
		element.RocketShieldBlueprintWidget:close()
		element.IngameChatClientContainer:close()
		element.IngameChatClientContainer0:close()
		element.BubbleGumPackInGame:close()
		element.GameTimeGroup:close()
		element.KingslayerPowerupsContainer:close()
		
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_zm_factory.buttonPrompts" ) )
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end
