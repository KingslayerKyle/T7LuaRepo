require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreen_DoubleWeaponXPLabel" )
require( "ui.uieditor.widgets.LoadingAnimation.LoadingScreen_DoubleXPLabel" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.Notification2xpReward" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.Notification2xpWeaponReward" )

CoD.LoadingScreen_DoubleXPWidget = InheritFrom( LUI.UIElement )
CoD.LoadingScreen_DoubleXPWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreen_DoubleXPWidget )
	self.id = "LoadingScreen_DoubleXPWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 465 )
	self:setTopBottom( 0, 0, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local Notification2xpReward = CoD.Notification2xpReward.new( menu, controller )
	Notification2xpReward:setLeftRight( 1, 1, -4, 68 )
	Notification2xpReward:setTopBottom( 0, 0, -18, 54 )
	Notification2xpReward:setAlpha( 0 )
	Notification2xpReward:setScale( 0.8 )
	self:addElement( Notification2xpReward )
	self.Notification2xpReward = Notification2xpReward
	
	local Notification2xpWeaponReward = CoD.Notification2xpWeaponReward.new( menu, controller )
	Notification2xpWeaponReward:setLeftRight( 1, 1, -4, 68 )
	Notification2xpWeaponReward:setTopBottom( 0, 0, -18, 54 )
	Notification2xpWeaponReward:setAlpha( 0 )
	Notification2xpWeaponReward:setScale( 0.8 )
	self:addElement( Notification2xpWeaponReward )
	self.Notification2xpWeaponReward = Notification2xpWeaponReward
	
	local LoadingScreenDoubleXPLabel = CoD.LoadingScreen_DoubleXPLabel.new( menu, controller )
	LoadingScreenDoubleXPLabel:setLeftRight( 1, 1, -464.5, 0.5 )
	LoadingScreenDoubleXPLabel:setTopBottom( 0, 0, 0, 36 )
	LoadingScreenDoubleXPLabel:setAlpha( 0 )
	LoadingScreenDoubleXPLabel.XPLabel:setText( Engine.Localize( "MENU_DOUBLE_WEAPON_XP" ) )
	self:addElement( LoadingScreenDoubleXPLabel )
	self.LoadingScreenDoubleXPLabel = LoadingScreenDoubleXPLabel
	
	local cryptokeyBack0 = LUI.UIImage.new()
	cryptokeyBack0:setLeftRight( 1, 1, -13, 77 )
	cryptokeyBack0:setTopBottom( 0, 0, -24, 66 )
	cryptokeyBack0:setAlpha( 0 )
	cryptokeyBack0:setScale( 0.75 )
	cryptokeyBack0:setImage( RegisterImage( "uie_t7_icon_blackmarket_doubleloot_small" ) )
	self:addElement( cryptokeyBack0 )
	self.cryptokeyBack0 = cryptokeyBack0
	
	local LoadingScreenDoubleWeaponXPLabel = CoD.LoadingScreen_DoubleWeaponXPLabel.new( menu, controller )
	LoadingScreenDoubleWeaponXPLabel:setLeftRight( 1, 1, -464.5, 0.5 )
	LoadingScreenDoubleWeaponXPLabel:setTopBottom( 0, 0, 0, 36 )
	LoadingScreenDoubleWeaponXPLabel:setAlpha( 0 )
	LoadingScreenDoubleWeaponXPLabel.XPLabel:setRGB( 0.59, 0.36, 0.89 )
	LoadingScreenDoubleWeaponXPLabel.XPLabel:setText( Engine.Localize( "MENU_DOUBLE_WEAPON_XP" ) )
	self:addElement( LoadingScreenDoubleWeaponXPLabel )
	self.LoadingScreenDoubleWeaponXPLabel = LoadingScreenDoubleWeaponXPLabel
	
	self.resetProperties = function ()
		LoadingScreenDoubleXPLabel:completeAnimation()
		Notification2xpReward:completeAnimation()
		Notification2xpWeaponReward:completeAnimation()
		LoadingScreenDoubleWeaponXPLabel:completeAnimation()
		cryptokeyBack0:completeAnimation()
		LoadingScreenDoubleXPLabel:setLeftRight( 1, 1, -464.5, 0.5 )
		LoadingScreenDoubleXPLabel:setTopBottom( 0, 0, 0, 36 )
		LoadingScreenDoubleXPLabel:setAlpha( 0 )
		LoadingScreenDoubleXPLabel.XPLabel:setRGB( 0.39, 0.83, 0.94 )
		LoadingScreenDoubleXPLabel.XPLabel:setText( Engine.Localize( "MENU_DOUBLE_WEAPON_XP" ) )
		Notification2xpReward:setLeftRight( 1, 1, -4, 68 )
		Notification2xpReward:setTopBottom( 0, 0, -18, 54 )
		Notification2xpReward:setAlpha( 0 )
		Notification2xpReward:setScale( 0.8 )
		Notification2xpWeaponReward:setLeftRight( 1, 1, -4, 68 )
		Notification2xpWeaponReward:setTopBottom( 0, 0, -18, 54 )
		Notification2xpWeaponReward:setAlpha( 0 )
		Notification2xpWeaponReward:setScale( 0.8 )
		LoadingScreenDoubleWeaponXPLabel:setAlpha( 0 )
		cryptokeyBack0:setLeftRight( 1, 1, -13, 77 )
		cryptokeyBack0:setTopBottom( 0, 0, -24, 66 )
		cryptokeyBack0:setAlpha( 0 )
		cryptokeyBack0:setScale( 0.75 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		DoubleXPDoubleWeaponXP = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setLeftRight( 1, 1, -4, 68 )
				self.Notification2xpReward:setTopBottom( 0, 0, -62, 10 )
				self.Notification2xpReward:setAlpha( 1 )
				self.Notification2xpReward:setScale( 0.65 )
				self.clipFinished( Notification2xpReward, {} )
				Notification2xpWeaponReward:completeAnimation()
				self.Notification2xpWeaponReward:setAlpha( 1 )
				self.Notification2xpWeaponReward:setScale( 0.65 )
				self.clipFinished( Notification2xpWeaponReward, {} )
				LoadingScreenDoubleXPLabel:completeAnimation()
				LoadingScreenDoubleXPLabel.XPLabel:completeAnimation()
				self.LoadingScreenDoubleXPLabel:setLeftRight( 1, 1, -464.5, 0.5 )
				self.LoadingScreenDoubleXPLabel:setTopBottom( 0, 0, -44, -8 )
				self.LoadingScreenDoubleXPLabel:setAlpha( 1 )
				self.LoadingScreenDoubleXPLabel.XPLabel:setRGB( 0.39, 0.83, 0.94 )
				self.LoadingScreenDoubleXPLabel.XPLabel:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
				self.clipFinished( LoadingScreenDoubleXPLabel, {} )
				LoadingScreenDoubleWeaponXPLabel:completeAnimation()
				self.LoadingScreenDoubleWeaponXPLabel:setAlpha( 1 )
				self.clipFinished( LoadingScreenDoubleWeaponXPLabel, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 1 )
				self.clipFinished( Notification2xpReward, {} )
				LoadingScreenDoubleXPLabel:completeAnimation()
				LoadingScreenDoubleXPLabel.XPLabel:completeAnimation()
				self.LoadingScreenDoubleXPLabel:setAlpha( 1 )
				self.LoadingScreenDoubleXPLabel.XPLabel:setRGB( 0.39, 0.83, 0.94 )
				self.LoadingScreenDoubleXPLabel.XPLabel:setText( Engine.Localize( "MENU_DOUBLE_XP" ) )
				self.clipFinished( LoadingScreenDoubleXPLabel, {} )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Notification2xpWeaponReward:completeAnimation()
				self.Notification2xpWeaponReward:setAlpha( 1 )
				self.clipFinished( Notification2xpWeaponReward, {} )
				LoadingScreenDoubleXPLabel:completeAnimation()
				LoadingScreenDoubleXPLabel.XPLabel:completeAnimation()
				self.LoadingScreenDoubleXPLabel.XPLabel:setRGB( 0.59, 0.36, 0.89 )
				self.clipFinished( LoadingScreenDoubleXPLabel, {} )
				LoadingScreenDoubleWeaponXPLabel:completeAnimation()
				self.LoadingScreenDoubleWeaponXPLabel:setAlpha( 1 )
				self.clipFinished( LoadingScreenDoubleWeaponXPLabel, {} )
			end
		},
		Doubleloot = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setLeftRight( 1, 1, -4, 68 )
				self.Notification2xpReward:setTopBottom( 0, 0, -27, 45 )
				self.clipFinished( Notification2xpReward, {} )
				Notification2xpWeaponReward:completeAnimation()
				self.Notification2xpWeaponReward:setLeftRight( 1, 1, -4, 68 )
				self.Notification2xpWeaponReward:setTopBottom( 0, 0, -27, 45 )
				self.clipFinished( Notification2xpWeaponReward, {} )
				LoadingScreenDoubleXPLabel:completeAnimation()
				LoadingScreenDoubleXPLabel.XPLabel:completeAnimation()
				self.LoadingScreenDoubleXPLabel:setLeftRight( 1, 1, -464.5, 0.5 )
				self.LoadingScreenDoubleXPLabel:setTopBottom( 0, 0, -6, 30 )
				self.LoadingScreenDoubleXPLabel:setAlpha( 1 )
				self.LoadingScreenDoubleXPLabel.XPLabel:setRGB( 1, 0.88, 0.43 )
				self.LoadingScreenDoubleXPLabel.XPLabel:setText( Engine.Localize( "MENU_DOUBLELOOT" ) )
				self.clipFinished( LoadingScreenDoubleXPLabel, {} )
				cryptokeyBack0:completeAnimation()
				self.cryptokeyBack0:setLeftRight( 1, 1, -13, 77 )
				self.cryptokeyBack0:setTopBottom( 0, 0, -31, 59 )
				self.cryptokeyBack0:setAlpha( 1 )
				self.cryptokeyBack0:setScale( 0.7 )
				self.clipFinished( cryptokeyBack0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DoubleXPDoubleWeaponXP",
			condition = function ( menu, element, event )
				return IsDoubleWeaponXP( controller ) and IsDoubleXP( controller )
			end
		},
		{
			stateName = "DoubleXP",
			condition = function ( menu, element, event )
				return IsDoubleXP( controller )
			end
		},
		{
			stateName = "DoubleWeaponXP",
			condition = function ( menu, element, event )
				return IsDoubleWeaponXP( controller )
			end
		},
		{
			stateName = "Doubleloot",
			condition = function ( menu, element, event )
				return IsDoubleLootXP( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Notification2xpReward:close()
		self.Notification2xpWeaponReward:close()
		self.LoadingScreenDoubleXPLabel:close()
		self.LoadingScreenDoubleWeaponXPLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

