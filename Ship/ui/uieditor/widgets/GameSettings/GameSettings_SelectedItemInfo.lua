-- b9ca59e62edd30ef498f3da3d4cda1e4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GameSettings.GameSettings_Description" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_MatchSettingsInfo" )
require( "ui.uieditor.widgets.GameSettings.GameSettings_GameModeName" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local ToolTip = CoD.GameSettings_Description.new( menu, controller )
	ToolTip:setLeftRight( true, false, 727, 1216 )
	ToolTip:setTopBottom( true, false, 141.5, 276.5 )
	self:addElement( ToolTip )
	self.ToolTip = ToolTip
	
	local GameModeInfo = CoD.GameSettings_MatchSettingsInfo.new( menu, controller )
	GameModeInfo:setLeftRight( true, false, 727, 1216 )
	GameModeInfo:setTopBottom( true, false, 348.5, 691.5 )
	self:addElement( GameModeInfo )
	self.GameModeInfo = GameModeInfo
	
	local GameModeName = CoD.GameSettings_GameModeName.new( menu, controller )
	GameModeName:setLeftRight( false, true, -553, -64 )
	GameModeName:setTopBottom( false, true, -146.5, -108.5 )
	self:addElement( GameModeName )
	self.GameModeName = GameModeName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ToolTip:close()
		element.GameModeInfo:close()
		element.GameModeName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
