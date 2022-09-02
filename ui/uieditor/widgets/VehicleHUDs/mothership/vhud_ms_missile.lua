-- 3d71f4e2e103ddd47109fe27fde0b4ab
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_ms_missile = InheritFrom( LUI.UIElement )
CoD.vhud_ms_missile.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_ms_missile )
	self.id = "vhud_ms_missile"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 18 )
	
	local agrIconMissileLine1 = LUI.UIImage.new()
	agrIconMissileLine1:setLeftRight( true, true, 0, 0 )
	agrIconMissileLine1:setTopBottom( true, true, 0, 0 )
	agrIconMissileLine1:setRGB( 0.74, 0.94, 0.99 )
	agrIconMissileLine1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ms_notificationiconmissileoutline" ) )
	agrIconMissileLine1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrIconMissileLine1 )
	self.agrIconMissileLine1 = agrIconMissileLine1
	
	local agrIconMissile1 = LUI.UIImage.new()
	agrIconMissile1:setLeftRight( true, true, 0, 0 )
	agrIconMissile1:setTopBottom( true, true, 0, 0 )
	agrIconMissile1:setRGB( 0.74, 0.94, 0.99 )
	agrIconMissile1:setAlpha( 0 )
	agrIconMissile1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ms_notificationiconmissile1" ) )
	agrIconMissile1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrIconMissile1 )
	self.agrIconMissile1 = agrIconMissile1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				agrIconMissile1:completeAnimation()
				self.agrIconMissile1:setAlpha( 0 )
				self.clipFinished( agrIconMissile1, {} )
			end,
			Armed = function ()
				self:setupElementClipCounter( 1 )

				local agrIconMissile1Frame2 = function ( agrIconMissile1, event )
					local agrIconMissile1Frame3 = function ( agrIconMissile1, event )
						local agrIconMissile1Frame4 = function ( agrIconMissile1, event )
							if not event.interrupted then
								agrIconMissile1:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							agrIconMissile1:setAlpha( 1 )
							if event.interrupted then
								self.clipFinished( agrIconMissile1, event )
							else
								agrIconMissile1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							agrIconMissile1Frame4( agrIconMissile1, event )
							return 
						else
							agrIconMissile1:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
							agrIconMissile1:setAlpha( 0.6 )
							agrIconMissile1:registerEventHandler( "transition_complete_keyframe", agrIconMissile1Frame4 )
						end
					end
					
					if event.interrupted then
						agrIconMissile1Frame3( agrIconMissile1, event )
						return 
					else
						agrIconMissile1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						agrIconMissile1:setAlpha( 1 )
						agrIconMissile1:registerEventHandler( "transition_complete_keyframe", agrIconMissile1Frame3 )
					end
				end
				
				agrIconMissile1:completeAnimation()
				self.agrIconMissile1:setAlpha( 0 )
				agrIconMissile1Frame2( agrIconMissile1, {} )
			end
		},
		Armed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				agrIconMissile1:completeAnimation()
				self.agrIconMissile1:setAlpha( 1 )
				self.clipFinished( agrIconMissile1, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

