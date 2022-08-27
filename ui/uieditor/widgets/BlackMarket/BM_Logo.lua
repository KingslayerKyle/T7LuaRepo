-- 37acd46bd5244d81ffeb718f9241791f
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Logo = InheritFrom( LUI.UIElement )
CoD.BM_Logo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Logo )
	self.id = "BM_Logo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 324 )
	self:setTopBottom( true, false, 0, 121 )
	
	local logo = LUI.UIImage.new()
	logo:setLeftRight( true, false, 0, 338.8 )
	logo:setTopBottom( true, false, 0, 121 )
	logo:setImage( RegisterImage( "uie_t7_blackmarket_screen_header" ) )
	self:addElement( logo )
	self.logo = logo
	
	local text = LUI.UITightText.new()
	text:setLeftRight( true, false, 150.4, 313.3 )
	text:setTopBottom( true, false, 52.86, 69.86 )
	text:setRGB( 0.49, 0.59, 0.59 )
	text:setScale( 0.8 )
	text:setText( Engine.Localize( "MPUI_CONTRABAND_CAPS" ) )
	text:setTTF( "fonts/escom.ttf" )
	text:setLetterSpacing( 8.2 )
	self:addElement( text )
	self.text = text
	
	local contractsLogo = LUI.UIImage.new()
	contractsLogo:setLeftRight( true, false, -160.27, -16.27 )
	contractsLogo:setTopBottom( true, false, -15.43, 128.57 )
	contractsLogo:setAlpha( 0 )
	contractsLogo:setImage( RegisterImage( "uie_t7_hud_aar_bm_challenge" ) )
	self:addElement( contractsLogo )
	self.contractsLogo = contractsLogo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

