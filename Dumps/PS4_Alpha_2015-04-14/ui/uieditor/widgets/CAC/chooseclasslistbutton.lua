CoD.chooseClassListButton = InheritFrom( LUI.UIElement )
CoD.chooseClassListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseClassListButton )
	self.id = "chooseClassListButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.34, 0.37, 0.46 )
	background:setAlpha( 0 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local label = LUI.UIText.new()
	label:setLeftRight( true, true, 5, -5 )
	label:setTopBottom( true, false, 0, 30 )
	label:setRGB( 0.5, 0.51, 0.52 )
	label:setTTF( "fonts/default.ttf" )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	label:linkToElementModel( self, "customClassName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			label:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( label )
	self.label = label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				label:completeAnimation()
				self.label:setRGB( 0.5, 0.51, 0.52 )
				self.clipFinished( label, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setRGB( 0.34, 0.37, 0.46 )
				self.background:setAlpha( 0.35 )
				self.clipFinished( background, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 0.41, 0 )
				self.clipFinished( label, {} )
			end,
			LoseFocus2 = function ()
				self:setupElementClipCounter( 2 )
				local backgroundFrame2 = function ( background, event )
					if not event.interrupted then
						background:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					background:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( background, event )
					else
						background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				background:completeAnimation()
				self.background:setAlpha( 0.3 )
				backgroundFrame2( background, {} )
				local labelFrame2 = function ( label, event )
					if not event.interrupted then
						label:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					label:setRGB( 0.5, 0.51, 0.52 )
					if event.interrupted then
						self.clipFinished( label, event )
					else
						label:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				label:completeAnimation()
				self.label:setRGB( 1, 0.41, 0 )
				labelFrame2( label, {} )
			end,
			GainFocus2 = function ()
				self:setupElementClipCounter( 2 )
				local backgroundFrame2 = function ( background, event )
					if not event.interrupted then
						background:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					background:setAlpha( 0.33 )
					if event.interrupted then
						self.clipFinished( background, event )
					else
						background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				background:completeAnimation()
				self.background:setAlpha( 0 )
				backgroundFrame2( background, {} )
				local labelFrame2 = function ( label, event )
					if not event.interrupted then
						label:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					label:setRGB( 1, 0.41, 0 )
					if event.interrupted then
						self.clipFinished( label, event )
					else
						label:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				label:completeAnimation()
				self.label:setRGB( 0.5, 0.51, 0.52 )
				labelFrame2( label, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setRGB( 0.34, 0.37, 0.46 )
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 0.2 )
				self.clipFinished( label, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setRGB( 0.34, 0.37, 0.46 )
				self.background:setAlpha( 0.32 )
				self.clipFinished( background, {} )
				label:completeAnimation()
				self.label:setRGB( 1, 1, 1 )
				self.label:setAlpha( 0.2 )
				self.clipFinished( label, {} )
			end
		}
	}
	self.close = function ( self )
		self.label:close()
		CoD.chooseClassListButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

