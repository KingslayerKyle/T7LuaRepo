-- c518b8f1e0c4c8f2f097488c220d1496
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.Infinite.lmgInfiniteReticle_UI3D" )

local PreLoadFunc = function ( self, controller )
	self:setupReticle( controller )
end

CoD.lmgInfiniteReticle = InheritFrom( LUI.UIElement )
CoD.lmgInfiniteReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.lmgInfiniteReticle )
	self.id = "lmgInfiniteReticle"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 216 )
	self:setTopBottom( true, false, 0, 93 )
	self.anyChildUsesUpdateState = true
	
	local lmgInfiniteReticleUI3D = CoD.lmgInfiniteReticle_UI3D.new( menu, controller )
	lmgInfiniteReticleUI3D:setLeftRight( true, false, 1, 216 )
	lmgInfiniteReticleUI3D:setTopBottom( true, false, 0, 93 )
	lmgInfiniteReticleUI3D:subscribeToGlobalModel( controller, "CurrentWeapon", nil, function ( model )
		lmgInfiniteReticleUI3D:setModel( model, controller )
	end )
	self:addElement( lmgInfiniteReticleUI3D )
	self.lmgInfiniteReticleUI3D = lmgInfiniteReticleUI3D
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.lmgInfiniteReticleUI3D:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

