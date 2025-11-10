CoD.LobbyBubbleGumBuff = InheritFrom( LUI.UIElement )
CoD.LobbyBubbleGumBuff.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyBubbleGumBuff )
	self.id = "LobbyBubbleGumBuff"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local BubbleGumBuffImage = LUI.UIImage.new()
	BubbleGumBuffImage:setLeftRight( false, false, -32, 32 )
	BubbleGumBuffImage:setTopBottom( false, false, -32, 32 )
	self:addElement( BubbleGumBuffImage )
	self.BubbleGumBuffImage = BubbleGumBuffImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BubbleGumBuffImage:completeAnimation()
				self.BubbleGumBuffImage:setAlpha( 1 )
				self.clipFinished( BubbleGumBuffImage, {} )
			end
		},
		OutOfBubbleGum = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				BubbleGumBuffImage:completeAnimation()
				self.BubbleGumBuffImage:setAlpha( 0.5 )
				self.clipFinished( BubbleGumBuffImage, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

