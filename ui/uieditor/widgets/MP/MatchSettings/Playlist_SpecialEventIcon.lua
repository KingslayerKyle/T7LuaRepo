-- 15c1d0823d6ce819c037e1aa62a8bbb7
-- This hash is used for caching, delete to decompile the file again

CoD.Playlist_SpecialEventIcon = InheritFrom( LUI.UIElement )
CoD.Playlist_SpecialEventIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Playlist_SpecialEventIcon )
	self.id = "Playlist_SpecialEventIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	
	local XpSmall = LUI.UIImage.new()
	XpSmall:setLeftRight( true, true, 0, 0 )
	XpSmall:setTopBottom( true, true, 0, 0 )
	XpSmall:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp_weapon_reward" ) )
	self:addElement( XpSmall )
	self.XpSmall = XpSmall
	
	local XPLabel = LUI.UIText.new()
	XPLabel:setLeftRight( true, false, -76, 124 )
	XPLabel:setTopBottom( true, false, LanguageOverrideNumber( "french", 17, 15 ), LanguageOverrideNumber( "french", 31, 33 ) )
	XPLabel:setText( Engine.Localize( AppendLocalizeString( "MENU_XP_CAPS", "2" ) ) )
	XPLabel:setTTF( "fonts/escom.ttf" )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XPLabel )
	self.XPLabel = XPLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				XPLabel:completeAnimation()
				self.XPLabel:setLeftRight( true, false, -76, 124 )
				self.XPLabel:setTopBottom( true, false, 15, 33 )
				self.clipFinished( XPLabel, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end,
			Combined = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
