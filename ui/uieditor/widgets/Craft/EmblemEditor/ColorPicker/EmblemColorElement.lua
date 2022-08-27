-- 4ab8e380bf2407259b3952ca75912930
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 16 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 0.41, 0 )
	self:addElement( background )
	self.background = background
	
	local colorElement = LUI.UIImage.new()
	colorElement:setLeftRight( true, true, 3, -3 )
	colorElement:setTopBottom( true, true, 3, -3 )
	colorElement:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			colorElement:setRGB( color )
		end
	end )
	self:addElement( colorElement )
	self.colorElement = colorElement
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setAlpha( 1 )
				self.clipFinished( colorElement, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				local backgroundFrame2 = function ( background, event )
					local backgroundFrame3 = function ( background, event )
						local backgroundFrame4 = function ( background, event )
							local backgroundFrame5 = function ( background, event )
								local backgroundFrame6 = function ( background, event )
									if not event.interrupted then
										background:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
									end
									background:setLeftRight( true, true, 0, 0 )
									background:setTopBottom( true, true, 0, 0 )
									background:setRGB( 1, 0.41, 0 )
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
				self.background:setLeftRight( true, true, 0, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 0.65 )
				backgroundFrame2( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setAlpha( 1 )
				self.clipFinished( colorElement, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				local backgroundFrame2 = function ( background, event )
					local backgroundFrame3 = function ( background, event )
						local backgroundFrame4 = function ( background, event )
							local backgroundFrame5 = function ( background, event )
								local backgroundFrame6 = function ( background, event )
									if not event.interrupted then
										background:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
									end
									background:setLeftRight( true, true, 0, 0 )
									background:setTopBottom( true, true, 0, 0 )
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
				self.background:setLeftRight( true, true, 0, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.background:setRGB( 1, 1, 1 )
				self.background:setAlpha( 0.65 )
				backgroundFrame2( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setAlpha( 1 )
				self.clipFinished( colorElement, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.colorElement:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

