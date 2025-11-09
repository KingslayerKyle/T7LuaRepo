require( "ui.uieditor.widgets.Notifications.Global.Notif_Global_TitleBackingLine" )

CoD.Notif_Global_TitleLine = InheritFrom( LUI.UIElement )
CoD.Notif_Global_TitleLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notif_Global_TitleLine )
	self.id = "Notif_Global_TitleLine"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 40 )
	
	local NotifGlobalTitleBackingLine = CoD.Notif_Global_TitleBackingLine.new( menu, controller )
	NotifGlobalTitleBackingLine:setLeftRight( true, true, 0, 0 )
	NotifGlobalTitleBackingLine:setTopBottom( true, false, 0, 40 )
	self:addElement( NotifGlobalTitleBackingLine )
	self.NotifGlobalTitleBackingLine = NotifGlobalTitleBackingLine
	
	local SubText = LUI.UIText.new()
	SubText:setLeftRight( false, false, -273, 273 )
	SubText:setTopBottom( true, false, 3, 37 )
	SubText:setRGB( 0, 0, 0 )
	SubText:setAlpha( 0 )
	SubText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( SubText, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 158, 0 )
	end )
	self:addElement( SubText )
	self.SubText = SubText
	
	self.SubText:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			SubText:setText( title )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NotifGlobalTitleBackingLine:close()
		element.SubText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

