CoD.codcaster_color_element = InheritFrom( LUI.UIElement )
CoD.codcaster_color_element.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.codcaster_color_element )
	self.id = "codcaster_color_element"
	self.soundSet = "SelectColor_ColorSwatchPicker"
	self:setLeftRight( 0, 0, 0, 75 )
	self:setTopBottom( 0, 0, 0, 75 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 4, -4 )
	background:setTopBottom( 0, 1, 4, -4 )
	background:setRGB( 1, 0.41, 0 )
	background:setAlpha( 0.65 )
	self:addElement( background )
	self.background = background
	
	local colorElement = LUI.UIImage.new()
	colorElement:setLeftRight( 0, 1, 12, -12 )
	colorElement:setTopBottom( 0, 1, 12, -12 )
	colorElement:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colorElement:setRGB( modelValue )
		end
	end )
	self:addElement( colorElement )
	self.colorElement = colorElement
	
	local Selected = LUI.UIImage.new()
	Selected:setLeftRight( 0, 0, 37, 63 )
	Selected:setTopBottom( 0, 0, 12, 38 )
	Selected:setRGB( ColorSet.SelectedGreen.r, ColorSet.SelectedGreen.g, ColorSet.SelectedGreen.b )
	Selected:setImage( RegisterImage( "t7_hud_cac_equipped_16" ) )
	self:addElement( Selected )
	self.Selected = Selected
	
	self.resetProperties = function ()
		background:completeAnimation()
		Selected:completeAnimation()
		colorElement:completeAnimation()
		background:setLeftRight( 0, 1, 4, -4 )
		background:setTopBottom( 0, 1, 4, -4 )
		background:setAlpha( 0.65 )
		Selected:setAlpha( 1 )
		colorElement:setLeftRight( 0, 1, 12, -12 )
		colorElement:setTopBottom( 0, 1, 12, -12 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local backgroundFrame2 = function ( background, event )
					local backgroundFrame3 = function ( background, event )
						local backgroundFrame4 = function ( background, event )
							local backgroundFrame5 = function ( background, event )
								local backgroundFrame6 = function ( background, event )
									if not event.interrupted then
										background:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
									end
									background:setLeftRight( 0, 1, 0, 0 )
									background:setTopBottom( 0, 1, 0, 0 )
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
				self.background:setLeftRight( 0, 1, 0, 0 )
				self.background:setTopBottom( 0, 1, 0, 0 )
				self.background:setAlpha( 0.65 )
				backgroundFrame2( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setLeftRight( 0, 1, 8, -8 )
				self.colorElement:setTopBottom( 0, 1, 8, -8 )
				self.clipFinished( colorElement, {} )
				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )
			end
		},
		Selected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local backgroundFrame2 = function ( background, event )
					local backgroundFrame3 = function ( background, event )
						local backgroundFrame4 = function ( background, event )
							local backgroundFrame5 = function ( background, event )
								local backgroundFrame6 = function ( background, event )
									if not event.interrupted then
										background:beginAnimation( "keyframe", 30, false, true, CoD.TweenType.Linear )
									end
									background:setLeftRight( 0, 1, 0, 0 )
									background:setTopBottom( 0, 1, 0, 0 )
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
						background:setAlpha( 0.65 )
						background:registerEventHandler( "transition_complete_keyframe", backgroundFrame3 )
					end
				end
				
				background:completeAnimation()
				self.background:setLeftRight( 0, 1, 0, 0 )
				self.background:setTopBottom( 0, 1, 0, 0 )
				self.background:setAlpha( 0.35 )
				backgroundFrame2( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setLeftRight( 0, 1, 8, -8 )
				self.colorElement:setTopBottom( 0, 1, 8, -8 )
				self.clipFinished( colorElement, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "selected" )
			end
		}
	} )
	self:linkToElementModel( self, "selected", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "selected"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.colorElement:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

