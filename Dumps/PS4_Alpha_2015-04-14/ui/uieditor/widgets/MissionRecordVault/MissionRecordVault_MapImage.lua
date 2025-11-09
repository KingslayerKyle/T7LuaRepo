CoD.MissionRecordVault_MapImage = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_MapImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_MapImage )
	self.id = "MissionRecordVault_MapImage"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 318 )
	self:setTopBottom( true, false, 0, 159 )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 318 )
	Image:setTopBottom( true, false, 0, 159 )
	Image:setRGB( 1, 1, 1 )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	Image:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "previewImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	self.close = function ( self )
		self.Image:close()
		CoD.MissionRecordVault_MapImage.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

