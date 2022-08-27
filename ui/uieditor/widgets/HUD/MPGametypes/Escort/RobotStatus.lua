-- 08bafd7bc914e514ebb6fe7c0a5e5583
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )
require( "ui.uieditor.widgets.HUD.Flag.PlayerFlag" )

CoD.RobotStatus = InheritFrom( LUI.UIElement )
CoD.RobotStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RobotStatus )
	self.id = "RobotStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.ScoreInfo_PanelScale.new( menu, controller )
	Panel:setLeftRight( true, true, 4, -68 )
	Panel:setTopBottom( false, false, -13, 11 )
	Panel:setRGB( 0.64, 0.67, 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local ShadowGlow = LUI.UIImage.new()
	ShadowGlow:setLeftRight( true, false, -4, 36 )
	ShadowGlow:setTopBottom( true, false, -4, 36 )
	ShadowGlow:setRGB( 0, 0, 0 )
	ShadowGlow:setAlpha( 0.2 )
	ShadowGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( ShadowGlow )
	self.ShadowGlow = ShadowGlow
	
	local RobotStatus = LUI.UIText.new()
	RobotStatus:setLeftRight( true, false, 28, 248 )
	RobotStatus:setTopBottom( false, false, -8, 8 )
	RobotStatus:setTTF( "fonts/escom.ttf" )
	RobotStatus:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	RobotStatus:setShaderVector( 0, 0, 1, 0, 0 )
	RobotStatus:setShaderVector( 1, 0.05, 0, 0, 0 )
	RobotStatus:setShaderVector( 2, 0, 0, 0, 0 )
	RobotStatus:setShaderVector( 3, 0, 0, 0, 0 )
	RobotStatus:setShaderVector( 4, 0, 0, 0, 0 )
	RobotStatus:setLetterSpacing( 1 )
	RobotStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	RobotStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	RobotStatus:subscribeToGlobalModel( controller, "Escort", "robotStatusText", function ( model )
		local robotStatusText = Engine.GetModelValue( model )
		if robotStatusText then
			RobotStatus:setText( Engine.Localize( robotStatusText ) )
		end
	end )
	self:addElement( RobotStatus )
	self.RobotStatus = RobotStatus
	
	local EnemyTeamIcon = CoD.PlayerFlag.new( menu, controller )
	EnemyTeamIcon:setLeftRight( true, false, 4, 28 )
	EnemyTeamIcon:setTopBottom( true, false, 4, 28 )
	EnemyTeamIcon:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	EnemyTeamIcon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	EnemyTeamIcon:setShaderVector( 0, 0.05, 0, 0, 0 )
	EnemyTeamIcon:setShaderVector( 1, 0.1, 0, 0, 0 )
	EnemyTeamIcon:setShaderVector( 2, 0, 0, 0, 0 )
	EnemyTeamIcon:setShaderVector( 3, 0, 0, 0, 0 )
	EnemyTeamIcon:setShaderVector( 4, 0, 0, 0, 0 )
	EnemyTeamIcon.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_safeguard_robot_minimap" ) )
	self:addElement( EnemyTeamIcon )
	self.EnemyTeamIcon = EnemyTeamIcon
	
	local FriendlyTeamIcon = CoD.PlayerFlag.new( menu, controller )
	FriendlyTeamIcon:setLeftRight( true, false, 4, 28 )
	FriendlyTeamIcon:setTopBottom( true, false, 4, 28 )
	FriendlyTeamIcon:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	FriendlyTeamIcon:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FriendlyTeamIcon:setShaderVector( 0, 0.05, 0, 0, 0 )
	FriendlyTeamIcon:setShaderVector( 1, 0.1, 0, 0, 0 )
	FriendlyTeamIcon:setShaderVector( 2, 0, 0, 0, 0 )
	FriendlyTeamIcon:setShaderVector( 3, 0, 0, 0, 0 )
	FriendlyTeamIcon:setShaderVector( 4, 0, 0, 0, 0 )
	FriendlyTeamIcon.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_safeguard_robot_minimap" ) )
	self:addElement( FriendlyTeamIcon )
	self.FriendlyTeamIcon = FriendlyTeamIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				ShadowGlow:completeAnimation()
				self.ShadowGlow:setAlpha( 0 )
				self.clipFinished( ShadowGlow, {} )
				RobotStatus:completeAnimation()
				self.RobotStatus:setAlpha( 0 )
				self.clipFinished( RobotStatus, {} )
				EnemyTeamIcon:completeAnimation()
				self.EnemyTeamIcon:setAlpha( 0 )
				self.clipFinished( EnemyTeamIcon, {} )
				FriendlyTeamIcon:completeAnimation()
				self.FriendlyTeamIcon:setAlpha( 0 )
				self.clipFinished( FriendlyTeamIcon, {} )
			end
		},
		EnemyRobot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				ShadowGlow:completeAnimation()
				self.ShadowGlow:setAlpha( 0.2 )
				self.clipFinished( ShadowGlow, {} )
				RobotStatus:completeAnimation()
				self.RobotStatus:setAlpha( 1 )
				self.clipFinished( RobotStatus, {} )
				EnemyTeamIcon:completeAnimation()
				self.EnemyTeamIcon:setAlpha( 1 )
				self.clipFinished( EnemyTeamIcon, {} )
				FriendlyTeamIcon:completeAnimation()
				self.FriendlyTeamIcon:setAlpha( 0 )
				self.clipFinished( FriendlyTeamIcon, {} )
			end
		},
		FriendlyRobot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 1 )
				self.clipFinished( Panel, {} )
				ShadowGlow:completeAnimation()
				self.ShadowGlow:setAlpha( 0.2 )
				self.clipFinished( ShadowGlow, {} )
				RobotStatus:completeAnimation()
				self.RobotStatus:setLeftRight( true, false, 32, 247 )
				self.RobotStatus:setTopBottom( false, false, -8, 8 )
				self.RobotStatus:setAlpha( 1 )
				self.clipFinished( RobotStatus, {} )
				EnemyTeamIcon:completeAnimation()
				self.EnemyTeamIcon:setAlpha( 0 )
				self.clipFinished( EnemyTeamIcon, {} )
				FriendlyTeamIcon:completeAnimation()
				self.FriendlyTeamIcon:setAlpha( 1 )
				self.clipFinished( FriendlyTeamIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EnemyRobot",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "escortGametype.enemyRobot", 1 ) and IsModelValueEqualTo( controller, "escortGametype.robotStatusVisible", 1 )
			end
		},
		{
			stateName = "FriendlyRobot",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "escortGametype.enemyRobot", 0 ) and IsModelValueEqualTo( controller, "escortGametype.robotStatusVisible", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "escortGametype.enemyRobot" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "escortGametype.enemyRobot"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "escortGametype.robotStatusVisible" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "escortGametype.robotStatusVisible"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.EnemyTeamIcon:close()
		element.FriendlyTeamIcon:close()
		element.RobotStatus:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

