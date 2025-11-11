CoD.AnonymousPlayer = InheritFrom( LUI.UIElement )
CoD.AnonymousPlayer.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AnonymousPlayer )
	self.id = "AnonymousPlayer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 528 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local MatchedPlayer = LUI.UITightText.new()
	MatchedPlayer:setLeftRight( 0, 0, 0, 183 )
	MatchedPlayer:setTopBottom( 0, 0, 0, 38 )
	MatchedPlayer:setText( Engine.Localize( "MP_MATCHEDPLAYER" ) )
	MatchedPlayer:setTTF( "fonts/default.ttf" )
	self:addElement( MatchedPlayer )
	self.MatchedPlayer = MatchedPlayer
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

