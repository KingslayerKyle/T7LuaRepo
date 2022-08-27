-- d41d8cd98f00b204e9800998ecf8427e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.Magnifier.MagnifierReticle_Internal" )

CoD.MagnifierReticle_UI3D = InheritFrom( LUI.UIElement )
CoD.MagnifierReticle_UI3D.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MagnifierReticle_UI3D )
	self.id = "MagnifierReticle_UI3D"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 400 )
	self.anyChildUsesUpdateState = true
	
	local MagnifierReticleInternal = CoD.MagnifierReticle_Internal.new( menu, controller )
	MagnifierReticleInternal:setLeftRight( true, true, 0, 0 )
	MagnifierReticleInternal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 3, 400, 400 )
	MagnifierReticleInternal:setUI3DWindow( 3 )
	MagnifierReticleInternal:subscribeToGlobalModel( controller, "CurrentWeapon", nil, function ( model )
		MagnifierReticleInternal:setModel( model, controller )
	end )
	self:addElement( MagnifierReticleInternal )
	self.MagnifierReticleInternal = MagnifierReticleInternal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MagnifierReticleInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

