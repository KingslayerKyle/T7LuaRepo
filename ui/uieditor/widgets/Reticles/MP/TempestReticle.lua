-- 326ad71e1eb4c8fa662f4bfd5fe47e66
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.MP.TempestReticleInternal" )
require( "ui.uieditor.widgets.Reticles.MP.TempestReticle_UI3D" )

local PreLoadFunc = function ( self, controller )
	self:setupReticle( controller )
end

local PostLoadFunc = function ( self, controller, menu )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lookingDownSights" ), function ( model )
		if Engine.GetModelValue( model ) == true then
			if not self.ui3d then
				self.ui3d = CoD.TempestReticle_UI3D.new( menu, controller )
				self:addElement( self.ui3d )
			end
		elseif self.ui3d then
			self.ui3d:close()
			self.ui3d = nil
		end
	end )
end

CoD.TempestReticle = InheritFrom( LUI.UIElement )
CoD.TempestReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.TempestReticle )
	self.id = "TempestReticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.TempestReticleInternal.new( menu, controller )
	internal:setLeftRight( false, false, -36, 36 )
	internal:setTopBottom( false, false, -39, 40 )
	internal:setScale( 0.55 )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setRGB( 1, 1, 1 )
				self.internal:setAlpha( 1 )
				self.clipFinished( internal, {} )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 0 )
				self.clipFinished( internal, {} )
			end
		},
		HiddenUsingOffhand = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setAlpha( 0 )
				self.clipFinished( internal, {} )
			end
		},
		OverEnemy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setRGB( 1, 0, 0 )
				self.internal:setAlpha( 1 )
				self.clipFinished( internal, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD )
				if not f10_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DRAW_RETICLE ) then
						f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
						if not f10_local0 then
							f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE )
							if not f10_local0 then
								if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
									f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
									if not f10_local0 then
										f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_MISSILE )
										if not f10_local0 then
											f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
											if not f10_local0 then
												f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON )
												if not f10_local0 then
													f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_PLAYER_DEAD )
													if not f10_local0 then
														f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
														if not f10_local0 then
															f10_local0 = not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE )
														end
													end
												end
											end
										end
									end
								else
									f10_local0 = true
								end
							else
								return f10_local0
							end
						else
							return f10_local0
						end
					end
					f10_local0 = true
				end
				return f10_local0
			end
		},
		{
			stateName = "HiddenUsingOffhand",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "currentWeapon.usingOffhand" )
			end
		},
		{
			stateName = "OverEnemy",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "currentWeapon.weaponOverEnemy" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_CAMERA_ANIM_HIDING_HUD
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_RETICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_RETICLE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_PLAYER_DEAD
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_WEAPON_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.usingOffhand" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.usingOffhand"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponOverEnemy" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weaponOverEnemy"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

