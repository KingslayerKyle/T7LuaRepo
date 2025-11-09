local PostLoadFunc = function ( f1_arg0 )
	f1_arg0:setState( "DefaultState" )
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
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 32 )
	
	local dashBacking = LUI.UIImage.new()
	dashBacking:setLeftRight( true, false, 0, 16 )
	dashBacking:setTopBottom( true, false, 0, 32 )
	dashBacking:setAlpha( 0 )
	dashBacking:setImage( RegisterImage( "uie_t7_menu_cac_allocationbarempty" ) )
	dashBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( dashBacking )
	self.dashBacking = dashBacking
	
	local dash = LUI.UIImage.new()
	dash:setLeftRight( true, false, 0, 16 )
	dash:setTopBottom( true, false, 0, 32 )
	dash:setImage( RegisterImage( "uie_t7_menu_cac_allocationbarfull" ) )
	dash:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( dash )
	self.dash = dash
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, -13, 31 )
	Glow:setTopBottom( true, false, -15.77, 45.23 )
	Glow:setRGB( 0.84, 0.91, 1 )
	Glow:setAlpha( 0 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				dashBacking:completeAnimation()
				self.dashBacking:setAlpha( 0.5 )
				self.clipFinished( dashBacking, {} )
				dash:completeAnimation()
				self.dash:setAlpha( 0 )
				self.clipFinished( dash, {} )
			end,
			PointSpending = function ()
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
				local f4_local2 = function ( f16_arg0, f16_arg1 )
					local f16_local0 = function ( f17_arg0, f17_arg1 )
						if not f17_arg1.interrupted then
							f17_arg0:beginAnimation( "keyframe", 430, false, false, CoD.TweenType.Linear )
						end
						f17_arg0:setAlpha( 0 )
						if f17_arg1.interrupted then
							self.clipFinished( f17_arg0, f17_arg1 )
						else
							f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if f16_arg1.interrupted then
						f16_local0( f16_arg0, f16_arg1 )
						return 
					else
						f16_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						f16_arg0:setAlpha( 1 )
						f16_arg0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:registerEventHandler( "transition_complete_keyframe", f4_local2 )
			end,
			PointSpent = function ()
				self:setupElementClipCounter( 2 )
				dashBacking:completeAnimation()
				self.dashBacking:setAlpha( 0 )
				self.clipFinished( dashBacking, {} )
				dash:completeAnimation()
				self.dash:setAlpha( 1 )
				self.clipFinished( dash, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

