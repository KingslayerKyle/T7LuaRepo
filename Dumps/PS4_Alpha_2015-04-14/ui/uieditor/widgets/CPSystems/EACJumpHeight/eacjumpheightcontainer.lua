require( "ui.uieditor.widgets.CPSystems.EACJumpHeight.EACJumpHeight" )

CoD.EACJumpHeightContainer = InheritFrom( LUI.UIElement )
CoD.EACJumpHeightContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EACJumpHeightContainer )
	self.id = "EACJumpHeightContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 392 )
	self:setTopBottom( true, false, 0, 258 )
	self.anyChildUsesUpdateState = true
	
	local EACJumpHeight = CoD.EACJumpHeight.new( menu, controller )
	EACJumpHeight:setLeftRight( true, false, 0, 392.06 )
	EACJumpHeight:setTopBottom( true, false, 0, 258.33 )
	EACJumpHeight:setRGB( 1, 1, 1 )
	EACJumpHeight.ArrowTop:setAlpha( 0 )
	EACJumpHeight.FrameTop:setAlpha( 0 )
	EACJumpHeight.MeterIcon:setAlpha( 0 )
	EACJumpHeight.Line:setAlpha( 0 )
	EACJumpHeight.TextMessage:setAlpha( 0 )
	EACJumpHeight.TextHeight:setAlpha( 0 )
	self:addElement( EACJumpHeight )
	self.EACJumpHeight = EACJumpHeight
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				EACJumpHeight:completeAnimation()
				EACJumpHeight.ArrowTop:completeAnimation()
				EACJumpHeight.FrameTop:completeAnimation()
				EACJumpHeight.MeterIcon:completeAnimation()
				EACJumpHeight.Line:completeAnimation()
				EACJumpHeight.TextMessage:completeAnimation()
				EACJumpHeight.TextHeight:completeAnimation()
				self.EACJumpHeight.ArrowTop:setAlpha( 0 )
				self.EACJumpHeight.FrameTop:setAlpha( 0 )
				self.EACJumpHeight.MeterIcon:setAlpha( 0 )
				self.EACJumpHeight.Line:setAlpha( 0 )
				self.EACJumpHeight.TextMessage:setAlpha( 0 )
				self.EACJumpHeight.TextHeight:setAlpha( 0 )
				self.clipFinished( EACJumpHeight, {} )
			end,
			On = function ()
				self:setupElementClipCounter( 1 )
				local EACJumpHeightFrame2 = function ( EACJumpHeight, event )
					local EACJumpHeightFrame3 = function ( EACJumpHeight, event )
						local EACJumpHeightFrame4 = function ( EACJumpHeight, event )
							local EACJumpHeightFrame5 = function ( EACJumpHeight, event )
								local EACJumpHeightFrame6 = function ( EACJumpHeight, event )
									local EACJumpHeightFrame7 = function ( EACJumpHeight, event )
										if not event.interrupted then
											EACJumpHeight:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.Line:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
										end
										EACJumpHeight.ArrowTop:setAlpha( 1 )
										EACJumpHeight.FrameTop:setAlpha( 1 )
										EACJumpHeight.MeterIcon:setAlpha( 1 )
										EACJumpHeight.Line:setAlpha( 1 )
										EACJumpHeight.TextMessage:setAlpha( 1 )
										EACJumpHeight.TextHeight:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( EACJumpHeight, event )
										else
											EACJumpHeight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										EACJumpHeightFrame7( EACJumpHeight, event )
										return 
									else
										EACJumpHeight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame7 )
									end
								end
								
								if event.interrupted then
									EACJumpHeightFrame6( EACJumpHeight, event )
									return 
								else
									EACJumpHeight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.Line:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.ArrowTop:setAlpha( 0.2 )
									EACJumpHeight.FrameTop:setAlpha( 0.2 )
									EACJumpHeight.MeterIcon:setAlpha( 0.2 )
									EACJumpHeight.Line:setAlpha( 0.2 )
									EACJumpHeight.TextMessage:setAlpha( 0.2 )
									EACJumpHeight.TextHeight:setAlpha( 0.2 )
									EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame6 )
								end
							end
							
							if event.interrupted then
								EACJumpHeightFrame5( EACJumpHeight, event )
								return 
							else
								EACJumpHeight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.Line:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.ArrowTop:setAlpha( 1 )
								EACJumpHeight.FrameTop:setAlpha( 1 )
								EACJumpHeight.MeterIcon:setAlpha( 1 )
								EACJumpHeight.Line:setAlpha( 1 )
								EACJumpHeight.TextMessage:setAlpha( 1 )
								EACJumpHeight.TextHeight:setAlpha( 1 )
								EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame5 )
							end
						end
						
						if event.interrupted then
							EACJumpHeightFrame4( EACJumpHeight, event )
							return 
						else
							EACJumpHeight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.Line:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.ArrowTop:setAlpha( 0.1 )
							EACJumpHeight.FrameTop:setAlpha( 0.1 )
							EACJumpHeight.MeterIcon:setAlpha( 0.1 )
							EACJumpHeight.Line:setAlpha( 0.1 )
							EACJumpHeight.TextMessage:setAlpha( 0.1 )
							EACJumpHeight.TextHeight:setAlpha( 0.1 )
							EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame4 )
						end
					end
					
					if event.interrupted then
						EACJumpHeightFrame3( EACJumpHeight, event )
						return 
					else
						EACJumpHeight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.Line:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.ArrowTop:setAlpha( 0.6 )
						EACJumpHeight.FrameTop:setAlpha( 0.6 )
						EACJumpHeight.MeterIcon:setAlpha( 0.6 )
						EACJumpHeight.Line:setAlpha( 0.6 )
						EACJumpHeight.TextMessage:setAlpha( 0.6 )
						EACJumpHeight.TextHeight:setAlpha( 0.6 )
						EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame3 )
					end
				end
				
				EACJumpHeight:completeAnimation()
				EACJumpHeight.ArrowTop:completeAnimation()
				EACJumpHeight.FrameTop:completeAnimation()
				EACJumpHeight.MeterIcon:completeAnimation()
				EACJumpHeight.Line:completeAnimation()
				EACJumpHeight.TextMessage:completeAnimation()
				EACJumpHeight.TextHeight:completeAnimation()
				self.EACJumpHeight.ArrowTop:setAlpha( 0 )
				self.EACJumpHeight.FrameTop:setAlpha( 0 )
				self.EACJumpHeight.MeterIcon:setAlpha( 0 )
				self.EACJumpHeight.Line:setAlpha( 0 )
				self.EACJumpHeight.TextMessage:setAlpha( 0 )
				self.EACJumpHeight.TextHeight:setAlpha( 0 )
				EACJumpHeightFrame2( EACJumpHeight, {} )
			end
		},
		On = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				EACJumpHeight:completeAnimation()
				EACJumpHeight.ArrowTop:completeAnimation()
				EACJumpHeight.FrameTop:completeAnimation()
				EACJumpHeight.MeterIcon:completeAnimation()
				EACJumpHeight.Line:completeAnimation()
				EACJumpHeight.TextMessage:completeAnimation()
				EACJumpHeight.TextHeight:completeAnimation()
				self.EACJumpHeight.ArrowTop:setAlpha( 1 )
				self.EACJumpHeight.FrameTop:setAlpha( 1 )
				self.EACJumpHeight.MeterIcon:setAlpha( 1 )
				self.EACJumpHeight.Line:setAlpha( 1 )
				self.EACJumpHeight.TextMessage:setAlpha( 1 )
				self.EACJumpHeight.TextHeight:setAlpha( 1 )
				self.clipFinished( EACJumpHeight, {} )
			end,
			Off = function ()
				self:setupElementClipCounter( 1 )
				local EACJumpHeightFrame2 = function ( EACJumpHeight, event )
					local EACJumpHeightFrame3 = function ( EACJumpHeight, event )
						local EACJumpHeightFrame4 = function ( EACJumpHeight, event )
							local EACJumpHeightFrame5 = function ( EACJumpHeight, event )
								local EACJumpHeightFrame6 = function ( EACJumpHeight, event )
									if not event.interrupted then
										EACJumpHeight:beginAnimation( "keyframe", 260, false, false, CoD.TweenType.Linear )
										EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 260, false, false, CoD.TweenType.Linear )
										EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 260, false, false, CoD.TweenType.Linear )
										EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 260, false, false, CoD.TweenType.Linear )
										EACJumpHeight.Line:beginAnimation( "subkeyframe", 260, false, false, CoD.TweenType.Linear )
										EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 260, false, false, CoD.TweenType.Linear )
										EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 260, false, false, CoD.TweenType.Linear )
									end
									EACJumpHeight.ArrowTop:setAlpha( 0 )
									EACJumpHeight.FrameTop:setAlpha( 0 )
									EACJumpHeight.MeterIcon:setAlpha( 0 )
									EACJumpHeight.Line:setAlpha( 0 )
									EACJumpHeight.TextMessage:setAlpha( 0 )
									EACJumpHeight.TextHeight:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( EACJumpHeight, event )
									else
										EACJumpHeight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									EACJumpHeightFrame6( EACJumpHeight, event )
									return 
								else
									EACJumpHeight:beginAnimation( "keyframe", 99, false, false, CoD.TweenType.Linear )
									EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									EACJumpHeight.Line:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 99, false, false, CoD.TweenType.Linear )
									EACJumpHeight.ArrowTop:setAlpha( 0.3 )
									EACJumpHeight.FrameTop:setAlpha( 0.3 )
									EACJumpHeight.MeterIcon:setAlpha( 0.3 )
									EACJumpHeight.Line:setAlpha( 0.3 )
									EACJumpHeight.TextMessage:setAlpha( 0.3 )
									EACJumpHeight.TextHeight:setAlpha( 0.3 )
									EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame6 )
								end
							end
							
							if event.interrupted then
								EACJumpHeightFrame5( EACJumpHeight, event )
								return 
							else
								EACJumpHeight:beginAnimation( "keyframe", 40, false, false, CoD.TweenType.Linear )
								EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
								EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
								EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
								EACJumpHeight.Line:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
								EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
								EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 40, false, false, CoD.TweenType.Linear )
								EACJumpHeight.ArrowTop:setAlpha( 0 )
								EACJumpHeight.FrameTop:setAlpha( 0 )
								EACJumpHeight.MeterIcon:setAlpha( 0 )
								EACJumpHeight.Line:setAlpha( 0 )
								EACJumpHeight.TextMessage:setAlpha( 0 )
								EACJumpHeight.TextHeight:setAlpha( 0 )
								EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame5 )
							end
						end
						
						if event.interrupted then
							EACJumpHeightFrame4( EACJumpHeight, event )
							return 
						else
							EACJumpHeight:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
							EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
							EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
							EACJumpHeight.Line:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
							EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
							EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 60, false, false, CoD.TweenType.Linear )
							EACJumpHeight.ArrowTop:setAlpha( 0.7 )
							EACJumpHeight.FrameTop:setAlpha( 0.7 )
							EACJumpHeight.MeterIcon:setAlpha( 0.7 )
							EACJumpHeight.Line:setAlpha( 0.7 )
							EACJumpHeight.TextMessage:setAlpha( 0.7 )
							EACJumpHeight.TextHeight:setAlpha( 0.7 )
							EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame4 )
						end
					end
					
					if event.interrupted then
						EACJumpHeightFrame3( EACJumpHeight, event )
						return 
					else
						EACJumpHeight:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						EACJumpHeight.Line:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 79, false, false, CoD.TweenType.Linear )
						EACJumpHeight.ArrowTop:setAlpha( 0 )
						EACJumpHeight.FrameTop:setAlpha( 0 )
						EACJumpHeight.MeterIcon:setAlpha( 0 )
						EACJumpHeight.Line:setAlpha( 0 )
						EACJumpHeight.TextMessage:setAlpha( 0 )
						EACJumpHeight.TextHeight:setAlpha( 0 )
						EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame3 )
					end
				end
				
				EACJumpHeight:completeAnimation()
				EACJumpHeight.ArrowTop:completeAnimation()
				EACJumpHeight.FrameTop:completeAnimation()
				EACJumpHeight.MeterIcon:completeAnimation()
				EACJumpHeight.Line:completeAnimation()
				EACJumpHeight.TextMessage:completeAnimation()
				EACJumpHeight.TextHeight:completeAnimation()
				self.EACJumpHeight.ArrowTop:setAlpha( 1 )
				self.EACJumpHeight.FrameTop:setAlpha( 1 )
				self.EACJumpHeight.MeterIcon:setAlpha( 1 )
				self.EACJumpHeight.Line:setAlpha( 1 )
				self.EACJumpHeight.TextMessage:setAlpha( 1 )
				self.EACJumpHeight.TextHeight:setAlpha( 1 )
				EACJumpHeightFrame2( EACJumpHeight, {} )
			end
		},
		Off = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				EACJumpHeight:completeAnimation()
				EACJumpHeight.ArrowTop:completeAnimation()
				EACJumpHeight.FrameTop:completeAnimation()
				EACJumpHeight.MeterIcon:completeAnimation()
				EACJumpHeight.Line:completeAnimation()
				EACJumpHeight.TextMessage:completeAnimation()
				EACJumpHeight.TextHeight:completeAnimation()
				self.EACJumpHeight.ArrowTop:setAlpha( 0 )
				self.EACJumpHeight.FrameTop:setAlpha( 0 )
				self.EACJumpHeight.MeterIcon:setAlpha( 0 )
				self.EACJumpHeight.Line:setAlpha( 0 )
				self.EACJumpHeight.TextMessage:setAlpha( 0 )
				self.EACJumpHeight.TextHeight:setAlpha( 0 )
				self.clipFinished( EACJumpHeight, {} )
			end,
			On = function ()
				self:setupElementClipCounter( 1 )
				local EACJumpHeightFrame2 = function ( EACJumpHeight, event )
					local EACJumpHeightFrame3 = function ( EACJumpHeight, event )
						local EACJumpHeightFrame4 = function ( EACJumpHeight, event )
							local EACJumpHeightFrame5 = function ( EACJumpHeight, event )
								local EACJumpHeightFrame6 = function ( EACJumpHeight, event )
									local EACJumpHeightFrame7 = function ( EACJumpHeight, event )
										if not event.interrupted then
											EACJumpHeight:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.Line:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
											EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 69, false, false, CoD.TweenType.Linear )
										end
										EACJumpHeight.ArrowTop:setAlpha( 1 )
										EACJumpHeight.FrameTop:setAlpha( 1 )
										EACJumpHeight.MeterIcon:setAlpha( 1 )
										EACJumpHeight.Line:setAlpha( 1 )
										EACJumpHeight.TextMessage:setAlpha( 1 )
										EACJumpHeight.TextHeight:setAlpha( 1 )
										if event.interrupted then
											self.clipFinished( EACJumpHeight, event )
										else
											EACJumpHeight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										EACJumpHeightFrame7( EACJumpHeight, event )
										return 
									else
										EACJumpHeight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
										EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame7 )
									end
								end
								
								if event.interrupted then
									EACJumpHeightFrame6( EACJumpHeight, event )
									return 
								else
									EACJumpHeight:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.Line:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 19, false, false, CoD.TweenType.Linear )
									EACJumpHeight.ArrowTop:setAlpha( 0.2 )
									EACJumpHeight.FrameTop:setAlpha( 0.2 )
									EACJumpHeight.MeterIcon:setAlpha( 0.2 )
									EACJumpHeight.Line:setAlpha( 0.2 )
									EACJumpHeight.TextMessage:setAlpha( 0.2 )
									EACJumpHeight.TextHeight:setAlpha( 0.2 )
									EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame6 )
								end
							end
							
							if event.interrupted then
								EACJumpHeightFrame5( EACJumpHeight, event )
								return 
							else
								EACJumpHeight:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.Line:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 30, false, false, CoD.TweenType.Linear )
								EACJumpHeight.ArrowTop:setAlpha( 1 )
								EACJumpHeight.FrameTop:setAlpha( 1 )
								EACJumpHeight.MeterIcon:setAlpha( 1 )
								EACJumpHeight.Line:setAlpha( 1 )
								EACJumpHeight.TextMessage:setAlpha( 1 )
								EACJumpHeight.TextHeight:setAlpha( 1 )
								EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame5 )
							end
						end
						
						if event.interrupted then
							EACJumpHeightFrame4( EACJumpHeight, event )
							return 
						else
							EACJumpHeight:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.Line:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 9, false, false, CoD.TweenType.Linear )
							EACJumpHeight.ArrowTop:setAlpha( 0.1 )
							EACJumpHeight.FrameTop:setAlpha( 0.1 )
							EACJumpHeight.MeterIcon:setAlpha( 0.1 )
							EACJumpHeight.Line:setAlpha( 0.1 )
							EACJumpHeight.TextMessage:setAlpha( 0.1 )
							EACJumpHeight.TextHeight:setAlpha( 0.1 )
							EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame4 )
						end
					end
					
					if event.interrupted then
						EACJumpHeightFrame3( EACJumpHeight, event )
						return 
					else
						EACJumpHeight:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.ArrowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.FrameTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.MeterIcon:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.Line:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.TextMessage:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.TextHeight:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
						EACJumpHeight.ArrowTop:setAlpha( 0.6 )
						EACJumpHeight.FrameTop:setAlpha( 0.6 )
						EACJumpHeight.MeterIcon:setAlpha( 0.6 )
						EACJumpHeight.Line:setAlpha( 0.6 )
						EACJumpHeight.TextMessage:setAlpha( 0.6 )
						EACJumpHeight.TextHeight:setAlpha( 0.6 )
						EACJumpHeight:registerEventHandler( "transition_complete_keyframe", EACJumpHeightFrame3 )
					end
				end
				
				EACJumpHeight:completeAnimation()
				EACJumpHeight.ArrowTop:completeAnimation()
				EACJumpHeight.FrameTop:completeAnimation()
				EACJumpHeight.MeterIcon:completeAnimation()
				EACJumpHeight.Line:completeAnimation()
				EACJumpHeight.TextMessage:completeAnimation()
				EACJumpHeight.TextHeight:completeAnimation()
				self.EACJumpHeight.ArrowTop:setAlpha( 0 )
				self.EACJumpHeight.FrameTop:setAlpha( 0 )
				self.EACJumpHeight.MeterIcon:setAlpha( 0 )
				self.EACJumpHeight.Line:setAlpha( 0 )
				self.EACJumpHeight.TextMessage:setAlpha( 0 )
				self.EACJumpHeight.TextHeight:setAlpha( 0 )
				EACJumpHeightFrame2( EACJumpHeight, {} )
			end
		}
	}
	self.close = function ( self )
		self.EACJumpHeight:close()
		CoD.EACJumpHeightContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

