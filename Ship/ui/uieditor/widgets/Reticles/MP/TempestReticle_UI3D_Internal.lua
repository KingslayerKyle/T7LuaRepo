-- 46b05f97bbb234375890bbe4dcf4896b
-- This hash is used for caching, delete to decompile the file again

CoD.TempestReticle_UI3D_Internal = InheritFrom( LUI.UIElement )
CoD.TempestReticle_UI3D_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TempestReticle_UI3D_Internal )
	self.id = "TempestReticle_UI3D_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 200 )
	
	local leftHash = LUI.UIImage.new()
	leftHash:setLeftRight( true, false, 0, 50 )
	leftHash:setTopBottom( false, false, -11, -10 )
	self:addElement( leftHash )
	self.leftHash = leftHash
	
	local rightHash = LUI.UIImage.new()
	rightHash:setLeftRight( false, true, -50, 0 )
	rightHash:setTopBottom( false, false, -11, -10 )
	self:addElement( rightHash )
	self.rightHash = rightHash
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
