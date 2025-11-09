CoD.FE_ImageA = InheritFrom( LUI.UIElement )
CoD.FE_ImageA.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ImageA )
	self.id = "FE_ImageA"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	
	local imgSolid = LUI.UIImage.new()
	imgSolid:setLeftRight( true, true, 0, 0 )
	imgSolid:setTopBottom( true, true, 0, 0 )
	imgSolid:setRGB( 0, 0, 0 )
	imgSolid:setAlpha( 0.3 )
	imgSolid:setZoom( -5 )
	imgSolid:setImage( RegisterImage( "uie_t7_menu_frontend_slideemblemph" ) )
	imgSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgSolid )
	self.imgSolid = imgSolid
	
	local imgAdd = LUI.UIImage.new()
	imgAdd:setLeftRight( true, true, 0, 0 )
	imgAdd:setTopBottom( true, true, 0, 0 )
	imgAdd:setImage( RegisterImage( "uie_t7_menu_frontend_slideemblemph" ) )
	imgAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgAdd )
	self.imgAdd = imgAdd
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

