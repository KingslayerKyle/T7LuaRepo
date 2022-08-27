-- 8d2349622a07bbaf841ab67ff0a6edd8
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Circuits02FX = InheritFrom( LUI.UIElement )
CoD.BM_Circuits02FX.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Circuits02FX )
	self.id = "BM_Circuits02FX"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 380 )
	self:setTopBottom( true, false, 0, 476 )
	
	local Pixels04 = LUI.UIImage.new()
	Pixels04:setLeftRight( true, false, 0, 380 )
	Pixels04:setTopBottom( true, false, 0, 476 )
	Pixels04:setAlpha( 0 )
	Pixels04:setImage( RegisterImage( "uie_t7_blackmarket_limited_circuits" ) )
	self:addElement( Pixels04 )
	self.Pixels04 = Pixels04
	
	local mask = LUI.UIImage.new()
	mask:setLeftRight( true, false, 0, 380 )
	mask:setTopBottom( true, false, 0, 476 )
	mask:setRGB( 0, 0, 0 )
	mask:setAlpha( 0 )
	mask:setImage( RegisterImage( "uie_t7_blackmarket_pixelanim_mask2" ) )
	self:addElement( mask )
	self.mask = mask
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local Pixels04Frame2 = function ( Pixels04, event )
					local Pixels04Frame3 = function ( Pixels04, event )
						local Pixels04Frame4 = function ( Pixels04, event )
							local Pixels04Frame5 = function ( Pixels04, event )
								local Pixels04Frame6 = function ( Pixels04, event )
									local Pixels04Frame7 = function ( Pixels04, event )
										local Pixels04Frame8 = function ( Pixels04, event )
											local Pixels04Frame9 = function ( Pixels04, event )
												local Pixels04Frame10 = function ( Pixels04, event )
													if not event.interrupted then
														Pixels04:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
													end
													Pixels04:setAlpha( 0 )
													if event.interrupted then
														self.clipFinished( Pixels04, event )
													else
														Pixels04:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
													end
												end
												
												if event.interrupted then
													Pixels04Frame10( Pixels04, event )
													return 
												else
													Pixels04:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
													Pixels04:setAlpha( 0.35 )
													Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame10 )
												end
											end
											
											if event.interrupted then
												Pixels04Frame9( Pixels04, event )
												return 
											else
												Pixels04:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
												Pixels04:setAlpha( 0.59 )
												Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame9 )
											end
										end
										
										if event.interrupted then
											Pixels04Frame8( Pixels04, event )
											return 
										else
											Pixels04:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											Pixels04:setAlpha( 0.19 )
											Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame8 )
										end
									end
									
									if event.interrupted then
										Pixels04Frame7( Pixels04, event )
										return 
									else
										Pixels04:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
										Pixels04:setAlpha( 0.78 )
										Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame7 )
									end
								end
								
								if event.interrupted then
									Pixels04Frame6( Pixels04, event )
									return 
								else
									Pixels04:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
									Pixels04:setAlpha( 0.26 )
									Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame6 )
								end
							end
							
							if event.interrupted then
								Pixels04Frame5( Pixels04, event )
								return 
							else
								Pixels04:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
								Pixels04:setAlpha( 1 )
								Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame5 )
							end
						end
						
						if event.interrupted then
							Pixels04Frame4( Pixels04, event )
							return 
						else
							Pixels04:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							Pixels04:setAlpha( 0.3 )
							Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame4 )
						end
					end
					
					if event.interrupted then
						Pixels04Frame3( Pixels04, event )
						return 
					else
						Pixels04:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Pixels04:setAlpha( 1 )
						Pixels04:registerEventHandler( "transition_complete_keyframe", Pixels04Frame3 )
					end
				end
				
				Pixels04:completeAnimation()
				self.Pixels04:setAlpha( 0 )
				Pixels04Frame2( Pixels04, {} )
				mask:completeAnimation()
				self.mask:setAlpha( 0 )
				self.clipFinished( mask, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

