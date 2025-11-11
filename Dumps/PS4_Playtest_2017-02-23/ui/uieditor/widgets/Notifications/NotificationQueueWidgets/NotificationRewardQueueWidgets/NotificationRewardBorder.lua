CoD.NotificationRewardBorder = InheritFrom( LUI.UIElement )
CoD.NotificationRewardBorder.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.NotificationRewardBorder )
	self.id = "NotificationRewardBorder"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local NineSliceShaderImage = LUI.UIImage.new()
	NineSliceShaderImage:setLeftRight( 0, 1, 0, 0 )
	NineSliceShaderImage:setTopBottom( 0, 1, 0, 0 )
	NineSliceShaderImage:setImage( RegisterImage( "uie_t7_hud_notficationframe" ) )
	NineSliceShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	NineSliceShaderImage:setShaderVector( 0, 0, 0, 0, 0 )
	NineSliceShaderImage:setupNineSliceShader( 21, 21 )
	self:addElement( NineSliceShaderImage )
	self.NineSliceShaderImage = NineSliceShaderImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

