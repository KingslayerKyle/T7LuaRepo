CoD.AmmoWidget_Knife = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_Knife.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_Knife )
	self.id = "AmmoWidget_Knife"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 26 )
	
	local Knife = LUI.UIImage.new()
	Knife:setLeftRight( false, true, -35, -50.46 )
	Knife:setTopBottom( false, true, -49.3, 23.7 )
	Knife:setZRot( -90 )
	Knife:setImage( RegisterImage( "uie_img_t7_hud_icon_knife_proto" ) )
	self:addElement( Knife )
	self.Knife = Knife
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

