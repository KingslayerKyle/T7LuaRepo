-- fdfb67f453e9e78768e38755c1f0d46c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Flag.PlayerFlag" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	if not Engine.GetModel( f1_local0, "escortGametype" ) then
		Engine.CreateModel( f1_local0, "escortGametype" )
		Engine.CreateModel( f1_local0, "escortGametype.enemyRobot" )
		Engine.CreateModel( f1_local0, "escortGametype.robotStatusVisible" )
	end
end

CoD.CodCasterRobotStatus = InheritFrom( LUI.UIElement )
CoD.CodCasterRobotStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterRobotStatus )
	self.id = "CodCasterRobotStatus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 54 )
	self:setTopBottom( true, false, 0, 56 )
	
	local ShadowGlow = LUI.UIImage.new()
	ShadowGlow:setLeftRight( false, false, -25.5, 25.5 )
	ShadowGlow:setTopBottom( true, false, -9.5, 41.5 )
	ShadowGlow:setRGB( 0, 0, 0 )
	ShadowGlow:setAlpha( 0.2 )
	ShadowGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( ShadowGlow )
	self.ShadowGlow = ShadowGlow
	
	local Status = LUI.UIText.new()
	Status:setLeftRight( false, false, -111, 111 )
	Status:setTopBottom( true, false, 35, 51 )
	Status:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Status:setLetterSpacing( 1 )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Status:subscribeToGlobalModel( controller, "Escort", "robotStatusText", function ( model )
		local robotStatusText = Engine.GetModelValue( model )
		if robotStatusText then
			Status:setText( Engine.Localize( robotStatusText ) )
		end
	end )
	self:addElement( Status )
	self.Status = Status
	
	local AlliesFlag = CoD.PlayerFlag.new( menu, controller )
	AlliesFlag:setLeftRight( false, false, -17.5, 17.5 )
	AlliesFlag:setTopBottom( true, false, -1.5, 33.5 )
	AlliesFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_safeguard_robot_minimap" ) )
	AlliesFlag:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			AlliesFlag:setRGB( alliesFactionColor )
		end
	end )
	self:addElement( AlliesFlag )
	self.AlliesFlag = AlliesFlag
	
	local AxisFlag = CoD.PlayerFlag.new( menu, controller )
	AxisFlag:setLeftRight( false, false, -17.5, 17.5 )
	AxisFlag:setTopBottom( true, false, -1.5, 33.5 )
	AxisFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_safeguard_robot_minimap" ) )
	AxisFlag:subscribeToGlobalModel( controller, "Factions", "axisFactionColor", function ( model )
		local axisFactionColor = Engine.GetModelValue( model )
		if axisFactionColor then
			AxisFlag:setRGB( axisFactionColor )
		end
	end )
	self:addElement( AxisFlag )
	self.AxisFlag = AxisFlag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ShadowGlow:completeAnimation()
				self.ShadowGlow:setAlpha( 0 )
				self.clipFinished( ShadowGlow, {} )
				Status:completeAnimation()
				self.Status:setAlpha( 0 )
				self.clipFinished( Status, {} )
				AlliesFlag:completeAnimation()
				self.AlliesFlag:setAlpha( 0 )
				self.clipFinished( AlliesFlag, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
			end
		},
		AxisRobot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ShadowGlow:completeAnimation()
				self.ShadowGlow:setAlpha( 0.2 )
				self.clipFinished( ShadowGlow, {} )
				Status:completeAnimation()
				self.Status:setAlpha( 1 )
				self.clipFinished( Status, {} )
				AlliesFlag:completeAnimation()
				self.AlliesFlag:setAlpha( 0 )
				self.clipFinished( AlliesFlag, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setAlpha( 1 )
				self.clipFinished( AxisFlag, {} )
			end
		},
		AlliesRobot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ShadowGlow:completeAnimation()
				self.ShadowGlow:setAlpha( 0.2 )
				self.clipFinished( ShadowGlow, {} )
				Status:completeAnimation()
				self.Status:setAlpha( 1 )
				self.clipFinished( Status, {} )
				AlliesFlag:completeAnimation()
				self.AlliesFlag:setAlpha( 1 )
				self.clipFinished( AlliesFlag, {} )
				AxisFlag:completeAnimation()
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AxisRobot",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "escortGametype.enemyRobot", 1 ) and IsModelValueEqualTo( controller, "escortGametype.robotStatusVisible", 1 )
			end
		},
		{
			stateName = "AlliesRobot",
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
		element.AlliesFlag:close()
		element.AxisFlag:close()
		element.Status:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

