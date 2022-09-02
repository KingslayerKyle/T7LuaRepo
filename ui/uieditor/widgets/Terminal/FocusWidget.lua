-- 166498a3d7193e479e694e5dc3c9ddce
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.FocusWidget_BG" )
require( "ui.uieditor.widgets.Terminal.FocusWidgetWhiteBars" )

CoD.FocusWidget = InheritFrom( LUI.UIElement )
CoD.FocusWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FocusWidget )
	self.id = "FocusWidget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 164 )
	self:setTopBottom( true, false, 0, 18 )
	self.anyChildUsesUpdateState = true
	
	local FocusWidgetBG0 = CoD.FocusWidget_BG.new( menu, controller )
	FocusWidgetBG0:setLeftRight( true, true, 5, -4 )
	FocusWidgetBG0:setTopBottom( true, false, -2, 20 )
	self:addElement( FocusWidgetBG0 )
	self.FocusWidgetBG0 = FocusWidgetBG0
	
	local FocusWidgetBG1 = CoD.FocusWidget_BG.new( menu, controller )
	FocusWidgetBG1:setLeftRight( true, true, 5, -4 )
	FocusWidgetBG1:setTopBottom( true, false, -2, 20 )
	self:addElement( FocusWidgetBG1 )
	self.FocusWidgetBG1 = FocusWidgetBG1
	
	local FocusWidgetBG2 = CoD.FocusWidget_BG.new( menu, controller )
	FocusWidgetBG2:setLeftRight( true, true, 5, -4 )
	FocusWidgetBG2:setTopBottom( true, false, -2, 20 )
	self:addElement( FocusWidgetBG2 )
	self.FocusWidgetBG2 = FocusWidgetBG2
	
	local FocusWidgetBG = CoD.FocusWidget_BG.new( menu, controller )
	FocusWidgetBG:setLeftRight( true, true, 5, -4 )
	FocusWidgetBG:setTopBottom( true, false, -2, 20 )
	self:addElement( FocusWidgetBG )
	self.FocusWidgetBG = FocusWidgetBG
	
	local FocusWidgetWhiteBars = CoD.FocusWidgetWhiteBars.new( menu, controller )
	FocusWidgetWhiteBars:setLeftRight( true, true, -0.32, 0.68 )
	FocusWidgetWhiteBars:setTopBottom( true, false, -3.42, 3.42 )
	self:addElement( FocusWidgetWhiteBars )
	self.FocusWidgetWhiteBars = FocusWidgetWhiteBars
	
	local FocusWidgetWhiteBars0 = CoD.FocusWidgetWhiteBars.new( menu, controller )
	FocusWidgetWhiteBars0:setLeftRight( true, true, -0.32, 0.68 )
	FocusWidgetWhiteBars0:setTopBottom( true, false, 14.08, 20.92 )
	self:addElement( FocusWidgetWhiteBars0 )
	self.FocusWidgetWhiteBars0 = FocusWidgetWhiteBars0
	
	local Name = LUI.UITightText.new()
	Name:setLeftRight( true, false, 12.99, 155.84 )
	Name:setTopBottom( true, false, 0.5, 17.5 )
	Name:setText( Engine.Localize( "MENU_NEW" ) )
	Name:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( Name )
	self.Name = Name
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusWidgetBG0:close()
		element.FocusWidgetBG1:close()
		element.FocusWidgetBG2:close()
		element.FocusWidgetBG:close()
		element.FocusWidgetWhiteBars:close()
		element.FocusWidgetWhiteBars0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

