require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetPnlLeft" )

CoD.KillcamWidgetPnlLeftContain = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetPnlLeftContain.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetPnlLeftContain )
	self.id = "KillcamWidgetPnlLeftContain"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 80 )
	
	local KillcamWidgetPnlLeft0 = CoD.KillcamWidgetPnlLeft.new( menu, controller )
	KillcamWidgetPnlLeft0:setLeftRight( true, true, 0, 0 )
	KillcamWidgetPnlLeft0:setTopBottom( false, false, -40, 40 )
	KillcamWidgetPnlLeft0:setRGB( 1, 1, 1 )
	KillcamWidgetPnlLeft0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	KillcamWidgetPnlLeft0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( KillcamWidgetPnlLeft0 )
	self.KillcamWidgetPnlLeft0 = KillcamWidgetPnlLeft0
	
	self.close = function ( self )
		self.KillcamWidgetPnlLeft0:close()
		CoD.KillcamWidgetPnlLeftContain.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

