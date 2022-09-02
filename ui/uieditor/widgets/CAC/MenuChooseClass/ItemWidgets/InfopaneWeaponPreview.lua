-- 5d4a09a3498b67298b0cf1bba30c7f45
-- This hash is used for caching, delete to decompile the file again

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
		local image = Engine.GetModelValue( model )
		if image then
			wideImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( wideImage )
	self.wideImage = wideImage
	
	local squareImage = LUI.UIImage.new()
	squareImage:setLeftRight( false, false, -128, 128 )
	squareImage:setTopBottom( false, false, -128, 128 )
	squareImage:setAlpha( 0 )
	squareImage:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			squareImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( squareImage )
	self.squareImage = squareImage
	
	local emptyWideImage = LUI.UIImage.new()
	emptyWideImage:setLeftRight( false, false, -256, 256 )
	emptyWideImage:setTopBottom( false, false, -128, 128 )
	emptyWideImage:setAlpha( 0 )
	emptyWideImage:linkToElementModel( self, "emptyImage", true, function ( model )
		local emptyImage = Engine.GetModelValue( model )
		if emptyImage then
			emptyWideImage:setImage( RegisterImage( emptyImage ) )
		end
	end )
	self:addElement( emptyWideImage )
	self.emptyWideImage = emptyWideImage
	
	local emptySquareImage = LUI.UIImage.new()
	emptySquareImage:setLeftRight( false, false, -128, 128 )
	emptySquareImage:setTopBottom( false, false, -128, 128 )
	emptySquareImage:setAlpha( 0 )
	emptySquareImage:linkToElementModel( self, "emptyImage", true, function ( model )
		local emptyImage = Engine.GetModelValue( model )
		if emptyImage then
			emptySquareImage:setImage( RegisterImage( emptyImage ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.wideImage:close()
		element.squareImage:close()
		element.emptyWideImage:close()
		element.emptySquareImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

