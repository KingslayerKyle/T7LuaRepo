-- 2dc7e53fb909b3ff565936a46bde85fd
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_Humiliation_Skull = InheritFrom( LUI.UIElement )
CoD.CallingCards_Humiliation_Skull.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_Humiliation_Skull )
	self.id = "CallingCards_Humiliation_Skull"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 192 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Skull = LUI.UIImage.new()
	Skull:setLeftRight( true, false, 0, 192 )
	Skull:setTopBottom( true, false, 0, 120 )
	Skull:setImage( RegisterImage( "uie_t7_callingcard_humiliation_skull" ) )
	self:addElement( Skull )
	self.Skull = Skull
	
	local GlowOrangeOver0 = LUI.UIImage.new()
	GlowOrangeOver0:setLeftRight( true, false, 101, 111.51 )
	GlowOrangeOver0:setTopBottom( true, false, 20.82, 41.89 )
	GlowOrangeOver0:setRGB( 0.01, 1, 0 )
	GlowOrangeOver0:setAlpha( 0.2 )
	GlowOrangeOver0:setZRot( 90 )
	GlowOrangeOver0:setScale( 1.1 )
	GlowOrangeOver0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver0 )
	self.GlowOrangeOver0 = GlowOrangeOver0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 52, 62.51 )
	Image0:setTopBottom( true, false, 21.82, 42.89 )
	Image0:setRGB( 0.01, 1, 0 )
	Image0:setAlpha( 0.2 )
	Image0:setZRot( 90 )
	Image0:setScale( 1.1 )
	Image0:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local GlowOrangeOver0Frame2 = function ( GlowOrangeOver0, event )
					local GlowOrangeOver0Frame3 = function ( GlowOrangeOver0, event )
						local GlowOrangeOver0Frame4 = function ( GlowOrangeOver0, event )
							local GlowOrangeOver0Frame5 = function ( GlowOrangeOver0, event )
								local GlowOrangeOver0Frame6 = function ( GlowOrangeOver0, event )
									local GlowOrangeOver0Frame7 = function ( GlowOrangeOver0, event )
										local GlowOrangeOver0Frame8 = function ( GlowOrangeOver0, event )
											local GlowOrangeOver0Frame9 = function ( GlowOrangeOver0, event )
												if not event.interrupted then
													GlowOrangeOver0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												end
												GlowOrangeOver0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( GlowOrangeOver0, event )
												else
													GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												GlowOrangeOver0Frame9( GlowOrangeOver0, event )
												return 
											else
												GlowOrangeOver0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
												GlowOrangeOver0:setAlpha( 0.25 )
												GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame9 )
											end
										end
										
										if event.interrupted then
											GlowOrangeOver0Frame8( GlowOrangeOver0, event )
											return 
										else
											GlowOrangeOver0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											GlowOrangeOver0:setAlpha( 0 )
											GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame8 )
										end
									end
									
									if event.interrupted then
										GlowOrangeOver0Frame7( GlowOrangeOver0, event )
										return 
									else
										GlowOrangeOver0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
										GlowOrangeOver0:setAlpha( 0.25 )
										GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame7 )
									end
								end
								
								if event.interrupted then
									GlowOrangeOver0Frame6( GlowOrangeOver0, event )
									return 
								else
									GlowOrangeOver0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									GlowOrangeOver0:setAlpha( 0 )
									GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame6 )
								end
							end
							
							if event.interrupted then
								GlowOrangeOver0Frame5( GlowOrangeOver0, event )
								return 
							else
								GlowOrangeOver0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								GlowOrangeOver0:setAlpha( 0.25 )
								GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame5 )
							end
						end
						
						if event.interrupted then
							GlowOrangeOver0Frame4( GlowOrangeOver0, event )
							return 
						else
							GlowOrangeOver0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							GlowOrangeOver0:setAlpha( 0 )
							GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame4 )
						end
					end
					
					if event.interrupted then
						GlowOrangeOver0Frame3( GlowOrangeOver0, event )
						return 
					else
						GlowOrangeOver0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						GlowOrangeOver0:setAlpha( 0.25 )
						GlowOrangeOver0:registerEventHandler( "transition_complete_keyframe", GlowOrangeOver0Frame3 )
					end
				end
				
				GlowOrangeOver0:completeAnimation()
				self.GlowOrangeOver0:setAlpha( 0 )
				GlowOrangeOver0Frame2( GlowOrangeOver0, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						local Image0Frame4 = function ( Image0, event )
							local Image0Frame5 = function ( Image0, event )
								local Image0Frame6 = function ( Image0, event )
									local Image0Frame7 = function ( Image0, event )
										local Image0Frame8 = function ( Image0, event )
											local Image0Frame9 = function ( Image0, event )
												if not event.interrupted then
													Image0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
												end
												Image0:setAlpha( 0 )
												if event.interrupted then
													self.clipFinished( Image0, event )
												else
													Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												Image0Frame9( Image0, event )
												return 
											else
												Image0:beginAnimation( "keyframe", 89, false, false, CoD.TweenType.Linear )
												Image0:setAlpha( 0.25 )
												Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame9 )
											end
										end
										
										if event.interrupted then
											Image0Frame8( Image0, event )
											return 
										else
											Image0:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
											Image0:setAlpha( 0 )
											Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame8 )
										end
									end
									
									if event.interrupted then
										Image0Frame7( Image0, event )
										return 
									else
										Image0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
										Image0:setAlpha( 0.25 )
										Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame7 )
									end
								end
								
								if event.interrupted then
									Image0Frame6( Image0, event )
									return 
								else
									Image0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									Image0:setAlpha( 0 )
									Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame6 )
								end
							end
							
							if event.interrupted then
								Image0Frame5( Image0, event )
								return 
							else
								Image0:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
								Image0:setAlpha( 0.25 )
								Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame5 )
							end
						end
						
						if event.interrupted then
							Image0Frame4( Image0, event )
							return 
						else
							Image0:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
							Image0:setAlpha( 0 )
							Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame4 )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
						Image0:setAlpha( 0.25 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				Image0Frame2( Image0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
