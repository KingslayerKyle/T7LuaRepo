-- 6ef559b0ca6eb83eab38ce0a66ade680
-- This hash is used for caching, delete to decompile the file again

CoD.ZmFx_Spark1Img = InheritFrom( LUI.UIElement )
CoD.ZmFx_Spark1Img.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmFx_Spark1Img )
	self.id = "ZmFx_Spark1Img"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 168 )
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, true, 0, 0 )
	Image00:setTopBottom( true, true, 0, 0 )
	Image00:setImage( RegisterImage( "uie_t7_zm_hud_rnd_spkseq1" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook_add" ) )
	Image00:setShaderVector( 0, 10, 2, 0, 0 )
	Image00:setShaderVector( 1, 30, 0, 0, 0 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

