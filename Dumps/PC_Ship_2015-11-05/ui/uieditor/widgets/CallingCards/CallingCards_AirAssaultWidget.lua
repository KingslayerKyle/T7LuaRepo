CoD.CallingCards_AirAssaultWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_AirAssaultWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_AirAssaultWidget )
	self.id = "CallingCards_AirAssaultWidget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcards_airassault_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 323, 667.86 )
	GlowOrangeOver:setTopBottom( true, false, -152.27, 140.27 )
	GlowOrangeOver:setRGB( 1, 0.63, 0 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local smoke1 = LUI.UIImage.new()
	smoke1:setLeftRight( true, false, 174.8, 346 )
	smoke1:setTopBottom( true, false, -66, 148 )
	smoke1:setImage( RegisterImage( "uie_t7_callingcard_efficiency_smoke2" ) )
	smoke1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	smoke1:setShaderVector( 0, 1, 1, 0, 0 )
	smoke1:setShaderVector( 1, 0, 0.23, 0, 0 )
	self:addElement( smoke1 )
	self.smoke1 = smoke1
	
	local smoke2 = LUI.UIImage.new()
	smoke2:setLeftRight( true, false, -103.04, 174.8 )
	smoke2:setTopBottom( true, false, -57.69, 157.69 )
	smoke2:setImage( RegisterImage( "uie_t7_callingcard_efficiency_smoke3" ) )
	smoke2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	smoke2:setShaderVector( 0, 1, 1, 0, 0 )
	smoke2:setShaderVector( 1, 0, 0.15, 0, 0 )
	self:addElement( smoke2 )
	self.smoke2 = smoke2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						local GlowOrangeOverFrame4 = function ( GlowOrangeOver, event )
							local GlowOrangeOverFrame5 = function ( GlowOrangeOver, event )
								local GlowOrangeOverFrame6 = function ( GlowOrangeOver, event )
									local GlowOrangeOverFrame7 = function ( GlowOrangeOver, event )
										local GlowOrangeOverFrame8 = function ( GlowOrangeOver, event )
											if not event.interrupted then
												GlowOrangeOver:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
											end
											GlowOrangeOver:setAlpha( 0 )
											if event.interrupted then
												self.clipFinished( GlowOrangeOver, event )
											else
												GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											GlowOrangeOverFrame8( GlowOrangeOver, event )
											return 
										else
											GlowOrangeOver:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
											GlowOrangeOver:setAlpha( 0.59 )
											GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeOverFrame7( GlowOrangeOver, event )
										return 
									else
										GlowOrangeOver:beginAnimation( "keyframe", 450, false, false, CoD.TweenType.Linear )
										GlowOrangeOver:setAlpha( 0.85 )
										GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeOverFrame6( GlowOrangeOver, event )
									return 
								else
									GlowOrangeOver:beginAnimation( "keyframe", 1029, false, false, CoD.TweenType.Linear )
									GlowOrangeOver:setAlpha( 0.73 )
									GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOverFrame5( GlowOrangeOver, event )
								return 
							else
								GlowOrangeOver:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
								GlowOrangeOver:setAlpha( 1 )
								GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOverFrame4( GlowOrangeOver, event )
							return 
						else
							GlowOrangeOver:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							GlowOrangeOver:setAlpha( 0.41 )
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.59 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

