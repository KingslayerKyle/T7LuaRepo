require( "ui.uieditor.widgets.GameSettings.GameSettings_Description" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeName" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_MatchSettingsInfo" )

CoD.GameSettings_SelectedItemInfo = InheritFrom( LUI.UIElement )
CoD.GameSettings_SelectedItemInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_SelectedItemInfo )
	self.id = "GameSettings_SelectedItemInfo"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local ToolTip = CoD.GameSettings_Description.new( menu, controller )
	ToolTip:setLeftRight( 0, 0, 1090, 1824 )
	ToolTip:setTopBottom( 0, 0, 213, 415 )
	self:addElement( ToolTip )
	self.ToolTip = ToolTip
	
	local GameModeInfo = CoD.GameSettings_MatchSettingsInfo.new( menu, controller )
	GameModeInfo:setLeftRight( 0, 0, 1090, 1824 )
	GameModeInfo:setTopBottom( 0, 0, 523, 1037 )
	self:addElement( GameModeInfo )
	self.GameModeInfo = GameModeInfo
	
	local GameModeName = CoD.GameSettings_GameModeName.new( menu, controller )
	GameModeName:setLeftRight( 1, 1, -830, -96 )
	GameModeName:setTopBottom( 1, 1, -219.5, -162.5 )
	self:addElement( GameModeName )
	self.GameModeName = GameModeName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ToolTip:close()
		self.GameModeInfo:close()
		self.GameModeName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

