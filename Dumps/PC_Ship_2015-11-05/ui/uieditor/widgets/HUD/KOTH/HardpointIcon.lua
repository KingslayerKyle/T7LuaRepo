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
	
	local Hardpoint = LUI.UIImage.new()
	Hardpoint:setLeftRight( true, true, 0.96, -0.88 )
	Hardpoint:setTopBottom( true, true, 0.75, -2.25 )
	Hardpoint:setImage( RegisterImage( "uie_t7_hud_waypoints_neutral_koth" ) )
	self:addElement( Hardpoint )
	self.Hardpoint = Hardpoint
	
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
				self:setupElementClipCounter( 3 )
				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 0 )
				self.clipFinished( ProgressMeterFrame, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setRGB( 1, 1, 1 )
				self.clipFinished( Hardpoint, {} )
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
				self:setupElementClipCounter( 3 )
				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 0 )
				self.clipFinished( ProgressMeterFrame, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
				self.clipFinished( Hardpoint, {} )
			end
		},
		EnemyControlled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 0 )
				self.clipFinished( ProgressMeterFrame, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
				self.clipFinished( Hardpoint, {} )
			end
		},
		Contested = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 1 )
				self.clipFinished( ProgressMeterFrame, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0.9 )
				self.clipFinished( progressMeter, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setRGB( 1, 1, 1 )
				self.clipFinished( Hardpoint, {} )
			end
		},
		TeamControlled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ProgressMeterFrame:completeAnimation()
				self.ProgressMeterFrame:setAlpha( 0 )
				self.clipFinished( ProgressMeterFrame, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )
				Hardpoint:completeAnimation()
				self.Hardpoint:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
				self.clipFinished( Hardpoint, {} )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

