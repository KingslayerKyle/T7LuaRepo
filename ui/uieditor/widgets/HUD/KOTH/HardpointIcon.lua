-- fc922e3b5ab456130e300561f2f3cd5d
-- This hash is used for caching, delete to decompile the file again

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "Hardpoint" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "state" ), "neutral" )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "team" ), Enum.team_t.TEAM_NEUTRAL )
	Engine.SetModelValue( Engine.CreateModel( f1_local0, "objId" ), 0 )
end

CoD.HardpointIcon = InheritFrom( LUI.UIElement )
CoD.HardpointIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.HardpointIcon )
	self.id = "HardpointIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local ProgressMeterFrame = LUI.UIImage.new()
	ProgressMeterFrame:setLeftRight( true, true, -13.5, 14 )
	ProgressMeterFrame:setTopBottom( true, true, -12.75, 11.75 )
	ProgressMeterFrame:setImage( RegisterImage( "uie_t7_hud_waypoints_new_framefill" ) )
	self:addElement( ProgressMeterFrame )
	self.ProgressMeterFrame = ProgressMeterFrame
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( true, true, -3.5, 3.5 )
	progressMeter:setTopBottom( true, true, -3.75, 2.25 )
	progressMeter:setRGB( 1, 0.4, 0 )
	progressMeter:setAlpha( 0.9 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_diamond" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 0, 1.03, 0, 0, 0 )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	local HardpointNeutral = LUI.UIImage.new()
	HardpointNeutral:setLeftRight( true, true, 0.96, -0.88 )
	HardpointNeutral:setTopBottom( true, true, 0.75, -2.25 )
	HardpointNeutral:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_koth" ) )
	self:addElement( HardpointNeutral )
	self.HardpointNeutral = HardpointNeutral
	
	local HardpointFriendly = LUI.UIImage.new()
	HardpointFriendly:setLeftRight( true, true, 0.96, -0.88 )
	HardpointFriendly:setTopBottom( true, true, 0.75, -2.25 )
	HardpointFriendly:setAlpha( 0 )
	HardpointFriendly:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_koth" ) )
	HardpointFriendly:subscribeToGlobalModel( controller, "HUDItems", "colorBlindSensitiveFriendlyColor", function ( model )
		local colorBlindSensitiveFriendlyColor = Engine.GetModelValue( model )
		if colorBlindSensitiveFriendlyColor then
			HardpointFriendly:setRGB( colorBlindSensitiveFriendlyColor )
		end
	end )
	self:addElement( HardpointFriendly )
	self.HardpointFriendly = HardpointFriendly
	
	local HardpointEnemy = LUI.UIImage.new()
	HardpointEnemy:setLeftRight( true, true, 0.96, -0.88 )
	HardpointEnemy:setTopBottom( true, true, 0.75, -2.25 )
	HardpointEnemy:setAlpha( 0 )
	HardpointEnemy:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_koth" ) )
	HardpointEnemy:subscribeToGlobalModel( controller, "HUDItems", "colorBlindSensitiveEnemyColor", function ( model )
		local colorBlindSensitiveEnemyColor = Engine.GetModelValue( model )
		if colorBlindSensitiveEnemyColor then
			HardpointEnemy:setRGB( colorBlindSensitiveEnemyColor )
		end
	end )
	self:addElement( HardpointEnemy )
	self.HardpointEnemy = HardpointEnemy
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			hud_start = function ()
				self:setupElementClipCounter( 0 )

			end,
			hud_stop = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Neutral = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 0 )
				self.clipFinished( ProgressMeterFrame, {} )

				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )

				HardpointNeutral:completeAnimation()
				self.HardpointNeutral:setAlpha( 1 )
				self.clipFinished( HardpointNeutral, {} )

				HardpointFriendly:completeAnimation()
				self.HardpointFriendly:setAlpha( 0 )
				self.clipFinished( HardpointFriendly, {} )

				HardpointEnemy:completeAnimation()
				self.HardpointEnemy:setAlpha( 0 )
				self.clipFinished( HardpointEnemy, {} )
			end,
			hud_start = function ()
				self:setupElementClipCounter( 0 )

			end,
			hud_stop = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		FriendlyControlled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 0 )
				self.clipFinished( ProgressMeterFrame, {} )

				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )

				HardpointNeutral:completeAnimation()
				self.HardpointNeutral:setAlpha( 0 )
				self.clipFinished( HardpointNeutral, {} )

				HardpointFriendly:completeAnimation()
				self.HardpointFriendly:setAlpha( 1 )
				self.clipFinished( HardpointFriendly, {} )

				HardpointEnemy:completeAnimation()
				self.HardpointEnemy:setAlpha( 0 )
				self.clipFinished( HardpointEnemy, {} )
			end
		},
		EnemyControlled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 0 )
				self.clipFinished( ProgressMeterFrame, {} )

				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )

				HardpointNeutral:completeAnimation()
				self.HardpointNeutral:setAlpha( 0 )
				self.clipFinished( HardpointNeutral, {} )

				HardpointFriendly:completeAnimation()
				self.HardpointFriendly:setAlpha( 0 )
				self.clipFinished( HardpointFriendly, {} )

				HardpointEnemy:completeAnimation()
				self.HardpointEnemy:setAlpha( 1 )
				self.clipFinished( HardpointEnemy, {} )
			end
		},
		Contested = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 1 )
				self.clipFinished( ProgressMeterFrame, {} )

				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0.9 )
				self.clipFinished( progressMeter, {} )

				HardpointNeutral:completeAnimation()
				self.HardpointNeutral:setAlpha( 1 )
				self.clipFinished( HardpointNeutral, {} )

				HardpointFriendly:completeAnimation()
				self.HardpointFriendly:setAlpha( 0 )
				self.clipFinished( HardpointFriendly, {} )

				HardpointEnemy:completeAnimation()
				self.HardpointEnemy:setAlpha( 0 )
				self.clipFinished( HardpointEnemy, {} )
			end
		},
		TeamControlled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 0 )
				self.clipFinished( ProgressMeterFrame, {} )

				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )

				HardpointNeutral:completeAnimation()
				self.HardpointNeutral:setAlpha( 0 )
				self.clipFinished( HardpointNeutral, {} )

				HardpointFriendly:completeAnimation()
				self.HardpointFriendly:setAlpha( 1 )
				self.clipFinished( HardpointFriendly, {} )

				HardpointEnemy:completeAnimation()
				self.HardpointEnemy:setAlpha( 0 )
				self.clipFinished( HardpointEnemy, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Neutral",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Hardpoint.state", "neutral" )
			end
		},
		{
			stateName = "FriendlyControlled",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Hardpoint.state", "friendly" )
			end
		},
		{
			stateName = "EnemyControlled",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Hardpoint.state", "enemy" )
			end
		},
		{
			stateName = "Contested",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Hardpoint.state", "contested" )
			end
		},
		{
			stateName = "TeamControlled",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "Hardpoint.state", "anyteam" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "Hardpoint.state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "Hardpoint.state"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HardpointFriendly:close()
		element.HardpointEnemy:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

