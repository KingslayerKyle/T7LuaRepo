require( "ui.uieditor.widgets.Notifications.RankUp.RankUpNotification_TitleBacking9Slice" )

CoD.RankUpNotification_Title = InheritFrom( LUI.UIElement )
CoD.RankUpNotification_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RankUpNotification_Title )
	self.id = "RankUpNotification_Title"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 280 )
	self:setTopBottom( true, false, 0, 68 )
	self.anyChildUsesUpdateState = true
	
	local RankUpNotificationTitleBacking9Slice0 = CoD.RankUpNotification_TitleBacking9Slice.new( menu, controller )
	RankUpNotificationTitleBacking9Slice0:setLeftRight( true, true, 0, 0 )
	RankUpNotificationTitleBacking9Slice0:setTopBottom( true, false, 0, 68 )
	RankUpNotificationTitleBacking9Slice0:setAlpha( 0.4 )
	self:addElement( RankUpNotificationTitleBacking9Slice0 )
	self.RankUpNotificationTitleBacking9Slice0 = RankUpNotificationTitleBacking9Slice0
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( false, false, -206, 206 )
	Text:setTopBottom( true, false, 5, 35 )
	Text:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 40, 40 )
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
			end,
			TimeUp = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RankUpNotificationTitleBacking9Slice0:close()
		element.Text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

