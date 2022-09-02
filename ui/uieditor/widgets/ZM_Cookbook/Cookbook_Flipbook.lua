-- f8b4536b162777784936fbd17ac9911b
-- This hash is used for caching, delete to decompile the file again

CoD.Cookbook_Flipbook = InheritFrom( LUI.UIElement )
CoD.Cookbook_Flipbook.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_Flipbook )
	self.id = "Cookbook_Flipbook"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	
	local flipbook = LUI.UIImage.new()
	flipbook:setLeftRight( true, false, 0, 100 )
	flipbook:setTopBottom( true, false, 0, 100 )
	flipbook:setImage( RegisterImage( "uie_t7_zm_cookbook_flipbook" ) )
	flipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	flipbook:setShaderVector( 0, 10, 7, 0, 0 )
	flipbook:setShaderVector( 1, 25, 0, 0, 0 )
	self:addElement( flipbook )
	self.flipbook = flipbook
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				flipbook:completeAnimation()
				self.flipbook:setAlpha( 1 )
				self.clipFinished( flipbook, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

