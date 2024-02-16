-- c9a4cd27327151f184e928092c159487
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local NineSliceShaderImage = LUI.UIImage.new()
	NineSliceShaderImage:setLeftRight( true, true, 0, 0 )
	NineSliceShaderImage:setTopBottom( true, true, 0, 0 )
	NineSliceShaderImage:setImage( RegisterImage( "uie_t7_hud_notficationframe" ) )
	NineSliceShaderImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	NineSliceShaderImage:setShaderVector( 0, 0.44, 0.44, 0, 0 )
	NineSliceShaderImage:setupNineSliceShader( 14, 14 )
	self:addElement( NineSliceShaderImage )
	self.NineSliceShaderImage = NineSliceShaderImage
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
