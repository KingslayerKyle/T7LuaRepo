local PostLoadFunc = function ( self )
	self:setState( "DefaultState" )
end

CoD.AllocationBar = InheritFrom( LUI.UIElement )
CoD.AllocationBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AllocationBar )
	self.id = "AllocationBar"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 24 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local dashBacking = LUI.UIImage.new()
	dashBacking:setLeftRight( 0, 0, 0, 24 )
	dashBacking:setTopBottom( 0, 0, 0, 48 )
	dashBacking:setAlpha( 0 )
	dashBacking:setImage( RegisterImage( "uie_t7_menu_cac_allocationbarempty" ) )
	dashBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( dashBacking )
	self.dashBacking = dashBacking
	
	local dash = LUI.UIImage.new()
	dash:setLeftRight( 0, 0, 0, 24 )
	dash:setTopBottom( 0, 0, 0, 48 )
	dash:setImage( RegisterImage( "uie_t7_menu_cac_allocationbarfull" ) )
	dash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( dash )
	self.dash = dash
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 0, -19, 47 )
	Glow:setTopBottom( 0, 0, -24, 68 )
	Glow:setRGB( 0.84, 0.91, 1 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.resetProperties = function ()
		dash:completeAnimation()
		dashBacking:completeAnimation()
		Glow:completeAnimation()
		dash:setAlpha( 1 )
		dashBacking:setAlpha( 0 )
		Glow:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				dashBacking:completeAnimation()
				self.dashBacking:setAlpha( 0.5 )
				self.clipFinished( dashBacking, {} )
				dash:completeAnimation()
				self.dash:setAlpha( 0 )
				self.clipFinished( dash, {} )
			end,
			PointSpending = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local dashBackingFrame2 = function ( dashBacking, event )
					if not event.interrupted then
						dashBacking:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
					end
					dashBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( dashBacking, event )
					else
						dashBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				dashBacking:completeAnimation()
				self.dashBacking:setAlpha( 0.5 )
				dashBackingFrame2( dashBacking, {} )
				local dashFrame2 = function ( dash, event )
					local dashFrame3 = function ( dash, event )
						local dashFrame4 = function ( dash, event )
							local dashFrame5 = function ( dash, event )
								local dashFrame6 = function ( dash, event )
									local dashFrame7 = function ( dash, event )
										local dashFrame8 = function ( dash, event )
											local dashFrame9 = function ( dash, event )
												local dashFrame10 = function ( dash, event )
													local dashFrame11 = function ( dash, event )
														if not event.interrupted then
															dash:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
														end
														dash:setAlpha( 1 )
														if event.interrupted then
															self.clipFinished( dash, event )
														else
															dash:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														dashFrame11( dash, event )
														return 
													else
														dash:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
														dash:setAlpha( 0.76 )
														dash:registerEventHandler( "transition_complete_keyframe", dashFrame11 )
													end
												end
												
												if event.interrupted then
													dashFrame10( dash, event )
													return 
												else
													dash:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
													dash:registerEventHandler( "transition_complete_keyframe", dashFrame10 )
												end
											end
											
											if event.interrupted then
												dashFrame9( dash, event )
												return 
											else
												dash:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												dash:setAlpha( 0.4 )
												dash:registerEventHandler( "transition_complete_keyframe", dashFrame9 )
											end
										end
										
										if event.interrupted then
											dashFrame8( dash, event )
											return 
										else
											dash:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											dash:registerEventHandler( "transition_complete_keyframe", dashFrame8 )
										end
									end
									
									if event.interrupted then
										dashFrame7( dash, event )
										return 
									else
										dash:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										dash:setAlpha( 1 )
										dash:registerEventHandler( "transition_complete_keyframe", dashFrame7 )
									end
								end
								
								if event.interrupted then
									dashFrame6( dash, event )
									return 
								else
									dash:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									dash:registerEventHandler( "transition_complete_keyframe", dashFrame6 )
								end
							end
							
							if event.interrupted then
								dashFrame5( dash, event )
								return 
							else
								dash:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								dash:setAlpha( 0 )
								dash:registerEventHandler( "transition_complete_keyframe", dashFrame5 )
							end
						end
						
						if event.interrupted then
							dashFrame4( dash, event )
							return 
						else
							dash:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
							dash:registerEventHandler( "transition_complete_keyframe", dashFrame4 )
						end
					end
					
					if event.interrupted then
						dashFrame3( dash, event )
						return 
					else
						dash:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						dash:setAlpha( 0.5 )
						dash:registerEventHandler( "transition_complete_keyframe", dashFrame3 )
					end
				end
				
				dash:completeAnimation()
				self.dash:setAlpha( 0 )
				dashFrame2( dash, {} )
				local GlowFrame2 = function ( Glow, event )
					local GlowFrame3 = function ( Glow, event )
						if not event.interrupted then
							Glow:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						Glow:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Glow, event )
						else
							Glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowFrame3( Glow, event )
						return 
					else
						Glow:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						Glow:setAlpha( 1 )
						Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame3 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", GlowFrame2 )
			end,
			PointSpent = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

