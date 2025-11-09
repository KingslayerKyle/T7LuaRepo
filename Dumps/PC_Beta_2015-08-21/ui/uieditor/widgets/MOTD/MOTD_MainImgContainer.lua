CoD.MOTD_MainImgContainer = InheritFrom( LUI.UIElement )
CoD.MOTD_MainImgContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MOTD_MainImgContainer )
	self.id = "MOTD_MainImgContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 442 )
	self:setTopBottom( true, false, 0, 491 )
	
	local PopupImage = LUI.UIImage.new()
	PopupImage:setLeftRight( true, true, 0, 0 )
	PopupImage:setTopBottom( true, true, 0, 1.15 )
	PopupImage:setImage( RegisterImage( "uie_t7_motd_main_img" ) )
	self:addElement( PopupImage )
	self.PopupImage = PopupImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

