-- a2fe66a24201ebd7a0dc8e473ed46010
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_dart_CenterReticleOuterCircleDots = InheritFrom( LUI.UIElement )
CoD.vhud_dart_CenterReticleOuterCircleDots.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_CenterReticleOuterCircleDots )
	self.id = "vhud_dart_CenterReticleOuterCircleDots"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 399 )
	self:setTopBottom( true, false, 0, 199 )
	
	local CenterReticleOuterCircleDots0 = LUI.UIImage.new()
	CenterReticleOuterCircleDots0:setLeftRight( true, false, 0, 398.5 )
	CenterReticleOuterCircleDots0:setTopBottom( true, false, 0, 199.25 )
	CenterReticleOuterCircleDots0:setAlpha( 0.1 )
	CenterReticleOuterCircleDots0:setZoom( -40 )
	CenterReticleOuterCircleDots0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticleouterringdotsrgb" ) )
	CenterReticleOuterCircleDots0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleOuterCircleDots0 )
	self.CenterReticleOuterCircleDots0 = CenterReticleOuterCircleDots0
	
	local CenterReticleOuterCircleDots = LUI.UIImage.new()
	CenterReticleOuterCircleDots:setLeftRight( true, false, 0, 398.5 )
	CenterReticleOuterCircleDots:setTopBottom( true, false, 0, 199.25 )
	CenterReticleOuterCircleDots:setAlpha( 0.5 )
	CenterReticleOuterCircleDots:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticleouterringdotsrgb" ) )
	CenterReticleOuterCircleDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticleOuterCircleDots )
	self.CenterReticleOuterCircleDots = CenterReticleOuterCircleDots
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local CenterReticleOuterCircleDots0Frame2 = function ( CenterReticleOuterCircleDots0, event )
					local CenterReticleOuterCircleDots0Frame3 = function ( CenterReticleOuterCircleDots0, event )
						if not event.interrupted then
							CenterReticleOuterCircleDots0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
						end
						CenterReticleOuterCircleDots0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( CenterReticleOuterCircleDots0, event )
						else
							CenterReticleOuterCircleDots0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterReticleOuterCircleDots0Frame3( CenterReticleOuterCircleDots0, event )
						return 
					else
						CenterReticleOuterCircleDots0:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						CenterReticleOuterCircleDots0:setAlpha( 0.05 )
						CenterReticleOuterCircleDots0:registerEventHandler( "transition_complete_keyframe", CenterReticleOuterCircleDots0Frame3 )
					end
				end
				
				CenterReticleOuterCircleDots0:completeAnimation()
				self.CenterReticleOuterCircleDots0:setAlpha( 0.1 )
				CenterReticleOuterCircleDots0Frame2( CenterReticleOuterCircleDots0, {} )
				local CenterReticleOuterCircleDotsFrame2 = function ( CenterReticleOuterCircleDots, event )
					local CenterReticleOuterCircleDotsFrame3 = function ( CenterReticleOuterCircleDots, event )
						if not event.interrupted then
							CenterReticleOuterCircleDots:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
						end
						CenterReticleOuterCircleDots:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( CenterReticleOuterCircleDots, event )
						else
							CenterReticleOuterCircleDots:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CenterReticleOuterCircleDotsFrame3( CenterReticleOuterCircleDots, event )
						return 
					else
						CenterReticleOuterCircleDots:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
						CenterReticleOuterCircleDots:setAlpha( 0.25 )
						CenterReticleOuterCircleDots:registerEventHandler( "transition_complete_keyframe", CenterReticleOuterCircleDotsFrame3 )
					end
				end
				
				CenterReticleOuterCircleDots:completeAnimation()
				self.CenterReticleOuterCircleDots:setAlpha( 0.5 )
				CenterReticleOuterCircleDotsFrame2( CenterReticleOuterCircleDots, {} )
				self.nextClip = "DefaultClip"
			end,
			StartUp = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

