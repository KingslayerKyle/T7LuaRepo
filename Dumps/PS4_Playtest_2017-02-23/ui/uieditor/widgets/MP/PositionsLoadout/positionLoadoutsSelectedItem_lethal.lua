CoD.positionLoadoutsSelectedItem_lethal = InheritFrom( LUI.UIElement )
CoD.positionLoadoutsSelectedItem_lethal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.positionLoadoutsSelectedItem_lethal )
	self.id = "positionLoadoutsSelectedItem_lethal"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 80 )
	self:setTopBottom( 0, 0, 0, 80 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, -131, 289 )
	Image:setTopBottom( 0, 0, -39, 165 )
	Image:setXRot( 180 )
	Image:setImage( RegisterImage( "uie_menu_loadout_main_backing_highlight" ) )
	self:addElement( Image )
	self.Image = Image
	
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
		Image:completeAnimation()
		selectedImage:completeAnimation()
		Image:setAlpha( 1 )
		selectedImage:setAlpha( 1 )
		selectedImage:setScale( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				ImageFrame2( Image, {} )
				local selectedImageFrame2 = function ( selectedImage, event )
					if not event.interrupted then
						selectedImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectedImage:setAlpha( 1 )
					selectedImage:setScale( 1.2 )
					if event.interrupted then
						self.clipFinished( selectedImage, event )
					else
						selectedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectedImage:completeAnimation()
				self.selectedImage:setAlpha( 1 )
				self.selectedImage:setScale( 1 )
				selectedImageFrame2( selectedImage, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local ImageFrame2 = function ( Image, event )
					if not event.interrupted then
						Image:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Image:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Image, event )
					else
						Image:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				ImageFrame2( Image, {} )
				local selectedImageFrame2 = function ( selectedImage, event )
					if not event.interrupted then
						selectedImage:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					selectedImage:setAlpha( 1 )
					selectedImage:setScale( 1 )
					if event.interrupted then
						self.clipFinished( selectedImage, event )
					else
						selectedImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectedImage:completeAnimation()
				self.selectedImage:setAlpha( 1 )
				self.selectedImage:setScale( 1.2 )
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

