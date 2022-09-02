-- 437d836dedb6d29c8ccbcdd898684fa0
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_dart_CenterTriLine = InheritFrom( LUI.UIElement )
CoD.vhud_dart_CenterTriLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_CenterTriLine )
	self.id = "vhud_dart_CenterTriLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 137 )
	self:setTopBottom( true, false, 0, 137 )
	
	local centerTriLine1 = LUI.UIImage.new()
	centerTriLine1:setLeftRight( true, false, 0, 137 )
	centerTriLine1:setTopBottom( true, false, 0, 137 )
	centerTriLine1:setAlpha( 0.1 )
	centerTriLine1:setZoom( -40 )
	centerTriLine1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecentertriline" ) )
	centerTriLine1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( centerTriLine1 )
	self.centerTriLine1 = centerTriLine1
	
	local centerTriLine = LUI.UIImage.new()
	centerTriLine:setLeftRight( true, false, 0, 137 )
	centerTriLine:setTopBottom( true, false, 0, 137 )
	centerTriLine:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecentertriline" ) )
	centerTriLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( centerTriLine )
	self.centerTriLine = centerTriLine
	
	local centerTriLine0 = LUI.UIImage.new()
	centerTriLine0:setLeftRight( true, false, 0, 137 )
	centerTriLine0:setTopBottom( true, false, 0, 137 )
	centerTriLine0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlecentertriline" ) )
	centerTriLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( centerTriLine0 )
	self.centerTriLine0 = centerTriLine0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

