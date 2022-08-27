-- 024334f9d369540ffe9449ade209ae10
-- This hash is used for caching, delete to decompile the file again

CoD.GunsmithSessionModeBrandingImage = InheritFrom( LUI.UIElement )
CoD.GunsmithSessionModeBrandingImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithSessionModeBrandingImage )
	self.id = "GunsmithSessionModeBrandingImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local mpLogo = LUI.UIImage.new()
	mpLogo:setLeftRight( true, true, 0, 0 )
	mpLogo:setTopBottom( true, false, 0, 32 )
	mpLogo:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodemp" ) )
	self:addElement( mpLogo )
	self.mpLogo = mpLogo
	
	local cpLogo = LUI.UIImage.new()
	cpLogo:setLeftRight( true, true, 0, 0 )
	cpLogo:setTopBottom( true, false, 0, 32 )
	cpLogo:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodecp" ) )
	self:addElement( cpLogo )
	self.cpLogo = cpLogo
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

