require( "ui.uieditor.widgets.AmmoWidget_StatusPanelLeftWidget" )

CoD.AmmoWidget_StatusPanelLeftContainer = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_StatusPanelLeftContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_StatusPanelLeftContainer )
	self.id = "AmmoWidget_StatusPanelLeftContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 48 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local AmmoWidgetStatusPanelLeftWidget = CoD.AmmoWidget_StatusPanelLeftWidget.new( menu, controller )
	AmmoWidgetStatusPanelLeftWidget:setLeftRight( true, false, 0, 48 )
	AmmoWidgetStatusPanelLeftWidget:setTopBottom( true, false, 0, 48 )
	self:addElement( AmmoWidgetStatusPanelLeftWidget )
	self.AmmoWidgetStatusPanelLeftWidget = AmmoWidgetStatusPanelLeftWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AmmoWidgetStatusPanelLeftWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

