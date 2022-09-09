-- 8bc3f9c12e29b8a4eabc89ac15f95469
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DniWipe.DniWipe_TopLineBlink" )

CoD.CP_Prologue_FaceScanner_LoadingLines = InheritFrom( LUI.UIElement )
CoD.CP_Prologue_FaceScanner_LoadingLines.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CP_Prologue_FaceScanner_LoadingLines )
	self.id = "CP_Prologue_FaceScanner_LoadingLines"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 187 )
	self:setTopBottom( true, false, 0, 15 )
	self.anyChildUsesUpdateState = true
	
	local DniWipeTopLineBlink = CoD.DniWipe_TopLineBlink.new( menu, controller )
	DniWipeTopLineBlink:setLeftRight( false, false, 78.25, 93.25 )
	DniWipeTopLineBlink:setTopBottom( false, false, -7.5, 7.5 )
	DniWipeTopLineBlink:setZRot( 90 )
	DniWipeTopLineBlink:setScale( 0.8 )
	self:addElement( DniWipeTopLineBlink )
	self.DniWipeTopLineBlink = DniWipeTopLineBlink
	
	local DniWipeTopLineBlink0 = CoD.DniWipe_TopLineBlink.new( menu, controller )
	DniWipeTopLineBlink0:setLeftRight( false, false, -93.25, -78.25 )
	DniWipeTopLineBlink0:setTopBottom( false, false, -7.5, 7.5 )
	DniWipeTopLineBlink0:setZRot( 90 )
	DniWipeTopLineBlink0:setScale( 0.8 )
	self:addElement( DniWipeTopLineBlink0 )
	self.DniWipeTopLineBlink0 = DniWipeTopLineBlink0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local DniWipeTopLineBlinkFrame2 = function ( DniWipeTopLineBlink, event )
					local DniWipeTopLineBlinkFrame3 = function ( DniWipeTopLineBlink, event )
						local DniWipeTopLineBlinkFrame4 = function ( DniWipeTopLineBlink, event )
							local DniWipeTopLineBlinkFrame5 = function ( DniWipeTopLineBlink, event )
								local DniWipeTopLineBlinkFrame6 = function ( DniWipeTopLineBlink, event )
									local DniWipeTopLineBlinkFrame7 = function ( DniWipeTopLineBlink, event )
										local DniWipeTopLineBlinkFrame8 = function ( DniWipeTopLineBlink, event )
											if not event.interrupted then
												DniWipeTopLineBlink:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
											end
											DniWipeTopLineBlink:setLeftRight( false, false, 78.25, 93.25 )
											DniWipeTopLineBlink:setTopBottom( false, false, -7.5, 7.5 )
											DniWipeTopLineBlink:setAlpha( 0.76 )
											if event.interrupted then
												self.clipFinished( DniWipeTopLineBlink, event )
											else
												DniWipeTopLineBlink:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											DniWipeTopLineBlinkFrame8( DniWipeTopLineBlink, event )
											return 
										else
											DniWipeTopLineBlink:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
											DniWipeTopLineBlink:setLeftRight( false, false, -8.49, 6.51 )
											DniWipeTopLineBlink:setAlpha( 0.76 )
											DniWipeTopLineBlink:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlinkFrame8 )
										end
									end
									
									if event.interrupted then
										DniWipeTopLineBlinkFrame7( DniWipeTopLineBlink, event )
										return 
									else
										DniWipeTopLineBlink:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
										DniWipeTopLineBlink:setLeftRight( false, false, -34, -19 )
										DniWipeTopLineBlink:setAlpha( 0.85 )
										DniWipeTopLineBlink:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlinkFrame7 )
									end
								end
								
								if event.interrupted then
									DniWipeTopLineBlinkFrame6( DniWipeTopLineBlink, event )
									return 
								else
									DniWipeTopLineBlink:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									DniWipeTopLineBlink:setLeftRight( false, false, -42.8, -27.8 )
									DniWipeTopLineBlink:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlinkFrame6 )
								end
							end
							
							if event.interrupted then
								DniWipeTopLineBlinkFrame5( DniWipeTopLineBlink, event )
								return 
							else
								DniWipeTopLineBlink:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
								DniWipeTopLineBlink:setLeftRight( false, false, -45, -30 )
								DniWipeTopLineBlink:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlinkFrame5 )
							end
						end
						
						if event.interrupted then
							DniWipeTopLineBlinkFrame4( DniWipeTopLineBlink, event )
							return 
						else
							DniWipeTopLineBlink:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
							DniWipeTopLineBlink:setLeftRight( false, false, 0, 15 )
							DniWipeTopLineBlink:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlinkFrame4 )
						end
					end
					
					if event.interrupted then
						DniWipeTopLineBlinkFrame3( DniWipeTopLineBlink, event )
						return 
					else
						DniWipeTopLineBlink:beginAnimation( "keyframe", 280, false, false, CoD.TweenType.Linear )
						DniWipeTopLineBlink:setLeftRight( false, false, -15, 0 )
						DniWipeTopLineBlink:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlinkFrame3 )
					end
				end
				
				DniWipeTopLineBlink:completeAnimation()
				self.DniWipeTopLineBlink:setLeftRight( false, false, 78.25, 93.25 )
				self.DniWipeTopLineBlink:setTopBottom( false, false, -7.5, 7.5 )
				self.DniWipeTopLineBlink:setAlpha( 1 )
				DniWipeTopLineBlinkFrame2( DniWipeTopLineBlink, {} )
				local DniWipeTopLineBlink0Frame2 = function ( DniWipeTopLineBlink0, event )
					local DniWipeTopLineBlink0Frame3 = function ( DniWipeTopLineBlink0, event )
						local DniWipeTopLineBlink0Frame4 = function ( DniWipeTopLineBlink0, event )
							local DniWipeTopLineBlink0Frame5 = function ( DniWipeTopLineBlink0, event )
								local DniWipeTopLineBlink0Frame6 = function ( DniWipeTopLineBlink0, event )
									local DniWipeTopLineBlink0Frame7 = function ( DniWipeTopLineBlink0, event )
										if not event.interrupted then
											DniWipeTopLineBlink0:beginAnimation( "keyframe", 149, false, false, CoD.TweenType.Linear )
										end
										DniWipeTopLineBlink0:setLeftRight( false, false, -93.5, -78.5 )
										DniWipeTopLineBlink0:setTopBottom( false, false, -7.5, 7.5 )
										DniWipeTopLineBlink0:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( DniWipeTopLineBlink0, event )
										else
											DniWipeTopLineBlink0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										DniWipeTopLineBlink0Frame7( DniWipeTopLineBlink0, event )
										return 
									else
										DniWipeTopLineBlink0:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
										DniWipeTopLineBlink0:setLeftRight( false, false, 78.25, 93.25 )
										DniWipeTopLineBlink0:setAlpha( 0.21 )
										DniWipeTopLineBlink0:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlink0Frame7 )
									end
								end
								
								if event.interrupted then
									DniWipeTopLineBlink0Frame6( DniWipeTopLineBlink0, event )
									return 
								else
									DniWipeTopLineBlink0:beginAnimation( "keyframe", 240, false, false, CoD.TweenType.Linear )
									DniWipeTopLineBlink0:setLeftRight( false, false, 60.94, 75.94 )
									DniWipeTopLineBlink0:setAlpha( 0 )
									DniWipeTopLineBlink0:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlink0Frame6 )
								end
							end
							
							if event.interrupted then
								DniWipeTopLineBlink0Frame5( DniWipeTopLineBlink0, event )
								return 
							else
								DniWipeTopLineBlink0:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								DniWipeTopLineBlink0:setLeftRight( false, false, -42.92, -27.92 )
								DniWipeTopLineBlink0:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlink0Frame5 )
							end
						end
						
						if event.interrupted then
							DniWipeTopLineBlink0Frame4( DniWipeTopLineBlink0, event )
							return 
						else
							DniWipeTopLineBlink0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
							DniWipeTopLineBlink0:setLeftRight( false, false, -47.25, -32.25 )
							DniWipeTopLineBlink0:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlink0Frame4 )
						end
					end
					
					if event.interrupted then
						DniWipeTopLineBlink0Frame3( DniWipeTopLineBlink0, event )
						return 
					else
						DniWipeTopLineBlink0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						DniWipeTopLineBlink0:setLeftRight( false, false, -34.25, -19.25 )
						DniWipeTopLineBlink0:registerEventHandler( "transition_complete_keyframe", DniWipeTopLineBlink0Frame3 )
					end
				end
				
				DniWipeTopLineBlink0:completeAnimation()
				self.DniWipeTopLineBlink0:setLeftRight( false, false, -93.25, -78.25 )
				self.DniWipeTopLineBlink0:setTopBottom( false, false, -7.5, 7.5 )
				self.DniWipeTopLineBlink0:setAlpha( 1 )
				DniWipeTopLineBlink0Frame2( DniWipeTopLineBlink0, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Scanning = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		PossibleMatch = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Found = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Failed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DniWipeTopLineBlink:close()
		element.DniWipeTopLineBlink0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
