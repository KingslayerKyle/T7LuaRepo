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
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 60 )
	
	local GroupRankIcon = LUI.UIImage.new()
	GroupRankIcon:setLeftRight( true, true, 10, -88 )
	GroupRankIcon:setTopBottom( true, true, 0, 0 )
	GroupRankIcon:setImage( RegisterImage( "uie_t7_hud_waypoints_bomb_new" ) )
	self:addElement( GroupRankIcon )
	self.GroupRankIcon = GroupRankIcon
	
	local GroupLevel = LUI.UIText.new()
	GroupLevel:setLeftRight( true, true, 88.79, -9.79 )
	GroupLevel:setTopBottom( true, true, 8.5, -8.5 )
	GroupLevel:setText( Engine.Localize( "125" ) )
	GroupLevel:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	GroupLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GroupLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GroupLevel )
	self.GroupLevel = GroupLevel
	
	local GroupLevelTitle = LUI.UIText.new()
	GroupLevelTitle:setLeftRight( false, true, -166, 0 )
	GroupLevelTitle:setTopBottom( true, false, 45, 65 )
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

