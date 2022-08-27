-- 3fb899234faca96c275ab19c7d874f35
-- This hash is used for caching, delete to decompile the file again

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
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -3.5, 3.5 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_partyease_focusfooterfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0.03, 0.09, 0, 0 )
	Image:setupNineSliceShader( 16, 1 )
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

