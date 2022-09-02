-- e175ef08710b35bac1b12c5b1ed135b6
-- This hash is used for caching, delete to decompile the file again

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
	Image:setLeftRight( true, true, 0, 0 )
	Image:setTopBottom( true, true, 0, 0 )
	Image:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "previewImage", function ( model )
		local previewImage = Engine.GetModelValue( model )
		if previewImage then
			Image:setImage( RegisterImage( previewImage ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

