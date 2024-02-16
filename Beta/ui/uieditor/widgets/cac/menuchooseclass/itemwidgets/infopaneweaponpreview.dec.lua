CoD.InfopaneWeaponPreview = InheritFrom( LUI.UIElement )
CoD.InfopaneWeaponPreview.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.InfopaneWeaponPreview )
	self.id = "InfopaneWeaponPreview"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 256 )
	
	local wideImage = LUI.UIImage.new()
	wideImage:setLeftRight( false, false, -256, 256 )
	wideImage:setTopBottom( false, false, -128, 128 )
	wideImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			wideImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( wideImage )
	self.wideImage = wideImage
	
	local squareImage = LUI.UIImage.new()
	squareImage:setLeftRight( false, false, -128, 128 )
	squareImage:setTopBottom( false, false, -128, 128 )
	squareImage:setAlpha( 0 )
	squareImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			squareImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( squareImage )
	self.squareImage = squareImage
	
	local emptyWideImage = LUI.UIImage.new()
	emptyWideImage:setLeftRight( false, false, -256, 256 )
	emptyWideImage:setTopBottom( false, false, -128, 128 )
	emptyWideImage:setAlpha( 0 )
	emptyWideImage:linkToElementModel( self, "emptyImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emptyWideImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( emptyWideImage )
	self.emptyWideImage = emptyWideImage
	
	local emptySquareImage = LUI.UIImage.new()
	emptySquareImage:setLeftRight( false, false, -128, 128 )
	emptySquareImage:setTopBottom( false, false, -128, 128 )
	emptySquareImage:setAlpha( 0 )
	emptySquareImage:linkToElementModel( self, "emptyImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emptySquareImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( emptySquareImage )
	self.emptySquareImage = emptySquareImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				wideImage:completeAnimation()
				self.wideImage:setAlpha( 0 )
				self.clipFinished( wideImage, {} )
				squareImage:completeAnimation()
				self.squareImage:setAlpha( 1 )
				self.clipFinished( squareImage, {} )
				emptyWideImage:completeAnimation()
				self.emptyWideImage:setAlpha( 0 )
				self.clipFinished( emptyWideImage, {} )
				emptySquareImage:completeAnimation()
				self.emptySquareImage:setAlpha( 0 )
				self.clipFinished( emptySquareImage, {} )
			end
		},
		WideImage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				wideImage:completeAnimation()
				self.wideImage:setAlpha( 1 )
				self.clipFinished( wideImage, {} )
				squareImage:completeAnimation()
				self.squareImage:setAlpha( 0 )
				self.clipFinished( squareImage, {} )
				emptyWideImage:completeAnimation()
				self.emptyWideImage:setAlpha( 0 )
				self.clipFinished( emptyWideImage, {} )
				emptySquareImage:completeAnimation()
				self.emptySquareImage:setAlpha( 0 )
				self.clipFinished( emptySquareImage, {} )
			end
		},
		EmptySquareImage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				wideImage:completeAnimation()
				self.wideImage:setAlpha( 0 )
				self.clipFinished( wideImage, {} )
				squareImage:completeAnimation()
				self.squareImage:setAlpha( 0 )
				self.clipFinished( squareImage, {} )
				emptyWideImage:completeAnimation()
				self.emptyWideImage:setAlpha( 0 )
				self.clipFinished( emptyWideImage, {} )
				emptySquareImage:completeAnimation()
				self.emptySquareImage:setAlpha( 0.15 )
				self.clipFinished( emptySquareImage, {} )
			end
		},
		EmptyWideImage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				wideImage:completeAnimation()
				self.wideImage:setAlpha( 0 )
				self.clipFinished( wideImage, {} )
				squareImage:completeAnimation()
				self.squareImage:setAlpha( 0 )
				self.clipFinished( squareImage, {} )
				emptyWideImage:completeAnimation()
				self.emptyWideImage:setAlpha( 0.15 )
				self.clipFinished( emptyWideImage, {} )
				emptySquareImage:completeAnimation()
				self.emptySquareImage:setAlpha( 0 )
				self.clipFinished( emptySquareImage, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.wideImage:close()
		self.squareImage:close()
		self.emptyWideImage:close()
		self.emptySquareImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

