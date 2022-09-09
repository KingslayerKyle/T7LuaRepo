-- d028f7a0a6e3de162f403d2c69c5bf4c
-- This hash is used for caching, delete to decompile the file again

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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ChatBubbleImage:completeAnimation()
				self.ChatBubbleImage:setRGB( 1, 1, 1 )
				self.ChatBubbleImage:setAlpha( 1 )
				self.clipFinished( ChatBubbleImage, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				ChatBubbleImage:completeAnimation()
				self.ChatBubbleImage:setRGB( 1, 0.41, 0 )
				self.ChatBubbleImage:setAlpha( 1 )
				self.clipFinished( ChatBubbleImage, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ChatBubbleImage:completeAnimation()
				self.ChatBubbleImage:setRGB( 1, 1, 1 )
				self.ChatBubbleImage:setAlpha( 0.75 )
				self.clipFinished( ChatBubbleImage, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ChatClientIsAvailable( self, element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "ChatClientGlobal.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ChatClientGlobal.update"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
