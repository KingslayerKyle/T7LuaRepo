CoD.vtolCenterFrame = InheritFrom( LUI.UIElement )
CoD.vtolCenterFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vtolCenterFrame )
	self.id = "vtolCenterFrame"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local minigunCenter = LUI.UIImage.new()
	minigunCenter:setLeftRight( false, false, -181, 181 )
	minigunCenter:setTopBottom( false, false, -181, 181 )
	minigunCenter:setRGB( 1, 1, 1 )
	minigunCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_miniguncenter" ) )
	minigunCenter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( minigunCenter )
	self.minigunCenter = minigunCenter
	
	local missilesCenter = LUI.UIImage.new()
	missilesCenter:setLeftRight( false, false, -181, 181 )
	missilesCenter:setTopBottom( false, false, -181, 181 )
	missilesCenter:setRGB( 1, 1, 1 )
	missilesCenter:setAlpha( 0 )
	missilesCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_missilescenter" ) )
	missilesCenter:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( missilesCenter )
	self.missilesCenter = missilesCenter
	
	local minigunReticle = LUI.UIImage.new()
	minigunReticle:setLeftRight( false, false, -72, 72 )
	minigunReticle:setTopBottom( false, false, -69, 75 )
	minigunReticle:setRGB( 1, 1, 1 )
	minigunReticle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_minigunreticle" ) )
	minigunReticle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( minigunReticle )
	self.minigunReticle = minigunReticle
	
	local missilesReticle = LUI.UIImage.new()
	missilesReticle:setLeftRight( false, false, -72, 72 )
	missilesReticle:setTopBottom( false, false, -69, 75 )
	missilesReticle:setRGB( 1, 1, 1 )
	missilesReticle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_missilesreticle" ) )
	missilesReticle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( missilesReticle )
	self.missilesReticle = missilesReticle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				minigunCenter:completeAnimation()
				self.minigunCenter:setAlpha( 1 )
				self.clipFinished( minigunCenter, {} )
				missilesCenter:completeAnimation()
				self.missilesCenter:setAlpha( 0 )
				self.clipFinished( missilesCenter, {} )
				minigunReticle:completeAnimation()
				self.minigunReticle:setAlpha( 1 )
				self.clipFinished( minigunReticle, {} )
				missilesReticle:completeAnimation()
				self.missilesReticle:setAlpha( 0 )
				self.clipFinished( missilesReticle, {} )
			end
		},
		Minigun = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local minigunCenterFrame2 = function ( minigunCenter, event )
					if not event.interrupted then
						minigunCenter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					minigunCenter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( minigunCenter, event )
					else
						minigunCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				minigunCenter:completeAnimation()
				self.minigunCenter:setAlpha( 0 )
				minigunCenterFrame2( minigunCenter, {} )
				local missilesCenterFrame2 = function ( missilesCenter, event )
					if not event.interrupted then
						missilesCenter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					missilesCenter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( missilesCenter, event )
					else
						missilesCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				missilesCenter:completeAnimation()
				self.missilesCenter:setAlpha( 1 )
				missilesCenterFrame2( missilesCenter, {} )
				local minigunReticleFrame2 = function ( minigunReticle, event )
					if not event.interrupted then
						minigunReticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					minigunReticle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( minigunReticle, event )
					else
						minigunReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				minigunReticle:completeAnimation()
				self.minigunReticle:setAlpha( 0 )
				minigunReticleFrame2( minigunReticle, {} )
				local missilesReticleFrame2 = function ( missilesReticle, event )
					if not event.interrupted then
						missilesReticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					missilesReticle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( missilesReticle, event )
					else
						missilesReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				missilesReticle:completeAnimation()
				self.missilesReticle:setAlpha( 1 )
				missilesReticleFrame2( missilesReticle, {} )
			end
		},
		Missiles = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local minigunCenterFrame2 = function ( minigunCenter, event )
					if not event.interrupted then
						minigunCenter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					minigunCenter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( minigunCenter, event )
					else
						minigunCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				minigunCenter:completeAnimation()
				self.minigunCenter:setAlpha( 1 )
				minigunCenterFrame2( minigunCenter, {} )
				local missilesCenterFrame2 = function ( missilesCenter, event )
					if not event.interrupted then
						missilesCenter:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					missilesCenter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( missilesCenter, event )
					else
						missilesCenter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				missilesCenter:completeAnimation()
				self.missilesCenter:setAlpha( 0 )
				missilesCenterFrame2( missilesCenter, {} )
				local minigunReticleFrame2 = function ( minigunReticle, event )
					if not event.interrupted then
						minigunReticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					minigunReticle:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( minigunReticle, event )
					else
						minigunReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				minigunReticle:completeAnimation()
				self.minigunReticle:setAlpha( 1 )
				minigunReticleFrame2( minigunReticle, {} )
				local missilesReticleFrame2 = function ( missilesReticle, event )
					if not event.interrupted then
						missilesReticle:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					missilesReticle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( missilesReticle, event )
					else
						missilesReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				missilesReticle:completeAnimation()
				self.missilesReticle:setAlpha( 0 )
				missilesReticleFrame2( missilesReticle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Minigun",
			condition = function ( menu, element, event )
				return not IsSelfModelValueEqualTo( element, controller, "weaponIndex", 1 )
			end
		},
		{
			stateName = "Missiles",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "weaponIndex", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "weaponIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "weaponIndex"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

