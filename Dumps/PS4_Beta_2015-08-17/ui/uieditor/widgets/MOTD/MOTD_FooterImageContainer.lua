CoD.MOTD_FooterImageContainer = InheritFrom( LUI.UIElement )
CoD.MOTD_FooterImageContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MOTD_FooterImageContainer )
	self.id = "MOTD_FooterImageContainer"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 913 )
	self:setTopBottom( true, false, 0, 100 )
	
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	image:setImage( RegisterImage( "uie_t7_motd_temphorizonralfooter" ) )
	self:addElement( image )
	self.image = image
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

