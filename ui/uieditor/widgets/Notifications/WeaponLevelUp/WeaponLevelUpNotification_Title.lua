-- 3599a51ef88ddc8d4f91a6ae5d965985
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_TitleBacking" )

CoD.WeaponLevelUpNotification_Title = InheritFrom( LUI.UIElement )
CoD.WeaponLevelUpNotification_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponLevelUpNotification_Title )
	self.id = "WeaponLevelUpNotification_Title"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 408 )
	self:setTopBottom( true, false, 0, 40 )
	self.anyChildUsesUpdateState = true
	
	local WeaponLevelUpNotificationTitleBacking = CoD.WeaponLevelUpNotification_TitleBacking.new( menu, controller )
	WeaponLevelUpNotificationTitleBacking:setLeftRight( true, true, 0, 0 )
	WeaponLevelUpNotificationTitleBacking:setTopBottom( true, false, 0, 40 )
	self:addElement( WeaponLevelUpNotificationTitleBacking )
	self.WeaponLevelUpNotificationTitleBacking = WeaponLevelUpNotificationTitleBacking
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( false, false, -300, 300 )
	Text:setTopBottom( true, false, 2, 32 )
	Text:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 170, 170 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.Text:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Text:setText( Engine.Localize( title ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponLevelUpNotificationTitleBacking:close()
		element.Text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

