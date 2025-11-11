CoD.positionLoadoutsSelectedItem_gadget4 = InheritFrom( LUI.UIElement )
CoD.positionLoadoutsSelectedItem_gadget4.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.positionLoadoutsSelectedItem_gadget4 )
	self.id = "positionLoadoutsSelectedItem_gadget4"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 80 )
	self:setTopBottom( 0, 0, 0, 80 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local highlight = LUI.UIImage.new()
	highlight:setLeftRight( 0, 0, -78, 282 )
	highlight:setTopBottom( 0, 0, -26, 238 )
	highlight:setImage( RegisterImage( "uie_menu_loadout_wheel_highlight" ) )
	self:addElement( highlight )
	self.highlight = highlight
	
	local selectedImage = LUI.UIImage.new()
	selectedImage:setLeftRight( 0, 1, 0, 0 )
	selectedImage:setTopBottom( 0, 1, 0, 0 )
	selectedImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			selectedImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( selectedImage )
	self.selectedImage = selectedImage
	
	self.resetProperties = function ()
		selectedImage:completeAnimation()
		highlight:completeAnimation()
		selectedImage:setAlpha( 1 )
		selectedImage:setScale( 1 )
		highlight:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				self.clipFinished( highlight, {} )
				selectedImage:completeAnimation()
				self.selectedImage:setScale( 0.8 )
				self.clipFinished( selectedImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 119, true, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 0 )
				highlightFrame2( highlight, {} )
				local selectedImageFrame2 = function ( selectedImage, event )
					if not event.interrupted then
						selectedImage:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					selectedImage:setAlpha( 1 )
					selectedImage:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( selectedImage, event )
					else
						selectedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectedImage:completeAnimation()
				self.selectedImage:setAlpha( 1 )
				self.selectedImage:setScale( 0.8 )
				selectedImageFrame2( selectedImage, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local highlightFrame2 = function ( highlight, event )
					if not event.interrupted then
						highlight:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					highlight:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( highlight, event )
					else
						highlight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				highlight:completeAnimation()
				self.highlight:setAlpha( 1 )
				highlightFrame2( highlight, {} )
				local selectedImageFrame2 = function ( selectedImage, event )
					if not event.interrupted then
						selectedImage:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					selectedImage:setAlpha( 1 )
					selectedImage:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( selectedImage, event )
					else
						selectedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectedImage:completeAnimation()
				self.selectedImage:setAlpha( 1 )
				self.selectedImage:setScale( 0.9 )
				selectedImageFrame2( selectedImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectedImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

