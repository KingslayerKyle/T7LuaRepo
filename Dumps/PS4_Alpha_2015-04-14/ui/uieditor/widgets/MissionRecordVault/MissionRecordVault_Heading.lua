CoD.MissionRecordVault_Heading = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Heading.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Heading )
	self.id = "MissionRecordVault_Heading"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 65 )
	
	local Subtitle = LUI.UITightText.new()
	Subtitle:setLeftRight( true, false, 35, 202 )
	Subtitle:setTopBottom( true, false, 40, 64 )
	Subtitle:setRGB( 1, 1, 1 )
	Subtitle:setText( Engine.Localize( "MENU_SELECT_MISSION" ) )
	Subtitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 35, 35 )
	Title:setTopBottom( true, false, 0, 34 )
	Title:setRGB( 1, 1, 1 )
	Title:setText( Engine.Localize( "" ) )
	Title:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	self:addElement( Title )
	self.Title = Title
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

