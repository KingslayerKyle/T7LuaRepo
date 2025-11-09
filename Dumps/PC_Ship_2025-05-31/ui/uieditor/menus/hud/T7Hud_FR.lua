require( "ui.uieditor.widgets.Freerun.FR_InfoContainer" )
require( "ui.uieditor.widgets.Freerun.FR_DpadContainer" )
require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMPContainer" )
require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_Container" )
require( "ui.uieditor.widgets.Freerun.FR_NotificationFlashes" )
require( "ui.uieditor.widgets.Freerun.FR_TopScoreContainer" )
require( "ui.uieditor.widgets.Freerun.FR_TimerContainer" )
require( "ui.uieditor.widgets.Freerun.FR_DistanceBarContainer" )
require( "ui.uieditor.widgets.Chat.inGame.IngameChatClientContainer" )
require( "ui.uieditor.widgets.Freerun.FR_Checkpoint" )

CoD.FreerunUtility = {}
CoD.FreerunUtility.FR_STATE_PRESTART = 0
CoD.FreerunUtility.FR_STATE_RUNNING = 1
CoD.FreerunUtility.FR_STATE_FINISHED = 2
CoD.FreerunUtility.FR_STATE_PAUSED = 3
CoD.FreerunUtility.FR_STATE_QUIT = 4
CoD.FreerunUtility.FR_STATE_DIALOG = 5
local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	return f1_arg0 - f1_arg1 + f1_arg2 * 1000 + f1_arg3 * 5000 - f1_arg4
end

local PostLoadFunc = function ( menu, controller )
	local _timer = LUI.UITimer.new( 1, "update_game_timer", false )
	menu:addElement( _timer )
	menu._timer = _timer
	
	LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
		menu._timer:close()
	end )
	menu:registerEventHandler( "update_game_timer", function ( element, event )
		local f4_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "FreeRun" )
		local f4_local1 = Engine.GetModel( f4_local0, "runState" )
		local f4_local2 = Engine.GetModel( f4_local0, "startTime" )
		local f4_local3 = Engine.GetModel( f4_local0, "pausedTime" )
		local f4_local4 = Engine.GetModel( f4_local0, "freeRunInfo" )
		local f4_local5 = Engine.GetModel( f4_local4, "bulletPenalty" )
		local f4_local6 = Engine.GetModel( f4_local4, "retries" )
		if f4_local2 and f4_local1 then
			local f4_local7 = Engine.GetModelValue( f4_local2 )
			local f4_local8 = Engine.GetModelValue( f4_local3 )
			local f4_local9 = Engine.GetModelValue( f4_local1 )
			local f4_local10 = Engine.GetModelValue( f4_local5 )
			local f4_local11 = Engine.GetModelValue( f4_local6 )
			local f4_local12 = Engine.GetModel( Engine.GetModel( f4_local0, "timer" ), "currentTime" )
			if f4_local7 ~= nil and f4_local7 ~= 0 then
				if f4_local9 == CoD.FreerunUtility.FR_STATE_RUNNING then
					local f4_local13 = f0_local0( Engine.CurrentGameTime(), f4_local7, f4_local10, f4_local11, f4_local8 )
					if f4_local13 < 0 then
						f4_local13 = 0
					end
					Engine.SetModelValue( f4_local12, f4_local13 )
				elseif f4_local9 == CoD.FreerunUtility.FR_STATE_FINISHED or f4_local9 == CoD.FreerunUtility.FR_STATE_QUIT or f4_local9 == CoD.FreerunUtility.FR_STATE_DIALOG then
					local f4_local14 = Engine.GetModel( f4_local0, "finishTime" )
					if f4_local14 then
						Engine.SetModelValue( f4_local12, Engine.GetModelValue( f4_local14 ) )
					end
				elseif f4_local9 == CoD.FreerunUtility.FR_STATE_PAUSED then
					if f0_local0( Engine.CurrentGameTime(), f4_local7, f4_local10, f4_local11, f4_local8 ) < 0 then
						local f4_local13 = 0
					end
				else
					Engine.SetModelValue( f4_local12, 0 )
				end
			end
		end
	end )
	menu:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.runState" ), function ( model )
		if model then
			local f5_local0 = Engine.GetModelValue( model )
			if f5_local0 == CoD.FreerunUtility.FR_STATE_PRESTART then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.freeRunInfo.activeCheckpoint" ), -1 )
				SetState( menu, "DefaultState" )
			elseif f5_local0 == CoD.FreerunUtility.FR_STATE_RUNNING then
				SetState( menu, "DefaultState" )
			elseif f5_local0 == CoD.FreerunUtility.FR_STATE_FINISHED then
				SetState( menu, "GameEnded" )
			elseif f5_local0 == CoD.FreerunUtility.FR_STATE_QUIT then
				SetState( menu, "GameQuit" )
			elseif f5_local0 == CoD.FreerunUtility.FR_STATE_DIALOG and not Engine.IsDemoPlaying() then
				Engine.LockInput( controller, true )
				CoD.OverlayUtility.CreateOverlay( controller, menu, "FreerunEndGamePopup" )
			end
		end
	end )
	menu:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.freeRunInfo.activeCheckpoint" ), function ( model )
		if model then
			Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.timer.timeAdjustment" ) )
		end
	end )
	menu:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.timer.timeAdjustmentNegative" ), function ( model )
		if model then
			Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( controller ), "FreeRun.timer.timeAdjustment" ) )
		end
	end )
