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
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local mpLogo = LUI.UIImage.new()
	mpLogo:setLeftRight( 0, 1, 0, 0 )
	mpLogo:setTopBottom( 0, 0, 0, 48 )
	mpLogo:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodemp" ) )
	self:addElement( mpLogo )
	self.mpLogo = mpLogo
	
	local cpLogo = LUI.UIImage.new()
	cpLogo:setLeftRight( 0, 1, 0, 0 )
	cpLogo:setTopBottom( 0, 0, 0, 48 )
	cpLogo:setImage( RegisterImage( "uie_t7_menu_frontend_iconmodecp" ) )
	self:addElement( cpLogo )
	self.cpLogo = cpLogo
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

