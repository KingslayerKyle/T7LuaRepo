-- 266930e21019c528d478ab8d317b6925
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 376 )
	self:setTopBottom( true, false, 0, 191 )
	self.anyChildUsesUpdateState = true
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 376 )
	Image:setTopBottom( true, false, 0, 191 )
	Image:setImage( RegisterImage( "uie_t7_icon_connect_overlays_bkg" ) )
	self:addElement( Image )
	self.Image = Image
	
	local systemOverlayConnectLines = CoD.systemOverlay_Connect_Lines.new( menu, controller )
	systemOverlayConnectLines:setLeftRight( true, false, 0, 376 )
	systemOverlayConnectLines:setTopBottom( true, false, 0, 191 )
	systemOverlayConnectLines:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( systemOverlayConnectLines )
	self.systemOverlayConnectLines = systemOverlayConnectLines
	
	local systemOverlayConnectLines2 = CoD.systemOverlay_Connect_Lines2.new( menu, controller )
	systemOverlayConnectLines2:setLeftRight( true, false, 0, 376 )
	systemOverlayConnectLines2:setTopBottom( true, false, 0, 191 )
	systemOverlayConnectLines2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( systemOverlayConnectLines2 )
	self.systemOverlayConnectLines2 = systemOverlayConnectLines2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.systemOverlayConnectLines:close()
		element.systemOverlayConnectLines2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

