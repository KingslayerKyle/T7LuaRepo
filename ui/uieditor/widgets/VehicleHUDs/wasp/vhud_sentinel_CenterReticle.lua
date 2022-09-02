-- 80f10848982fe8d55714c39e81be7a5e
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_sentinel_CenterReticle = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_CenterReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_CenterReticle )
	self.id = "vhud_sentinel_CenterReticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 24 )
	
	local CenterReticle = LUI.UIImage.new()
	CenterReticle:setLeftRight( false, false, -20, 20 )
	CenterReticle:setTopBottom( false, false, -12, 12 )
	CenterReticle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerreticlecircle" ) )
	CenterReticle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticle )
	self.CenterReticle = CenterReticle
	
	local CenterReticle0 = LUI.UIImage.new()
	CenterReticle0:setLeftRight( false, false, -20, 20 )
	CenterReticle0:setTopBottom( false, false, -12, 12 )
	CenterReticle0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_centerreticlecircle" ) )
	CenterReticle0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticle0 )
	self.CenterReticle0 = CenterReticle0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			StartUp = function ()
				self:setupElementClipCounter( 2 )

				local f3_local0 = function ( f4_arg0, f4_arg1 )
					if not f4_arg1.interrupted then
						f4_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
					end
					f4_arg0:setAlpha( 1 )
					if f4_arg1.interrupted then
						self.clipFinished( f4_arg0, f4_arg1 )
					else
						f4_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticle:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
				CenterReticle:setAlpha( 0 )
				CenterReticle:registerEventHandler( "transition_complete_keyframe", f3_local0 )
				local f3_local1 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setAlpha( 1 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticle0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
				CenterReticle0:setAlpha( 0 )
				CenterReticle0:registerEventHandler( "transition_complete_keyframe", f3_local1 )
			end,
			Zoom = function ()
				self:setupElementClipCounter( 2 )

				local CenterReticleFrame2 = function ( CenterReticle, event )
					if not event.interrupted then
						CenterReticle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticle:setZoom( -400 )
					if event.interrupted then
						self.clipFinished( CenterReticle, event )
					else
						CenterReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticle:completeAnimation()
				self.CenterReticle:setZoom( 0 )
				CenterReticleFrame2( CenterReticle, {} )
				local CenterReticle0Frame2 = function ( CenterReticle0, event )
					if not event.interrupted then
						CenterReticle0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticle0:setZoom( -400 )
					if event.interrupted then
						self.clipFinished( CenterReticle0, event )
					else
						CenterReticle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticle0:completeAnimation()
				self.CenterReticle0:setZoom( 0 )
				CenterReticle0Frame2( CenterReticle0, {} )
			end
		},
		RAPS = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				CenterReticle:completeAnimation()
				self.CenterReticle:setAlpha( 0 )
				self.clipFinished( CenterReticle, {} )

				CenterReticle0:completeAnimation()
				self.CenterReticle0:setAlpha( 0 )
				self.clipFinished( CenterReticle0, {} )
			end
		},
		Zoom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				CenterReticle:completeAnimation()
				self.CenterReticle:setLeftRight( false, false, -19.5, 20.5 )
				self.CenterReticle:setTopBottom( false, false, -12, 12 )
				self.CenterReticle:setZoom( -400 )
				self.clipFinished( CenterReticle, {} )

				CenterReticle0:completeAnimation()
				self.CenterReticle0:setLeftRight( false, false, -19.5, 20.5 )
				self.CenterReticle0:setTopBottom( false, false, -12, 12 )
				self.CenterReticle0:setAlpha( 1 )
				self.CenterReticle0:setZoom( -400 )
				self.clipFinished( CenterReticle0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )

				local CenterReticleFrame2 = function ( CenterReticle, event )
					if not event.interrupted then
						CenterReticle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticle:setLeftRight( false, false, -19.5, 20.5 )
					CenterReticle:setTopBottom( false, false, -12, 12 )
					CenterReticle:setZoom( -400 )
					if event.interrupted then
						self.clipFinished( CenterReticle, event )
					else
						CenterReticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticle:completeAnimation()
				self.CenterReticle:setLeftRight( false, false, -19.5, 20.5 )
				self.CenterReticle:setTopBottom( false, false, -12, 12 )
				self.CenterReticle:setZoom( -400 )
				CenterReticleFrame2( CenterReticle, {} )
				local CenterReticle0Frame2 = function ( CenterReticle0, event )
					if not event.interrupted then
						CenterReticle0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					CenterReticle0:setLeftRight( false, false, -19.5, 20.5 )
					CenterReticle0:setTopBottom( false, false, -12, 12 )
					CenterReticle0:setZoom( -400 )
					CenterReticle0:setScale( 1 )
					if event.interrupted then
						self.clipFinished( CenterReticle0, event )
					else
						CenterReticle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CenterReticle0:completeAnimation()
				self.CenterReticle0:setLeftRight( false, false, -19.5, 20.5 )
				self.CenterReticle0:setTopBottom( false, false, -12, 12 )
				self.CenterReticle0:setZoom( -400 )
				self.CenterReticle0:setScale( 1 )
				CenterReticle0Frame2( CenterReticle0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "RAPS",
			condition = function ( menu, element, event )
				return IsCampaign() and IsVehicleOfType( controller, "raps" )
			end
		},
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "vehicle.vehicleType" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicle.vehicleType"
		} )
	end )
	self:linkToElementModel( self, "zoomed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

