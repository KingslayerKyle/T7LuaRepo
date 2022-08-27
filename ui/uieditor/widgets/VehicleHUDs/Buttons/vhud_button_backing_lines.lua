-- 9a954deb67a1b36e34ba5ab6b87be88b
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_button_backing_lines = InheritFrom( LUI.UIElement )
CoD.vhud_button_backing_lines.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_button_backing_lines )
	self.id = "vhud_button_backing_lines"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 73 )
	self:setTopBottom( true, false, 0, 73 )
	
	local ButtonHexLines = LUI.UIImage.new()
	ButtonHexLines:setLeftRight( false, false, -36.5, 36.5 )
	ButtonHexLines:setTopBottom( false, false, -36.5, 36.5 )
	ButtonHexLines:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_framehex" ) )
	ButtonHexLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ButtonHexLines )
	self.ButtonHexLines = ButtonHexLines
	
	local ButtonTriLines = LUI.UIImage.new()
	ButtonTriLines:setLeftRight( false, false, -36.5, 36.5 )
	ButtonTriLines:setTopBottom( false, false, -36.5, 36.5 )
	ButtonTriLines:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_frametri" ) )
	ButtonTriLines:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ButtonTriLines )
	self.ButtonTriLines = ButtonTriLines
	
	local ButtonTriLines0 = LUI.UIImage.new()
	ButtonTriLines0:setLeftRight( false, false, -36.5, 36.5 )
	ButtonTriLines0:setTopBottom( false, false, -36.5, 36.5 )
	ButtonTriLines0:setAlpha( 0.3 )
	ButtonTriLines0:setZoom( 7 )
	ButtonTriLines0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_frametri" ) )
	ButtonTriLines0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ButtonTriLines0 )
	self.ButtonTriLines0 = ButtonTriLines0
	
	local ButtonTriLines00 = LUI.UIImage.new()
	ButtonTriLines00:setLeftRight( false, false, -36.5, 36.5 )
	ButtonTriLines00:setTopBottom( false, false, -36.5, 36.5 )
	ButtonTriLines00:setAlpha( 0.1 )
	ButtonTriLines00:setZoom( 15 )
	ButtonTriLines00:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_frametri" ) )
	ButtonTriLines00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ButtonTriLines00 )
	self.ButtonTriLines00 = ButtonTriLines00
	
	local ButtonHexDots = LUI.UIImage.new()
	ButtonHexDots:setLeftRight( false, false, -36.5, 36.5 )
	ButtonHexDots:setTopBottom( false, false, -36.5, 36.5 )
	ButtonHexDots:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_dotshex" ) )
	ButtonHexDots:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ButtonHexDots )
	self.ButtonHexDots = ButtonHexDots
	
	local ButtonHexDots0 = LUI.UIImage.new()
	ButtonHexDots0:setLeftRight( false, false, -36.5, 36.5 )
	ButtonHexDots0:setTopBottom( false, false, -36.5, 36.5 )
	ButtonHexDots0:setAlpha( 0.5 )
	ButtonHexDots0:setZoom( 7 )
	ButtonHexDots0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_dotshex" ) )
	ButtonHexDots0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ButtonHexDots0 )
	self.ButtonHexDots0 = ButtonHexDots0
	
	local ButtonHexDots00 = LUI.UIImage.new()
	ButtonHexDots00:setLeftRight( false, false, -36.5, 36.5 )
	ButtonHexDots00:setTopBottom( false, false, -36.5, 36.5 )
	ButtonHexDots00:setAlpha( 0.2 )
	ButtonHexDots00:setZoom( 15 )
	ButtonHexDots00:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_dotshex" ) )
	ButtonHexDots00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ButtonHexDots00 )
	self.ButtonHexDots00 = ButtonHexDots00
	
	local ButtonHexLines0 = LUI.UIImage.new()
	ButtonHexLines0:setLeftRight( false, false, -36.5, 36.5 )
	ButtonHexLines0:setTopBottom( false, false, -36.5, 36.5 )
	ButtonHexLines0:setAlpha( 0 )
	ButtonHexLines0:setZoom( 30 )
	ButtonHexLines0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_button_framehex" ) )
	ButtonHexLines0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ButtonHexLines0 )
	self.ButtonHexLines0 = ButtonHexLines0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

