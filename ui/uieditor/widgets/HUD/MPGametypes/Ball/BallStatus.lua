-- 59bcab9bdf28da69326487f9701a26d0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )
require( "ui.uieditor.widgets.HUD.Flag.PlayerFlag" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "ballGametype" )
	Engine.CreateModel( f1_local0, "ballStatusText" )
	Engine.CreateModel( f1_local0, "ballHeldByEnemy" )
	Engine.CreateModel( f1_local0, "ballHeldByFriendly" )
end

CoD.BallStatus = InheritFrom( LUI.UIElement )
CoD.BallStatus.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BallStatus )
	self.id = "BallStatus"
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
	ShadowGlow:setLeftRight( true, false, 0, 40 )
	ShadowGlow:setTopBottom( true, false, -4, 36 )
	ShadowGlow:setRGB( 0, 0, 0 )
	ShadowGlow:setAlpha( 0.2 )
	ShadowGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( ShadowGlow )
	self.ShadowGlow = ShadowGlow
	
	local CarrierName = LUI.UIText.new()
	CarrierName:setLeftRight( true, false, 36, 252 )
	CarrierName:setTopBottom( false, false, -9, 7 )
	CarrierName:setText( Engine.Localize( "WWWWWMWWWWWMWWWWWW" ) )
	CarrierName:setTTF( "fonts/escom.ttf" )
	CarrierName:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	CarrierName:setShaderVector( 0, 0, 1, 0, 0 )
	CarrierName:setShaderVector( 1, 0.05, 0, 0, 0 )
	CarrierName:setShaderVector( 2, 0, 0, 0, 0 )
	CarrierName:setShaderVector( 3, 0, 0, 0, 0 )
	CarrierName:setShaderVector( 4, 0, 0, 0, 0 )
	CarrierName:setLetterSpacing( 1 )
	CarrierName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CarrierName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CarrierName )
	self.CarrierName = CarrierName
	
	local FriendlyFlag = CoD.PlayerFlag.new( menu, controller )
	FriendlyFlag:setLeftRight( true, false, 6.87, 30.5 )
	FriendlyFlag:setTopBottom( true, false, 7, 25 )
	FriendlyFlag:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	FriendlyFlag:setAlpha( 0 )
	FriendlyFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_uplinkballsquare" ) )
	self:addElement( FriendlyFlag )
	self.FriendlyFlag = FriendlyFlag
	
	local EnemyFlag = CoD.PlayerFlag.new( menu, controller )
	EnemyFlag:setLeftRight( true, false, 6.87, 30.5 )
	EnemyFlag:setTopBottom( true, false, 7, 25 )
	EnemyFlag:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	EnemyFlag:setAlpha( 0 )
	EnemyFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_uplinkballsquare" ) )
	self:addElement( EnemyFlag )
	self.EnemyFlag = EnemyFlag
	
	local NeutralFlag = CoD.PlayerFlag.new( menu, controller )
	NeutralFlag:setLeftRight( true, false, 6.87, 30.5 )
	NeutralFlag:setTopBottom( true, false, 6, 24 )
	NeutralFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_uplinkballsquare" ) )
	self:addElement( NeutralFlag )
	self.NeutralFlag = NeutralFlag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				FriendlyFlag:completeAnimation()
				self.FriendlyFlag:setAlpha( 0 )
				self.clipFinished( FriendlyFlag, {} )

				EnemyFlag:completeAnimation()
				self.EnemyFlag:setAlpha( 0 )
				self.clipFinished( EnemyFlag, {} )

				NeutralFlag:completeAnimation()
				self.NeutralFlag:setAlpha( 1 )
				self.clipFinished( NeutralFlag, {} )
			end
		},
		EnemyHeld = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				FriendlyFlag:completeAnimation()
				self.FriendlyFlag:setAlpha( 0 )
				self.clipFinished( FriendlyFlag, {} )

				EnemyFlag:completeAnimation()
				self.EnemyFlag:setAlpha( 1 )
				self.clipFinished( EnemyFlag, {} )

				NeutralFlag:completeAnimation()
				self.NeutralFlag:setAlpha( 0 )
				self.clipFinished( NeutralFlag, {} )
			end
		},
		FriendlyHeld = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				FriendlyFlag:completeAnimation()
				self.FriendlyFlag:setAlpha( 1 )
				self.clipFinished( FriendlyFlag, {} )

				EnemyFlag:completeAnimation()
				self.EnemyFlag:setAlpha( 0 )
				self.clipFinished( EnemyFlag, {} )

				NeutralFlag:completeAnimation()
				self.NeutralFlag:setAlpha( 0 )
				self.clipFinished( NeutralFlag, {} )
			end
		},
		Neutral = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				FriendlyFlag:completeAnimation()
				self.FriendlyFlag:setAlpha( 0 )
				self.clipFinished( FriendlyFlag, {} )

				EnemyFlag:completeAnimation()
				self.EnemyFlag:setAlpha( 0 )
				self.clipFinished( EnemyFlag, {} )

				NeutralFlag:completeAnimation()
				self.NeutralFlag:setAlpha( 1 )
				self.clipFinished( NeutralFlag, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "EnemyHeld",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "ballGametype.ballHeldByEnemy" )
			end
		},
		{
			stateName = "FriendlyHeld",
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
		element.Panel:close()
		element.FriendlyFlag:close()
		element.EnemyFlag:close()
		element.NeutralFlag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

