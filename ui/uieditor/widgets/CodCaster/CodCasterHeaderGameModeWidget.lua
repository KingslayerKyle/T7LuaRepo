-- 4e8dfc211fd078bec5be5a7a1c89794b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterPlayerFlagStatus" )
require( "ui.uieditor.widgets.CodCaster.CodCasterEnemyFlagStatus" )
require( "ui.uieditor.widgets.CodCaster.CodCasterBombTimerWidget" )
require( "ui.uieditor.widgets.CodCaster.CodCasterDomFlagsWidget" )
require( "ui.uieditor.widgets.CodCaster.CodCasterHardpointWidget" )
require( "ui.uieditor.widgets.CodCaster.CodCasterBallStatus" )
require( "ui.uieditor.widgets.CodCaster.CodCasterRobotStatus" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "searchAndDestroy.defending" )
end

CoD.CodCasterHeaderGameModeWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterHeaderGameModeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterHeaderGameModeWidget )
	self.id = "CodCasterHeaderGameModeWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 506 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local rightB = LUI.UIImage.new()
	rightB:setLeftRight( false, true, -223, -5 )
	rightB:setTopBottom( true, false, 3, 27 )
	rightB:setYRot( 180 )
	rightB:setImage( RegisterImage( "uie_t7_codcaster_gamemodebacking" ) )
	self:addElement( rightB )
	self.rightB = rightB
	
	local leftBG0 = LUI.UIImage.new()
	leftBG0:setLeftRight( true, false, 4, 222 )
	leftBG0:setTopBottom( true, false, 3, 27 )
	leftBG0:setImage( RegisterImage( "uie_t7_codcaster_gamemodebacking" ) )
	self:addElement( leftBG0 )
	self.leftBG0 = leftBG0
	
	local AlliesFlagStatus = CoD.CodCasterPlayerFlagStatus.new( menu, controller )
	AlliesFlagStatus:setLeftRight( true, false, 0, 260 )
	AlliesFlagStatus:setTopBottom( true, false, -2, 32 )
	AlliesFlagStatus:setAlpha( 0 )
	AlliesFlagStatus:subscribeToGlobalModel( controller, "CTF", "friendlyFlagCarrier", function ( model )
		local friendlyFlagCarrier = Engine.GetModelValue( model )
		if friendlyFlagCarrier then
			AlliesFlagStatus.FriendlyFlagCarrier:setText( Engine.Localize( friendlyFlagCarrier ) )
		end
	end )
	AlliesFlagStatus:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			AlliesFlagStatus.PlayerFlag:setRGB( alliesFactionColor )
		end
	end )
	self:addElement( AlliesFlagStatus )
	self.AlliesFlagStatus = AlliesFlagStatus
	
	local AxisFlagStatus = CoD.CodCasterEnemyFlagStatus.new( menu, controller )
	AxisFlagStatus:setLeftRight( true, false, 204, 464 )
	AxisFlagStatus:setTopBottom( true, false, -2, 32 )
	AxisFlagStatus:setAlpha( 0 )
	AxisFlagStatus:subscribeToGlobalModel( controller, "CTF", "enemyFlagCarrier", function ( model )
		local enemyFlagCarrier = Engine.GetModelValue( model )
		if enemyFlagCarrier then
			AxisFlagStatus.FriendlyFlagCarrier:setText( Engine.Localize( enemyFlagCarrier ) )
		end
	end )
	AxisFlagStatus:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			AxisFlagStatus.PlayerFlag:setRGB( axisFactionColor )
		end
	end )
	self:addElement( AxisFlagStatus )
	self.AxisFlagStatus = AxisFlagStatus
	
	local BombTimerA = CoD.CodCasterBombTimerWidget.new( menu, controller )
	BombTimerA:setLeftRight( false, false, -46, 0 )
	BombTimerA:setTopBottom( true, false, 0, 30 )
	BombTimerA:setAlpha( 0 )
	BombTimerA.BombTimer:setupBombTimer( 0, true )
	BombTimerA.AOrBText:setText( Engine.Localize( "A" ) )
	BombTimerA:mergeStateConditions( {
		{
			stateName = "VisibleFriendly",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A )
			end
		},
		{
			stateName = "VisibleEnemy",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ) and IsModelValueTrue( controller, "searchAndDestroy.defending" )
			end
		}
	} )
	BombTimerA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A ), function ( model )
		menu:updateElementState( BombTimerA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_A
		} )
	end )
	BombTimerA:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "searchAndDestroy.defending" ), function ( model )
		menu:updateElementState( BombTimerA, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "searchAndDestroy.defending"
		} )
	end )
	self:addElement( BombTimerA )
	self.BombTimerA = BombTimerA
	
	local BombTimerB = CoD.CodCasterBombTimerWidget.new( menu, controller )
	BombTimerB:setLeftRight( false, false, 0, 47 )
	BombTimerB:setTopBottom( true, false, 0, 30 )
	BombTimerB:setAlpha( 0 )
	BombTimerB.BombTimer:setupBombTimer( 1, true )
	BombTimerB.AOrBText:setText( Engine.Localize( "B" ) )
	BombTimerB:mergeStateConditions( {
		{
			stateName = "VisibleFriendly",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B )
			end
		},
		{
			stateName = "VisibleEnemy",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ) and IsModelValueTrue( controller, "searchanddestroy.defending" )
			end
		}
	} )
	BombTimerB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B ), function ( model )
		menu:updateElementState( BombTimerB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_BOMB_TIMER_B
		} )
	end )
	BombTimerB:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "searchanddestroy.defending" ), function ( model )
		menu:updateElementState( BombTimerB, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "searchanddestroy.defending"
		} )
	end )
	self:addElement( BombTimerB )
	self.BombTimerB = BombTimerB
	
	local AlliesNumPlayersAlive = LUI.UIText.new()
	AlliesNumPlayersAlive:setLeftRight( true, false, 4, 260 )
	AlliesNumPlayersAlive:setTopBottom( true, false, 6.5, 22.5 )
	AlliesNumPlayersAlive:setAlpha( 0 )
	AlliesNumPlayersAlive:setText( Engine.Localize( "CODCASTER_TEAM1_NUM_ALIVE" ) )
	AlliesNumPlayersAlive:setTTF( "fonts/default.ttf" )
	AlliesNumPlayersAlive:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AlliesNumPlayersAlive:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AlliesNumPlayersAlive )
	self.AlliesNumPlayersAlive = AlliesNumPlayersAlive
	
	local AxisNumPlayersAlive = LUI.UIText.new()
	AxisNumPlayersAlive:setLeftRight( false, true, -253, -3 )
	AxisNumPlayersAlive:setTopBottom( true, false, 4.99, 22.99 )
	AxisNumPlayersAlive:setAlpha( 0 )
	AxisNumPlayersAlive:setText( Engine.Localize( "CODCASTER_TEAM2_NUM_ALIVE" ) )
	AxisNumPlayersAlive:setTTF( "fonts/default.ttf" )
	AxisNumPlayersAlive:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	AxisNumPlayersAlive:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( AxisNumPlayersAlive )
	self.AxisNumPlayersAlive = AxisNumPlayersAlive
	
	local DomFlags = CoD.CodCasterDomFlagsWidget.new( menu, controller )
	DomFlags:setLeftRight( false, false, -53, 50 )
	DomFlags:setTopBottom( true, false, 0, 30 )
	DomFlags:setAlpha( 0 )
	self:addElement( DomFlags )
	self.DomFlags = DomFlags
	
	local Hardpoint = CoD.CodCasterHardpointWidget.new( menu, controller )
	Hardpoint:setLeftRight( false, false, -46, 47 )
	Hardpoint:setTopBottom( true, false, 2, 62 )
	Hardpoint:setAlpha( 0 )
	self:addElement( Hardpoint )
	self.Hardpoint = Hardpoint
	
	local UplinkBall = CoD.CodCasterBallStatus.new( menu, controller )
	UplinkBall:setLeftRight( false, false, -19.38, 20.38 )
	UplinkBall:setTopBottom( true, false, 4, 60 )
	UplinkBall:setAlpha( 0 )
	self:addElement( UplinkBall )
	self.UplinkBall = UplinkBall
	
	local SafeGuardRobot = CoD.CodCasterRobotStatus.new( menu, controller )
	SafeGuardRobot:setLeftRight( false, false, -19.38, 20.38 )
	SafeGuardRobot:setTopBottom( true, false, 4, 60 )
	SafeGuardRobot:setAlpha( 0 )
	self:addElement( SafeGuardRobot )
	self.SafeGuardRobot = SafeGuardRobot
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				rightB:completeAnimation()
				self.rightB:setAlpha( 0 )
				self.clipFinished( rightB, {} )
				leftBG0:completeAnimation()
				self.leftBG0:setAlpha( 0 )
				self.clipFinished( leftBG0, {} )
				AlliesFlagStatus:completeAnimation()
				self.AlliesFlagStatus:setAlpha( 0 )
				self.clipFinished( AlliesFlagStatus, {} )
				AxisFlagStatus:completeAnimation()
				self.AxisFlagStatus:setAlpha( 0 )
				self.clipFinished( AxisFlagStatus, {} )
				BombTimerA:completeAnimation()
				self.BombTimerA:setAlpha( 0 )
				self.clipFinished( BombTimerA, {} )
				BombTimerB:completeAnimation()
				self.BombTimerB:setAlpha( 0 )
				self.clipFinished( BombTimerB, {} )
				AlliesNumPlayersAlive:completeAnimation()
				self.AlliesNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AlliesNumPlayersAlive, {} )
				AxisNumPlayersAlive:completeAnimation()
				self.AxisNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AxisNumPlayersAlive, {} )
				DomFlags:completeAnimation()
				self.DomFlags:setAlpha( 0 )
				self.clipFinished( DomFlags, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				UplinkBall:completeAnimation()
				self.UplinkBall:setAlpha( 0 )
				self.clipFinished( UplinkBall, {} )
				SafeGuardRobot:completeAnimation()
				self.SafeGuardRobot:setAlpha( 0 )
				self.clipFinished( SafeGuardRobot, {} )
			end
		},
		CTF = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				rightB:completeAnimation()
				self.rightB:setAlpha( 1 )
				self.clipFinished( rightB, {} )
				leftBG0:completeAnimation()
				self.leftBG0:setAlpha( 1 )
				self.clipFinished( leftBG0, {} )
				AlliesFlagStatus:completeAnimation()
				self.AlliesFlagStatus:setLeftRight( true, false, 3, 263 )
				self.AlliesFlagStatus:setTopBottom( true, false, -3, 31 )
				self.AlliesFlagStatus:setAlpha( 1 )
				self.clipFinished( AlliesFlagStatus, {} )
				AxisFlagStatus:completeAnimation()
				self.AxisFlagStatus:setLeftRight( true, false, 243, 503 )
				self.AxisFlagStatus:setTopBottom( true, false, -3, 31 )
				self.AxisFlagStatus:setAlpha( 1 )
				self.clipFinished( AxisFlagStatus, {} )
				BombTimerA:completeAnimation()
				self.BombTimerA:setAlpha( 0 )
				self.clipFinished( BombTimerA, {} )
				BombTimerB:completeAnimation()
				self.BombTimerB:setAlpha( 0 )
				self.clipFinished( BombTimerB, {} )
				AlliesNumPlayersAlive:completeAnimation()
				self.AlliesNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AlliesNumPlayersAlive, {} )
				AxisNumPlayersAlive:completeAnimation()
				self.AxisNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AxisNumPlayersAlive, {} )
				DomFlags:completeAnimation()
				self.DomFlags:setAlpha( 0 )
				self.clipFinished( DomFlags, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				UplinkBall:completeAnimation()
				self.UplinkBall:setAlpha( 0 )
				self.clipFinished( UplinkBall, {} )
				SafeGuardRobot:completeAnimation()
				self.SafeGuardRobot:setAlpha( 0 )
				self.clipFinished( SafeGuardRobot, {} )
			end
		},
		Dom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				rightB:completeAnimation()
				self.rightB:setAlpha( 0 )
				self.clipFinished( rightB, {} )
				leftBG0:completeAnimation()
				self.leftBG0:setAlpha( 0 )
				self.clipFinished( leftBG0, {} )
				AlliesFlagStatus:completeAnimation()
				self.AlliesFlagStatus:setAlpha( 0 )
				self.clipFinished( AlliesFlagStatus, {} )
				AxisFlagStatus:completeAnimation()
				self.AxisFlagStatus:setAlpha( 0 )
				self.clipFinished( AxisFlagStatus, {} )
				BombTimerA:completeAnimation()
				self.BombTimerA:setAlpha( 0 )
				self.clipFinished( BombTimerA, {} )
				BombTimerB:completeAnimation()
				self.BombTimerB:setAlpha( 0 )
				self.clipFinished( BombTimerB, {} )
				AlliesNumPlayersAlive:completeAnimation()
				self.AlliesNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AlliesNumPlayersAlive, {} )
				AxisNumPlayersAlive:completeAnimation()
				self.AxisNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AxisNumPlayersAlive, {} )
				DomFlags:completeAnimation()
				self.DomFlags:setLeftRight( false, false, -47, 44 )
				self.DomFlags:setTopBottom( true, false, 0, 30 )
				self.DomFlags:setAlpha( 1 )
				self.clipFinished( DomFlags, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setLeftRight( false, false, -47, 44 )
				self.Hardpoint:setTopBottom( true, false, 1, 62 )
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				UplinkBall:completeAnimation()
				self.UplinkBall:setAlpha( 0 )
				self.clipFinished( UplinkBall, {} )
				SafeGuardRobot:completeAnimation()
				self.SafeGuardRobot:setAlpha( 0 )
				self.clipFinished( SafeGuardRobot, {} )
			end
		},
		Hardpoint = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				rightB:completeAnimation()
				self.rightB:setAlpha( 0 )
				self.clipFinished( rightB, {} )
				leftBG0:completeAnimation()
				self.leftBG0:setAlpha( 0 )
				self.clipFinished( leftBG0, {} )
				AlliesFlagStatus:completeAnimation()
				self.AlliesFlagStatus:setAlpha( 0 )
				self.clipFinished( AlliesFlagStatus, {} )
				AxisFlagStatus:completeAnimation()
				self.AxisFlagStatus:setAlpha( 0 )
				self.clipFinished( AxisFlagStatus, {} )
				BombTimerA:completeAnimation()
				self.BombTimerA:setAlpha( 0 )
				self.clipFinished( BombTimerA, {} )
				BombTimerB:completeAnimation()
				self.BombTimerB:setAlpha( 0 )
				self.clipFinished( BombTimerB, {} )
				AlliesNumPlayersAlive:completeAnimation()
				self.AlliesNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AlliesNumPlayersAlive, {} )
				AxisNumPlayersAlive:completeAnimation()
				self.AxisNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AxisNumPlayersAlive, {} )
				DomFlags:completeAnimation()
				self.DomFlags:setAlpha( 0 )
				self.clipFinished( DomFlags, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setLeftRight( false, false, -47, 44 )
				self.Hardpoint:setTopBottom( true, false, -1, 59 )
				self.Hardpoint:setAlpha( 1 )
				self.clipFinished( Hardpoint, {} )
				UplinkBall:completeAnimation()
				self.UplinkBall:setAlpha( 0 )
				self.clipFinished( UplinkBall, {} )
				SafeGuardRobot:completeAnimation()
				self.SafeGuardRobot:setAlpha( 0 )
				self.clipFinished( SafeGuardRobot, {} )
			end
		},
		Uplink = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				rightB:completeAnimation()
				self.rightB:setAlpha( 0 )
				self.clipFinished( rightB, {} )
				leftBG0:completeAnimation()
				self.leftBG0:setAlpha( 0 )
				self.clipFinished( leftBG0, {} )
				AlliesFlagStatus:completeAnimation()
				self.AlliesFlagStatus:setAlpha( 0 )
				self.clipFinished( AlliesFlagStatus, {} )
				AxisFlagStatus:completeAnimation()
				self.AxisFlagStatus:setAlpha( 0 )
				self.clipFinished( AxisFlagStatus, {} )
				BombTimerA:completeAnimation()
				self.BombTimerA:setAlpha( 0 )
				self.clipFinished( BombTimerA, {} )
				BombTimerB:completeAnimation()
				self.BombTimerB:setAlpha( 0 )
				self.clipFinished( BombTimerB, {} )
				AlliesNumPlayersAlive:completeAnimation()
				self.AlliesNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AlliesNumPlayersAlive, {} )
				AxisNumPlayersAlive:completeAnimation()
				self.AxisNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AxisNumPlayersAlive, {} )
				DomFlags:completeAnimation()
				self.DomFlags:setAlpha( 0 )
				self.clipFinished( DomFlags, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setLeftRight( false, false, -46, 47 )
				self.Hardpoint:setTopBottom( true, false, 2, 62 )
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				UplinkBall:completeAnimation()
				self.UplinkBall:setLeftRight( false, false, -47, 44 )
				self.UplinkBall:setTopBottom( true, false, 14, 70 )
				self.UplinkBall:setAlpha( 1 )
				self.clipFinished( UplinkBall, {} )
				SafeGuardRobot:completeAnimation()
				self.SafeGuardRobot:setAlpha( 0 )
				self.clipFinished( SafeGuardRobot, {} )
			end
		},
		SafeGuard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				rightB:completeAnimation()
				self.rightB:setAlpha( 0 )
				self.clipFinished( rightB, {} )
				leftBG0:completeAnimation()
				self.leftBG0:setAlpha( 0 )
				self.clipFinished( leftBG0, {} )
				AlliesFlagStatus:completeAnimation()
				self.AlliesFlagStatus:setAlpha( 0 )
				self.clipFinished( AlliesFlagStatus, {} )
				AxisFlagStatus:completeAnimation()
				self.AxisFlagStatus:setAlpha( 0 )
				self.clipFinished( AxisFlagStatus, {} )
				BombTimerA:completeAnimation()
				self.BombTimerA:setAlpha( 0 )
				self.clipFinished( BombTimerA, {} )
				BombTimerB:completeAnimation()
				self.BombTimerB:setAlpha( 0 )
				self.clipFinished( BombTimerB, {} )
				AlliesNumPlayersAlive:completeAnimation()
				self.AlliesNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AlliesNumPlayersAlive, {} )
				AxisNumPlayersAlive:completeAnimation()
				self.AxisNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AxisNumPlayersAlive, {} )
				DomFlags:completeAnimation()
				self.DomFlags:setAlpha( 0 )
				self.clipFinished( DomFlags, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setLeftRight( false, false, -46, 47 )
				self.Hardpoint:setTopBottom( true, false, 2, 62 )
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				UplinkBall:completeAnimation()
				self.UplinkBall:setLeftRight( false, false, -47, 44 )
				self.UplinkBall:setTopBottom( true, false, 4, 60 )
				self.UplinkBall:setAlpha( 0 )
				self.clipFinished( UplinkBall, {} )
				SafeGuardRobot:completeAnimation()
				self.SafeGuardRobot:setLeftRight( false, false, -47, 44 )
				self.SafeGuardRobot:setTopBottom( true, false, -1, 55 )
				self.SafeGuardRobot:setAlpha( 1 )
				self.clipFinished( SafeGuardRobot, {} )
			end
		},
		SD = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				rightB:completeAnimation()
				self.rightB:setAlpha( 1 )
				self.clipFinished( rightB, {} )
				leftBG0:completeAnimation()
				self.leftBG0:setAlpha( 1 )
				self.clipFinished( leftBG0, {} )
				AlliesFlagStatus:completeAnimation()
				self.AlliesFlagStatus:setAlpha( 0 )
				self.clipFinished( AlliesFlagStatus, {} )
				AxisFlagStatus:completeAnimation()
				self.AxisFlagStatus:setAlpha( 0 )
				self.clipFinished( AxisFlagStatus, {} )
				BombTimerA:completeAnimation()
				self.BombTimerA:setLeftRight( false, false, -26, 20 )
				self.BombTimerA:setTopBottom( true, false, 10, 40 )
				self.BombTimerA:setAlpha( 1 )
				self.clipFinished( BombTimerA, {} )
				BombTimerB:completeAnimation()
				self.BombTimerB:setLeftRight( false, false, -26, 20 )
				self.BombTimerB:setTopBottom( true, false, 10, 40 )
				self.BombTimerB:setAlpha( 1 )
				self.clipFinished( BombTimerB, {} )
				AlliesNumPlayersAlive:completeAnimation()
				self.AlliesNumPlayersAlive:setLeftRight( true, false, 11, 262 )
				self.AlliesNumPlayersAlive:setTopBottom( true, false, 6.5, 22.5 )
				self.AlliesNumPlayersAlive:setAlpha( 1 )
				self.clipFinished( AlliesNumPlayersAlive, {} )
				AxisNumPlayersAlive:completeAnimation()
				self.AxisNumPlayersAlive:setLeftRight( false, true, -256, -13 )
				self.AxisNumPlayersAlive:setTopBottom( true, false, 4.99, 22.99 )
				self.AxisNumPlayersAlive:setAlpha( 1 )
				self.AxisNumPlayersAlive:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( AxisNumPlayersAlive, {} )
				DomFlags:completeAnimation()
				self.DomFlags:setLeftRight( false, false, -47, 44 )
				self.DomFlags:setTopBottom( true, false, 0, 30 )
				self.DomFlags:setAlpha( 0 )
				self.clipFinished( DomFlags, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setLeftRight( false, false, -46, 47 )
				self.Hardpoint:setTopBottom( true, false, 0, 61 )
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				UplinkBall:completeAnimation()
				self.UplinkBall:setAlpha( 0 )
				self.clipFinished( UplinkBall, {} )
				SafeGuardRobot:completeAnimation()
				self.SafeGuardRobot:setAlpha( 0 )
				self.clipFinished( SafeGuardRobot, {} )
			end
		},
		Dem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				rightB:completeAnimation()
				self.rightB:setAlpha( 1 )
				self.clipFinished( rightB, {} )
				leftBG0:completeAnimation()
				self.leftBG0:setAlpha( 1 )
				self.clipFinished( leftBG0, {} )
				AlliesFlagStatus:completeAnimation()
				self.AlliesFlagStatus:setAlpha( 0 )
				self.clipFinished( AlliesFlagStatus, {} )
				AxisFlagStatus:completeAnimation()
				self.AxisFlagStatus:setAlpha( 0 )
				self.clipFinished( AxisFlagStatus, {} )
				BombTimerA:completeAnimation()
				self.BombTimerA:setLeftRight( false, false, -46, 0 )
				self.BombTimerA:setTopBottom( true, false, 10, 40 )
				self.BombTimerA:setAlpha( 1 )
				self.clipFinished( BombTimerA, {} )
				BombTimerB:completeAnimation()
				self.BombTimerB:setLeftRight( false, false, 0, 47 )
				self.BombTimerB:setTopBottom( true, false, 10, 40 )
				self.BombTimerB:setAlpha( 1 )
				self.clipFinished( BombTimerB, {} )
				AlliesNumPlayersAlive:completeAnimation()
				self.AlliesNumPlayersAlive:setLeftRight( true, false, 11, 262 )
				self.AlliesNumPlayersAlive:setTopBottom( true, false, 6.5, 22.5 )
				self.AlliesNumPlayersAlive:setAlpha( 0 )
				self.clipFinished( AlliesNumPlayersAlive, {} )
				AxisNumPlayersAlive:completeAnimation()
				self.AxisNumPlayersAlive:setLeftRight( false, true, -256, -13 )
				self.AxisNumPlayersAlive:setTopBottom( true, false, 4.99, 22.99 )
				self.AxisNumPlayersAlive:setAlpha( 0 )
				self.AxisNumPlayersAlive:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
				self.clipFinished( AxisNumPlayersAlive, {} )
				DomFlags:completeAnimation()
				self.DomFlags:setLeftRight( false, false, -47, 44 )
				self.DomFlags:setTopBottom( true, false, 0, 30 )
				self.DomFlags:setAlpha( 0 )
				self.clipFinished( DomFlags, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setLeftRight( false, false, -46, 47 )
				self.Hardpoint:setTopBottom( true, false, 0, 61 )
				self.Hardpoint:setAlpha( 0 )
				self.clipFinished( Hardpoint, {} )
				UplinkBall:completeAnimation()
				self.UplinkBall:setAlpha( 0 )
				self.clipFinished( UplinkBall, {} )
				SafeGuardRobot:completeAnimation()
				self.SafeGuardRobot:setAlpha( 0 )
				self.clipFinished( SafeGuardRobot, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CTF",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "ctf" )
			end
		},
		{
			stateName = "Dom",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "dom" )
			end
		},
		{
			stateName = "Hardpoint",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "koth" )
			end
		},
		{
			stateName = "Uplink",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "ball" )
			end
		},
		{
			stateName = "SafeGuard",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "escort" )
			end
		},
		{
			stateName = "SD",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "sd" )
			end
		},
		{
			stateName = "Dem",
			condition = function ( menu, element, event )
				return IsBombBasedGameMode()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AlliesFlagStatus:close()
		element.AxisFlagStatus:close()
		element.BombTimerA:close()
		element.BombTimerB:close()
		element.DomFlags:close()
		element.Hardpoint:close()
		element.UplinkBall:close()
		element.SafeGuardRobot:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

