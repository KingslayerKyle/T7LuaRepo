-- aacbe78caa7d1bc5d1256506ee94a895
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRingIn" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_CenterInnerRingOutter" )

CoD.VehicleGround_CenterInnerRingOutterCountainter = InheritFrom( LUI.UIElement )
CoD.VehicleGround_CenterInnerRingOutterCountainter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_CenterInnerRingOutterCountainter )
	self.id = "VehicleGround_CenterInnerRingOutterCountainter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 608 )
	self:setTopBottom( true, false, 0, 608 )
	self.anyChildUsesUpdateState = true
	
	local InnerRingIn = CoD.VehicleGround_CenterInnerRingIn.new( menu, controller )
	InnerRingIn:setLeftRight( false, false, -304, 304 )
	InnerRingIn:setTopBottom( false, false, -304, 304 )
	InnerRingIn:setZRot( -55 )
	self:addElement( InnerRingIn )
	self.InnerRingIn = InnerRingIn
	
	local InnerRingOutter = CoD.VehicleGround_CenterInnerRingOutter.new( menu, controller )
	InnerRingOutter:setLeftRight( false, false, -304, 304 )
	InnerRingOutter:setTopBottom( false, false, -304, 304 )
	InnerRingOutter:setAlpha( 0.49 )
	self:addElement( InnerRingOutter )
	self.InnerRingOutter = InnerRingOutter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local InnerRingInFrame2 = function ( InnerRingIn, event )
					local InnerRingInFrame3 = function ( InnerRingIn, event )
						local InnerRingInFrame4 = function ( InnerRingIn, event )
							local InnerRingInFrame5 = function ( InnerRingIn, event )
								local InnerRingInFrame6 = function ( InnerRingIn, event )
									local InnerRingInFrame7 = function ( InnerRingIn, event )
										local InnerRingInFrame8 = function ( InnerRingIn, event )
											local InnerRingInFrame9 = function ( InnerRingIn, event )
												local InnerRingInFrame10 = function ( InnerRingIn, event )
													local InnerRingInFrame11 = function ( InnerRingIn, event )
														if not event.interrupted then
															InnerRingIn:beginAnimation( "keyframe", 4260, true, true, CoD.TweenType.Linear )
														end
														InnerRingIn:setLeftRight( false, false, -304, 304 )
														InnerRingIn:setTopBottom( false, false, -304, 304 )
														InnerRingIn:setAlpha( 1 )
														InnerRingIn:setZRot( -55 )
														InnerRingIn:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( InnerRingIn, event )
														else
															InnerRingIn:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														InnerRingInFrame11( InnerRingIn, event )
														return 
													else
														InnerRingIn:beginAnimation( "keyframe", 4039, true, true, CoD.TweenType.Linear )
														InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame11 )
													end
												end
												
												if event.interrupted then
													InnerRingInFrame10( InnerRingIn, event )
													return 
												else
													InnerRingIn:beginAnimation( "keyframe", 4020, true, true, CoD.TweenType.Linear )
													InnerRingIn:setLeftRight( false, false, -290, 290 )
													InnerRingIn:setTopBottom( false, false, -290, 290 )
													InnerRingIn:setZRot( -5 )
													InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame10 )
												end
											end
											
											if event.interrupted then
												InnerRingInFrame9( InnerRingIn, event )
												return 
											else
												InnerRingIn:beginAnimation( "keyframe", 2340, false, false, CoD.TweenType.Linear )
												InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame9 )
											end
										end
										
										if event.interrupted then
											InnerRingInFrame8( InnerRingIn, event )
											return 
										else
											InnerRingIn:beginAnimation( "keyframe", 3680, true, true, CoD.TweenType.Linear )
											InnerRingIn:setLeftRight( false, false, -304, 304 )
											InnerRingIn:setTopBottom( false, false, -304, 304 )
											InnerRingIn:setZRot( 13 )
											InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame8 )
										end
									end
									
									if event.interrupted then
										InnerRingInFrame7( InnerRingIn, event )
										return 
									else
										InnerRingIn:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
										InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame7 )
									end
								end
								
								if event.interrupted then
									InnerRingInFrame6( InnerRingIn, event )
									return 
								else
									InnerRingIn:beginAnimation( "keyframe", 3100, true, true, CoD.TweenType.Linear )
									InnerRingIn:setZRot( -48 )
									InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame6 )
								end
							end
							
							if event.interrupted then
								InnerRingInFrame5( InnerRingIn, event )
								return 
							else
								InnerRingIn:beginAnimation( "keyframe", 2199, false, false, CoD.TweenType.Linear )
								InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame5 )
							end
						end
						
						if event.interrupted then
							InnerRingInFrame4( InnerRingIn, event )
							return 
						else
							InnerRingIn:beginAnimation( "keyframe", 1990, true, true, CoD.TweenType.Linear )
							InnerRingIn:setLeftRight( false, false, -290, 290 )
							InnerRingIn:setTopBottom( false, false, -290, 290 )
							InnerRingIn:setZRot( -42 )
							InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame4 )
						end
					end
					
					if event.interrupted then
						InnerRingInFrame3( InnerRingIn, event )
						return 
					else
						InnerRingIn:beginAnimation( "keyframe", 3309, false, false, CoD.TweenType.Linear )
						InnerRingIn:registerEventHandler( "transition_complete_keyframe", InnerRingInFrame3 )
					end
				end
				
				InnerRingIn:completeAnimation()
				self.InnerRingIn:setLeftRight( false, false, -304, 304 )
				self.InnerRingIn:setTopBottom( false, false, -304, 304 )
				self.InnerRingIn:setAlpha( 1 )
				self.InnerRingIn:setZRot( -55 )
				self.InnerRingIn:setZoom( 0 )
				InnerRingInFrame2( InnerRingIn, {} )
				local InnerRingOutterFrame2 = function ( InnerRingOutter, event )
					local InnerRingOutterFrame3 = function ( InnerRingOutter, event )
						local InnerRingOutterFrame4 = function ( InnerRingOutter, event )
							local InnerRingOutterFrame5 = function ( InnerRingOutter, event )
								local InnerRingOutterFrame6 = function ( InnerRingOutter, event )
									local InnerRingOutterFrame7 = function ( InnerRingOutter, event )
										local InnerRingOutterFrame8 = function ( InnerRingOutter, event )
											local InnerRingOutterFrame9 = function ( InnerRingOutter, event )
												local InnerRingOutterFrame10 = function ( InnerRingOutter, event )
													local InnerRingOutterFrame11 = function ( InnerRingOutter, event )
														if not event.interrupted then
															InnerRingOutter:beginAnimation( "keyframe", 4260, false, false, CoD.TweenType.Linear )
														end
														InnerRingOutter:setLeftRight( false, false, -304, 304 )
														InnerRingOutter:setTopBottom( false, false, -304, 304 )
														InnerRingOutter:setZRot( 0 )
														InnerRingOutter:setZoom( 0 )
														if event.interrupted then
															self.clipFinished( InnerRingOutter, event )
														else
															InnerRingOutter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
														end
													end
													
													if event.interrupted then
														InnerRingOutterFrame11( InnerRingOutter, event )
														return 
													else
														InnerRingOutter:beginAnimation( "keyframe", 4039, false, false, CoD.TweenType.Linear )
														InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame11 )
													end
												end
												
												if event.interrupted then
													InnerRingOutterFrame10( InnerRingOutter, event )
													return 
												else
													InnerRingOutter:beginAnimation( "keyframe", 4020, false, false, CoD.TweenType.Linear )
													InnerRingOutter:setZRot( 19 )
													InnerRingOutter:setZoom( 0 )
													InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame10 )
												end
											end
											
											if event.interrupted then
												InnerRingOutterFrame9( InnerRingOutter, event )
												return 
											else
												InnerRingOutter:beginAnimation( "keyframe", 2340, false, false, CoD.TweenType.Linear )
												InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame9 )
											end
										end
										
										if event.interrupted then
											InnerRingOutterFrame8( InnerRingOutter, event )
											return 
										else
											InnerRingOutter:beginAnimation( "keyframe", 3680, true, true, CoD.TweenType.Linear )
											InnerRingOutter:setZRot( -12 )
											InnerRingOutter:setZoom( -55 )
											InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame8 )
										end
									end
									
									if event.interrupted then
										InnerRingOutterFrame7( InnerRingOutter, event )
										return 
									else
										InnerRingOutter:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
										InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame7 )
									end
								end
								
								if event.interrupted then
									InnerRingOutterFrame6( InnerRingOutter, event )
									return 
								else
									InnerRingOutter:beginAnimation( "keyframe", 3100, true, true, CoD.TweenType.Linear )
									InnerRingOutter:setZRot( 9 )
									InnerRingOutter:setZoom( 0 )
									InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame6 )
								end
							end
							
							if event.interrupted then
								InnerRingOutterFrame5( InnerRingOutter, event )
								return 
							else
								InnerRingOutter:beginAnimation( "keyframe", 2199, false, false, CoD.TweenType.Linear )
								InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame5 )
							end
						end
						
						if event.interrupted then
							InnerRingOutterFrame4( InnerRingOutter, event )
							return 
						else
							InnerRingOutter:beginAnimation( "keyframe", 1990, true, true, CoD.TweenType.Linear )
							InnerRingOutter:setZRot( -11 )
							InnerRingOutter:setZoom( -55 )
							InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame4 )
						end
					end
					
					if event.interrupted then
						InnerRingOutterFrame3( InnerRingOutter, event )
						return 
					else
						InnerRingOutter:beginAnimation( "keyframe", 3309, false, false, CoD.TweenType.Linear )
						InnerRingOutter:registerEventHandler( "transition_complete_keyframe", InnerRingOutterFrame3 )
					end
				end
				
				InnerRingOutter:completeAnimation()
				self.InnerRingOutter:setLeftRight( false, false, -304, 304 )
				self.InnerRingOutter:setTopBottom( false, false, -304, 304 )
				self.InnerRingOutter:setZRot( 0 )
				self.InnerRingOutter:setZoom( 0 )
				InnerRingOutterFrame2( InnerRingOutter, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return HideVehicleReticle( self, controller, event )
			end
		}
	} )
	self:linkToElementModel( self, "vehicleType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicleType"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.InnerRingIn:close()
		element.InnerRingOutter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

