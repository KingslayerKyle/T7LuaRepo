CoD.CommsWidget_EventMessageRing = InheritFrom( LUI.UIElement )
CoD.CommsWidget_EventMessageRing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_EventMessageRing )
	self.id = "CommsWidget_EventMessageRing"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 104 )
	
	local ImgRing2 = LUI.UIImage.new()
	ImgRing2:setLeftRight( true, false, 52, 104 )
	ImgRing2:setTopBottom( true, false, 0, 52 )
	ImgRing2:setRGB( 1, 1, 1 )
	ImgRing2:setYRot( 180 )
	ImgRing2:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_ring" ) )
	ImgRing2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgRing2 )
	self.ImgRing2 = ImgRing2
	
	local ImgRing1 = LUI.UIImage.new()
	ImgRing1:setLeftRight( true, false, 0, 52 )
	ImgRing1:setTopBottom( true, false, 0, 52 )
	ImgRing1:setRGB( 1, 1, 1 )
	ImgRing1:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_ring" ) )
	ImgRing1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ImgRing1 )
	self.ImgRing1 = ImgRing1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

