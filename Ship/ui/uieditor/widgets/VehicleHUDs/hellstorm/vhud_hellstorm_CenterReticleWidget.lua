-- 693f6e00f7c2c9984f66a9c5bc85aa08
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_hellstorm_CenterReticleWidget = InheritFrom( LUI.UIElement )
CoD.vhud_hellstorm_CenterReticleWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_hellstorm_CenterReticleWidget )
	self.id = "vhud_hellstorm_CenterReticleWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 68 )
	self:setTopBottom( true, false, 0, 68 )
	
	local CenterReticleHash = LUI.UIImage.new()
	CenterReticleHash:setLeftRight( false, false, -34, 34 )
	CenterReticleHash:setTopBottom( false, false, -34, 34 )
	CenterReticleHash:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticlehashring" ) )
	CenterReticleHash:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	CenterReticleHash:setShaderVector( 0, 0.5, 0, 0, 0 )
	CenterReticleHash:setShaderVector( 1, 0, 0, 0, 0 )
	CenterReticleHash:setShaderVector( 2, 0, 0, 0, 0 )
	CenterReticleHash:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( CenterReticleHash )
	self.CenterReticleHash = CenterReticleHash
	
	local CenterReticleHash0 = LUI.UIImage.new()
	CenterReticleHash0:setLeftRight( false, false, -34, 34 )
	CenterReticleHash0:setTopBottom( false, false, -34, 34 )
	CenterReticleHash0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticlehashring" ) )
	CenterReticleHash0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	CenterReticleHash0:setShaderVector( 0, -0.5, 0, 0, 0 )
	CenterReticleHash0:setShaderVector( 1, 0.45, 0, 0, 0 )
	CenterReticleHash0:setShaderVector( 2, 0.62, 0, 0, 0 )
	CenterReticleHash0:setShaderVector( 3, 2.05, -0.45, 0, 0 )
	self:addElement( CenterReticleHash0 )
	self.CenterReticleHash0 = CenterReticleHash0
	
	local CenterReticleTarget = LUI.UIImage.new()
	CenterReticleTarget:setLeftRight( false, false, -34, 34 )
	CenterReticleTarget:setTopBottom( false, false, -34, 34 )
	CenterReticleTarget:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_hellstorm_centerreticletarget" ) )
	CenterReticleTarget:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleTarget )
	self.CenterReticleTarget = CenterReticleTarget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local CenterReticleHashFrame2 = function ( CenterReticleHash, event )
					local CenterReticleHashFrame3 = function ( CenterReticleHash, event )
						if not event.interrupted then
							CenterReticleHash:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						end
						CenterReticleHash:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
						CenterReticleHash:setShaderVector( 0, 1.17, 0, 0, 0 )
						CenterReticleHash:setShaderVector( 1, 0.45, 0, 0, 0 )
						CenterReticleHash:setShaderVector( 2, 0.62, 0, 0, 0 )
						CenterReticleHash:setShaderVector( 3, 3.54, -0.46, 0, 0 )
						if event.interrupted then
							self.clipFinished( CenterReticleHash, event )
						else
							CenterReticleHash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterReticleHashFrame3( CenterReticleHash, event )
						return 
					else
						CenterReticleHash:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						CenterReticleHash:setShaderVector( 0, 0.35, 0, 0, 0 )
						CenterReticleHash:setShaderVector( 2, 0.56, 0, 0, 0 )
						CenterReticleHash:setShaderVector( 3, 3.7, -0.3, 0, 0 )
						CenterReticleHash:registerEventHandler( "transition_complete_keyframe", CenterReticleHashFrame3 )
					end
				end
				
				CenterReticleHash:completeAnimation()
				self.CenterReticleHash:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
				self.CenterReticleHash:setShaderVector( 0, -0.5, 0, 0, 0 )
				self.CenterReticleHash:setShaderVector( 1, 0.45, 0, 0, 0 )
				self.CenterReticleHash:setShaderVector( 2, 0.62, 0, 0, 0 )
				self.CenterReticleHash:setShaderVector( 3, 2.05, -0.45, 0, 0 )
				CenterReticleHashFrame2( CenterReticleHash, {} )
				local CenterReticleHash0Frame2 = function ( CenterReticleHash0, event )
					local CenterReticleHash0Frame3 = function ( CenterReticleHash0, event )
						if not event.interrupted then
							CenterReticleHash0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
						end
						CenterReticleHash0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
						CenterReticleHash0:setShaderVector( 0, 1.17, 0, 0, 0 )
						CenterReticleHash0:setShaderVector( 1, 0.45, 0, 0, 0 )
						CenterReticleHash0:setShaderVector( 2, 0.62, 0, 0, 0 )
						CenterReticleHash0:setShaderVector( 3, 3.54, -0.46, 0, 0 )
						if event.interrupted then
							self.clipFinished( CenterReticleHash0, event )
						else
							CenterReticleHash0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterReticleHash0Frame3( CenterReticleHash0, event )
						return 
					else
						CenterReticleHash0:beginAnimation( "keyframe", 360, false, false, CoD.TweenType.Linear )
						CenterReticleHash0:setShaderVector( 0, 0.35, 0, 0, 0 )
						CenterReticleHash0:setShaderVector( 2, 0.56, 0, 0, 0 )
						CenterReticleHash0:setShaderVector( 3, 3.7, -0.3, 0, 0 )
						CenterReticleHash0:registerEventHandler( "transition_complete_keyframe", CenterReticleHash0Frame3 )
					end
				end
				
				CenterReticleHash0:completeAnimation()
				self.CenterReticleHash0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
				self.CenterReticleHash0:setShaderVector( 0, -0.5, 0, 0, 0 )
				self.CenterReticleHash0:setShaderVector( 1, 0.45, 0, 0, 0 )
				self.CenterReticleHash0:setShaderVector( 2, 0.62, 0, 0, 0 )
				self.CenterReticleHash0:setShaderVector( 3, 2.05, -0.45, 0, 0 )
				CenterReticleHash0Frame2( CenterReticleHash0, {} )

				self.nextClip = "DefaultClip"
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LowAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LowAltitude_Slow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LowAltitude_Boost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MediumAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MediumAltitude_Slow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MediumAltitude_Boost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HighAltitude = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HighAltitude_Slow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HighAltitude_Boost = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
