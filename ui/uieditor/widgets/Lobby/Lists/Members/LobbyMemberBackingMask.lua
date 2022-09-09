-- 4296b39a99798055a0b3ac540c59497a
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, -5, 5 )
	Image:setTopBottom( true, true, -3, 3 )
	Image:setImage( RegisterImage( "uie_img_t7_menu_partyease_boxmaskfull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Image:setShaderVector( 0, 0.03, 0.35, 0, 0 )
	Image:setupNineSliceShader( 16, 11 )
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
