require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_FooterBacking01" )

CoD.RankUpNotification_FooterLabel01 = InheritFrom( LUI.UIElement )
CoD.RankUpNotification_FooterLabel01.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RankUpNotification_FooterLabel01 )
	self.id = "RankUpNotification_FooterLabel01"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 206 )
	self:setTopBottom( true, false, 0, 32 )
	
	local RankUpNotificationFooterBacking010 = CoD.RankUpNotification_FooterBacking01.new( menu, controller )
	RankUpNotificationFooterBacking010:setLeftRight( true, true, 0, 0 )
	RankUpNotificationFooterBacking010:setTopBottom( true, false, 0, 32 )
	RankUpNotificationFooterBacking010:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( RankUpNotificationFooterBacking010 )
	self.RankUpNotificationFooterBacking010 = RankUpNotificationFooterBacking010
	
	local SubText = LUI.UIText.new()
	SubText:setLeftRight( false, false, -180, 180 )
	SubText:setTopBottom( true, false, 1, 31 )
	SubText:setRGB( 0, 0, 0 )
	SubText:setTTF( "fonts/default.ttf" )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( SubText, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 20, 20 )
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
		element.RankUpNotificationFooterBacking010:close()
		element.SubText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

