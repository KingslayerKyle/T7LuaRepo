-- ef32f091efdfc7f3e5fbf22439ecf315
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 411 )
	self:setTopBottom( true, false, 0, 72 )
	
	local platformPresence = LUI.UIText.new()
	platformPresence:setLeftRight( true, true, 10, -10 )
	platformPresence:setTopBottom( true, false, 43, 65 )
	platformPresence:setText( Engine.Localize( "NULL_EMPTY" ) )
	platformPresence:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	platformPresence:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( platformPresence )
	self.platformPresence = platformPresence
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, 1, 0 )
	cacItemTitleGlow0:setTopBottom( true, false, 1.5, 38.5 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local statusText = LUI.UIText.new()
	statusText:setLeftRight( true, true, 10, -5 )
	statusText:setTopBottom( true, false, 6.75, 31.75 )
	statusText:setRGB( 0, 0, 0 )
	statusText:setText( Engine.Localize( "MENU_OFFLINE" ) )
	statusText:setTTF( "fonts/escom.ttf" )
	statusText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	statusText:setShaderVector( 0, 0.06, 0, 0, 0 )
	statusText:setShaderVector( 1, 0.02, 0, 0, 0 )
	statusText:setShaderVector( 2, 1, 0, 0, 0 )
	statusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	statusText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( statusText )
	self.statusText = statusText
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, true, -57.93, 44.07 )
	Glow:setTopBottom( false, false, -73, 0 )
	Glow:setAlpha( 0.14 )
	Glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	Glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				platformPresence:completeAnimation()
				self.platformPresence:setAlpha( 1 )
				self.clipFinished( platformPresence, {} )
				statusText:completeAnimation()
				self.statusText:setAlpha( 1 )
				self.statusText:setText( Engine.Localize( "MENU_ONLINE" ) )
				self.clipFinished( statusText, {} )
			end
		},
		Offline = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				platformPresence:completeAnimation()
				self.platformPresence:setRGB( 1, 1, 1 )
				self.platformPresence:setAlpha( 0 )
				self.clipFinished( platformPresence, {} )
				statusText:completeAnimation()
				self.statusText:setAlpha( 1 )
				self.statusText:setText( Engine.Localize( "MENU_OFFLINE" ) )
				self.clipFinished( statusText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacItemTitleGlow0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

