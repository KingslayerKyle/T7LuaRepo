-- 5045e9acacdf5d8342742db3a0a67ad6
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self.shader:setupBowLauncherReticleShader()
end

CoD.BowLauncherReticle_Shader = InheritFrom( LUI.UIElement )
CoD.BowLauncherReticle_Shader.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BowLauncherReticle_Shader )
	self.id = "BowLauncherReticle_Shader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	
	local shader = LUI.UIImage.new()
	shader:setLeftRight( true, true, 0, 0 )
	shader:setTopBottom( true, true, 0, 0 )
	shader:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_bow_launcher_reticle" ) )
	shader:setShaderVector( 0, 3, 10, 0, 0 )
	shader:setShaderVector( 1, 100, 100, 0, 0 )
	shader:setShaderVector( 2, 0, 0, 0, 0 )
	shader:setShaderVector( 3, 2, 30, 100, 0 )
	shader:setShaderVector( 4, 2, 0, 0, 0 )
	self:addElement( shader )
	self.shader = shader
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

