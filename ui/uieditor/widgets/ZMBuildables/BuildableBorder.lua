-- 1df0206bed6d517100a0d239110a461a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMBuildables.BuildableBorder_Internal" )

CoD.BuildableBorder = InheritFrom( LUI.UIElement )
CoD.BuildableBorder.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BuildableBorder )
	self.id = "BuildableBorder"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 50 )
	
	local border = CoD.BuildableBorder_Internal.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setAlpha( 0.25 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( 1, 1, 1 )
				self.border:setAlpha( 0.25 )
				self.clipFinished( border, {} )
			end,
			PulseRed = function ()
				self:setupElementClipCounter( 1 )
				local borderFrame2 = function ( border, event )
					local borderFrame3 = function ( border, event )
						local borderFrame4 = function ( border, event )
							local borderFrame5 = function ( border, event )
								local borderFrame6 = function ( border, event )
									local borderFrame7 = function ( border, event )
										local borderFrame8 = function ( border, event )
											local borderFrame9 = function ( border, event )
												local borderFrame10 = function ( border, event )
													local borderFrame11 = function ( border, event )
														local borderFrame12 = function ( border, event )
															if not event.interrupted then
																border:beginAnimation( "keyframe", 96, false, false, CoD.TweenType.Linear )
															end
															border:setRGB( 1, 1, 1 )
															border:setAlpha( 0.25 )
															if event.interrupted then
																self.clipFinished( border, event )
															else
																border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
															end
														end
														
														if event.interrupted then
															borderFrame12( border, event )
															return 
														else
															border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
															border:setAlpha( 0.1 )
															border:registerEventHandler( "transition_complete_keyframe", borderFrame12 )
														end
													end
													
													if event.interrupted then
														borderFrame11( border, event )
														return 
													else
														border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
														border:setAlpha( 1 )
														border:registerEventHandler( "transition_complete_keyframe", borderFrame11 )
													end
												end
												
												if event.interrupted then
													borderFrame10( border, event )
													return 
												else
													border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
													border:setAlpha( 0.1 )
													border:registerEventHandler( "transition_complete_keyframe", borderFrame10 )
												end
											end
											
											if event.interrupted then
												borderFrame9( border, event )
												return 
											else
												border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
												border:setAlpha( 1 )
												border:registerEventHandler( "transition_complete_keyframe", borderFrame9 )
											end
										end
										
										if event.interrupted then
											borderFrame8( border, event )
											return 
										else
											border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
											border:setAlpha( 0.1 )
											border:registerEventHandler( "transition_complete_keyframe", borderFrame8 )
										end
									end
									
									if event.interrupted then
										borderFrame7( border, event )
										return 
									else
										border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
										border:setAlpha( 1 )
										border:registerEventHandler( "transition_complete_keyframe", borderFrame7 )
									end
								end
								
								if event.interrupted then
									borderFrame6( border, event )
									return 
								else
									border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									border:setAlpha( 0.1 )
									border:registerEventHandler( "transition_complete_keyframe", borderFrame6 )
								end
							end
							
							if event.interrupted then
								borderFrame5( border, event )
								return 
							else
								border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								border:setAlpha( 1 )
								border:registerEventHandler( "transition_complete_keyframe", borderFrame5 )
							end
						end
						
						if event.interrupted then
							borderFrame4( border, event )
							return 
						else
							border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							border:setAlpha( 0.1 )
							border:registerEventHandler( "transition_complete_keyframe", borderFrame4 )
						end
					end
					
					if event.interrupted then
						borderFrame3( border, event )
						return 
					else
						border:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						border:setAlpha( 1 )
						border:registerEventHandler( "transition_complete_keyframe", borderFrame3 )
					end
				end
				
				border:completeAnimation()
				self.border:setRGB( 1, 0, 0 )
				self.border:setAlpha( 0.1 )
				borderFrame2( border, {} )
			end
		},
		CurrentItem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( 1, 0, 0 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.border:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

