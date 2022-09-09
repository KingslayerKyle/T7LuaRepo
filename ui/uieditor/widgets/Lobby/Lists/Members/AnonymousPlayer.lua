-- 405c2cc181493372091b01deed79719a
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 352 )
	self:setTopBottom( true, false, 0, 25 )
	
	local MatchedPlayer = LUI.UITightText.new()
	MatchedPlayer:setLeftRight( true, false, 0, 122 )
	MatchedPlayer:setTopBottom( true, false, 0, 25 )
	MatchedPlayer:setText( Engine.Localize( "MP_MATCHEDPLAYER" ) )
	MatchedPlayer:setTTF( "fonts/default.ttf" )
	self:addElement( MatchedPlayer )
	self.MatchedPlayer = MatchedPlayer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
