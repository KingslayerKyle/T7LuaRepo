require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfoContainer" )
require( "ui.uieditor.widgets.TOS" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMPContainer" )
require( "ui.uieditor.widgets.HUD.fx.EMP_ScoreInfo" )
require( "ui.uieditor.widgets.HUD.fx.EMP_WeaponInfo" )
require( "ui.uieditor.widgets.HUD.Map.CompassGroupMPContainer" )
require( "ui.uieditor.widgets.HUD.MP_VoipWidget.Voip_Container" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_Container" )
require( "ui.uieditor.widgets.MPHudWidgets.ReadyEvents.ReadyEvents" )

local PreLoadFunc = function ( self, controller )
	
end

LUI.createMenu.T7Hud_MP = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_MP" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local ScoreInfo = CoD.ScoreInfoContainer.new( self, controller )
	ScoreInfo:setLeftRight( true, false, -177, 437 )
	ScoreInfo:setTopBottom( false, true, -242, 8 )
	ScoreInfo:setRGB( 1, 1, 1 )
	self:addElement( ScoreInfo )
	self.ScoreInfo = ScoreInfo
	
	local TeamOps = CoD.TOS.new( self, controller )
	TeamOps:setLeftRight( false, true, -300, -60 )
	TeamOps:setTopBottom( true, false, 26, 246 )
	TeamOps:setRGB( 1, 1, 1 )
	self:addElement( TeamOps )
	self.TeamOps = TeamOps
	
	local AmmoWidgetContainer = CoD.AmmoWidgetMPContainer.new( self, controller )
	AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
	AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
	AmmoWidgetContainer:setRGB( 1, 1, 1 )
	self:addElement( AmmoWidgetContainer )
	self.AmmoWidgetContainer = AmmoWidgetContainer
	
	local EMPScoreInfo = CoD.EMP_ScoreInfo.new( self, controller )
	EMPScoreInfo:setLeftRight( true, false, -15, 326 )
	EMPScoreInfo:setTopBottom( true, false, 549, 720 )
	EMPScoreInfo:setRGB( 1, 1, 1 )
	self:addElement( EMPScoreInfo )
	self.EMPScoreInfo = EMPScoreInfo
	
	local EMPWeaponInfo = CoD.EMP_WeaponInfo.new( self, controller )
	EMPWeaponInfo:setLeftRight( false, true, -341, 0 )
	EMPWeaponInfo:setTopBottom( false, true, -171, 0 )
	EMPWeaponInfo:setRGB( 1, 1, 1 )
	self:addElement( EMPWeaponInfo )
	self.EMPWeaponInfo = EMPWeaponInfo
	
	local CompassGroupContainer = CoD.CompassGroupMPContainer.new( self, controller )
	CompassGroupContainer:setLeftRight( true, false, 6, 289 )
	CompassGroupContainer:setTopBottom( true, false, -1.33, 202.67 )
	CompassGroupContainer:setRGB( 1, 1, 1 )
	self:addElement( CompassGroupContainer )
	self.CompassGroupContainer = CompassGroupContainer
	
	local VoipContainer0 = CoD.Voip_Container.new( self, controller )
	VoipContainer0:setLeftRight( true, false, 290, 563 )
	VoipContainer0:setTopBottom( true, false, 39, 111 )
	VoipContainer0:setRGB( 1, 1, 1 )
	VoipContainer0:setYRot( 20 )
	VoipContainer0:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f3_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f3_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
						f3_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
					else
						f3_local0 = false
					end
				end
				return f3_local0
			end
		}
	} )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	if VoipContainer0.m_eventHandlers.hud_update_refresh then
		local currentEv = VoipContainer0.m_eventHandlers.hud_update_refresh
		VoipContainer0:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		VoipContainer0:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	VoipContainer0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		self:updateElementState( VoipContainer0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( VoipContainer0 )
	self.VoipContainer0 = VoipContainer0
	
	local currentEv = CoD.ScrStk_Container.new( self, controller )
	currentEv:setLeftRight( false, true, -130.54, -22 )
	currentEv:setTopBottom( false, true, -303.41, -128 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:setXRot( 15 )
	currentEv:setYRot( -40 )
	currentEv:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f20_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f20_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
						f20_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
					else
						f20_local0 = false
					end
				end
				return f20_local0
			end
		}
	} )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	if currentEv.m_eventHandlers.hud_update_refresh then
		local currentEv = currentEv.m_eventHandlers.hud_update_refresh
		currentEv:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		currentEv:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	currentEv:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		self:updateElementState( currentEv, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:addElement( currentEv )
	self.ScrStkContainer = currentEv
	
	local currentEv = CoD.ReadyEvents.new( self, controller )
	currentEv:setLeftRight( false, false, -200, 200 )
	currentEv:setTopBottom( false, true, -203, -83 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv:registerEventHandler( "hero_weapon_received", function ( element, event )
		local retVal = nil
		AddHeroAbilityReceivedNotification( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	currentEv:registerEventHandler( "killstreak_received", function ( element, event )
		local retVal = nil
		AddKillstreakReceivedNotification( self, element, event )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( currentEv )
	self.ReadyEvents = currentEv
	
	local ScoreInfoFlash = LUI.UIImage.new()
	ScoreInfoFlash:setLeftRight( true, false, 25, 235.74 )
	ScoreInfoFlash:setTopBottom( true, false, 617, 679 )
	ScoreInfoFlash:setRGB( 0.75, 0.85, 1 )
	ScoreInfoFlash:setZRot( 8 )
	ScoreInfoFlash:setImage( RegisterImage( "uie_radial_gradient" ) )
	ScoreInfoFlash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ScoreInfoFlash )
	self.ScoreInfoFlash = ScoreInfoFlash
	
	local AmmoWidgetFlash = LUI.UIImage.new()
	AmmoWidgetFlash:setLeftRight( true, false, 1040.95, 1268 )
	AmmoWidgetFlash:setTopBottom( true, false, 627, 685 )
	AmmoWidgetFlash:setRGB( 0.75, 0.85, 1 )
	AmmoWidgetFlash:setZRot( -8 )
	AmmoWidgetFlash:setImage( RegisterImage( "uie_radial_gradient" ) )
	AmmoWidgetFlash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AmmoWidgetFlash )
	self.AmmoWidgetFlash = AmmoWidgetFlash
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ScoreInfo:completeAnimation()
				self.ScoreInfo:setLeftRight( true, false, -177, 437 )
				self.ScoreInfo:setTopBottom( false, true, -242, 8 )
				self.ScoreInfo:setRGB( 1, 1, 1 )
				self.clipFinished( ScoreInfo, {} )
				AmmoWidgetContainer:completeAnimation()
				self.AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
				self.AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
				self.AmmoWidgetContainer:setRGB( 1, 1, 1 )
				self.clipFinished( AmmoWidgetContainer, {} )
				ScoreInfoFlash:completeAnimation()
				self.ScoreInfoFlash:setAlpha( 0 )
				self.clipFinished( ScoreInfoFlash, {} )
				AmmoWidgetFlash:completeAnimation()
				self.AmmoWidgetFlash:setAlpha( 0 )
				self.clipFinished( AmmoWidgetFlash, {} )
			end,
			SpeedBoost = function ()
				self:setupElementClipCounter( 4 )
				local ScoreInfoFrame2 = function ( ScoreInfo, event )
					local ScoreInfoFrame3 = function ( ScoreInfo, event )
						if not event.interrupted then
							ScoreInfo:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						ScoreInfo:setLeftRight( true, false, -188, 426 )
						ScoreInfo:setTopBottom( false, true, -232, 18 )
						ScoreInfo:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( ScoreInfo, event )
						else
							ScoreInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreInfoFrame3( ScoreInfo, event )
						return 
					else
						ScoreInfo:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						ScoreInfo:setLeftRight( true, false, -182.5, 431.5 )
						ScoreInfo:setTopBottom( false, true, -237, 13 )
						ScoreInfo:setRGB( 0.2, 0.53, 1 )
						ScoreInfo:registerEventHandler( "transition_complete_keyframe", ScoreInfoFrame3 )
					end
				end
				
				ScoreInfo:completeAnimation()
				self.ScoreInfo:setLeftRight( true, false, -177, 437 )
				self.ScoreInfo:setTopBottom( false, true, -242, 8 )
				self.ScoreInfo:setRGB( 1, 1, 1 )
				ScoreInfoFrame2( ScoreInfo, {} )
				local AmmoWidgetContainerFrame2 = function ( AmmoWidgetContainer, event )
					local AmmoWidgetContainerFrame3 = function ( AmmoWidgetContainer, event )
						if not event.interrupted then
							AmmoWidgetContainer:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						AmmoWidgetContainer:setLeftRight( false, true, -404, -6 )
						AmmoWidgetContainer:setTopBottom( false, true, -144, -20 )
						AmmoWidgetContainer:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( AmmoWidgetContainer, event )
						else
							AmmoWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoWidgetContainerFrame3( AmmoWidgetContainer, event )
						return 
					else
						AmmoWidgetContainer:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						AmmoWidgetContainer:setLeftRight( false, true, -414.5, -16.5 )
						AmmoWidgetContainer:setTopBottom( false, true, -150, -26 )
						AmmoWidgetContainer:setRGB( 0.2, 0.53, 1 )
						AmmoWidgetContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetContainerFrame3 )
					end
				end
				
				AmmoWidgetContainer:completeAnimation()
				self.AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
				self.AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
				self.AmmoWidgetContainer:setRGB( 1, 1, 1 )
				AmmoWidgetContainerFrame2( AmmoWidgetContainer, {} )
				local ScoreInfoFlashFrame2 = function ( ScoreInfoFlash, event )
					local ScoreInfoFlashFrame3 = function ( ScoreInfoFlash, event )
						local ScoreInfoFlashFrame4 = function ( ScoreInfoFlash, event )
							if not event.interrupted then
								ScoreInfoFlash:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							ScoreInfoFlash:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ScoreInfoFlash, event )
							else
								ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ScoreInfoFlashFrame4( ScoreInfoFlash, event )
							return 
						else
							ScoreInfoFlash:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							ScoreInfoFlash:setAlpha( 0.75 )
							ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", ScoreInfoFlashFrame4 )
						end
					end
					
					if event.interrupted then
						ScoreInfoFlashFrame3( ScoreInfoFlash, event )
						return 
					else
						ScoreInfoFlash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", ScoreInfoFlashFrame3 )
					end
				end
				
				ScoreInfoFlash:completeAnimation()
				self.ScoreInfoFlash:setAlpha( 0 )
				ScoreInfoFlashFrame2( ScoreInfoFlash, {} )
				local AmmoWidgetFlashFrame2 = function ( AmmoWidgetFlash, event )
					local AmmoWidgetFlashFrame3 = function ( AmmoWidgetFlash, event )
						local AmmoWidgetFlashFrame4 = function ( AmmoWidgetFlash, event )
							if not event.interrupted then
								AmmoWidgetFlash:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							AmmoWidgetFlash:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetFlash, event )
							else
								AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetFlashFrame4( AmmoWidgetFlash, event )
							return 
						else
							AmmoWidgetFlash:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							AmmoWidgetFlash:setAlpha( 0.75 )
							AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", AmmoWidgetFlashFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetFlashFrame3( AmmoWidgetFlash, event )
						return 
					else
						AmmoWidgetFlash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", AmmoWidgetFlashFrame3 )
					end
				end
				
				AmmoWidgetFlash:completeAnimation()
				self.AmmoWidgetFlash:setAlpha( 0 )
				AmmoWidgetFlashFrame2( AmmoWidgetFlash, {} )
			end
		},
		SpeedBoost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local ScoreInfoFrame2 = function ( ScoreInfo, event )
					local ScoreInfoFrame3 = function ( ScoreInfo, event )
						if not event.interrupted then
							ScoreInfo:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						ScoreInfo:setLeftRight( true, false, -177, 437 )
						ScoreInfo:setTopBottom( false, true, -242, 8 )
						ScoreInfo:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( ScoreInfo, event )
						else
							ScoreInfo:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ScoreInfoFrame3( ScoreInfo, event )
						return 
					else
						ScoreInfo:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						ScoreInfo:setLeftRight( true, false, -182.5, 431.5 )
						ScoreInfo:setTopBottom( false, true, -237, 13 )
						ScoreInfo:setRGB( 0.2, 0.53, 1 )
						ScoreInfo:registerEventHandler( "transition_complete_keyframe", ScoreInfoFrame3 )
					end
				end
				
				ScoreInfo:completeAnimation()
				self.ScoreInfo:setLeftRight( true, false, -188, 426 )
				self.ScoreInfo:setTopBottom( false, true, -232, 18 )
				self.ScoreInfo:setRGB( 1, 1, 1 )
				ScoreInfoFrame2( ScoreInfo, {} )
				local AmmoWidgetContainerFrame2 = function ( AmmoWidgetContainer, event )
					local AmmoWidgetContainerFrame3 = function ( AmmoWidgetContainer, event )
						if not event.interrupted then
							AmmoWidgetContainer:beginAnimation( "keyframe", 250, false, true, CoD.TweenType.Linear )
						end
						AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
						AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
						AmmoWidgetContainer:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( AmmoWidgetContainer, event )
						else
							AmmoWidgetContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AmmoWidgetContainerFrame3( AmmoWidgetContainer, event )
						return 
					else
						AmmoWidgetContainer:beginAnimation( "keyframe", 250, true, false, CoD.TweenType.Linear )
						AmmoWidgetContainer:setLeftRight( false, true, -414.5, -16.5 )
						AmmoWidgetContainer:setTopBottom( false, true, -150, -26 )
						AmmoWidgetContainer:setRGB( 0.2, 0.53, 1 )
						AmmoWidgetContainer:registerEventHandler( "transition_complete_keyframe", AmmoWidgetContainerFrame3 )
					end
				end
				
				AmmoWidgetContainer:completeAnimation()
				self.AmmoWidgetContainer:setLeftRight( false, true, -404, -6 )
				self.AmmoWidgetContainer:setTopBottom( false, true, -144, -20 )
				self.AmmoWidgetContainer:setRGB( 1, 1, 1 )
				AmmoWidgetContainerFrame2( AmmoWidgetContainer, {} )
				local ScoreInfoFlashFrame2 = function ( ScoreInfoFlash, event )
					local ScoreInfoFlashFrame3 = function ( ScoreInfoFlash, event )
						local ScoreInfoFlashFrame4 = function ( ScoreInfoFlash, event )
							if not event.interrupted then
								ScoreInfoFlash:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							ScoreInfoFlash:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( ScoreInfoFlash, event )
							else
								ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							ScoreInfoFlashFrame4( ScoreInfoFlash, event )
							return 
						else
							ScoreInfoFlash:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							ScoreInfoFlash:setAlpha( 0.75 )
							ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", ScoreInfoFlashFrame4 )
						end
					end
					
					if event.interrupted then
						ScoreInfoFlashFrame3( ScoreInfoFlash, event )
						return 
					else
						ScoreInfoFlash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						ScoreInfoFlash:registerEventHandler( "transition_complete_keyframe", ScoreInfoFlashFrame3 )
					end
				end
				
				ScoreInfoFlash:completeAnimation()
				self.ScoreInfoFlash:setAlpha( 0 )
				ScoreInfoFlashFrame2( ScoreInfoFlash, {} )
				local AmmoWidgetFlashFrame2 = function ( AmmoWidgetFlash, event )
					local AmmoWidgetFlashFrame3 = function ( AmmoWidgetFlash, event )
						local AmmoWidgetFlashFrame4 = function ( AmmoWidgetFlash, event )
							if not event.interrupted then
								AmmoWidgetFlash:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							end
							AmmoWidgetFlash:setAlpha( 0 )
							if event.interrupted then
								self.clipFinished( AmmoWidgetFlash, event )
							else
								AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AmmoWidgetFlashFrame4( AmmoWidgetFlash, event )
							return 
						else
							AmmoWidgetFlash:beginAnimation( "keyframe", 120, false, false, CoD.TweenType.Linear )
							AmmoWidgetFlash:setAlpha( 0.75 )
							AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", AmmoWidgetFlashFrame4 )
						end
					end
					
					if event.interrupted then
						AmmoWidgetFlashFrame3( AmmoWidgetFlash, event )
						return 
					else
						AmmoWidgetFlash:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						AmmoWidgetFlash:registerEventHandler( "transition_complete_keyframe", AmmoWidgetFlashFrame3 )
					end
				end
				
				AmmoWidgetFlash:completeAnimation()
				self.AmmoWidgetFlash:setAlpha( 0 )
				AmmoWidgetFlashFrame2( AmmoWidgetFlash, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "SpeedBoost",
			condition = function ( menu, element, event )
				return IsHeroWeaponOrGadgetInUse( menu, controller ) and IsHeroWeaponSpeedBurst( menu, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weapon" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weapon"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.powerRatio" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.powerRatio"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.name" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.name"
		} )
	end )
	currentEv.id = "ScrStkContainer"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ScrStkContainer:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.ScoreInfo:close()
		self.TeamOps:close()
		self.AmmoWidgetContainer:close()
		self.EMPScoreInfo:close()
		self.EMPWeaponInfo:close()
		self.CompassGroupContainer:close()
		self.VoipContainer0:close()
		self.ScrStkContainer:close()
		self.ReadyEvents:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

