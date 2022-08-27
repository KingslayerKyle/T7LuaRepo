-- 8332c8c490008d6cc1d159e8a593c03d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_Options" )

CoD.GameSettings_OptionsContainer = InheritFrom( LUI.UIElement )
CoD.GameSettings_OptionsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_OptionsContainer )
	self.id = "GameSettings_OptionsContainer"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 340 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GameSettingsOptions0 = CoD.GameSettings_Options.new( menu, controller )
	GameSettingsOptions0:setLeftRight( false, true, -334, 0 )
	GameSettingsOptions0:setTopBottom( true, true, 0, 0 )
	self:addElement( GameSettingsOptions0 )
	self.GameSettingsOptions0 = GameSettingsOptions0
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( false, true, -356, -355 )
	Border00:setTopBottom( true, false, 0, 720 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	GameSettingsOptions0.id = "GameSettingsOptions0"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GameSettingsOptions0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GameSettingsOptions0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

