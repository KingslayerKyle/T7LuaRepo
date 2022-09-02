-- 0422415f1700cd3093a6710950a50b54
-- This hash is used for caching, delete to decompile the file again

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
	ImgRing2:setYRot( 180 )
	ImgRing2:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_ring" ) )
	self:addElement( ImgRing2 )
	self.ImgRing2 = ImgRing2
	
	local ImgRing1 = LUI.UIImage.new()
	ImgRing1:setLeftRight( true, false, 0, 52 )
	ImgRing1:setTopBottom( true, false, 0, 52 )
	ImgRing1:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_ring" ) )
	self:addElement( ImgRing1 )
	self.ImgRing1 = ImgRing1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 52, 104 )
	Image0:setTopBottom( true, false, 52, 104 )
	Image0:setXRot( 180 )
	Image0:setYRot( 180 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_ring" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 52 )
	Image1:setTopBottom( true, false, 52, 104 )
	Image1:setXRot( 180 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_commswidget_ring" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

