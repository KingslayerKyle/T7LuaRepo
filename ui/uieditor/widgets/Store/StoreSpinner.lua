-- f1c25d38792a003b87afa46ba6b81243
-- This hash is used for caching, delete to decompile the file again

CoD.StoreSpinner = InheritFrom( LUI.UIElement )
CoD.StoreSpinner.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.StoreSpinner )
	self.id = "StoreSpinner"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local SpinnerFlipbook = LUI.UIImage.new()
	SpinnerFlipbook:setLeftRight( true, false, -7, 71 )
	SpinnerFlipbook:setTopBottom( true, false, -7, 71 )
	SpinnerFlipbook:setRGB( 1, 0.63, 0 )
	SpinnerFlipbook:setImage( RegisterImage( "uie_t7_menu_loadingspinner_flipbook" ) )
	SpinnerFlipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	SpinnerFlipbook:setShaderVector( 0, 28, 0, 0, 0 )
	SpinnerFlipbook:setShaderVector( 1, 22, 0, 0, 0 )
	self:addElement( SpinnerFlipbook )
	self.SpinnerFlipbook = SpinnerFlipbook
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				SpinnerFlipbook:completeAnimation()
				self.SpinnerFlipbook:setAlpha( 1 )
				self.clipFinished( SpinnerFlipbook, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
