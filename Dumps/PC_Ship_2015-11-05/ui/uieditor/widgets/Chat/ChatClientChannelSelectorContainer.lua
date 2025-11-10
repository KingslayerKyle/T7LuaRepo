require( "ui.uieditor.widgets.Chat.ChatClientChannelSelectorMenu" )

CoD.ChatClientChannelSelectorContainer = InheritFrom( LUI.UIElement )
CoD.ChatClientChannelSelectorContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientChannelSelectorContainer )
	self.id = "ChatClientChannelSelectorContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local ChatClientChannelSelectorMenu = CoD.ChatClientChannelSelectorMenu.new( menu, controller )
	ChatClientChannelSelectorMenu:setLeftRight( true, false, 0, 110 )
	ChatClientChannelSelectorMenu:setTopBottom( true, false, 1, 76 )
	ChatClientChannelSelectorMenu:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		ChatClientChannelSelectorMenu:setModel( model, controller )
	end )
	self:addElement( ChatClientChannelSelectorMenu )
	self.ChatClientChannelSelectorMenu = ChatClientChannelSelectorMenu
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ChatClientChannelSelectorMenu:completeAnimation()
				self.ChatClientChannelSelectorMenu:setLeftRight( true, false, 0, 110 )
				self.ChatClientChannelSelectorMenu:setTopBottom( true, false, 1, 76 )
				self.ChatClientChannelSelectorMenu:setAlpha( 1 )
				self.clipFinished( ChatClientChannelSelectorMenu, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ChatClientChannelSelectorMenu:completeAnimation()
				self.ChatClientChannelSelectorMenu:setAlpha( 0 )
				self.clipFinished( ChatClientChannelSelectorMenu, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChatClientChannelSelectorMenu:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

