CoD.Social_PlayersList_PageInfo = InheritFrom( LUI.UIElement )
CoD.Social_PlayersList_PageInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_PlayersList_PageInfo )
	self.id = "Social_PlayersList_PageInfo"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 114 )
	self:setTopBottom( true, false, 0, 24 )
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( true, false, 9, 27 )
	arrow:setTopBottom( true, false, 4.09, 13.09 )
	arrow:setRGB( 0.24, 0.25, 0.26 )
	arrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( arrow )
	self.arrow = arrow
	
	local pageInfo = LUI.UIText.new()
	pageInfo:setLeftRight( true, false, 27, 87 )
	pageInfo:setTopBottom( false, true, -23.41, -4.41 )
	pageInfo:setText( Engine.Localize( "999/810" ) )
	pageInfo:setTTF( "fonts/default.ttf" )
	pageInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	pageInfo:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( pageInfo )
	self.pageInfo = pageInfo
	
	local arrow0 = LUI.UIImage.new()
	arrow0:setLeftRight( true, false, 87, 105 )
	arrow0:setTopBottom( true, false, 4.09, 13.09 )
	arrow0:setRGB( 0.97, 0.4, 0.15 )
	arrow0:setZRot( 180 )
	arrow0:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( arrow0 )
	self.arrow0 = arrow0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

