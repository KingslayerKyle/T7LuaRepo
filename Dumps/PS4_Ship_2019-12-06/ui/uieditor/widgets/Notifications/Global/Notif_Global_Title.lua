require( "ui.uieditor.widgets.Notifications.Global.Notif_Global_TitleBacking" )

CoD.Notif_Global_Title = InheritFrom( LUI.UIElement )
CoD.Notif_Global_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Notif_Global_Title )
	self.id = "Notif_Global_Title"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 40 )
	
	local NotifGlobalTitleBacking0 = CoD.Notif_Global_TitleBacking.new( menu, controller )
	NotifGlobalTitleBacking0:setLeftRight( true, true, 0, 0 )
	NotifGlobalTitleBacking0:setTopBottom( true, false, 0, 40 )
	NotifGlobalTitleBacking0:setRGB( 0, 0, 0 )
	NotifGlobalTitleBacking0:setAlpha( 0.7 )
	self:addElement( NotifGlobalTitleBacking0 )
	self.NotifGlobalTitleBacking0 = NotifGlobalTitleBacking0
	
	local NotifGlobalTitleBacking = CoD.Notif_Global_TitleBacking.new( menu, controller )
	NotifGlobalTitleBacking:setLeftRight( true, true, 0, 0 )
	NotifGlobalTitleBacking:setTopBottom( true, false, 0, 40 )
	NotifGlobalTitleBacking:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NotifGlobalTitleBacking )
	self.NotifGlobalTitleBacking = NotifGlobalTitleBacking
	
	local SubText = LUI.UIText.new()
	SubText:setLeftRight( false, false, -273, 273 )
	SubText:setTopBottom( true, false, 3, 37 )
	SubText:setRGB( 0, 0, 0 )
	SubText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SubText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( SubText, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 40, 0 )
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
		element.NotifGlobalTitleBacking0:close()
		element.NotifGlobalTitleBacking:close()
		element.SubText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

