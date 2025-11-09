CoD.CurrentSelectionInfo = InheritFrom( LUI.UIElement )
CoD.CurrentSelectionInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CurrentSelectionInfo )
	self.id = "CurrentSelectionInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 178 )
	
	local categoryLabel = LUI.UITightText.new()
	categoryLabel:setLeftRight( true, false, 2, 180 )
	categoryLabel:setTopBottom( true, false, 0, 30 )
	categoryLabel:setRGB( 0.4, 0.44, 0.52 )
	categoryLabel:setText( Engine.Localize( "MPUI_PRIMARY_WEAPON1" ) )
	categoryLabel:setTTF( "fonts/default.ttf" )
	self:addElement( categoryLabel )
	self.categoryLabel = categoryLabel
	
	local weaponNameLabel = LUI.UITightText.new()
	weaponNameLabel:setLeftRight( true, false, 1, 145 )
	weaponNameLabel:setTopBottom( true, false, 34, 82 )
	weaponNameLabel:setRGB( 0.9, 0.9, 0.9 )
	weaponNameLabel:setText( Engine.Localize( "WEAPON_PDW57" ) )
	weaponNameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( weaponNameLabel )
	self.weaponNameLabel = weaponNameLabel
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( true, false, 2, 278 )
	weaponDescTextBox:setTopBottom( true, false, 82, 102 )
	weaponDescTextBox:setRGB( 0.59, 0.62, 0.7 )
	weaponDescTextBox:setText( Engine.Localize( "WEAPON_PDW57_DESC" ) )
	weaponDescTextBox:setTTF( "fonts/default.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

