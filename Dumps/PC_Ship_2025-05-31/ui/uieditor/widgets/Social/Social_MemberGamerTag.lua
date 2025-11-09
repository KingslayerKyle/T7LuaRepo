CoD.Social_MemberGamerTag = InheritFrom( LUI.UIElement )
CoD.Social_MemberGamerTag.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_MemberGamerTag )
	self.id = "Social_MemberGamerTag"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 271 )
	self:setTopBottom( true, false, 0, 25 )
	
	local gamertag = LUI.UITightText.new()
	gamertag:setLeftRight( true, false, 0, 271 )
	gamertag:setTopBottom( true, false, 0, 22 )
	gamertag:setRGB( 0.87, 0.9, 0.9 )
	gamertag:setAlpha( 0.73 )
	gamertag:setText( Engine.Localize( "[WWWW]WWWWWWWWWWWWWWWW" ) )
	gamertag:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			TeamSwitch = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

