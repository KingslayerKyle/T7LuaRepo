CoD.FileshareSelectedItemAuthor = InheritFrom( LUI.UIElement )
CoD.FileshareSelectedItemAuthor.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 2
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectedItemAuthor )
	self.id = "FileshareSelectedItemAuthor"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 317 )
	self:setTopBottom( true, false, 0, 30 )
	
	local LblAuthor = LUI.UITightText.new()
	LblAuthor:setLeftRight( true, false, 0, 59 )
	LblAuthor:setTopBottom( true, false, 0, 30 )
	LblAuthor:setText( Engine.Localize( "MENU_FILESHARE_AUTHOR" ) )
	LblAuthor:setTTF( "fonts/default.ttf" )
	self:addElement( LblAuthor )
	self.LblAuthor = LblAuthor
	
	local AuthorName = LUI.UIText.new()
	AuthorName:setLeftRight( true, false, 61, 317 )
	AuthorName:setTopBottom( true, false, 0, 30 )
	AuthorName:setText( Engine.Localize( "WWWWWWWWWWWWWWWW" ) )
	AuthorName:setTTF( "fonts/default.ttf" )
	AuthorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	AuthorName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AuthorName )
	self.AuthorName = AuthorName
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

