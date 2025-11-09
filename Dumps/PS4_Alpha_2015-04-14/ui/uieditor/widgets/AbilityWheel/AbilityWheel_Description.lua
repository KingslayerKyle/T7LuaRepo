require( "ui.uieditor.widgets.AbilityWheel.AbilityWheel_DescriptionBottom" )

CoD.AbilityWheel_Description = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Description.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Description )
	self.id = "AbilityWheel_Description"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 169 )
	
	local TextName = LUI.UIText.new()
	TextName:setLeftRight( false, false, -116.5, 116.5 )
	TextName:setTopBottom( false, false, -48, -32 )
	TextName:setRGB( 1, 0.93, 0.24 )
	TextName:setAlpha( 0.9 )
	TextName:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextName:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TextName:setShaderVector( 0, 0.1, 0, 0, 0 )
	TextName:setShaderVector( 1, 0, 0, 0, 0 )
	TextName:setShaderVector( 2, 0, 0, 0, 0 )
	TextName:setShaderVector( 3, 0, 0, 0, 0 )
	TextName:setShaderVector( 4, 0, 0, 0, 0 )
	TextName:setLetterSpacing( 1 )
	TextName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextName:subscribeToGlobalModel( controller, "AbilityWheel", "selectedAbilityDisplayName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextName )
	self.TextName = TextName
	
	local AbilityWheelDescriptionBottom = CoD.AbilityWheel_DescriptionBottom.new( menu, controller )
	AbilityWheelDescriptionBottom:setLeftRight( false, false, -88, 88 )
	AbilityWheelDescriptionBottom:setTopBottom( false, false, -7, 61 )
	AbilityWheelDescriptionBottom:setRGB( 1, 0.93, 0.24 )
	AbilityWheelDescriptionBottom:setAlpha( 0.9 )
	AbilityWheelDescriptionBottom:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	AbilityWheelDescriptionBottom:setShaderVector( 0, 0.1, 0, 0, 0 )
	AbilityWheelDescriptionBottom:setShaderVector( 1, 0, 0, 0, 0 )
	AbilityWheelDescriptionBottom:setShaderVector( 2, 0, 0, 0, 0 )
	AbilityWheelDescriptionBottom:setShaderVector( 3, 0, 0, 0, 0 )
	AbilityWheelDescriptionBottom:setShaderVector( 4, 0, 0, 0, 0 )
	AbilityWheelDescriptionBottom:subscribeToGlobalModel( controller, "AbilityWheel", "selectedAbilityDisplayDesc", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			AbilityWheelDescriptionBottom.TextDesc:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( AbilityWheelDescriptionBottom )
	self.AbilityWheelDescriptionBottom = AbilityWheelDescriptionBottom
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
				self.nextClip = "DefaultClip"
			end,
			Inactive = function ()
				self:setupElementClipCounter( 2 )
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
				local AbilityWheelDescriptionBottomFrame2 = function ( AbilityWheelDescriptionBottom, event )
					local AbilityWheelDescriptionBottomFrame3 = function ( AbilityWheelDescriptionBottom, event )
						local AbilityWheelDescriptionBottomFrame4 = function ( AbilityWheelDescriptionBottom, event )
							local AbilityWheelDescriptionBottomFrame5 = function ( AbilityWheelDescriptionBottom, event )
								local AbilityWheelDescriptionBottomFrame6 = function ( AbilityWheelDescriptionBottom, event )
									if not event.interrupted then
										AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
									end
									AbilityWheelDescriptionBottom:setAlpha( 0 )
									if event.interrupted then
										self.clipFinished( AbilityWheelDescriptionBottom, event )
									else
										AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									AbilityWheelDescriptionBottomFrame6( AbilityWheelDescriptionBottom, event )
									return 
								else
									AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
									AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", AbilityWheelDescriptionBottomFrame6 )
								end
							end
							
							if event.interrupted then
								AbilityWheelDescriptionBottomFrame5( AbilityWheelDescriptionBottom, event )
								return 
							else
								AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								AbilityWheelDescriptionBottom:setAlpha( 0.4 )
								AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", AbilityWheelDescriptionBottomFrame5 )
							end
						end
						
						if event.interrupted then
							AbilityWheelDescriptionBottomFrame4( AbilityWheelDescriptionBottom, event )
							return 
						else
							AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", AbilityWheelDescriptionBottomFrame4 )
						end
					end
					
					if event.interrupted then
						AbilityWheelDescriptionBottomFrame3( AbilityWheelDescriptionBottom, event )
						return 
					else
						AbilityWheelDescriptionBottom:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
						AbilityWheelDescriptionBottom:setAlpha( 0 )
						AbilityWheelDescriptionBottom:registerEventHandler( "transition_complete_keyframe", AbilityWheelDescriptionBottomFrame3 )
					end
				end
				
				AbilityWheelDescriptionBottom:completeAnimation()
				self.AbilityWheelDescriptionBottom:setAlpha( 0.7 )
				AbilityWheelDescriptionBottomFrame2( AbilityWheelDescriptionBottom, {} )
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
	self.close = function ( self )
		self.AbilityWheelDescriptionBottom:close()
		self.TextName:close()
		CoD.AbilityWheel_Description.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

