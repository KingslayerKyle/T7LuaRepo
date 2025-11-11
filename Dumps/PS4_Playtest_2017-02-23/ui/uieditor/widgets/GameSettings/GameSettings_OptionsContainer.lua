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
	self:setLeftRight( 0, 0, 0, 510 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local GameSettingsOptions0 = CoD.GameSettings_Options.new( menu, controller )
	GameSettingsOptions0:setLeftRight( 1, 1, -501, 0 )
	GameSettingsOptions0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( GameSettingsOptions0 )
	self.GameSettingsOptions0 = GameSettingsOptions0
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( 1, 1, -534, -532 )
	Border00:setTopBottom( 0, 0, 0, 1080 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	GameSettingsOptions0.id = "GameSettingsOptions0"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.GameSettingsOptions0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GameSettingsOptions0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

