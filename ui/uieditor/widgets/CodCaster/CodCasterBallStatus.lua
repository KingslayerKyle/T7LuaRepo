-- 3940f7c19750d2f686fca2474ddafa59
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Flag.PlayerFlag" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModelForController( controller )
	if not Engine.GetModel( f1_local0, "ballGametype" ) then
		Engine.CreateModel( f1_local0, "ballGametype.ballStatusText" )
		Engine.CreateModel( f1_local0, "ballGametype.ballHeldByEnemy" )
		Engine.CreateModel( f1_local0, "ballGametype.ballHeldByFriendly" )
	end
end

CoD.CodCasterBallStatus = InheritFrom( LUI.UIElement )
CoD.CodCasterBallStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterBallStatus )
	self.id = "CodCasterBallStatus"
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
	Status:setTopBottom( true, false, 34.5, 52.5 )
	Status:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Status:setLetterSpacing( 1 )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Status:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Status:subscribeToGlobalModel( controller, "Ball", "ballStatusText", function ( model )
		local ballStatusText = Engine.GetModelValue( model )
		if ballStatusText then
			Status:setText( Engine.Localize( ballStatusText ) )
		end
	end )
	self:addElement( Status )
	self.Status = Status
	
	local AlliesFlag = CoD.PlayerFlag.new( menu, controller )
	AlliesFlag:setLeftRight( false, false, -17.5, 17.5 )
	AlliesFlag:setTopBottom( true, false, -1.5, 33.5 )
	AlliesFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_grab" ) )
	AlliesFlag:subscribeToGlobalModel( controller, "Factions", "alliesFactionColor", function ( model )
		local alliesFactionColor = Engine.GetModelValue( model )
		if alliesFactionColor then
			AlliesFlag:setRGB( alliesFactionColor )
		end
	end )
	self:addElement( AlliesFlag )
	self.AlliesFlag = AlliesFlag
	
	local NeutralFlag = CoD.PlayerFlag.new( menu, controller )
	NeutralFlag:setLeftRight( false, false, -17.5, 17.5 )
	NeutralFlag:setTopBottom( true, false, -1.5, 33.5 )
	NeutralFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_grab" ) )
	self:addElement( NeutralFlag )
	self.NeutralFlag = NeutralFlag
	
	local AxisFlag = CoD.PlayerFlag.new( menu, controller )
	AxisFlag:setLeftRight( false, false, -17.5, 17.5 )
	AxisFlag:setTopBottom( true, false, -1.5, 33.5 )
	AxisFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_grab" ) )
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
				self:setupElementClipCounter( 0 )
			end
		},
		AxisHeld = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				AlliesFlag:completeAnimation()
				self.AlliesFlag:setAlpha( 0 )
				self.clipFinished( AlliesFlag, {} )

				NeutralFlag:completeAnimation()
				self.NeutralFlag:setAlpha( 0 )
				self.clipFinished( NeutralFlag, {} )

				AxisFlag:completeAnimation()
				self.AxisFlag:setAlpha( 1 )
				self.clipFinished( AxisFlag, {} )
			end
		},
		AlliesHeld = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				AlliesFlag:completeAnimation()
				self.AlliesFlag:setAlpha( 1 )
				self.clipFinished( AlliesFlag, {} )

				NeutralFlag:completeAnimation()
				self.NeutralFlag:setAlpha( 0 )
				self.clipFinished( NeutralFlag, {} )

				AxisFlag:completeAnimation()
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
			end
		},
		Neutral = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				AlliesFlag:completeAnimation()
				self.AlliesFlag:setAlpha( 0 )
				self.clipFinished( AlliesFlag, {} )

				NeutralFlag:completeAnimation()
				self.NeutralFlag:setAlpha( 1 )
				self.clipFinished( NeutralFlag, {} )

				AxisFlag:completeAnimation()
				self.AxisFlag:setAlpha( 0 )
				self.clipFinished( AxisFlag, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "AxisHeld",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "ballGametype.ballHeldByEnemy" )
			end
		},
		{
			stateName = "AlliesHeld",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "ballGametype.ballHeldByFriendly" )
			end
		},
		{
			stateName = "Neutral",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ballGametype.ballHeldByEnemy" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ballGametype.ballHeldByEnemy"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ballGametype.ballHeldByFriendly" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ballGametype.ballHeldByFriendly"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AlliesFlag:close()
		element.NeutralFlag:close()
		element.AxisFlag:close()
		element.Status:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
