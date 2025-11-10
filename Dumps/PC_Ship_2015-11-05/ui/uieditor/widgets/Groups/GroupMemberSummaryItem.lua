CoD.GroupMemberSummaryItem = InheritFrom( LUI.UIElement )
CoD.GroupMemberSummaryItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupMemberSummaryItem )
	self.id = "GroupMemberSummaryItem"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 65 )
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, true, 0, 0 )
	Title:setTopBottom( true, false, 7.5, 23.5 )
	Title:setText( Engine.Localize( "TITLE" ) )
	Title:setTTF( "fonts/UnitedSansRgMd.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, -2, 2 )
	Background:setTopBottom( true, true, 25, 0 )
	Background:setRGB( 0.87, 0.88, 0.78 )
	self:addElement( Background )
	self.Background = Background
	
	local Count = LUI.UIText.new()
	Count:setLeftRight( true, true, 0, 0 )
	Count:setTopBottom( false, false, -0.5, 32.5 )
	Count:setRGB( 0, 0, 0 )
	Count:setText( Engine.Localize( "00000" ) )
	Count:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Count )
	self.Count = Count
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

