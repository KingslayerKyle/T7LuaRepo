-- 16f6b0a08578d47dfb284ce69e9b4955
-- This hash is used for caching, delete to decompile the file again

CoD.ZM_ReviveBleedoutRedEyeGlow = InheritFrom( LUI.UIElement )
CoD.ZM_ReviveBleedoutRedEyeGlow.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_ReviveBleedoutRedEyeGlow )
	self.id = "ZM_ReviveBleedoutRedEyeGlow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 17 )
	self:setTopBottom( true, false, 0, 18 )
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( true, false, 0, 17.17 )
	GlowOrangeOver0:setTopBottom( true, false, 0, 18.16 )
	GlowOrangeOver0:setRGB( 1, 0, 0.03 )
	GlowOrangeOver0:setAlpha( 0.46 )
	GlowOrangeOver0:setZRot( 90 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					local GlowOrangeOver0Frame3 = function ( GlowOrangeOver0, event )
						local GlowOrangeOver0Frame4 = function ( GlowOrangeOver0, event )
							local GlowOrangeOver0Frame5 = function ( GlowOrangeOver0, event )
								local GlowOrangeOver0Frame6 = function ( GlowOrangeOver0, event )
									local GlowOrangeOver0Frame7 = function ( GlowOrangeOver0, event )
										local GlowOrangeOver0Frame8 = function ( GlowOrangeOver0, event )
											local GlowOrangeOver0Frame9 = function ( GlowOrangeOver0, event )
												local GlowOrangeOver0Frame10 = function ( GlowOrangeOver0, event )
													local GlowOrangeOver0Frame11 = function ( GlowOrangeOver0, event )
														if not event.interrupted then
															GlowOrangeOver0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
														end
														GlowOrangeOver0:setAlpha( 0 )
														if event.interrupted then
															self.clipFinished( GlowOrangeOver0, event )
														else
															GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														GlowOrangeOver0Frame11( GlowOrangeOver0, event )
														return 
													else
														GlowOrangeOver0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
														GlowOrangeOver0:setAlpha( 0.17 )
														GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame11 )
													end
												end
												
												if event.interrupted then
													GlowOrangeOver0Frame10( GlowOrangeOver0, event )
													return 
												else
													GlowOrangeOver0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
													GlowOrangeOver0:setAlpha( 0 )
													GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame10 )
												end
											end
											
											if event.interrupted then
												GlowOrangeOver0Frame9( GlowOrangeOver0, event )
												return 
											else
												GlowOrangeOver0:beginAnimation( "keyframe", 299, false, false, CoD.TweenType.Linear )
												GlowOrangeOver0:setAlpha( 0.3 )
												GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame9 )
											end
										end
										
										if event.interrupted then
											GlowOrangeOver0Frame8( GlowOrangeOver0, event )
											return 
										else
											GlowOrangeOver0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
											GlowOrangeOver0:setAlpha( 0 )
											GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeOver0Frame7( GlowOrangeOver0, event )
										return 
									else
										GlowOrangeOver0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
										GlowOrangeOver0:setAlpha( 0.29 )
										GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeOver0Frame6( GlowOrangeOver0, event )
									return 
								else
									GlowOrangeOver0:beginAnimation( "keyframe", 229, false, false, CoD.TweenType.Linear )
									GlowOrangeOver0:setAlpha( 0.2 )
									GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOver0Frame5( GlowOrangeOver0, event )
								return 
							else
								GlowOrangeOver0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								GlowOrangeOver0:setAlpha( 0.54 )
								GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOver0Frame4( GlowOrangeOver0, event )
							return 
						else
							GlowOrangeOver0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
							GlowOrangeOver0:setAlpha( 0.11 )
							GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver0Frame3( GlowOrangeOver0, event )
						return 
					else
						GlowOrangeOver0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						GlowOrangeOver0:setAlpha( 0.19 )
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame3 )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )

				self.nextClip = "DefaultClip"
			end,
			BleedingOut = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
