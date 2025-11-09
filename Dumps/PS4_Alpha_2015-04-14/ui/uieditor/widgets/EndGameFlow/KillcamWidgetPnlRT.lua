require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetPnlRTInt" )

CoD.KillcamWidgetPnlRT = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetPnlRT.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetPnlRT )
	self.id = "KillcamWidgetPnlRT"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 80 )
	
	local KillcamWidgetPnlRTInt0 = CoD.KillcamWidgetPnlRTInt.new( menu, controller )
	KillcamWidgetPnlRTInt0:setLeftRight( true, true, 0, 0 )
	KillcamWidgetPnlRTInt0:setTopBottom( false, false, -40, 40 )
	KillcamWidgetPnlRTInt0:setRGB( 1, 1, 1 )
	KillcamWidgetPnlRTInt0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	KillcamWidgetPnlRTInt0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( KillcamWidgetPnlRTInt0 )
	self.KillcamWidgetPnlRTInt0 = KillcamWidgetPnlRTInt0
	
	self.close = function ( self )
		self.KillcamWidgetPnlRTInt0:close()
		CoD.KillcamWidgetPnlRT.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

