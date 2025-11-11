require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSessionModeBrandingImage" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSessionModeText" )

CoD.GunsmithStatsBranding = InheritFrom( LUI.UIElement )
CoD.GunsmithStatsBranding.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 2
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStatsBranding )
	self.id = "GunsmithStatsBranding"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 201 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local sessionMode = CoD.GunsmithSessionModeText.new( menu, controller )
	sessionMode:setLeftRight( 0, 0, 73, 201 )
	sessionMode:setTopBottom( 0, 0, 5, 43 )
	sessionMode.modeText:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	self:addElement( sessionMode )
	self.sessionMode = sessionMode
	
	local bo3BrandingLogo = CoD.GunsmithSessionModeBrandingImage.new( menu, controller )
	bo3BrandingLogo:setLeftRight( 0, 0, 22, 70 )
	bo3BrandingLogo:setTopBottom( 0, 0, 0, 48 )
	bo3BrandingLogo.cpLogo:setAlpha( 0 )
	self:addElement( bo3BrandingLogo )
	self.bo3BrandingLogo = bo3BrandingLogo
	
	self.resetProperties = function ()
		bo3BrandingLogo:completeAnimation()
		sessionMode:completeAnimation()
		bo3BrandingLogo.mpLogo:setAlpha( 1 )
		bo3BrandingLogo.cpLogo:setAlpha( 0 )
		sessionMode.modeText:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Campaign = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				sessionMode:completeAnimation()
				sessionMode.modeText:completeAnimation()
				self.sessionMode.modeText:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
				self.clipFinished( sessionMode, {} )
				bo3BrandingLogo:completeAnimation()
				bo3BrandingLogo.mpLogo:completeAnimation()
				bo3BrandingLogo.cpLogo:completeAnimation()
				self.bo3BrandingLogo.mpLogo:setAlpha( 0 )
				self.bo3BrandingLogo.cpLogo:setAlpha( 1 )
				self.clipFinished( bo3BrandingLogo, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.sessionMode:close()
		self.bo3BrandingLogo:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

