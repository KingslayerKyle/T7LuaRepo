require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.MOTD.MOTD_FooterImageContainer" )
require( "ui.uieditor.widgets.MOTD.MOTD_TextAndBG" )

CoD.MOTD_Footer = InheritFrom( LUI.UIElement )
CoD.MOTD_Footer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MOTD_Footer )
	self.id = "MOTD_Footer"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 913 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local LobbyMemberBackingMask1 = CoD.LobbyMemberBackingMask.new( menu, controller )
	LobbyMemberBackingMask1:setLeftRight( true, true, 0, 0 )
	LobbyMemberBackingMask1:setTopBottom( true, true, 0, 0 )
	LobbyMemberBackingMask1:setRGB( 0, 0, 0 )
	LobbyMemberBackingMask1:setAlpha( 0.59 )
	self:addElement( LobbyMemberBackingMask1 )
	self.LobbyMemberBackingMask1 = LobbyMemberBackingMask1
	
	local MOTDFooterImageContainer = CoD.MOTD_FooterImageContainer.new( menu, controller )
	MOTDFooterImageContainer:setLeftRight( true, true, 0, 0 )
	MOTDFooterImageContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( MOTDFooterImageContainer )
	self.MOTDFooterImageContainer = MOTDFooterImageContainer
	
	local ActionImage = LUI.UIImage.new()
	ActionImage:setLeftRight( true, false, 26, 50 )
	ActionImage:setTopBottom( false, true, -33.63, -9.63 )
	ActionImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ActionImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ActionImage )
	self.ActionImage = ActionImage
	
	local Text = CoD.MOTD_TextAndBG.new( menu, controller )
	Text:setLeftRight( true, false, 25, 440.5 )
	Text:setTopBottom( true, false, 11.37, 36.37 )
	Text.CACvarientTitlePanel0:setAlpha( 0 )
	Text:subscribeToGlobalModel( controller, "MtxCommsRegistration", "content_short", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 53, 157 )
	label:setTopBottom( false, false, 21.37, 37.37 )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	label:subscribeToGlobalModel( controller, "MtxCommsRegistration", "action_title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			label:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( label )
	self.label = label
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberBackingMask1:close()
		self.MOTDFooterImageContainer:close()
		self.Text:close()
		self.ActionImage:close()
		self.label:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

