-- a913f810f54a7f9dc063741da003ffa1
-- This hash is used for caching, delete to decompile the file again

CoD.Notification2xpWeaponReward = InheritFrom( LUI.UIElement )
CoD.Notification2xpWeaponReward.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Notification2xpWeaponReward )
	self.id = "Notification2xpWeaponReward"
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
	XPLabel:setTopBottom( true, false, 15, 33 )
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
		},
		french = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				XPLabel:completeAnimation()
				self.XPLabel:setLeftRight( true, false, -76, 124 )
				self.XPLabel:setTopBottom( true, false, 17, 31 )
				self.XPLabel:setRGB( 1, 1, 1 )
				self.XPLabel:setText( Engine.Localize( AppendLocalizeString( "MENU_XP_CAPS", "2" ) ) )
				self.clipFinished( XPLabel, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "french",
			condition = function ( menu, element, event )
				return IsCurrentLanguageFrench()
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
