-- ce477047e154b9e608fcc1479a74994e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnPnlInternal" )

CoD.KillcamWidgetFctnPnl = InheritFrom( LUI.UIElement )
CoD.KillcamWidgetFctnPnl.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KillcamWidgetFctnPnl )
	self.id = "KillcamWidgetFctnPnl"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 200 )
	self.anyChildUsesUpdateState = true
	
	local KillcamWidgetFctnPnlInternal0 = CoD.KillcamWidgetFctnPnlInternal.new( menu, controller )
	KillcamWidgetFctnPnlInternal0:setLeftRight( true, false, 0, 400 )
	KillcamWidgetFctnPnlInternal0:setTopBottom( true, false, 0, 200 )
	KillcamWidgetFctnPnlInternal0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	KillcamWidgetFctnPnlInternal0:setShaderVector( 0, 30, 10, 0, 0 )
	self:addElement( KillcamWidgetFctnPnlInternal0 )
	self.KillcamWidgetFctnPnlInternal0 = KillcamWidgetFctnPnlInternal0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.KillcamWidgetFctnPnlInternal0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

