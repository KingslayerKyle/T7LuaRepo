require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.Notification2xpWeaponReward" )
require( "ui.uieditor.widgets.Notifications.NotificationQueueWidgets.NotificationRewardQueueWidgets.Notification2xpReward" )

CoD.LoadingScreen_DoubleXPWidget = InheritFrom( LUI.UIElement )
CoD.LoadingScreen_DoubleXPWidget.new = function ( menu, controller )
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
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreen_DoubleXPWidget )
	self.id = "LoadingScreen_DoubleXPWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local cryptokeyBack0 = LUI.UIImage.new()
	cryptokeyBack0:setLeftRight( false, true, -48, 0 )
	cryptokeyBack0:setTopBottom( true, false, 0, 48 )
	cryptokeyBack0:setAlpha( 0 )
	cryptokeyBack0:setImage( RegisterImage( "uie_t7_icon_blackmarket_doubleloot_small" ) )
	self:addElement( cryptokeyBack0 )
	self.cryptokeyBack0 = cryptokeyBack0
	
	local Notification2xpWeaponReward = CoD.Notification2xpWeaponReward.new( menu, controller )
	Notification2xpWeaponReward:setLeftRight( false, true, -96, -48 )
	Notification2xpWeaponReward:setTopBottom( true, false, 0, 48 )
	Notification2xpWeaponReward:setAlpha( 0 )
	self:addElement( Notification2xpWeaponReward )
	self.Notification2xpWeaponReward = Notification2xpWeaponReward
	
	local Notification2xpReward = CoD.Notification2xpReward.new( menu, controller )
	Notification2xpReward:setLeftRight( false, true, -144, -96 )
	Notification2xpReward:setTopBottom( true, false, 0, 48 )
	Notification2xpReward:setAlpha( 0 )
	self:addElement( Notification2xpReward )
	self.Notification2xpReward = Notification2xpReward
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		TripleDouble = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				cryptokeyBack0:completeAnimation()
				self.cryptokeyBack0:setAlpha( 1 )
				self.clipFinished( cryptokeyBack0, {} )
				Notification2xpWeaponReward:completeAnimation()
				self.Notification2xpWeaponReward:setAlpha( 1 )
				self.clipFinished( Notification2xpWeaponReward, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 1 )
				self.clipFinished( Notification2xpReward, {} )
			end
		},
		DoubleXPDoubleWeaponXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				cryptokeyBack0:completeAnimation()
				self.cryptokeyBack0:setAlpha( 0 )
				self.clipFinished( cryptokeyBack0, {} )
				Notification2xpWeaponReward:completeAnimation()
				self.Notification2xpWeaponReward:setAlpha( 1 )
				self.clipFinished( Notification2xpWeaponReward, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 1 )
				self.clipFinished( Notification2xpReward, {} )
			end
		},
		DoubleXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				cryptokeyBack0:completeAnimation()
				self.cryptokeyBack0:setAlpha( 0 )
				self.clipFinished( cryptokeyBack0, {} )
				Notification2xpWeaponReward:completeAnimation()
				self.Notification2xpWeaponReward:setAlpha( 0 )
				self.clipFinished( Notification2xpWeaponReward, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 1 )
				self.clipFinished( Notification2xpReward, {} )
			end
		},
		DoubleWeaponXP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				cryptokeyBack0:completeAnimation()
				self.cryptokeyBack0:setAlpha( 0 )
				self.clipFinished( cryptokeyBack0, {} )
				Notification2xpWeaponReward:completeAnimation()
				self.Notification2xpWeaponReward:setAlpha( 1 )
				self.clipFinished( Notification2xpWeaponReward, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 0 )
				self.clipFinished( Notification2xpReward, {} )
			end
		},
		Doubleloot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				cryptokeyBack0:completeAnimation()
				self.cryptokeyBack0:setAlpha( 1 )
				self.clipFinished( cryptokeyBack0, {} )
				Notification2xpWeaponReward:completeAnimation()
				self.Notification2xpWeaponReward:setAlpha( 0 )
				self.clipFinished( Notification2xpWeaponReward, {} )
				Notification2xpReward:completeAnimation()
				self.Notification2xpReward:setAlpha( 0 )
				self.clipFinished( Notification2xpReward, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "TripleDouble",
			condition = function ( menu, element, event )
				local f9_local0 = IsDoubleWeaponXP( controller )
				if f9_local0 then
					f9_local0 = IsDoubleXP( controller )
					if f9_local0 then
						f9_local0 = IsDoubleLootXP( controller )
					end
				end
				return f9_local0
			end
		},
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Notification2xpWeaponReward:close()
		element.Notification2xpReward:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

