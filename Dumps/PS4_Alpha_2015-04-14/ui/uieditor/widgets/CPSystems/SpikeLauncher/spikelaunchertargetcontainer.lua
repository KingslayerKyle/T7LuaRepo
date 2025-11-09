require( "ui.uieditor.widgets.CPSystems.SpikeLauncher.SpikeLauncherTarget" )

CoD.SpikeLauncherTargetContainer = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherTargetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherTargetContainer )
	self.id = "SpikeLauncherTargetContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 381 )
	self:setTopBottom( true, false, 0, 381 )
	self.anyChildUsesUpdateState = true
	
	local SpikeLauncherTarget0 = CoD.SpikeLauncherTarget.new( menu, controller )
	SpikeLauncherTarget0:setLeftRight( true, false, 0, 381 )
	SpikeLauncherTarget0:setTopBottom( true, false, 0, 381 )
	SpikeLauncherTarget0:setRGB( 1, 1, 1 )
	self:addElement( SpikeLauncherTarget0 )
	self.SpikeLauncherTarget0 = SpikeLauncherTarget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				SpikeLauncherTarget0:completeAnimation()
				self.SpikeLauncherTarget0:setAlpha( 0 )
				self.clipFinished( SpikeLauncherTarget0, {} )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local SpikeLauncherTarget0Frame2 = function ( SpikeLauncherTarget0, event )
					local SpikeLauncherTarget0Frame3 = function ( SpikeLauncherTarget0, event )
						local SpikeLauncherTarget0Frame4 = function ( SpikeLauncherTarget0, event )
							local SpikeLauncherTarget0Frame5 = function ( SpikeLauncherTarget0, event )
								local SpikeLauncherTarget0Frame6 = function ( SpikeLauncherTarget0, event )
									local SpikeLauncherTarget0Frame7 = function ( SpikeLauncherTarget0, event )
										local SpikeLauncherTarget0Frame8 = function ( SpikeLauncherTarget0, event )
											local SpikeLauncherTarget0Frame9 = function ( SpikeLauncherTarget0, event )
												if not event.interrupted then
													SpikeLauncherTarget0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												end
												SpikeLauncherTarget0:setAlpha( 1 )
												if event.interrupted then
													self.clipFinished( SpikeLauncherTarget0, event )
												else
													SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												SpikeLauncherTarget0Frame9( SpikeLauncherTarget0, event )
												return 
											else
												SpikeLauncherTarget0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
												SpikeLauncherTarget0:setAlpha( 0 )
												SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame9 )
											end
										end
										
										if event.interrupted then
											SpikeLauncherTarget0Frame8( SpikeLauncherTarget0, event )
											return 
										else
											SpikeLauncherTarget0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											SpikeLauncherTarget0:setAlpha( 0.64 )
											SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame8 )
										end
									end
									
									if event.interrupted then
										SpikeLauncherTarget0Frame7( SpikeLauncherTarget0, event )
										return 
									else
										SpikeLauncherTarget0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame7 )
									end
								end
								
								if event.interrupted then
									SpikeLauncherTarget0Frame6( SpikeLauncherTarget0, event )
									return 
								else
									SpikeLauncherTarget0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									SpikeLauncherTarget0:setAlpha( 0 )
									SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame6 )
								end
							end
							
							if event.interrupted then
								SpikeLauncherTarget0Frame5( SpikeLauncherTarget0, event )
								return 
							else
								SpikeLauncherTarget0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
								SpikeLauncherTarget0:setAlpha( 1 )
								SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame5 )
							end
						end
						
						if event.interrupted then
							SpikeLauncherTarget0Frame4( SpikeLauncherTarget0, event )
							return 
						else
							SpikeLauncherTarget0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							SpikeLauncherTarget0:setAlpha( 0 )
							SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame4 )
						end
					end
					
					if event.interrupted then
						SpikeLauncherTarget0Frame3( SpikeLauncherTarget0, event )
						return 
					else
						SpikeLauncherTarget0:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						SpikeLauncherTarget0:setAlpha( 1 )
						SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame3 )
					end
				end
				
				SpikeLauncherTarget0:completeAnimation()
				self.SpikeLauncherTarget0:setAlpha( 0 )
				SpikeLauncherTarget0Frame2( SpikeLauncherTarget0, {} )
			end
		},
		Off = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local SpikeLauncherTarget0Frame2 = function ( SpikeLauncherTarget0, event )
					local SpikeLauncherTarget0Frame3 = function ( SpikeLauncherTarget0, event )
						local SpikeLauncherTarget0Frame4 = function ( SpikeLauncherTarget0, event )
							local SpikeLauncherTarget0Frame5 = function ( SpikeLauncherTarget0, event )
								local SpikeLauncherTarget0Frame6 = function ( SpikeLauncherTarget0, event )
									local SpikeLauncherTarget0Frame7 = function ( SpikeLauncherTarget0, event )
										if not event.interrupted then
											SpikeLauncherTarget0:beginAnimation( "keyframe", 349, false, false, CoD.TweenType.Linear )
										end
										SpikeLauncherTarget0:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( SpikeLauncherTarget0, event )
										else
											SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										SpikeLauncherTarget0Frame7( SpikeLauncherTarget0, event )
										return 
									else
										SpikeLauncherTarget0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										SpikeLauncherTarget0:setAlpha( 1 )
										SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame7 )
									end
								end
								
								if event.interrupted then
									SpikeLauncherTarget0Frame6( SpikeLauncherTarget0, event )
									return 
								else
									SpikeLauncherTarget0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame6 )
								end
							end
							
							if event.interrupted then
								SpikeLauncherTarget0Frame5( SpikeLauncherTarget0, event )
								return 
							else
								SpikeLauncherTarget0:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
								SpikeLauncherTarget0:setAlpha( 0.5 )
								SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame5 )
							end
						end
						
						if event.interrupted then
							SpikeLauncherTarget0Frame4( SpikeLauncherTarget0, event )
							return 
						else
							SpikeLauncherTarget0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							SpikeLauncherTarget0:setAlpha( 1 )
							SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame4 )
						end
					end
					
					if event.interrupted then
						SpikeLauncherTarget0Frame3( SpikeLauncherTarget0, event )
						return 
					else
						SpikeLauncherTarget0:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
						SpikeLauncherTarget0:setAlpha( 0.43 )
						SpikeLauncherTarget0:registerEventHandler( "transition_complete_keyframe", SpikeLauncherTarget0Frame3 )
					end
				end
				
				SpikeLauncherTarget0:completeAnimation()
				self.SpikeLauncherTarget0:setAlpha( 1 )
				SpikeLauncherTarget0Frame2( SpikeLauncherTarget0, {} )
			end
		}
	}
	self.close = function ( self )
		self.SpikeLauncherTarget0:close()
		CoD.SpikeLauncherTargetContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

