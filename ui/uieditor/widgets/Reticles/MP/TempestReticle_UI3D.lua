-- 2d8d365177e8a103c24b6ffda879b2f4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.MP.TempestReticle_UI3D_Internal" )

CoD.TempestReticle_UI3D = InheritFrom( LUI.UIElement )
CoD.TempestReticle_UI3D.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TempestReticle_UI3D )
	self.id = "TempestReticle_UI3D"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 200 )
	
	local internal = CoD.TempestReticle_UI3D_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 3, 300, 200 )
	internal:setUI3DWindow( 3 )
	self:addElement( internal )
	self.internal = internal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

