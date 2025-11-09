require( "ui.uieditor.widgets.CPSystems.Rigs.Notification_Rigs" )

CoD.NotificationRigsContainer = InheritFrom( LUI.UIElement )
CoD.NotificationRigsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationRigsContainer )
	self.id = "NotificationRigsContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 170 )
	self.anyChildUsesUpdateState = true
	
	local Rigs = CoD.Notification_Rigs.new( menu, controller )
	Rigs:setLeftRight( true, true, 0, 0 )
	Rigs:setTopBottom( true, true, 0, 0 )
	Rigs:setRGB( 1, 1, 1 )
	Rigs:setYRot( -30 )
	Rigs:setZoom( -70 )
	Rigs:subscribeToGlobalModel( controller, "PerController", "rigs", function ( model )
		Rigs:setModel( model, controller )
	end )
	self:addElement( Rigs )
	self.Rigs = Rigs
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Rigs:completeAnimation()
				self.Rigs:setAlpha( 0 )
				self.Rigs:setZoom( 0 )
				self.clipFinished( Rigs, {} )
			end
		},
		HudStart = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local RigsFrame2 = function ( Rigs, event )
					local RigsFrame3 = function ( Rigs, event )
						local RigsFrame4 = function ( Rigs, event )
							local RigsFrame5 = function ( Rigs, event )
								local RigsFrame6 = function ( Rigs, event )
									local RigsFrame7 = function ( Rigs, event )
										local RigsFrame8 = function ( Rigs, event )
											local RigsFrame9 = function ( Rigs, event )
												if not event.interrupted then
													Rigs:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
												end
												Rigs:setAlpha( 1 )
												Rigs:setZoom( 0 )
												if event.interrupted then
													self.clipFinished( Rigs, event )
												else
													Rigs:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
												end
											end
											
											if event.interrupted then
												RigsFrame9( Rigs, event )
												return 
											else
												Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
												Rigs:setAlpha( 1 )
												Rigs:setZoom( 0 )
												Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame9 )
											end
										end
										
										if event.interrupted then
											RigsFrame8( Rigs, event )
											return 
										else
											Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
											Rigs:setAlpha( 0.37 )
											Rigs:setZoom( -3.08 )
											Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame8 )
										end
									end
									
									if event.interrupted then
										RigsFrame7( Rigs, event )
										return 
									else
										Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										Rigs:setAlpha( 1 )
										Rigs:setZoom( -6.16 )
										Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame7 )
									end
								end
								
								if event.interrupted then
									RigsFrame6( Rigs, event )
									return 
								else
									Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									Rigs:setAlpha( 0.14 )
									Rigs:setZoom( -9.24 )
									Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame6 )
								end
							end
							
							if event.interrupted then
								RigsFrame5( Rigs, event )
								return 
							else
								Rigs:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								Rigs:setAlpha( 0.72 )
								Rigs:setZoom( -12.32 )
								Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame5 )
							end
						end
						
						if event.interrupted then
							RigsFrame4( Rigs, event )
							return 
						else
							Rigs:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
							Rigs:setAlpha( 0.4 )
							Rigs:setZoom( -15.4 )
							Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame4 )
						end
					end
					
					if event.interrupted then
						RigsFrame3( Rigs, event )
						return 
					else
						Rigs:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
						Rigs:setAlpha( 0.72 )
						Rigs:setZoom( -18.48 )
						Rigs:registerEventHandler( "transition_complete_keyframe", RigsFrame3 )
					end
				end
				
				Rigs:completeAnimation()
				self.Rigs:setAlpha( 0 )
				self.Rigs:setZoom( -77 )
				RigsFrame2( Rigs, {} )
			end
		}
	}
	self.close = function ( self )
		self.Rigs:close()
		CoD.NotificationRigsContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

