-- 890ee25c6510a3614b3105c140312aba
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Notifications.WeaponLevelUp.WeaponLevelUpNotification_FooterBacking02" )

CoD.WeaponLevelUpNotification_FooterLabel02 = InheritFrom( LUI.UIElement )
CoD.WeaponLevelUpNotification_FooterLabel02.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WeaponLevelUpNotification_FooterLabel02 )
	self.id = "WeaponLevelUpNotification_FooterLabel02"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 206 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local WeaponLevelUpNotificationFooterBacking = CoD.WeaponLevelUpNotification_FooterBacking02.new( menu, controller )
	WeaponLevelUpNotificationFooterBacking:setLeftRight( true, true, 0, 0 )
	WeaponLevelUpNotificationFooterBacking:setTopBottom( true, false, 0, 32 )
	self:addElement( WeaponLevelUpNotificationFooterBacking )
	self.WeaponLevelUpNotificationFooterBacking = WeaponLevelUpNotificationFooterBacking
	
	local SubText = LUI.UIText.new()
	SubText:setLeftRight( false, false, -180, 180 )
	SubText:setTopBottom( true, false, 1, 31 )
	SubText:setAlpha( 0 )
	SubText:setTTF( "fonts/default.ttf" )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( SubText, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 86, 86 )
	end )
	self:addElement( SubText )
	self.SubText = SubText
	
	self.SubText:linkToElementModel( self, "subtitle", true, function ( model )
		local subtitle = Engine.GetModelValue( model )
		if subtitle then
			SubText:setText( subtitle )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WeaponLevelUpNotificationFooterBacking:close()
		element.SubText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
