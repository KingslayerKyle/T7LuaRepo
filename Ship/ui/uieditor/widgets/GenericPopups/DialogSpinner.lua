-- fc06bb0d8ce312ccbe0f6078c922c790
-- This hash is used for caching, delete to decompile the file again

CoD.DialogSpinner = InheritFrom( LUI.UIElement )
CoD.DialogSpinner.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.DialogSpinner )
	self.id = "DialogSpinner"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local SpinnerFlipbook = LUI.UIImage.new()
	SpinnerFlipbook:setLeftRight( true, false, 0, 128 )
	SpinnerFlipbook:setTopBottom( true, false, 0, 128 )
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
