require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Connect_Lines" )
require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Connect_Lines2" )

CoD.systemOverlay_Connect_Looping = InheritFrom( LUI.UIElement )
CoD.systemOverlay_Connect_Looping.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_Connect_Looping )
	self.id = "systemOverlay_Connect_Looping"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 564 )
	self:setTopBottom( 0, 0, 0, 286 )
	self.anyChildUsesUpdateState = true
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 0, 564 )
	Image:setTopBottom( 0, 0, 0, 286 )
	Image:setImage( RegisterImage( "t7_icon_connect_overlays_bkg" ) )
	self:addElement( Image )
	self.Image = Image
	
	local systemOverlayConnectLines = CoD.systemOverlay_Connect_Lines.new( menu, controller )
	systemOverlayConnectLines:setLeftRight( 0, 0, 0, 564 )
	systemOverlayConnectLines:setTopBottom( 0, 0, 0, 286 )
	systemOverlayConnectLines:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( systemOverlayConnectLines )
	self.systemOverlayConnectLines = systemOverlayConnectLines
	
	local systemOverlayConnectLines2 = CoD.systemOverlay_Connect_Lines2.new( menu, controller )
	systemOverlayConnectLines2:setLeftRight( 0, 0, 0, 564 )
	systemOverlayConnectLines2:setTopBottom( 0, 0, 0, 286 )
	systemOverlayConnectLines2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( systemOverlayConnectLines2 )
	self.systemOverlayConnectLines2 = systemOverlayConnectLines2
	
	self.resetProperties = function ()
		systemOverlayConnectLines:completeAnimation()
		Image:completeAnimation()
		systemOverlayConnectLines:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
		Image:setAlpha( 1 )
		Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( Image, {} )
				systemOverlayConnectLines:completeAnimation()
				self.systemOverlayConnectLines:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
				self.clipFinished( systemOverlayConnectLines, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.systemOverlayConnectLines:close()
		self.systemOverlayConnectLines2:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

