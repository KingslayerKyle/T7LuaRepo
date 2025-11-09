CoD.TacticalModeStatusIndicatorWidget = InheritFrom( LUI.UIElement )
CoD.TacticalModeStatusIndicatorWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalModeStatusIndicatorWidget )
	self.id = "TacticalModeStatusIndicatorWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 68 )
	self:setTopBottom( true, false, 0, 32 )
	
	local arrowRight = LUI.UIImage.new()
	arrowRight:setLeftRight( false, false, 16, 32 )
	arrowRight:setTopBottom( false, false, -16, 16 )
	arrowRight:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_status_arrow" ) )
	arrowRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowRight )
	self.arrowRight = arrowRight
	
	local arrowLeft = LUI.UIImage.new()
	arrowLeft:setLeftRight( false, false, -32, -16 )
	arrowLeft:setTopBottom( false, false, -16, 16 )
	arrowLeft:setZRot( 180 )
	arrowLeft:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_status_arrow" ) )
	arrowLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowLeft )
	self.arrowLeft = arrowLeft
	
	local suppressedIcon = LUI.UIImage.new()
	suppressedIcon:setLeftRight( false, false, -22, 22 )
	suppressedIcon:setTopBottom( false, false, -16, 16 )
	suppressedIcon:setAlpha( 0 )
	suppressedIcon:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_status_suppressed" ) )
	suppressedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( suppressedIcon )
	self.suppressedIcon = suppressedIcon
	
	local shootingPlayerFlashingIcon = LUI.UIImage.new()
	shootingPlayerFlashingIcon:setLeftRight( false, false, -19, 21 )
	shootingPlayerFlashingIcon:setTopBottom( false, false, -16, 16 )
	shootingPlayerFlashingIcon:setRGB( 0.8, 0.1, 0 )
	shootingPlayerFlashingIcon:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_status_shootingself" ) )
	shootingPlayerFlashingIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( shootingPlayerFlashingIcon )
	self.shootingPlayerFlashingIcon = shootingPlayerFlashingIcon
	
	local shootingPlayerIcon = LUI.UIImage.new()
	shootingPlayerIcon:setLeftRight( false, false, -16, 16 )
	shootingPlayerIcon:setTopBottom( false, false, -16, 16 )
	shootingPlayerIcon:setRGB( ColorSet.PlayerYellow.r, ColorSet.PlayerYellow.g, ColorSet.PlayerYellow.b )
	shootingPlayerIcon:setAlpha( 0 )
	shootingPlayerIcon:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_status_shooting" ) )
	shootingPlayerIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( shootingPlayerIcon )
	self.shootingPlayerIcon = shootingPlayerIcon
	
	local shootingIcon = LUI.UIImage.new()
	shootingIcon:setLeftRight( false, false, -16, 16 )
	shootingIcon:setTopBottom( false, false, -16, 16 )
	shootingIcon:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	shootingIcon:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_status_shooting" ) )
	shootingIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( shootingIcon )
	self.shootingIcon = shootingIcon
	
	local maneuveringIcon = LUI.UIImage.new()
	maneuveringIcon:setLeftRight( false, false, -16, 16 )
	maneuveringIcon:setTopBottom( false, false, -16, 16 )
	maneuveringIcon:setAlpha( 0 )
	maneuveringIcon:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_status_moving" ) )
	maneuveringIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( maneuveringIcon )
	self.maneuveringIcon = maneuveringIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				arrowRight:completeAnimation()
				self.arrowRight:setAlpha( 0 )
				self.clipFinished( arrowRight, {} )
				arrowLeft:completeAnimation()
				self.arrowLeft:setAlpha( 0 )
				self.clipFinished( arrowLeft, {} )
				suppressedIcon:completeAnimation()
				self.suppressedIcon:setAlpha( 0 )
				self.clipFinished( suppressedIcon, {} )
				shootingPlayerFlashingIcon:completeAnimation()
				self.shootingPlayerFlashingIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerFlashingIcon, {} )
				shootingPlayerIcon:completeAnimation()
				self.shootingPlayerIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerIcon, {} )
				shootingIcon:completeAnimation()
				self.shootingIcon:setAlpha( 0 )
				self.clipFinished( shootingIcon, {} )
				maneuveringIcon:completeAnimation()
				self.maneuveringIcon:setAlpha( 0 )
				self.clipFinished( maneuveringIcon, {} )
			end
		},
		Suppressed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				arrowRight:completeAnimation()
				self.arrowRight:setAlpha( 0 )
				self.clipFinished( arrowRight, {} )
				arrowLeft:completeAnimation()
				self.arrowLeft:setAlpha( 0 )
				self.clipFinished( arrowLeft, {} )
				suppressedIcon:completeAnimation()
				self.suppressedIcon:setAlpha( 1 )
				self.clipFinished( suppressedIcon, {} )
				shootingPlayerFlashingIcon:completeAnimation()
				self.shootingPlayerFlashingIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerFlashingIcon, {} )
				shootingPlayerIcon:completeAnimation()
				self.shootingPlayerIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerIcon, {} )
				shootingIcon:completeAnimation()
				self.shootingIcon:setAlpha( 0 )
				self.clipFinished( shootingIcon, {} )
				maneuveringIcon:completeAnimation()
				self.maneuveringIcon:setAlpha( 0 )
				self.clipFinished( maneuveringIcon, {} )
			end
		},
		ManeuveringAndShootingPlayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				arrowRight:completeAnimation()
				self.arrowRight:setLeftRight( false, false, -26, -10 )
				self.arrowRight:setTopBottom( false, false, -16, 16 )
				self.arrowRight:setAlpha( 1 )
				self.clipFinished( arrowRight, {} )
				arrowLeft:completeAnimation()
				self.arrowLeft:setLeftRight( false, false, 11, 27 )
				self.arrowLeft:setTopBottom( false, false, -16, 16 )
				self.arrowLeft:setAlpha( 1 )
				self.clipFinished( arrowLeft, {} )
				suppressedIcon:completeAnimation()
				self.suppressedIcon:setAlpha( 0 )
				self.clipFinished( suppressedIcon, {} )
				local shootingPlayerFlashingIconFrame2 = function ( shootingPlayerFlashingIcon, event )
					local shootingPlayerFlashingIconFrame3 = function ( shootingPlayerFlashingIcon, event )
						if not event.interrupted then
							shootingPlayerFlashingIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						shootingPlayerFlashingIcon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( shootingPlayerFlashingIcon, event )
						else
							shootingPlayerFlashingIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						shootingPlayerFlashingIconFrame3( shootingPlayerFlashingIcon, event )
						return 
					else
						shootingPlayerFlashingIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						shootingPlayerFlashingIcon:setAlpha( 1 )
						shootingPlayerFlashingIcon:registerEventHandler( "transition_complete_keyframe", shootingPlayerFlashingIconFrame3 )
					end
				end
				
				shootingPlayerFlashingIcon:completeAnimation()
				self.shootingPlayerFlashingIcon:setAlpha( 0 )
				shootingPlayerFlashingIconFrame2( shootingPlayerFlashingIcon, {} )
				shootingPlayerIcon:completeAnimation()
				self.shootingPlayerIcon:setAlpha( 1 )
				self.clipFinished( shootingPlayerIcon, {} )
				shootingIcon:completeAnimation()
				self.shootingIcon:setAlpha( 0 )
				self.clipFinished( shootingIcon, {} )
				maneuveringIcon:completeAnimation()
				self.maneuveringIcon:setAlpha( 0 )
				self.clipFinished( maneuveringIcon, {} )
				self.nextClip = "DefaultClip"
			end
		},
		ManeuveringAndShootingOther = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				arrowRight:completeAnimation()
				self.arrowRight:setLeftRight( false, false, -26, -10 )
				self.arrowRight:setTopBottom( false, false, -16, 16 )
				self.arrowRight:setAlpha( 1 )
				self.clipFinished( arrowRight, {} )
				arrowLeft:completeAnimation()
				self.arrowLeft:setLeftRight( false, false, 11, 27 )
				self.arrowLeft:setTopBottom( false, false, -16, 16 )
				self.arrowLeft:setAlpha( 1 )
				self.clipFinished( arrowLeft, {} )
				suppressedIcon:completeAnimation()
				self.suppressedIcon:setAlpha( 0 )
				self.clipFinished( suppressedIcon, {} )
				shootingPlayerFlashingIcon:completeAnimation()
				self.shootingPlayerFlashingIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerFlashingIcon, {} )
				shootingPlayerIcon:completeAnimation()
				self.shootingPlayerIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerIcon, {} )
				shootingIcon:completeAnimation()
				self.shootingIcon:setAlpha( 1 )
				self.clipFinished( shootingIcon, {} )
				maneuveringIcon:completeAnimation()
				self.maneuveringIcon:setAlpha( 0 )
				self.clipFinished( maneuveringIcon, {} )
			end
		},
		ManeuveringOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				arrowRight:completeAnimation()
				self.arrowRight:setLeftRight( false, false, -16, 0 )
				self.arrowRight:setTopBottom( false, false, -16, 16 )
				self.arrowRight:setAlpha( 1 )
				self.clipFinished( arrowRight, {} )
				arrowLeft:completeAnimation()
				self.arrowLeft:setLeftRight( false, false, 1, 17 )
				self.arrowLeft:setTopBottom( false, false, -16, 16 )
				self.arrowLeft:setAlpha( 1 )
				self.clipFinished( arrowLeft, {} )
				suppressedIcon:completeAnimation()
				self.suppressedIcon:setAlpha( 0 )
				self.clipFinished( suppressedIcon, {} )
				shootingPlayerFlashingIcon:completeAnimation()
				self.shootingPlayerFlashingIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerFlashingIcon, {} )
				shootingPlayerIcon:completeAnimation()
				self.shootingPlayerIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerIcon, {} )
				shootingIcon:completeAnimation()
				self.shootingIcon:setAlpha( 0 )
				self.clipFinished( shootingIcon, {} )
				maneuveringIcon:completeAnimation()
				self.maneuveringIcon:setAlpha( 0 )
				self.clipFinished( maneuveringIcon, {} )
			end
		},
		ShootingPlayerOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				arrowRight:completeAnimation()
				self.arrowRight:setAlpha( 0 )
				self.clipFinished( arrowRight, {} )
				arrowLeft:completeAnimation()
				self.arrowLeft:setAlpha( 0 )
				self.clipFinished( arrowLeft, {} )
				suppressedIcon:completeAnimation()
				self.suppressedIcon:setAlpha( 0 )
				self.clipFinished( suppressedIcon, {} )
				local shootingPlayerFlashingIconFrame2 = function ( shootingPlayerFlashingIcon, event )
					local shootingPlayerFlashingIconFrame3 = function ( shootingPlayerFlashingIcon, event )
						if not event.interrupted then
							shootingPlayerFlashingIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						shootingPlayerFlashingIcon:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( shootingPlayerFlashingIcon, event )
						else
							shootingPlayerFlashingIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						shootingPlayerFlashingIconFrame3( shootingPlayerFlashingIcon, event )
						return 
					else
						shootingPlayerFlashingIcon:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						shootingPlayerFlashingIcon:setAlpha( 1 )
						shootingPlayerFlashingIcon:registerEventHandler( "transition_complete_keyframe", shootingPlayerFlashingIconFrame3 )
					end
				end
				
				shootingPlayerFlashingIcon:completeAnimation()
				self.shootingPlayerFlashingIcon:setAlpha( 0 )
				shootingPlayerFlashingIconFrame2( shootingPlayerFlashingIcon, {} )
				shootingPlayerIcon:completeAnimation()
				self.shootingPlayerIcon:setAlpha( 1 )
				self.clipFinished( shootingPlayerIcon, {} )
				shootingIcon:completeAnimation()
				self.shootingIcon:setAlpha( 0 )
				self.clipFinished( shootingIcon, {} )
				maneuveringIcon:completeAnimation()
				self.maneuveringIcon:setAlpha( 0 )
				self.clipFinished( maneuveringIcon, {} )
				self.nextClip = "DefaultClip"
			end
		},
		ShootingOtherOnly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				arrowRight:completeAnimation()
				self.arrowRight:setAlpha( 0 )
				self.clipFinished( arrowRight, {} )
				arrowLeft:completeAnimation()
				self.arrowLeft:setAlpha( 0 )
				self.clipFinished( arrowLeft, {} )
				suppressedIcon:completeAnimation()
				self.suppressedIcon:setAlpha( 0 )
				self.clipFinished( suppressedIcon, {} )
				shootingPlayerFlashingIcon:completeAnimation()
				self.shootingPlayerFlashingIcon:setAlpha( 0 )
				self.clipFinished( shootingPlayerFlashingIcon, {} )
				shootingPlayerIcon:completeAnimation()
				self.shootingPlayerIcon:setRGB( 1, 0.84, 0.04 )
				self.clipFinished( shootingPlayerIcon, {} )
				shootingIcon:completeAnimation()
				self.shootingIcon:setAlpha( 1 )
				self.clipFinished( shootingIcon, {} )
				maneuveringIcon:completeAnimation()
				self.maneuveringIcon:setAlpha( 0 )
				self.clipFinished( maneuveringIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Suppressed",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isSuppressed" )
			end
		},
		{
			stateName = "ManeuveringAndShootingPlayer",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isManeuvering" ) and IsSelfModelValueTrue( element, controller, "isShootingPlayer" )
			end
		},
		{
			stateName = "ManeuveringAndShootingOther",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isManeuvering" ) and IsSelfModelValueTrue( element, controller, "isShooting" )
			end
		},
		{
			stateName = "ManeuveringOnly",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isManeuvering" )
			end
		},
		{
			stateName = "ShootingPlayerOnly",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isShootingPlayer" )
			end
		},
		{
			stateName = "ShootingOtherOnly",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isShooting" )
			end
		}
	} )
	self:linkToElementModel( self, "isSuppressed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isSuppressed"
		} )
	end )
	self:linkToElementModel( self, "isManeuvering", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isManeuvering"
		} )
	end )
	self:linkToElementModel( self, "isShootingPlayer", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isShootingPlayer"
		} )
	end )
	self:linkToElementModel( self, "isShooting", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isShooting"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

