require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSessionModeText" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSessionModeBrandingImage" )

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
	self:setLeftRight( true, false, 0, 134 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local sessionMode = CoD.GunsmithSessionModeText.new( menu, controller )
	sessionMode:setLeftRight( true, false, 48.94, 134 )
	sessionMode:setTopBottom( true, false, 3.5, 28.5 )
	sessionMode.modeText:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	self:addElement( sessionMode )
	self.sessionMode = sessionMode
	
	local bo3BrandingLogo = CoD.GunsmithSessionModeBrandingImage.new( menu, controller )
	bo3BrandingLogo:setLeftRight( true, false, 14.94, 46.94 )
	bo3BrandingLogo:setTopBottom( true, false, 0, 32 )
	bo3BrandingLogo.cpLogo:setAlpha( 0 )
	self:addElement( bo3BrandingLogo )
	self.bo3BrandingLogo = bo3BrandingLogo
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				sessionMode:completeAnimation()
				sessionMode.modeText:completeAnimation()
				self.sessionMode.modeText:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
				self.clipFinished( sessionMode, {} )
				bo3BrandingLogo:completeAnimation()
				bo3BrandingLogo.mpLogo:completeAnimation()
				bo3BrandingLogo.cpLogo:completeAnimation()
				self.bo3BrandingLogo.mpLogo:setAlpha( 1 )
				self.bo3BrandingLogo.cpLogo:setAlpha( 0 )
				self.clipFinished( bo3BrandingLogo, {} )
			end
		},
		Campaign = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.sessionMode:close()
		element.bo3BrandingLogo:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

