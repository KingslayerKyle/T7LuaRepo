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
	
	local TeammateLockon = LUI.UIText.new()
	TeammateLockon:setLeftRight( false, false, -56.28, 59.58 )
	TeammateLockon:setTopBottom( false, false, -28.5, 1.5 )
	TeammateLockon:setText( Engine.Localize( LocalizeToUpperString( "WEAPON_TEAMMATE_LOCK_ON" ) ) )
	TeammateLockon:setTTF( "fonts/escom.ttf" )
	TeammateLockon:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TeammateLockon:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TeammateLockon )
	self.TeammateLockon = TeammateLockon
	
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
				self:setupElementClipCounter( 5 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0 )
				self.clipFinished( PanelGlow, {} )
				teamLockOn:completeAnimation()
				self.teamLockOn:setAlpha( 0 )
				self.clipFinished( teamLockOn, {} )
				teamLockOn0:completeAnimation()
				self.teamLockOn0:setAlpha( 0 )
				self.clipFinished( teamLockOn0, {} )
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 0 )
				self.clipFinished( TeammateLockon, {} )
				TeammateHacking:completeAnimation()
				self.TeammateHacking:setAlpha( 0 )
				self.clipFinished( TeammateHacking, {} )
			end,
			Locking = function ()
				self:setupElementClipCounter( 5 )
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
				self:setupElementClipCounter( 5 )
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
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 0 )
				self.clipFinished( TeammateLockon, {} )
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
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0.49 )
				self.clipFinished( PanelGlow, {} )
				teamLockOn:completeAnimation()
				self.teamLockOn:setAlpha( 1 )
				self.clipFinished( teamLockOn, {} )
				teamLockOn0:completeAnimation()
				self.teamLockOn0:setAlpha( 1 )
				self.clipFinished( teamLockOn0, {} )
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 1 )
				self.clipFinished( TeammateLockon, {} )
				TeammateHacking:completeAnimation()
				self.TeammateHacking:setAlpha( 0 )
				self.clipFinished( TeammateHacking, {} )
			end
		},
		Hacking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				PanelGlow:completeAnimation()
				self.PanelGlow:setAlpha( 0.49 )
				self.clipFinished( PanelGlow, {} )
				teamLockOn:completeAnimation()
				self.teamLockOn:setAlpha( 1 )
				self.clipFinished( teamLockOn, {} )
				teamLockOn0:completeAnimation()
				self.teamLockOn0:setAlpha( 1 )
				self.clipFinished( teamLockOn0, {} )
				TeammateLockon:completeAnimation()
				self.TeammateLockon:setAlpha( 0 )
				self.clipFinished( TeammateLockon, {} )
				TeammateHacking:completeAnimation()
				self.TeammateHacking:setAlpha( 1 )
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

