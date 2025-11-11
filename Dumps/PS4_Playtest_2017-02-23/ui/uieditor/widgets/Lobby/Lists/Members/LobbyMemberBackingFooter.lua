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
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 16 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -5, 5 )
	Image:setTopBottom( 0, 1, 0, 0 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_partyease_focusfooterfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 24, 1 )
	self:addElement( Image )
	self.Image = Image
	
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

