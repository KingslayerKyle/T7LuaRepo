require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_Title" )

CoD.WeaponLevelUpNotification_Bottom = InheritFrom( LUI.UIElement )
CoD.WeaponLevelUpNotification_Bottom.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponLevelUpNotification_Bottom )
	self.id = "WeaponLevelUpNotification_Bottom"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 160 )
	self.anyChildUsesUpdateState = true
	
	local BottomMain = LUI.UIImage.new()
	BottomMain:setLeftRight( false, false, -204, 204 )
	BottomMain:setTopBottom( true, false, 0, 120 )
	BottomMain:setRGB( 0, 0, 0 )
	BottomMain:setImage( RegisterImage( "uie_t7_hud_weaponlevel_bottom_main" ) )
	BottomMain:setupUIStreamedImage( 0 )
	self:addElement( BottomMain )
	self.BottomMain = BottomMain
	
	local WeaponLevelUpNotificationTitle = CoD.WeaponLevelUpNotification_Title.new( menu, controller )
	WeaponLevelUpNotificationTitle:setLeftRight( false, false, -204, 204 )
	WeaponLevelUpNotificationTitle:setTopBottom( true, false, 120, 160 )
	self:addElement( WeaponLevelUpNotificationTitle )
	self.WeaponLevelUpNotificationTitle = WeaponLevelUpNotificationTitle
	
	self.WeaponLevelUpNotificationTitle:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			WeaponLevelUpNotificationTitle.Text:setText( Engine.Localize( title ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BottomMain:completeAnimation()
				self.BottomMain:setLeftRight( false, false, -204, 204 )
				self.BottomMain:setTopBottom( true, false, 7, 127 )
				self.BottomMain:setAlpha( 1 )
				self.BottomMain:setScale( 1 )
				self.clipFinished( BottomMain, {} )
				WeaponLevelUpNotificationTitle:completeAnimation()
				self.WeaponLevelUpNotificationTitle:setLeftRight( false, false, -204, 204 )
				self.WeaponLevelUpNotificationTitle:setTopBottom( true, false, 127, 167 )
				self.WeaponLevelUpNotificationTitle:setAlpha( 1 )
				self.WeaponLevelUpNotificationTitle:setScale( 1 )
				self.clipFinished( WeaponLevelUpNotificationTitle, {} )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponLevelUpNotificationTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

