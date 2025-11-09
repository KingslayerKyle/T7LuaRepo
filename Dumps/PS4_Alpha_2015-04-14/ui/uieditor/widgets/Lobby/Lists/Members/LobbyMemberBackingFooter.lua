CoD.LobbyMemberBackingFooter = InheritFrom( LUI.UIElement )
CoD.LobbyMemberBackingFooter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberBackingFooter )
	self.id = "LobbyMemberBackingFooter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 11 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -3.5, 12.5 )
	Image2:setTopBottom( true, true, 0, 0 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_partyease_focusfooterl" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -12.5, 3.5 )
	Image3:setTopBottom( true, true, 0, 0 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_partyease_focusfooterr" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 12.5, -12.5 )
	Image4:setTopBottom( true, true, 0, 0 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setImage( RegisterImage( "uie_img_t7_menu_partyease_focusfooterm" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	self:mergeStateConditions( {
		{
			stateName = "PlayerCountState",
			condition = function ( menu, element, event )
				return IsPlayerCountItem( element )
			end
		},
		{
			stateName = "AddControllerState",
			condition = function ( menu, element, event )
				return IsAddControllerTextItem( element )
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

