-- 68e100626103a3670047b01d588c18e3
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_DescriptionText = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_DescriptionText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_DescriptionText )
	self.id = "AbilityWheel_DescriptionText"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 197 )
	self:setTopBottom( true, false, 0, 38 )
	
	local TextName = LUI.UIText.new()
	TextName:setLeftRight( false, false, -98.5, 98.5 )
	TextName:setTopBottom( false, false, -9.5, 9.5 )
	TextName:setRGB( 1, 0.93, 0.24 )
	TextName:setAlpha( 0.9 )
	TextName:setText( Engine.Localize( "System Overload" ) )
	TextName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextName:setLetterSpacing( 1 )
	TextName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( TextName )
	self.TextName = TextName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Inactive = function ()
				self:setupElementClipCounter( 1 )

				local TextNameFrame2 = function ( TextName, event )
					local TextNameFrame3 = function ( TextName, event )
						local TextNameFrame4 = function ( TextName, event )
							local TextNameFrame5 = function ( TextName, event )
								local TextNameFrame6 = function ( TextName, event )
									local TextNameFrame7 = function ( TextName, event )
										if not event.interrupted then
											TextName:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										end
										TextName:setAlpha( 0 )
										if event.interrupted then
											self.clipFinished( TextName, event )
										else
											TextName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
										end
									end
									
									if event.interrupted then
										TextNameFrame7( TextName, event )
										return 
									else
										TextName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
										TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame7 )
									end
								end
								
								if event.interrupted then
									TextNameFrame6( TextName, event )
									return 
								else
									TextName:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									TextName:setAlpha( 0.5 )
									TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame6 )
								end
							end
							
							if event.interrupted then
								TextNameFrame5( TextName, event )
								return 
							else
								TextName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame5 )
							end
						end
						
						if event.interrupted then
							TextNameFrame4( TextName, event )
							return 
						else
							TextName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							TextName:setAlpha( 0 )
							TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame4 )
						end
					end
					
					if event.interrupted then
						TextNameFrame3( TextName, event )
						return 
					else
						TextName:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame3 )
					end
				end
				
				TextName:completeAnimation()
				self.TextName:setAlpha( 0.9 )
				TextNameFrame2( TextName, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				TextName:completeAnimation()
				self.TextName:setAlpha( 0 )
				self.clipFinished( TextName, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local TextNameFrame2 = function ( TextName, event )
					local TextNameFrame3 = function ( TextName, event )
						local TextNameFrame4 = function ( TextName, event )
							local TextNameFrame5 = function ( TextName, event )
								local TextNameFrame6 = function ( TextName, event )
									if not event.interrupted then
										TextName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									TextName:setAlpha( 0.9 )
									TextName:setZoom( -100 )
									if event.interrupted then
										self.clipFinished( TextName, event )
									else
										TextName:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									TextNameFrame6( TextName, event )
									return 
								else
									TextName:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame6 )
								end
							end
							
							if event.interrupted then
								TextNameFrame5( TextName, event )
								return 
							else
								TextName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								TextName:setAlpha( 0 )
								TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame5 )
							end
						end
						
						if event.interrupted then
							TextNameFrame4( TextName, event )
							return 
						else
							TextName:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame4 )
						end
					end
					
					if event.interrupted then
						TextNameFrame3( TextName, event )
						return 
					else
						TextName:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						TextName:setAlpha( 0.9 )
						TextName:registerEventHandler( "transition_complete_keyframe", TextNameFrame3 )
					end
				end
				
				TextName:completeAnimation()
				self.TextName:setAlpha( 0 )
				self.TextName:setZoom( -100 )
				TextNameFrame2( TextName, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
