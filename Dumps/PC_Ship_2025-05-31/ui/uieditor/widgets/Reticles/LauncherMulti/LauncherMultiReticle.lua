require( "ui.uieditor.widgets.Reticles.LauncherMulti.LauncherMultiReticle_UI3D" )

CoD.LauncherMultiReticle = InheritFrom( LUI.UIElement )
CoD.LauncherMultiReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LauncherMultiReticle )
	self.id = "LauncherMultiReticle"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local LauncherMultiReticleUI3D = CoD.LauncherMultiReticle_UI3D.new( menu, controller )
	LauncherMultiReticleUI3D:setLeftRight( true, false, 0, 200 )
	LauncherMultiReticleUI3D:setTopBottom( true, false, 0, 200 )
	self:addElement( LauncherMultiReticleUI3D )
	self.LauncherMultiReticleUI3D = LauncherMultiReticleUI3D
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LauncherMultiReticleUI3D:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

