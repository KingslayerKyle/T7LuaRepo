CoD.EmblemColorElement = InheritFrom( LUI.UIElement )
CoD.EmblemColorElement.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemColorElement )
	self.id = "EmblemColorElement"
	self.soundSet = "SelectColor_ColorSwatchPicker"
	self:setLeftRight( 0, 0, 0, 72 )
	self:setTopBottom( 0, 0, 0, 24 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 1, 0.41, 0 )
	self:addElement( background )
	self.background = background
	
	local colorElement = LUI.UIImage.new()
	colorElement:setLeftRight( 0, 1, 4, -4 )
	colorElement:setTopBottom( 0, 1, 4, -4 )
	colorElement:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorElement:setRGB( modelValue )
		end
	end )
	self:addElement( colorElement )
	self.colorElement = colorElement
	
	self.resetProperties = function ()
		background:completeAnimation()
		background:setRGB( 1, 0.41, 0 )
		background:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local backgroundFrame2 = function ( background, event )
					local backgroundFrame3 = function ( background, event )
						local backgroundFrame4 = function ( background, event )
							local backgroundFrame5 = function ( background, event )
								local backgroundFrame6 = function ( background, event )
									if not event.interrupted then
										background:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
									end
									background:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( background, event )
									else
										background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									backgroundFrame6( background, event )
									return 
								else
									background:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									background:registerEventHandler( "transition_complete_keyframe", backgroundFrame6 )
								end
							end
							
							if event.interrupted then
								backgroundFrame5( background, event )
								return 
							else
								background:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								background:setAlpha( 0.35 )
								background:registerEventHandler( "transition_complete_keyframe", backgroundFrame5 )
							end
						end
						
						if event.interrupted then
							backgroundFrame4( background, event )
							return 
						else
							background:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							background:registerEventHandler( "transition_complete_keyframe", backgroundFrame4 )
						end
					end
					
					if event.interrupted then
						backgroundFrame3( background, event )
						return 
					else
						background:beginAnimation( "keyframe", 19, true, false, CoD.TweenType.Linear )
						background:registerEventHandler( "transition_complete_keyframe", backgroundFrame3 )
					end
				end
				
				background:completeAnimation()
				self.background:setAlpha( 0.65 )
				backgroundFrame2( background, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local backgroundFrame2 = function ( background, event )
					local backgroundFrame3 = function ( background, event )
						local backgroundFrame4 = function ( background, event )
							local backgroundFrame5 = function ( background, event )
								local backgroundFrame6 = function ( background, event )
									if not event.interrupted then
										background:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
									end
									background:setRGB( 1, 1, 1 )
									background:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( background, event )
									else
										background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									backgroundFrame6( background, event )
									return 
								else
									background:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									background:registerEventHandler( "transition_complete_keyframe", backgroundFrame6 )
								end
							end
							
							if event.interrupted then
								backgroundFrame5( background, event )
								return 
							else
								background:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
								background:setAlpha( 0.35 )
								background:registerEventHandler( "transition_complete_keyframe", backgroundFrame5 )
							end
						end
						
						if event.interrupted then
							backgroundFrame4( background, event )
							return 
						else
							background:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
							background:registerEventHandler( "transition_complete_keyframe", backgroundFrame4 )
						end
					end
					
					if event.interrupted then
						backgroundFrame3( background, event )
						return 
					else
						background:beginAnimation( "keyframe", 19, true, false, CoD.TweenType.Linear )
						background:registerEventHandler( "transition_complete_keyframe", backgroundFrame3 )
					end
				end
				
				background:completeAnimation()
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 0.65 )
				backgroundFrame2( background, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.colorElement:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

