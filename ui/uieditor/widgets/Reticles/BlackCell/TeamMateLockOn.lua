-- 4ce084fb9312e977801a3259c13771ca
-- This hash is used for caching, delete to decompile the file again

CoD.TeamMateLockOn = InheritFrom( LUI.UIElement )
CoD.TeamMateLockOn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TeamMateLockOn )
	self.id = "TeamMateLockOn"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 136 )
	self:setTopBottom( true, false, 0, 103 )
	
	local PanelGlow = LUI.UIImage.new()
	PanelGlow:setLeftRight( false, false, -101, 99.46 )
	PanelGlow:setTopBottom( false, false, -67.5, 69.5 )
	PanelGlow:setRGB( 0.97, 0.36, 0.07 )
	PanelGlow:setAlpha( 0.49 )
	PanelGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	PanelGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( PanelGlow )
	self.PanelGlow = PanelGlow
	
	local teamLockOn = LUI.UIImage.new()
	teamLockOn:setLeftRight( false, false, -76, 78.58 )
	teamLockOn:setTopBottom( false, false, -56.5, -16.63 )
	teamLockOn:setImage( RegisterImage( "uie_t7_hud_blackcell_teamlockline" ) )
	self:addElement( teamLockOn )
	self.teamLockOn = teamLockOn
	
	local teamLockOn0 = LUI.UIImage.new()
	teamLockOn0:setLeftRight( false, false, -76, 78.58 )
	teamLockOn0:setTopBottom( false, false, 18.5, 58.38 )
	teamLockOn0:setImage( RegisterImage( "uie_t7_hud_blackcell_teamlockline" ) )
	self:addElement( teamLockOn0 )
	self.teamLockOn0 = teamLockOn0
	
	local TeammateLockonShadow = LUI.UIText.new()
	TeammateLockonShadow:setLeftRight( false, false, -59.28, 63.58 )
	TeammateLockonShadow:setTopBottom( false, false, -28.5, 1.5 )
	TeammateLockonShadow:setRGB( 0, 0, 0 )
	TeammateLockonShadow:setAlpha( 0.8 )
	TeammateLockonShadow:setText( LocalizeToUpperString( "WEAPON_TEAMMATE_LOCK_ON" ) )
	TeammateLockonShadow:setTTF( "fonts/escom.ttf" )
	TeammateLockonShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeammateLockonShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeammateLockonShadow )
	self.TeammateLockonShadow = TeammateLockonShadow
	
	local TeammateLockon = LUI.UIText.new()
	TeammateLockon:setLeftRight( false, false, -59.28, 63.58 )
	TeammateLockon:setTopBottom( false, false, -28.5, 1.5 )
	TeammateLockon:setText( LocalizeToUpperString( "WEAPON_TEAMMATE_LOCK_ON" ) )
	TeammateLockon:setTTF( "fonts/escom.ttf" )
	TeammateLockon:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeammateLockon:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeammateLockon )
	self.TeammateLockon = TeammateLockon
	
	local TeammateHackingShadow = LUI.UIText.new()
	TeammateHackingShadow:setLeftRight( false, false, -56.28, 59.58 )
	TeammateHackingShadow:setTopBottom( false, false, -28.5, 1.5 )
	TeammateHackingShadow:setRGB( 0, 0, 0 )
	TeammateHackingShadow:setAlpha( 0 )
	TeammateHackingShadow:setText( Engine.Localize( "WEAPON_TEAMMATE_HACKING" ) )
	TeammateHackingShadow:setTTF( "fonts/escom.ttf" )
	TeammateHackingShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeammateHackingShadow:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeammateHackingShadow )
	self.TeammateHackingShadow = TeammateHackingShadow
	
	local TeammateHacking = LUI.UIText.new()
	TeammateHacking:setLeftRight( false, false, -56.28, 59.58 )
	TeammateHacking:setTopBottom( false, false, -28.5, 1.5 )
	TeammateHacking:setAlpha( 0 )
	TeammateHacking:setText( Engine.Localize( "WEAPON_TEAMMATE_HACKING" ) )
	TeammateHacking:setTTF( "fonts/escom.ttf" )
	TeammateHacking:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeammateHacking:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeammateHacking )
	self.TeammateHacking = TeammateHacking
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				teamLockOn:completeAnimation()
				self.teamLockOn:setAlpha( 0 )
				self.clipFinished( teamLockOn, {} )
				teamLockOn0:completeAnimation()
				self.teamLockOn0:setAlpha( 0 )
				self.clipFinished( teamLockOn0, {} )
				TeammateLockonShadow:completeAnimation()
				self.TeammateLockonShadow:setAlpha( 0 )
				self.clipFinished( TeammateLockonShadow, {} )
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 0 )
				self.clipFinished( TeammateLockon, {} )
				TeammateHacking:completeAnimation()
				self.TeammateHacking:setAlpha( 0 )
				self.clipFinished( TeammateHacking, {} )
			end,
			Locking = function ()
				self:setupElementClipCounter( 6 )
				local PanelGlowFrame2 = function ( PanelGlow, event )
					if not event.interrupted then
						PanelGlow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					PanelGlow:setAlpha( 0.49 )
					if event.interrupted then
						self.clipFinished( PanelGlow, event )
					else
						PanelGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				PanelGlowFrame2( PanelGlow, {} )
				local teamLockOnFrame2 = function ( teamLockOn, event )
					if not event.interrupted then
						teamLockOn:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					teamLockOn:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( teamLockOn, event )
					else
						teamLockOn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				teamLockOn:completeAnimation()
				self.teamLockOn:setAlpha( 0 )
				teamLockOnFrame2( teamLockOn, {} )
				local teamLockOn0Frame2 = function ( teamLockOn0, event )
					if not event.interrupted then
						teamLockOn0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					teamLockOn0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( teamLockOn0, event )
					else
						teamLockOn0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				teamLockOn0:completeAnimation()
				self.teamLockOn0:setAlpha( 0 )
				teamLockOn0Frame2( teamLockOn0, {} )
				local TeammateLockonShadowFrame2 = function ( TeammateLockonShadow, event )
					if not event.interrupted then
						TeammateLockonShadow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TeammateLockonShadow:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( TeammateLockonShadow, event )
					else
						TeammateLockonShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TeammateLockonShadow:completeAnimation()
				self.TeammateLockonShadow:setAlpha( 0 )
				TeammateLockonShadowFrame2( TeammateLockonShadow, {} )
				local TeammateLockonFrame2 = function ( TeammateLockon, event )
					if not event.interrupted then
						TeammateLockon:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TeammateLockon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TeammateLockon, event )
					else
						TeammateLockon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 0 )
				TeammateLockonFrame2( TeammateLockon, {} )
				TeammateHacking:completeAnimation()
				self.TeammateHacking:setAlpha( 0 )
				self.clipFinished( TeammateHacking, {} )
			end,
			Hacking = function ()
				self:setupElementClipCounter( 7 )
				local PanelGlowFrame2 = function ( PanelGlow, event )
					if not event.interrupted then
						PanelGlow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					PanelGlow:setAlpha( 0.49 )
					if event.interrupted then
						self.clipFinished( PanelGlow, event )
					else
						PanelGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				PanelGlowFrame2( PanelGlow, {} )
				local teamLockOnFrame2 = function ( teamLockOn, event )
					if not event.interrupted then
						teamLockOn:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					teamLockOn:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( teamLockOn, event )
					else
						teamLockOn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				teamLockOn:completeAnimation()
				self.teamLockOn:setAlpha( 0 )
				teamLockOnFrame2( teamLockOn, {} )
				local teamLockOn0Frame2 = function ( teamLockOn0, event )
					if not event.interrupted then
						teamLockOn0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					teamLockOn0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( teamLockOn0, event )
					else
						teamLockOn0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				teamLockOn0:completeAnimation()
				self.teamLockOn0:setAlpha( 0 )
				teamLockOn0Frame2( teamLockOn0, {} )
				TeammateLockonShadow:completeAnimation()
				self.TeammateLockonShadow:setAlpha( 0 )
				self.clipFinished( TeammateLockonShadow, {} )
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 0 )
				self.clipFinished( TeammateLockon, {} )
				local TeammateHackingShadowFrame2 = function ( TeammateHackingShadow, event )
					if not event.interrupted then
						TeammateHackingShadow:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TeammateHackingShadow:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( TeammateHackingShadow, event )
					else
						TeammateHackingShadow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TeammateHackingShadow:completeAnimation()
				self.TeammateHackingShadow:setAlpha( 0 )
				TeammateHackingShadowFrame2( TeammateHackingShadow, {} )
				local TeammateHackingFrame2 = function ( TeammateHacking, event )
					if not event.interrupted then
						TeammateHacking:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TeammateHacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( TeammateHacking, event )
					else
						TeammateHacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TeammateHacking:completeAnimation()
				self.TeammateHacking:setAlpha( 0 )
				TeammateHackingFrame2( TeammateHacking, {} )
			end
		},
		Hacking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0.49 )
				self.clipFinished( PanelGlow, {} )
				teamLockOn:completeAnimation()
				self.teamLockOn:setAlpha( 1 )
				self.clipFinished( teamLockOn, {} )
				teamLockOn0:completeAnimation()
				self.teamLockOn0:setAlpha( 1 )
				self.clipFinished( teamLockOn0, {} )
				TeammateLockonShadow:completeAnimation()
				self.TeammateLockonShadow:setAlpha( 0 )
				self.clipFinished( TeammateLockonShadow, {} )
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 0 )
				self.clipFinished( TeammateLockon, {} )
				TeammateHackingShadow:completeAnimation()
				self.TeammateHackingShadow:setAlpha( 0.8 )
				self.clipFinished( TeammateHackingShadow, {} )
				TeammateHacking:completeAnimation()
				self.TeammateHacking:setAlpha( 1 )
				self.clipFinished( TeammateHacking, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0.49 )
				self.clipFinished( PanelGlow, {} )
				teamLockOn:completeAnimation()
				self.teamLockOn:setAlpha( 1 )
				self.clipFinished( teamLockOn, {} )
				teamLockOn0:completeAnimation()
				self.teamLockOn0:setAlpha( 1 )
				self.clipFinished( teamLockOn0, {} )
				TeammateLockonShadow:completeAnimation()
				self.TeammateLockonShadow:setAlpha( 0.8 )
				self.clipFinished( TeammateLockonShadow, {} )
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 1 )
				self.clipFinished( TeammateLockon, {} )
				TeammateHacking:completeAnimation()
				self.TeammateHacking:setAlpha( 0 )
				self.clipFinished( TeammateHacking, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hacking",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "currentWeapon.lockedOnEnemyTeamHacking" ) and IsModelValueEnumBitSet( controller, "currentWeapon.lockedOnEnemy", Enum.RocketLauncherTargetStatesFlags.ROCKET_LAUNCHER_TARGET_FOUND )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "currentWeapon.lockedOnEnemyTeamTargetting" ) and IsModelValueEnumBitSet( controller, "currentWeapon.lockedOnEnemy", Enum.RocketLauncherTargetStatesFlags.ROCKET_LAUNCHER_TARGET_FOUND )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lockedOnEnemyTeamHacking" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lockedOnEnemyTeamHacking"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lockedOnEnemy" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lockedOnEnemy"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lockedOnEnemyTeamTargetting" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lockedOnEnemyTeamTargetting"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

