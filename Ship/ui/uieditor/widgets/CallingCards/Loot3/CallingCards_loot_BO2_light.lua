-- fa01bcdf6c469fa2b256ca3dbc6ef848
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_loot_BO2_light = InheritFrom( LUI.UIElement )
CoD.CallingCards_loot_BO2_light.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_loot_BO2_light )
	self.id = "CallingCards_loot_BO2_light"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 39 )
	self:setTopBottom( true, false, 0, 18 )
	
	local light = LUI.UIImage.new()
	light:setLeftRight( true, false, 0, 39.07 )
	light:setTopBottom( true, false, 0, 18.19 )
	light:setRGB( 0.12, 1, 0 )
	light:setAlpha( 0.68 )
	light:setZRot( -25 )
	light:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	light:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( light )
	self.light = light
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local lightFrame2 = function ( light, event )
					local lightFrame3 = function ( light, event )
						local lightFrame4 = function ( light, event )
							local lightFrame5 = function ( light, event )
								if not event.interrupted then
									light:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
								end
								light:setAlpha( 0.75 )
								if event.interrupted then
									self.clipFinished( light, event )
								else
									light:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								lightFrame5( light, event )
								return 
							else
								light:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
								light:setAlpha( 0.25 )
								light:registerEventHandler( "transition_complete_keyframe", lightFrame5 )
							end
						end
						
						if event.interrupted then
							lightFrame4( light, event )
							return 
						else
							light:beginAnimation( "keyframe", 419, false, false, CoD.TweenType.Linear )
							light:setAlpha( 0.75 )
							light:registerEventHandler( "transition_complete_keyframe", lightFrame4 )
						end
					end
					
					if event.interrupted then
						lightFrame3( light, event )
						return 
					else
						light:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						light:setAlpha( 0.25 )
						light:registerEventHandler( "transition_complete_keyframe", lightFrame3 )
					end
				end
				
				light:completeAnimation()
				self.light:setAlpha( 0.75 )
				lightFrame2( light, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
