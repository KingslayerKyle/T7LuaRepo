CoD.EscalationItemSelected_major1 = InheritFrom( LUI.UIElement )
CoD.EscalationItemSelected_major1.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscalationItemSelected_major1 )
	self.id = "EscalationItemSelected_major1"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 80 )
	self:setTopBottom( 0, 0, 0, 80 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
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
		selectedImage:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				selectedImage:completeAnimation()
				self.selectedImage:setScale( 1.2 )
				self.clipFinished( selectedImage, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local selectedImageFrame2 = function ( selectedImage, event )
					if not event.interrupted then
						selectedImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					selectedImage:setScale( 1.4 )
					if event.interrupted then
						self.clipFinished( selectedImage, event )
					else
						selectedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectedImage:completeAnimation()
				self.selectedImage:setScale( 1.2 )
				selectedImageFrame2( selectedImage, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local selectedImageFrame2 = function ( selectedImage, event )
					if not event.interrupted then
						selectedImage:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					selectedImage:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( selectedImage, event )
					else
						selectedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectedImage:completeAnimation()
				self.selectedImage:setScale( 1.4 )
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

