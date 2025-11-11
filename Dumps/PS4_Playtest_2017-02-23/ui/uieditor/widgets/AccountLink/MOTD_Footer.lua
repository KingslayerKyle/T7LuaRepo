require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.MOTD.MOTD_FooterImageContainer" )
require( "ui.uieditor.widgets.MOTD.MOTD_TextAndBG" )
require( "ui.uieditor.widgets.PC.Utility.GenericClickButton" )

local SetupPC = function ( self, controller, menu )
	self.actionButton:setButton( Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		SetupPC( self, controller, menu )
	end
end

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
	self:setLeftRight( 0, 0, 0, 1369 )
	self:setTopBottom( 0, 0, 0, 150 )
	self.anyChildUsesUpdateState = true
	
	local LobbyMemberBackingMask1 = CoD.LobbyMemberBackingMask.new( menu, controller )
	LobbyMemberBackingMask1:setLeftRight( 0, 1, 0, 0 )
	LobbyMemberBackingMask1:setTopBottom( 0, 1, 0, 0 )
	LobbyMemberBackingMask1:setRGB( 0, 0, 0 )
	LobbyMemberBackingMask1:setAlpha( 0.59 )
	self:addElement( LobbyMemberBackingMask1 )
	self.LobbyMemberBackingMask1 = LobbyMemberBackingMask1
	
	local MOTDFooterImageContainer = CoD.MOTD_FooterImageContainer.new( menu, controller )
	MOTDFooterImageContainer:setLeftRight( 0, 1, 0, 0 )
	MOTDFooterImageContainer:setTopBottom( 0, 1, 0, 0 )
	self:addElement( MOTDFooterImageContainer )
	self.MOTDFooterImageContainer = MOTDFooterImageContainer
	
	local label = LUI.UITightText.new()
	label:setLeftRight( 0, 0, 80, 236 )
	label:setTopBottom( 0.5, 0.5, 32, 56 )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	label:subscribeToGlobalModel( controller, "MtxCommsRegistration", "action_title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			label:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( label )
	self.label = label
	
	local ActionImage = LUI.UIImage.new()
	ActionImage:setLeftRight( 0, 0, 39, 75 )
	ActionImage:setTopBottom( 1, 1, -50, -14 )
	ActionImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ActionImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ActionImage )
	self.ActionImage = ActionImage
	
	local Text = CoD.MOTD_TextAndBG.new( menu, controller )
	Text:setLeftRight( 0, 0, 38, 661 )
	Text:setTopBottom( 0, 0, 17, 55 )
	Text:subscribeToGlobalModel( controller, "MtxCommsRegistration", "content_short", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text.weaponDescTextBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local FEFeaturedFrame00 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame00:setLeftRight( 0, 1, 0, 0 )
	FEFeaturedFrame00:setTopBottom( 0, 1, 0, 0 )
	FEFeaturedFrame00:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame00 )
	self.FEFeaturedFrame00 = FEFeaturedFrame00
	
	local pixelLL1 = LUI.UIImage.new()
	pixelLL1:setLeftRight( 0, 0, -51, -9 )
	pixelLL1:setTopBottom( 0.5, 0.5, 71, 75 )
	pixelLL1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL1 )
	self.pixelLL1 = pixelLL1
	
	local pixelLL10 = LUI.UIImage.new()
	pixelLL10:setLeftRight( 0, 0, -51, -9 )
	pixelLL10:setTopBottom( 0.5, 0.5, -76, -72 )
	pixelLL10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL10 )
	self.pixelLL10 = pixelLL10
	
	local pixelLL00 = LUI.UIImage.new()
	pixelLL00:setLeftRight( 0, 0, 1374, 1416 )
	pixelLL00:setTopBottom( 0.5, 0.5, -76, -72 )
	pixelLL00:setZRot( 180 )
	pixelLL00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL00 )
	self.pixelLL00 = pixelLL00
	
	local pixelLL000 = LUI.UIImage.new()
	pixelLL000:setLeftRight( 0, 0, 1374, 1416 )
	pixelLL000:setTopBottom( 0.5, 0.5, 72, 76 )
	pixelLL000:setZRot( 180 )
	pixelLL000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL000 )
	self.pixelLL000 = pixelLL000
	
	local actionButton = CoD.GenericClickButton.new( menu, controller )
	actionButton:setLeftRight( 0, 0, 39, 241 )
	actionButton:setTopBottom( 0, 0, 95, 141 )
	actionButton:setAlpha( 0 )
	actionButton:subscribeToGlobalModel( controller, "MtxCommsRegistration", "action_title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			actionButton.label:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( actionButton )
	self.actionButton = actionButton
	
	self.resetProperties = function ()
		label:completeAnimation()
		ActionImage:completeAnimation()
		actionButton:completeAnimation()
		label:setAlpha( 1 )
		ActionImage:setAlpha( 1 )
		actionButton:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 0 )
				self.clipFinished( ActionImage, {} )
				actionButton:completeAnimation()
				self.actionButton:setAlpha( 1 )
				self.clipFinished( actionButton, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return IsPC() and IsMouse( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LobbyMemberBackingMask1:close()
		self.MOTDFooterImageContainer:close()
		self.Text:close()
		self.FEFeaturedFrame00:close()
		self.actionButton:close()
		self.label:close()
		self.ActionImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

