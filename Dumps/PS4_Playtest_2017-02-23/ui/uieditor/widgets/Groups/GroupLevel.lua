CoD.GroupLevel = InheritFrom( LUI.UIElement )
CoD.GroupLevel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupLevel )
	self.id = "GroupLevel"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 240 )
	self:setTopBottom( 0, 0, 0, 90 )
	
	local GroupRankIcon = LUI.UIImage.new()
	GroupRankIcon:setLeftRight( 0, 1, 16, -132 )
	GroupRankIcon:setTopBottom( 0, 1, 0, 0 )
	self:addElement( GroupRankIcon )
	self.GroupRankIcon = GroupRankIcon
	
	local GroupLevel = LUI.UIText.new()
	GroupLevel:setLeftRight( 0, 1, 133, -15 )
	GroupLevel:setTopBottom( 0, 1, 13, -13 )
	GroupLevel:setText( Engine.Localize( "125" ) )
	GroupLevel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	GroupLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GroupLevel )
	self.GroupLevel = GroupLevel
	
	local GroupLevelTitle = LUI.UIText.new()
	GroupLevelTitle:setLeftRight( 1, 1, -249, 0 )
	GroupLevelTitle:setTopBottom( 0, 0, 67, 97 )
	GroupLevelTitle:setAlpha( 0 )
	GroupLevelTitle:setText( Engine.Localize( "GROUPS_GROUP_LEVEL_CAPS" ) )
	GroupLevelTitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	GroupLevelTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	GroupLevelTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GroupLevelTitle )
	self.GroupLevelTitle = GroupLevelTitle
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

