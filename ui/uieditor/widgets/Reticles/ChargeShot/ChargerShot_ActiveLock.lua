-- 0c10d431a935586f1cefc873be3caedf
-- This hash is used for caching, delete to decompile the file again

CoD.ChargerShot_ActiveLock = InheritFrom( LUI.UIElement )
CoD.ChargerShot_ActiveLock.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChargerShot_ActiveLock )
	self.id = "ChargerShot_ActiveLock"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 0.5, -0.5 )
	Image0:setTopBottom( true, true, 0, 0 )
	Image0:setImage( RegisterImage( "uie_t7_hud_chargeshot_active_lock" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

