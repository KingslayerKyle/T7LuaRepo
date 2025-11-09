CoD.FactionIcon = InheritFrom( LUI.UIElement )
CoD.FactionIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FactionIcon )
	self.id = "FactionIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	
	local factionIconBackground = LUI.UIImage.new()
	factionIconBackground:setLeftRight( true, true, 0, 0 )
	factionIconBackground:setTopBottom( true, true, 0, 0 )
	factionIconBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( factionIconBackground )
	self.factionIconBackground = factionIconBackground
	
	local factionIcon = LUI.UIImage.new()
	factionIcon:setLeftRight( true, true, 0, 0 )
	factionIcon:setTopBottom( true, true, 0, 0 )
	factionIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( factionIcon )
	self.factionIcon = factionIcon
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

