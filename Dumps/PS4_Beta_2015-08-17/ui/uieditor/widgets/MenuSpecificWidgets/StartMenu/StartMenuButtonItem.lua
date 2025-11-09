CoD.StartMenuButtonItem = InheritFrom( LUI.UIElement )
CoD.StartMenuButtonItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.StartMenuButtonItem )
	self.id = "StartMenuButtonItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 260 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.35, 0.35, 0.36 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 3, -3 )
	text:setTopBottom( true, false, 0, 30 )
	text:setRGB( 0.35, 0.35, 0.36 )
	text:setTTF( "fonts/default.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				text:completeAnimation()
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 2 )
				local backgroundFrame2 = function ( background, event )
					if not event.interrupted then
						background:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					background:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( background, event )
					else
						background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				background:completeAnimation()
				self.background:setAlpha( 0 )
				backgroundFrame2( background, {} )
				local textFrame2 = function ( text, event )
					if not event.interrupted then
						text:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					text:setRGB( 0.97, 0.58, 0.12 )
					if event.interrupted then
						self.clipFinished( text, event )
					else
						text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				text:completeAnimation()
				self.text:setRGB( 0.35, 0.35, 0.36 )
				textFrame2( text, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				background:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				self.background:setAlpha( 1 )
				background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				text:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
				self.text:setRGB( 0.97, 0.58, 0.12 )
				text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 2 )
				local backgroundFrame2 = function ( background, event )
					if not event.interrupted then
						background:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					background:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( background, event )
					else
						background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				background:completeAnimation()
				self.background:setAlpha( 1 )
				backgroundFrame2( background, {} )
				local textFrame2 = function ( text, event )
					if not event.interrupted then
						text:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					text:setRGB( 0.35, 0.35, 0.36 )
					if event.interrupted then
						self.clipFinished( text, event )
					else
						text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				text:completeAnimation()
				self.text:setRGB( 0.97, 0.58, 0.12 )
				textFrame2( text, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

