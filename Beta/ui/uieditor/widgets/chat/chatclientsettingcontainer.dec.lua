require( "ui.uieditor.widgets.Chat.ChatClientSettingsMenu" )

CoD.ChatClientSettingContainer = InheritFrom( LUI.UIElement )
CoD.ChatClientSettingContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientSettingContainer )
	self.id = "ChatClientSettingContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 110 )
	self.anyChildUsesUpdateState = true
	
	local ChatClientSettingsMenu = CoD.ChatClientSettingsMenu.new( menu, controller )
	ChatClientSettingsMenu:setLeftRight( true, false, 0, 110 )
	ChatClientSettingsMenu:setTopBottom( true, false, 0, 110 )
	self:addElement( ChatClientSettingsMenu )
	self.ChatClientSettingsMenu = ChatClientSettingsMenu
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ChatClientSettingsMenu:completeAnimation()
				self.ChatClientSettingsMenu:setAlpha( 1 )
				self.clipFinished( ChatClientSettingsMenu, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ChatClientSettingsMenu:completeAnimation()
				self.ChatClientSettingsMenu:setAlpha( 0 )
				self.clipFinished( ChatClientSettingsMenu, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChatClientSettingsMenu:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

