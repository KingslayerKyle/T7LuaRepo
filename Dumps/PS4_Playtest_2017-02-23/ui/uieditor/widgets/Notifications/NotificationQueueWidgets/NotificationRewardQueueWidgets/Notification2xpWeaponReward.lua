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
	self:setLeftRight( 0, 0, 0, 72 )
	self:setTopBottom( 0, 0, 0, 72 )
	
	local XpSmall = LUI.UIImage.new()
	XpSmall:setLeftRight( 0, 1, 0, 0 )
	XpSmall:setTopBottom( 0, 1, 0, 0 )
	XpSmall:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp_weapon_reward" ) )
	self:addElement( XpSmall )
	self.XpSmall = XpSmall
	
	local XPLabel = LUI.UIText.new()
	XPLabel:setLeftRight( 0, 0, -114, 186 )
	XPLabel:setTopBottom( 0, 0, 22, 49 )
	XPLabel:setText( AppendLocalizeString( "MENU_XP_CAPS", "2" ) )
	XPLabel:setTTF( "fonts/escom.ttf" )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	XPLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XPLabel )
	self.XPLabel = XPLabel
	
	self.resetProperties = function ()
		XPLabel:completeAnimation()
		XPLabel:setLeftRight( 0, 0, -114, 186 )
		XPLabel:setTopBottom( 0, 0, 22, 49 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			TimeUp = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Combined = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		french = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				XPLabel:completeAnimation()
				self.XPLabel:setLeftRight( 0, 0, -114, 186 )
				self.XPLabel:setTopBottom( 0, 0, 25, 46 )
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

