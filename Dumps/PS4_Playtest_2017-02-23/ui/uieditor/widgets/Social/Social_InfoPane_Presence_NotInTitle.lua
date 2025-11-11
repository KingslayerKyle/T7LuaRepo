require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

CoD.Social_InfoPane_Presence_NotInTitle = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane_Presence_NotInTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane_Presence_NotInTitle )
	self.id = "Social_InfoPane_Presence_NotInTitle"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 616 )
	self:setTopBottom( 0, 0, 0, 108 )
	
	local platformPresence = LUI.UIText.new()
	platformPresence:setLeftRight( 0, 1, 15, -15 )
	platformPresence:setTopBottom( 0, 0, 65, 98 )
	platformPresence:setText( Engine.Localize( "NULL_EMPTY" ) )
	platformPresence:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( platformPresence )
	self.platformPresence = platformPresence
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 1, 2, 0 )
	cacItemTitleGlow0:setTopBottom( 0, 0, 2, 58 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local statusText = LUI.UIText.new()
	statusText:setLeftRight( 0, 1, 15, -7 )
	statusText:setTopBottom( 0, 0, 10, 48 )
	statusText:setRGB( 0, 0, 0 )
	statusText:setText( Engine.Localize( "MENU_OFFLINE" ) )
	statusText:setTTF( "fonts/escom.ttf" )
	statusText:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	statusText:setShaderVector( 0, 0.06, 0, 0, 0 )
	statusText:setShaderVector( 1, 0.02, 0, 0, 0 )
	statusText:setShaderVector( 2, 1, 0, 0, 0 )
	statusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	statusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( statusText )
	self.statusText = statusText
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( 0, 1, -87, 67 )
	Glow:setTopBottom( 0.5, 0.5, -110, 0 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.resetProperties = function ()
		statusText:completeAnimation()
		platformPresence:completeAnimation()
		statusText:setText( Engine.Localize( "MENU_OFFLINE" ) )
		platformPresence:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				statusText:completeAnimation()
				self.statusText:setText( Engine.Localize( "MENU_ONLINE" ) )
				self.clipFinished( statusText, {} )
			end
		},
		Offline = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				platformPresence:completeAnimation()
				self.platformPresence:setAlpha( 0 )
				self.clipFinished( platformPresence, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacItemTitleGlow0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

