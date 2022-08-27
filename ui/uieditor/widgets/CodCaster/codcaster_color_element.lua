-- 23dbaf9eef048ff8fcd8865d67410df9
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 3, -3 )
	background:setTopBottom( true, true, 3, -3 )
	background:setRGB( 1, 0.41, 0 )
	background:setAlpha( 0.65 )
	self:addElement( background )
	self.background = background
	
	local colorElement = LUI.UIImage.new()
	colorElement:setLeftRight( true, true, 8, -8 )
	colorElement:setTopBottom( true, true, 8, -8 )
	colorElement:linkToElementModel( self, "color", true, function ( model )
		local color = Engine.GetModelValue( model )
		if color then
			colorElement:setRGB( color )
		end
	end )
	self:addElement( colorElement )
	self.colorElement = colorElement
	
	local Selected = LUI.UIImage.new()
	Selected:setLeftRight( true, false, 25, 42 )
	Selected:setTopBottom( true, false, 8, 25 )
	Selected:setRGB( ColorSet.SelectedGreen.r, ColorSet.SelectedGreen.g, ColorSet.SelectedGreen.b )
	Selected:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	self:addElement( Selected )
	self.Selected = Selected
	
	local Lock = LUI.UIImage.new()
	Lock:setLeftRight( true, false, 16.5, 33.5 )
	Lock:setTopBottom( true, false, 16.5, 33.5 )
	Lock:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
	Lock:setImage( RegisterImage( "uie_t7_hud_cac_lock_64" ) )
	self:addElement( Lock )
	self.Lock = Lock
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setLeftRight( true, true, 8, -8 )
				self.colorElement:setTopBottom( true, true, 8, -8 )
				self.colorElement:setAlpha( 1 )
				self.clipFinished( colorElement, {} )
				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
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
				self.colorElement:setLeftRight( true, true, 5, -5 )
				self.colorElement:setTopBottom( true, true, 5, -5 )
				self.colorElement:setAlpha( 1 )
				self.clipFinished( colorElement, {} )
				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )
			end
		},
		Selected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setLeftRight( true, true, 8, -8 )
				self.colorElement:setTopBottom( true, true, 8, -8 )
				self.colorElement:setAlpha( 1 )
				self.clipFinished( colorElement, {} )
				Selected:completeAnimation()
				self.Selected:setAlpha( 1 )
				self.clipFinished( Selected, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 0 )
				self.clipFinished( Lock, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
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
						background:setAlpha( 0.65 )
						background:registerEventHandler( "transition_complete_keyframe", backgroundFrame3 )
					end
				end
				
				background:completeAnimation()
				self.background:setLeftRight( true, true, 0, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 0.35 )
				backgroundFrame2( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setLeftRight( true, true, 5, -5 )
				self.colorElement:setTopBottom( true, true, 5, -5 )
				self.colorElement:setAlpha( 1 )
				self.clipFinished( colorElement, {} )
				Selected:completeAnimation()
				self.Selected:setAlpha( 1 )
				self.clipFinished( Selected, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				colorElement:completeAnimation()
				self.colorElement:setLeftRight( true, true, 8, -8 )
				self.colorElement:setTopBottom( true, true, 8, -8 )
				self.colorElement:setAlpha( 0.5 )
				self.clipFinished( colorElement, {} )
				Selected:completeAnimation()
				self.Selected:setAlpha( 0 )
				self.clipFinished( Selected, {} )
				Lock:completeAnimation()
				self.Lock:setAlpha( 1 )
				self.clipFinished( Lock, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Selected",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "selected" )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "disabled" )
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
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.colorElement:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

