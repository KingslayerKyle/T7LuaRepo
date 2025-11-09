require( "ui.uieditor.widgets.MP.MatchSettings.Playlist_SpecialEventItem" )

CoD.Playlist_SpecialEventWidget = InheritFrom( LUI.UIElement )
CoD.Playlist_SpecialEventWidget.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Playlist_SpecialEventWidget )
	self.id = "Playlist_SpecialEventWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 102 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local PlaylistSpecialEvent2XP = CoD.Playlist_SpecialEventItem.new( menu, controller )
	PlaylistSpecialEvent2XP:setLeftRight( true, false, 0, 34 )
	PlaylistSpecialEvent2XP:setTopBottom( true, false, 0, 30 )
	PlaylistSpecialEvent2XP:setAlpha( 0 )
	PlaylistSpecialEvent2XP.PlaylistSpecialEventIcon.XpSmall:setImage( RegisterImage( "uie_t7_hud_mp_notifications_2xp_reward" ) )
	self:addElement( PlaylistSpecialEvent2XP )
	self.PlaylistSpecialEvent2XP = PlaylistSpecialEvent2XP
	
	local PlaylistSpecialEvent2XPWeapon = CoD.Playlist_SpecialEventItem.new( menu, controller )
	PlaylistSpecialEvent2XPWeapon:setLeftRight( true, false, 34, 68 )
	PlaylistSpecialEvent2XPWeapon:setTopBottom( true, false, 0, 30 )
	PlaylistSpecialEvent2XPWeapon:setAlpha( 0 )
	self:addElement( PlaylistSpecialEvent2XPWeapon )
	self.PlaylistSpecialEvent2XPWeapon = PlaylistSpecialEvent2XPWeapon
	
	local PlaylistSpecialEvent2xCrypto = CoD.Playlist_SpecialEventItem.new( menu, controller )
	PlaylistSpecialEvent2xCrypto:setLeftRight( true, false, 68, 102 )
	PlaylistSpecialEvent2xCrypto:setTopBottom( true, false, 0, 30 )
	PlaylistSpecialEvent2xCrypto:setAlpha( 0 )
	PlaylistSpecialEvent2xCrypto.PlaylistSpecialEventIcon.XpSmall:setImage( RegisterImage( "uie_t7_icon_blackmarket_doubleloot_small" ) )
	PlaylistSpecialEvent2xCrypto.PlaylistSpecialEventIcon.XPLabel:setAlpha( 0 )
	self:addElement( PlaylistSpecialEvent2xCrypto )
	self.PlaylistSpecialEvent2xCrypto = PlaylistSpecialEvent2xCrypto
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PlaylistSpecialEvent2XP:completeAnimation()
				self.PlaylistSpecialEvent2XP:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2XP, {} )
				PlaylistSpecialEvent2XPWeapon:completeAnimation()
				self.PlaylistSpecialEvent2XPWeapon:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2XPWeapon, {} )
				PlaylistSpecialEvent2xCrypto:completeAnimation()
				self.PlaylistSpecialEvent2xCrypto:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2xCrypto, {} )
			end
		},
		DoubleXPWeaponXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PlaylistSpecialEvent2XP:completeAnimation()
				self.PlaylistSpecialEvent2XP:setAlpha( 1 )
				self.clipFinished( PlaylistSpecialEvent2XP, {} )
				PlaylistSpecialEvent2XPWeapon:completeAnimation()
				self.PlaylistSpecialEvent2XPWeapon:setAlpha( 1 )
				self.clipFinished( PlaylistSpecialEvent2XPWeapon, {} )
				PlaylistSpecialEvent2xCrypto:completeAnimation()
				self.PlaylistSpecialEvent2xCrypto:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2xCrypto, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PlaylistSpecialEvent2XP:completeAnimation()
				self.PlaylistSpecialEvent2XP:setAlpha( 1 )
				self.clipFinished( PlaylistSpecialEvent2XP, {} )
				PlaylistSpecialEvent2XPWeapon:completeAnimation()
				self.PlaylistSpecialEvent2XPWeapon:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2XPWeapon, {} )
				PlaylistSpecialEvent2xCrypto:completeAnimation()
				self.PlaylistSpecialEvent2xCrypto:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2xCrypto, {} )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PlaylistSpecialEvent2XP:completeAnimation()
				self.PlaylistSpecialEvent2XP:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2XP, {} )
				PlaylistSpecialEvent2XPWeapon:completeAnimation()
				self.PlaylistSpecialEvent2XPWeapon:setAlpha( 1 )
				self.clipFinished( PlaylistSpecialEvent2XPWeapon, {} )
				PlaylistSpecialEvent2xCrypto:completeAnimation()
				self.PlaylistSpecialEvent2xCrypto:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2xCrypto, {} )
			end
		},
		DoubleCryptokeys = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				PlaylistSpecialEvent2XP:completeAnimation()
				self.PlaylistSpecialEvent2XP:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2XP, {} )
				PlaylistSpecialEvent2XPWeapon:completeAnimation()
				self.PlaylistSpecialEvent2XPWeapon:setAlpha( 0 )
				self.clipFinished( PlaylistSpecialEvent2XPWeapon, {} )
				PlaylistSpecialEvent2xCrypto:completeAnimation()
				self.PlaylistSpecialEvent2xCrypto:setAlpha( 1 )
				self.clipFinished( PlaylistSpecialEvent2xCrypto, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PlaylistSpecialEvent2XP:close()
		element.PlaylistSpecialEvent2XPWeapon:close()
		element.PlaylistSpecialEvent2xCrypto:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

