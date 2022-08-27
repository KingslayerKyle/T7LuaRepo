-- 0147b6a1ec490901ffb53c3d8a79706d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Terminal.OmnipediaWidgetButtonsRight" )

CoD.OmnipediaWidgetButtons = InheritFrom( LUI.UIElement )
CoD.OmnipediaWidgetButtons.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OmnipediaWidgetButtons )
	self.id = "OmnipediaWidgetButtons"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 65 )
	self.anyChildUsesUpdateState = true
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( true, true, -123, 131.5 )
	blackleftBG:setTopBottom( false, true, -40, 149 )
	blackleftBG:setRGB( 0, 0, 0 )
	blackleftBG:setAlpha( 0.65 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, -123, 131.5 )
	LineLeft:setTopBottom( false, true, -41.85, -37.85 )
	LineLeft:setAlpha( 0.55 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	local feLeftContainer = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	feLeftContainer:setLeftRight( true, false, 9, 441 )
	feLeftContainer:setTopBottom( false, true, -51, -7 )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	local OmnipediaWidgetButtonsRight = CoD.OmnipediaWidgetButtonsRight.new( menu, controller )
	OmnipediaWidgetButtonsRight:setLeftRight( false, true, -870, -40 )
	OmnipediaWidgetButtonsRight:setTopBottom( false, true, -40, -8 )
	self:addElement( OmnipediaWidgetButtonsRight )
	self.OmnipediaWidgetButtonsRight = OmnipediaWidgetButtonsRight
	
	feLeftContainer:setModel( menu.buttonModel, controller )
	OmnipediaWidgetButtonsRight:setModel( menu.buttonModel, controller )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feLeftContainer:close()
		element.OmnipediaWidgetButtonsRight:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

