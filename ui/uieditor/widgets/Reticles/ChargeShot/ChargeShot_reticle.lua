-- 4efa089e3803c742ae3aeb4d5bec9002
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargeShot_reticle_ui3d" )

CoD.ChargeShot_reticle = InheritFrom( LUI.UIElement )
CoD.ChargeShot_reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChargeShot_reticle )
	self.id = "ChargeShot_reticle"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 600 )
	self.anyChildUsesUpdateState = true
	
	local ui3d = CoD.ChargeShot_reticle_ui3d.new( menu, controller )
	ui3d:setLeftRight( false, false, -349.2, 349.2 )
	ui3d:setTopBottom( false, false, -296, 294.36 )
	Engine.SetupUI3DWindow( controller, 3, 698.39, 590.36 )
	ui3d:setUI3DWindow( 3 )
	ui3d:subscribeToGlobalModel( controller, "CurrentWeapon", nil, function ( model )
		ui3d:setModel( model, controller )
	end )
	self:addElement( ui3d )
	self.ui3d = ui3d
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ui3d:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

