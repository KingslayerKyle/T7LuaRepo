LUI.UIStreamedImage = InheritFrom( LUI.UIElement )
LUI.UIStreamedImage.ImageReady = function ( self, event )
	event.image = self
	self:dispatchEventToChildren( event )
	self:dispatchEventToParent( event )
end

local RemoveSpinner = function ( self, event )
	self.spinner:close()
	LUI.UIStreamedImage.ImageReady( self, event )
end

LUI.UIStreamedImage.new = function ( defaultAnimationState, timeout, showSpinner, spinnerSize )
	local image = LUI.UIElement.new( defaultAnimationState )
	if timeout == nil then
		timeout = 0
	end
	image:setClass( LUI.UIStreamedImage )
	image:setupUIStreamedImage( timeout )
	if showSpinner then
		local size = 64
		if spinnerSize then
			size = spinnerSize
		end
		image.spinner = LUI.UIImage.new()
		image.spinner:setLeftRight( false, false, -size / 2, size / 2 )
		image.spinner:setTopBottom( false, false, -size / 2, size / 2 )
		image.spinner:setImage( RegisterMaterial( "lui_loader" ) )
		image:addElement( image.spinner )
		image:registerEventHandler( "streamed_image_ready", RemoveSpinner )
	else
		image:registerEventHandler( "streamed_image_ready", LUI.UIStreamedImage.ImageReady )
	end
	return image
end

LUI.UIStreamedImage.id = "LUIStreamedImage"
