require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
end

CoD.ChatClientChannelSelectorButton = InheritFrom( LUI.UIElement )
CoD.ChatClientChannelSelectorButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientChannelSelectorButton )
	self.id = "ChatClientChannelSelectorButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local ChatBubbleImage = LUI.UIImage.new()
	ChatBubbleImage:setLeftRight( true, false, 0, 32 )
	ChatBubbleImage:setTopBottom( true, false, 0, 32 )
	ChatBubbleImage:setScale( 0.6 )
	ChatBubbleImage:setImage( RegisterImage( "uie_chatclient_channel_select" ) )
	self:addElement( ChatBubbleImage )
	self.ChatBubbleImage = ChatBubbleImage
	
	local BorderOver = CoD.Border.new( menu, controller )
	BorderOver:setLeftRight( true, true, 0, 0 )
	BorderOver:setTopBottom( true, true, 0, 0 )
	BorderOver:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	BorderOver:setAlpha( 0 )
	self:addElement( BorderOver )
	self.BorderOver = BorderOver
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ChatBubbleImage:completeAnimation()
				self.ChatBubbleImage:setRGB( 1, 1, 1 )
				self.ChatBubbleImage:setAlpha( 1 )
				self.clipFinished( ChatBubbleImage, {} )
				BorderOver:completeAnimation()
				self.BorderOver:setAlpha( 0 )
				self.clipFinished( BorderOver, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )
				ChatBubbleImage:completeAnimation()
				self.ChatBubbleImage:setRGB( 1, 0.41, 0 )
				self.ChatBubbleImage:setAlpha( 1 )
				self.clipFinished( ChatBubbleImage, {} )
				BorderOver:completeAnimation()
				self.BorderOver:setAlpha( 0 )
				self.clipFinished( BorderOver, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderOver:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

