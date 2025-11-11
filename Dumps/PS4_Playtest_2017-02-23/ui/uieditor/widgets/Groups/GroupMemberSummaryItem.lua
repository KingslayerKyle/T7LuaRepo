require( "ui.uieditor.widgets.BorderThin" )

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
	self:setLeftRight( 0, 0, 0, 240 )
	self:setTopBottom( 0, 0, 0, 97 )
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 1, 0, 0 )
	Title:setTopBottom( 0, 0, 0, 36 )
	Title:setText( Engine.Localize( "TITLE" ) )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 38, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.65 )
	self:addElement( Background )
	self.Background = Background
	
	local Count = LUI.UIText.new()
	Count:setLeftRight( 0, 1, 0, 0 )
	Count:setTopBottom( 0.5, 0.5, 0, 48 )
	Count:setRGB( 1, 0.8, 0.4 )
	Count:setText( Engine.Localize( "00000" ) )
	Count:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Count )
	self.Count = Count
	
	local BorderThin0 = CoD.BorderThin.new( menu, controller )
	BorderThin0:setLeftRight( 0, 1, 0, 0 )
	BorderThin0:setTopBottom( 0, 1, 0, 0 )
	BorderThin0:setAlpha( 0.5 )
	self:addElement( BorderThin0 )
	self.BorderThin0 = BorderThin0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderThin0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

