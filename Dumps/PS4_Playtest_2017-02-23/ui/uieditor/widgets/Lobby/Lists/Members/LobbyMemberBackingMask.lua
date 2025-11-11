CoD.LobbyMemberBackingMask = InheritFrom( LUI.UIElement )
CoD.LobbyMemberBackingMask.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LobbyMemberBackingMask )
	self.id = "LobbyMemberBackingMask"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 735 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 1, -8, 8 )
	Image:setTopBottom( 0, 1, -4, 4 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0, 0, 0, 0 )
	Image:setupNineSliceShader( 24, 16 )
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
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

