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
	self:setLeftRight( 0, 0, 0, 96 )
	self:setTopBottom( 0, 0, 0, 96 )
	
	local SpinnerFlipbook = LUI.UIImage.new()
	SpinnerFlipbook:setLeftRight( 0, 0, -11, 106 )
	SpinnerFlipbook:setTopBottom( 0, 0, -11, 106 )
	SpinnerFlipbook:setRGB( 1, 0.63, 0 )
	SpinnerFlipbook:setImage( RegisterImage( "t7_menu_loadingspinner_flipbook" ) )
	SpinnerFlipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	SpinnerFlipbook:setShaderVector( 0, 28, 0, 0, 0 )
	SpinnerFlipbook:setShaderVector( 1, 22, 0, 0, 0 )
	self:addElement( SpinnerFlipbook )
	self.SpinnerFlipbook = SpinnerFlipbook
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

