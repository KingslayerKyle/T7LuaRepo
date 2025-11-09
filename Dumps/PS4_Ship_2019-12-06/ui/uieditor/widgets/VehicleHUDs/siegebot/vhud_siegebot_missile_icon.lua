CoD.vhud_siegebot_missile_icon = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_missile_icon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.vhud_siegebot_missile_icon )
	self.id = "vhud_siegebot_missile_icon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 31 )
	
	local agrIconMissileLine1 = LUI.UIImage.new()
	agrIconMissileLine1:setLeftRight( false, false, -24, 24 )
	agrIconMissileLine1:setTopBottom( false, false, -9, 9 )
	agrIconMissileLine1:setYRot( 130 )
	agrIconMissileLine1:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_missileoutline" ) )
	agrIconMissileLine1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrIconMissileLine1 )
	self.agrIconMissileLine1 = agrIconMissileLine1
	
	local agrIconMissile1 = LUI.UIImage.new()
	agrIconMissile1:setLeftRight( false, false, -24, 24 )
	agrIconMissile1:setTopBottom( false, false, -9, 9 )
	agrIconMissile1:setAlpha( 0 )
	agrIconMissile1:setYRot( 130 )
	agrIconMissile1:setScale( 1.2 )
	agrIconMissile1:setImage( RegisterImage( "uie_t7_mp_hud_vehicle_siegebot_missile1" ) )
	agrIconMissile1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrIconMissile1 )
	self.agrIconMissile1 = agrIconMissile1
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( false, false, -8.23, 8.23 )
	GlowOrangeOver:setTopBottom( false, false, -26.85, 28.85 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setZRot( -90 )
	GlowOrangeOver:setScale( 1.2 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				agrIconMissileLine1:completeAnimation()
				self.agrIconMissileLine1:setScale( 1 )
				self.clipFinished( agrIconMissileLine1, {} )
				agrIconMissile1:completeAnimation()
				self.agrIconMissile1:setAlpha( 0 )
				self.agrIconMissile1:setScale( 1 )
				self.clipFinished( agrIconMissile1, {} )
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				self.clipFinished( GlowOrangeOver, {} )
			end
		},
		Armed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local agrIconMissileLine1Frame2 = function ( agrIconMissileLine1, event )
					local agrIconMissileLine1Frame3 = function ( agrIconMissileLine1, event )
						if not event.interrupted then
							agrIconMissileLine1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						end
						agrIconMissileLine1:setScale( 1.2 )
						if event.interrupted then
							self.clipFinished( agrIconMissileLine1, event )
						else
							agrIconMissileLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						agrIconMissileLine1Frame3( agrIconMissileLine1, event )
						return 
					else
						agrIconMissileLine1:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						agrIconMissileLine1:registerEventHandler( "transition_complete_keyframe", agrIconMissileLine1Frame3 )
					end
				end
				
				agrIconMissileLine1:completeAnimation()
				self.agrIconMissileLine1:setScale( 1.2 )
				agrIconMissileLine1Frame2( agrIconMissileLine1, {} )
				local agrIconMissile1Frame2 = function ( agrIconMissile1, event )
					local agrIconMissile1Frame3 = function ( agrIconMissile1, event )
						local agrIconMissile1Frame4 = function ( agrIconMissile1, event )
							local agrIconMissile1Frame5 = function ( agrIconMissile1, event )
								local agrIconMissile1Frame6 = function ( agrIconMissile1, event )
									if not event.interrupted then
										agrIconMissile1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									end
									agrIconMissile1:setAlpha( 1 )
									agrIconMissile1:setScale( 1.2 )
									if event.interrupted then
										self.clipFinished( agrIconMissile1, event )
									else
										agrIconMissile1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									agrIconMissile1Frame6( agrIconMissile1, event )
									return 
								else
									agrIconMissile1:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									agrIconMissile1:setAlpha( 1 )
									agrIconMissile1:setScale( 1.5 )
									agrIconMissile1:registerEventHandler( "transition_complete_keyframe", agrIconMissile1Frame6 )
								end
							end
							
							if event.interrupted then
								agrIconMissile1Frame5( agrIconMissile1, event )
								return 
							else
								agrIconMissile1:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								agrIconMissile1:setAlpha( 0.32 )
								agrIconMissile1:setScale( 1.2 )
								agrIconMissile1:registerEventHandler( "transition_complete_keyframe", agrIconMissile1Frame5 )
							end
						end
						
						if event.interrupted then
							agrIconMissile1Frame4( agrIconMissile1, event )
							return 
						else
							agrIconMissile1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							agrIconMissile1:setAlpha( 1 )
							agrIconMissile1:setScale( 1.5 )
							agrIconMissile1:registerEventHandler( "transition_complete_keyframe", agrIconMissile1Frame4 )
						end
					end
					
					if event.interrupted then
						agrIconMissile1Frame3( agrIconMissile1, event )
						return 
					else
						agrIconMissile1:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						agrIconMissile1:setAlpha( 0 )
						agrIconMissile1:registerEventHandler( "transition_complete_keyframe", agrIconMissile1Frame3 )
					end
				end
				
				agrIconMissile1:completeAnimation()
				self.agrIconMissile1:setAlpha( 1 )
				self.agrIconMissile1:setScale( 1.2 )
				agrIconMissile1Frame2( agrIconMissile1, {} )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									if not event.interrupted then
										GlowOrangeOver:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
									end
									GlowOrangeOver:setAlpha( 0 )
									GlowOrangeOver:setScale( 1.2 )
									if event.interrupted then
										self.clipFinished( GlowOrangeOver, event )
									else
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 0.5 )
									GlowOrangeOver:setScale( 1.8 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 0.2 )
								GlowOrangeOver:setScale( 1.2 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.5 )
							GlowOrangeOver:setScale( 1.8 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.2 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 1 )
				self.GlowOrangeOver:setScale( 1.2 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

