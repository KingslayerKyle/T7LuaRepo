require( "ui.uieditor.widgets.HUD.Map.CompassGroupMP" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.hudStarted = false
	if Engine.DvarBool( nil, "ShakeHUD" ) or Engine.DvarBool( nil, "ParallaxHUD" ) then
		local f1_local0 = 0
		local f1_local1 = 0
		if Dvar.ParallaxHUD:get() then
			f1_arg0.shaker = CoD.HUDShaker.new( 10, 10 )
		else
			f1_arg0.shaker = CoD.HUDShaker.new( 0, 0 )
		end
		f1_arg0.shaker:setLeftRight( true, false, 0 + f1_local0, 300 + f1_local0 )
		f1_arg0.shaker:setTopBottom( true, false, 0 + f1_local1, 200 + f1_local1 )
		f1_arg0:addElement( f1_arg0.shaker )
		f1_arg0:removeElement( f1_arg0.CompassGroup )
		f1_arg0.shaker:addElement( f1_arg0.CompassGroup )
	end
end

CoD.CompassGroupMPContainer = InheritFrom( LUI.UIElement )
CoD.CompassGroupMPContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CompassGroupMPContainer )
	self.id = "CompassGroupMPContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 283 )
	self:setTopBottom( true, false, 0, 204 )
	self.anyChildUsesUpdateState = true
	
	local CompassGroup = CoD.CompassGroupMP.new( menu, controller )
	CompassGroup:setLeftRight( true, false, 0, 283 )
	CompassGroup:setTopBottom( true, false, 0, 204 )
	CompassGroup:setYRot( 20 )
	CompassGroup:mergeStateConditions( {
		{
			stateName = "HudStart",
			condition = function ( menu, element, event )
				local f3_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f3_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
						f3_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
					else
						f3_local0 = false
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "HudPause",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "hudItems.playerSpawned" ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
			end
		}
	} )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	CompassGroup:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( CompassGroup, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:addElement( CompassGroup )
	self.CompassGroup = CompassGroup
	
	local empMinimap = LUI.UIImage.new()
	empMinimap:setLeftRight( true, false, 9.79, 263.79 )
	empMinimap:setTopBottom( true, false, 10.83, 185.01 )
	empMinimap:setAlpha( 0 )
	empMinimap:setImage( RegisterImage( "uie_hud_t7_emp_minimap" ) )
	empMinimap:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	empMinimap:setShaderVector( 0, 30.27, 0, 0, 0 )
	empMinimap:setShaderVector( 1, 1, 0, 0, 0 )
	empMinimap:setShaderVector( 2, 1.5, 0, 0, 0 )
	self:addElement( empMinimap )
	self.empMinimap = empMinimap
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 1 )
				self.clipFinished( CompassGroup, {} )
				empMinimap:completeAnimation()
				self.empMinimap:setAlpha( 0 )
				self.clipFinished( empMinimap, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 1 )
				CompassGroupFrame2( CompassGroup, {} )
				empMinimap:completeAnimation()
				self.empMinimap:setAlpha( 0 )
				self.clipFinished( empMinimap, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 0 )
				CompassGroupFrame2( CompassGroup, {} )
			end
		},
		CodCasterInvisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 1 )
				CompassGroupFrame2( CompassGroup, {} )
				empMinimap:completeAnimation()
				self.empMinimap:setAlpha( 0 )
				self.clipFinished( empMinimap, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 0 )
				CompassGroupFrame2( CompassGroup, {} )
			end
		},
		CodCasterInvisibleCopy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 1 )
				CompassGroupFrame2( CompassGroup, {} )
				empMinimap:completeAnimation()
				self.empMinimap:setAlpha( 0 )
				self.clipFinished( empMinimap, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 0 )
				CompassGroupFrame2( CompassGroup, {} )
			end
		},
		InvisibleStateCopyForCodcaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 1 )
				CompassGroupFrame2( CompassGroup, {} )
				empMinimap:completeAnimation()
				self.empMinimap:setAlpha( 0 )
				self.clipFinished( empMinimap, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 0 )
				CompassGroupFrame2( CompassGroup, {} )
			end
		},
		EMP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 1 )
				CompassGroupFrame2( CompassGroup, {} )
				empMinimap:completeAnimation()
				self.empMinimap:setAlpha( 1 )
				self.clipFinished( empMinimap, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local CompassGroupFrame2 = function ( CompassGroup, event )
					if not event.interrupted then
						CompassGroup:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					CompassGroup:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CompassGroup, event )
					else
						CompassGroup:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CompassGroup:completeAnimation()
				self.CompassGroup:setAlpha( 0 )
				CompassGroupFrame2( CompassGroup, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f40_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f40_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
						f40_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
						if f40_local0 then
						
						else
							return f40_local0
						end
					end
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f40_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR )
					else
						f40_local0 = false
					end
				end
				return f40_local0
			end
		},
		{
			stateName = "CodCasterInvisible",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_minimap", Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_STANDARD )
			end
		},
		{
			stateName = "CodCasterInvisibleCopy",
			condition = function ( menu, element, event )
				return IsCodCaster( controller ) and IsModelValueTrue( controller, "CodCaster.showFullScreenMap" )
			end
		},
		{
			stateName = "InvisibleStateCopyForCodcaster",
			condition = function ( menu, element, event )
				local f43_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f43_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
						f43_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
						if f43_local0 then
						
						else
							return f43_local0
						end
					end
					if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
						f43_local0 = IsCodCaster( controller )
						if f43_local0 then
							f43_local0 = IsCodCasterProfileValueEqualTo( controller, "shoutcaster_minimap", Enum.ShoutcasterSettingMinimapMode.SHOUTCASTER_SETTING_MINIMAP_MODE_STANDARD )
						end
					else
						f43_local0 = false
					end
				end
				return f43_local0
			end
		},
		{
			stateName = "EMP",
			condition = function ( menu, element, event )
				local f44_local0 = IsModelValueTrue( controller, "hudItems.playerSpawned" )
				if f44_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) then
						f44_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
					else
						f44_local0 = false
					end
				end
				return f44_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.playerSpawned" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.playerSpawned"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_COMPASS_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showFullScreenMap" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showFullScreenMap"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CompassGroup:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

