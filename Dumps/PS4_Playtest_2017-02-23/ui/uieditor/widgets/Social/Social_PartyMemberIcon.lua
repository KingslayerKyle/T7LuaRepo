CoD.Social_PartyMemberIcon = InheritFrom( LUI.UIElement )
CoD.Social_PartyMemberIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PartyMemberIcon )
	self.id = "Social_PartyMemberIcon"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 15 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( 0, 0, -4, 20 )
	Icon:setTopBottom( 0, 0, -6, 45 )
	Icon:setRGB( ColorSet.PartyOther.r, ColorSet.PartyOther.g, ColorSet.PartyOther.b )
	Icon:setImage( RegisterImage( "uie_t7_menu_frontend_iconpartymember" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

