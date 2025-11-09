require( "ui.uieditor.widgets.Reticles.RocketLaunchers.rocketLauncherReticle_UI3D" )

local PreLoadFunc = function ( self, controller )
	self:setupReticle( controller )
end

CoD.rocketLauncherReticle = InheritFrom( LUI.UIElement )
CoD.rocketLauncherReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.rocketLauncherReticle )
	self.id = "rocketLauncherReticle"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local rocketLauncherReticleUI3D0 = CoD.rocketLauncherReticle_UI3D.new( menu, controller )
	rocketLauncherReticleUI3D0:setLeftRight( true, false, 0, 200 )
	rocketLauncherReticleUI3D0:setTopBottom( true, false, 0, 200 )
	self:addElement( rocketLauncherReticleUI3D0 )
	self.rocketLauncherReticleUI3D0 = rocketLauncherReticleUI3D0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.rocketLauncherReticleUI3D0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