end

LUI.createMenu.T7Hud_FR = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_FR" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "T7Hud_FR.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local EndTop = LUI.UIImage.new()
	EndTop:setLeftRight( true, false, -309.56, 1650.44 )
	EndTop:setTopBottom( true, false, -250, -122 )
	EndTop:setRGB( 0, 0, 0 )
	self:addElement( EndTop )
	self.EndTop = EndTop
	
	local EndBottom = LUI.UIImage.new()
	EndBottom:setLeftRight( true, false, -309.56, 1650.44 )
	EndBottom:setTopBottom( true, false, 874, 1002 )
	EndBottom:setRGB( 0, 0, 0 )
	self:addElement( EndBottom )
	self.EndBottom = EndBottom
	
	local FRInfoContainer = CoD.FR_InfoContainer.new( self, controller )
	FRInfoContainer:setLeftRight( true, false, 41, 343 )
	FRInfoContainer:setTopBottom( true, false, 31.17, 231.17 )
	self:addElement( FRInfoContainer )
	self.FRInfoContainer = FRInfoContainer
	
	local FRDpadContainer = CoD.FR_DpadContainer.new( self, controller )
	FRDpadContainer:setLeftRight( true, false, 41, 299.5 )
	FRDpadContainer:setTopBottom( false, true, -135.43, -27.31 )
	self:addElement( FRDpadContainer )
	self.FRDpadContainer = FRDpadContainer
	
	local AmmoWidgetContainer = CoD.AmmoWidgetMPContainer.new( self, controller )
	AmmoWidgetContainer:setLeftRight( false, true, -425, -27 )
	AmmoWidgetContainer:setTopBottom( false, true, -156, -32 )
	AmmoWidgetContainer:setAlpha( 0 )
	self:addElement( AmmoWidgetContainer )
	self.AmmoWidgetContainer = AmmoWidgetContainer
	
	local ScrStkContainer = CoD.ScrStk_Container.new( self, controller )
	ScrStkContainer:setLeftRight( false, true, -130.54, -22 )
	ScrStkContainer:setTopBottom( false, true, -303.41, -128 )
	ScrStkContainer:setAlpha( 0 )
	ScrStkContainer:setXRot( 15 )
	ScrStkContainer:setYRot( -40 )
	ScrStkContainer:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f9_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f9_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) then
						f9_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
					else
						f9_local0 = false
					end
				end
				return f9_local0
			end
		}
	} )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	ScrStkContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		self:updateElementState( ScrStkContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( ScrStkContainer )
	self.ScrStkContainer = ScrStkContainer
	
	local AmmoWidgetFlash = LUI.UIImage.new()
	AmmoWidgetFlash:setLeftRight( true, false, 1040.95, 1268 )
	AmmoWidgetFlash:setTopBottom( true, false, 627, 685 )
	AmmoWidgetFlash:setRGB( 0.75, 0.85, 1 )
	AmmoWidgetFlash:setAlpha( 0 )
	AmmoWidgetFlash:setZRot( -8 )
	AmmoWidgetFlash:setImage( RegisterImage( "uie_radial_gradient" ) )
	AmmoWidgetFlash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( AmmoWidgetFlash )
	self.AmmoWidgetFlash = AmmoWidgetFlash
	
	local FRNotificationFlashes = CoD.FR_NotificationFlashes.new( self, controller )
	FRNotificationFlashes:setLeftRight( true, false, 295.53, 970.53 )
	FRNotificationFlashes:setTopBottom( true, false, 494.67, 601.67 )
	self:addElement( FRNotificationFlashes )
	self.FRNotificationFlashes = FRNotificationFlashes
	
	local FRTopScoreContainer = CoD.FR_TopScoreContainer.new( self, controller )
	FRTopScoreContainer:setLeftRight( true, false, 362, 918 )
	FRTopScoreContainer:setTopBottom( true, false, 202.67, 494.67 )
	FRTopScoreContainer:setAlpha( 0 )
	FRTopScoreContainer:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return not IsFreeRunFinished( controller )
			end
		}
	} )
	FRTopScoreContainer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "FreeRun.runState" ), function ( model )
		self:updateElementState( FRTopScoreContainer, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FreeRun.runState"
		} )
	end )
	self:addElement( FRTopScoreContainer )
	self.FRTopScoreContainer = FRTopScoreContainer
	
	local FRTimerContainer = CoD.FR_TimerContainer.new( self, controller )
	FRTimerContainer:setLeftRight( false, false, -145.5, 145.5 )
	FRTimerContainer:setTopBottom( true, false, 31.17, 130.17 )
	self:addElement( FRTimerContainer )
	self.FRTimerContainer = FRTimerContainer
	
	local FRDistanceBarContainer = CoD.FR_DistanceBarContainer.new( self, controller )
	FRDistanceBarContainer:setLeftRight( true, false, 396.94, 943.94 )
	FRDistanceBarContainer:setTopBottom( true, false, -0.33, 60.67 )
	FRDistanceBarContainer:setAlpha( 0 )
	self:addElement( FRDistanceBarContainer )
	self.FRDistanceBarContainer = FRDistanceBarContainer
	
	local IngameChatClientContainer = CoD.IngameChatClientContainer.new( self, controller )
	IngameChatClientContainer:setLeftRight( true, false, 0, 360 )
	IngameChatClientContainer:setTopBottom( true, false, -2.5, 717.5 )
	self:addElement( IngameChatClientContainer )
	self.IngameChatClientContainer = IngameChatClientContainer
	
	local FRCheckpoint = CoD.FR_Checkpoint.new( self, controller )
	FRCheckpoint:setLeftRight( true, true, 0, 0 )
	FRCheckpoint:setTopBottom( true, false, 131.17, 282.17 )
	self:addElement( FRCheckpoint )
	self.FRCheckpoint = FRCheckpoint
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				EndTop:completeAnimation()
				self.EndTop:setAlpha( 0 )
				self.clipFinished( EndTop, {} )
				EndBottom:completeAnimation()
				self.EndBottom:setAlpha( 0 )
				self.clipFinished( EndBottom, {} )
				local FRInfoContainerFrame2 = function ( FRInfoContainer, event )
					if not event.interrupted then
						FRInfoContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FRInfoContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRInfoContainer, event )
					else
						FRInfoContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRInfoContainer:completeAnimation()
				self.FRInfoContainer:setAlpha( 0 )
				FRInfoContainerFrame2( FRInfoContainer, {} )
				local FRDpadContainerFrame2 = function ( FRDpadContainer, event )
					if not event.interrupted then
						FRDpadContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FRDpadContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRDpadContainer, event )
					else
						FRDpadContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRDpadContainer:completeAnimation()
				self.FRDpadContainer:setAlpha( 0 )
				FRDpadContainerFrame2( FRDpadContainer, {} )
				local FRTimerContainerFrame2 = function ( FRTimerContainer, event )
					if not event.interrupted then
						FRTimerContainer:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					FRTimerContainer:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FRTimerContainer, event )
					else
						FRTimerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FRTimerContainer:completeAnimation()
				self.FRTimerContainer:setAlpha( 0 )
				FRTimerContainerFrame2( FRTimerContainer, {} )
			end,
			Penalty = function ()
				self:setupElementClipCounter( 0 )
			end,
			FaultAnim = function ()
				self:setupElementClipCounter( 0 )
			end,
			RetryAnim = function ()
				self:setupElementClipCounter( 0 )
			end,
			SetCheckpointDelta = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		GameEnded = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local EndTopFrame2 = function ( EndTop, event )
					if not event.interrupted then
						EndTop:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					EndTop:setLeftRight( true, false, -309.56, 1650.44 )
					EndTop:setTopBottom( true, false, -250, 360 )
					EndTop:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( EndTop, event )
					else
						EndTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EndTop:completeAnimation()
				self.EndTop:setLeftRight( true, false, -309.56, 1650.44 )
				self.EndTop:setTopBottom( true, false, -250, -122 )
				self.EndTop:setAlpha( 0.4 )
				EndTopFrame2( EndTop, {} )
				local EndBottomFrame2 = function ( EndBottom, event )
					if not event.interrupted then
						EndBottom:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					EndBottom:setLeftRight( true, false, -309.56, 1650.44 )
					EndBottom:setTopBottom( true, false, 360, 1002 )
					EndBottom:setAlpha( 0.4 )
					if event.interrupted then
						self.clipFinished( EndBottom, event )
					else
						EndBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EndBottom:completeAnimation()
				self.EndBottom:setLeftRight( true, false, -309.56, 1650.44 )
				self.EndBottom:setTopBottom( true, false, 874, 1002 )
				self.EndBottom:setAlpha( 0.4 )
				EndBottomFrame2( EndBottom, {} )
				local FRInfoContainerFrame2 = function ( FRInfoContainer, event )
					local FRInfoContainerFrame3 = function ( FRInfoContainer, event )
						if not event.interrupted then
							FRInfoContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						end
						FRInfoContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FRInfoContainer, event )
						else
							FRInfoContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FRInfoContainerFrame3( FRInfoContainer, event )
						return 
					else
						FRInfoContainer:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FRInfoContainer:registerEventHandler( "transition_complete_keyframe", FRInfoContainerFrame3 )
					end
				end
				
				FRInfoContainer:completeAnimation()
				self.FRInfoContainer:setAlpha( 1 )
				FRInfoContainerFrame2( FRInfoContainer, {} )
				local FRDpadContainerFrame2 = function ( FRDpadContainer, event )
					local FRDpadContainerFrame3 = function ( FRDpadContainer, event )
						if not event.interrupted then
							FRDpadContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						end
						FRDpadContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FRDpadContainer, event )
						else
							FRDpadContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FRDpadContainerFrame3( FRDpadContainer, event )
						return 
					else
						FRDpadContainer:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FRDpadContainer:registerEventHandler( "transition_complete_keyframe", FRDpadContainerFrame3 )
					end
				end
				
				FRDpadContainer:completeAnimation()
				self.FRDpadContainer:setAlpha( 1 )
				FRDpadContainerFrame2( FRDpadContainer, {} )
			end
		},
		GameQuit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local FRInfoContainerFrame2 = function ( FRInfoContainer, event )
					local FRInfoContainerFrame3 = function ( FRInfoContainer, event )
						if not event.interrupted then
							FRInfoContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						end
						FRInfoContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FRInfoContainer, event )
						else
							FRInfoContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FRInfoContainerFrame3( FRInfoContainer, event )
						return 
					else
						FRInfoContainer:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FRInfoContainer:registerEventHandler( "transition_complete_keyframe", FRInfoContainerFrame3 )
					end
				end
				
				FRInfoContainer:completeAnimation()
				self.FRInfoContainer:setAlpha( 1 )
				FRInfoContainerFrame2( FRInfoContainer, {} )
				local FRDpadContainerFrame2 = function ( FRDpadContainer, event )
					local FRDpadContainerFrame3 = function ( FRDpadContainer, event )
						if not event.interrupted then
							FRDpadContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						end
						FRDpadContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FRDpadContainer, event )
						else
							FRDpadContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FRDpadContainerFrame3( FRDpadContainer, event )
						return 
					else
						FRDpadContainer:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FRDpadContainer:registerEventHandler( "transition_complete_keyframe", FRDpadContainerFrame3 )
					end
				end
				
				FRDpadContainer:completeAnimation()
				self.FRDpadContainer:setAlpha( 1 )
				FRDpadContainerFrame2( FRDpadContainer, {} )
				local FRTimerContainerFrame2 = function ( FRTimerContainer, event )
					local FRTimerContainerFrame3 = function ( FRTimerContainer, event )
						if not event.interrupted then
							FRTimerContainer:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						end
						FRTimerContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FRTimerContainer, event )
						else
							FRTimerContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FRTimerContainerFrame3( FRTimerContainer, event )
						return 
					else
						FRTimerContainer:beginAnimation( "keyframe", 509, false, false, CoD.TweenType.Linear )
						FRTimerContainer:registerEventHandler( "transition_complete_keyframe", FRTimerContainerFrame3 )
					end
				end
				
				FRTimerContainer:completeAnimation()
				self.FRTimerContainer:setAlpha( 1 )
				FRTimerContainerFrame2( FRTimerContainer, {} )
			end
		}
	}
	ScrStkContainer.id = "ScrStkContainer"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FRInfoContainer:close()
		element.FRDpadContainer:close()
		element.AmmoWidgetContainer:close()
		element.ScrStkContainer:close()
		element.FRNotificationFlashes:close()
		element.FRTopScoreContainer:close()
		element.FRTimerContainer:close()
		element.FRDistanceBarContainer:close()
		element.IngameChatClientContainer:close()
		element.FRCheckpoint:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "T7Hud_FR.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

