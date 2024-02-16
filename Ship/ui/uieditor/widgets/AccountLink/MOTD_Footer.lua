-- 143fd262bd3667a34f1013d2cdd394f1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Lists.Members.LobbyMemberBackingMask" )
require( "ui.uieditor.widgets.MOTD.MOTD_FooterImageContainer" )
require( "ui.uieditor.widgets.MOTD.MOTD_TextAndBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )
require( "ui.uieditor.widgets.PC.Utility.GenericClickButton" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0.actionButton:setButton( Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
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
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 53, 157 )
	label:setTopBottom( false, false, 21.37, 37.37 )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	label:subscribeToGlobalModel( controller, "MtxCommsRegistration", "action_title", function ( model )
		local actionTitle = Engine.GetModelValue( model )
		if actionTitle then
			label:setText( Engine.Localize( actionTitle ) )
		end
	end )
	self:addElement( label )
	self.label = label
	
	local ActionImage = LUI.UIImage.new()
	ActionImage:setLeftRight( true, false, 26, 50 )
	ActionImage:setTopBottom( false, true, -33.63, -9.63 )
	ActionImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			ActionImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( ActionImage )
	self.ActionImage = ActionImage
	
	local Text = CoD.MOTD_TextAndBG.new( menu, controller )
	Text:setLeftRight( true, false, 25, 440.5 )
	Text:setTopBottom( true, false, 11.37, 36.37 )
	Text:subscribeToGlobalModel( controller, "MtxCommsRegistration", "content_short", function ( model )
		local contentShort = Engine.GetModelValue( model )
		if contentShort then
			Text.weaponDescTextBox:setText( Engine.Localize( contentShort ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local FEFeaturedFrame00 = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame00:setLeftRight( true, true, 0, 0 )
	FEFeaturedFrame00:setTopBottom( true, true, 0, 0 )
	FEFeaturedFrame00:setAlpha( 0.5 )
	self:addElement( FEFeaturedFrame00 )
	self.FEFeaturedFrame00 = FEFeaturedFrame00
	
	local pixelLL1 = LUI.UIImage.new()
	pixelLL1:setLeftRight( true, false, -34, -6 )
	pixelLL1:setTopBottom( false, false, 47, 50 )
	pixelLL1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL1 )
	self.pixelLL1 = pixelLL1
	
	local pixelLL10 = LUI.UIImage.new()
	pixelLL10:setLeftRight( true, false, -34, -6 )
	pixelLL10:setTopBottom( false, false, -51, -48 )
	pixelLL10:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL10 )
	self.pixelLL10 = pixelLL10
	
	local pixelLL00 = LUI.UIImage.new()
	pixelLL00:setLeftRight( true, false, 916, 944 )
	pixelLL00:setTopBottom( false, false, -51, -48 )
	pixelLL00:setZRot( 180 )
	pixelLL00:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL00 )
	self.pixelLL00 = pixelLL00
	
	local pixelLL000 = LUI.UIImage.new()
	pixelLL000:setLeftRight( true, false, 916, 944 )
	pixelLL000:setTopBottom( false, false, 48, 51 )
	pixelLL000:setZRot( 180 )
	pixelLL000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL000 )
	self.pixelLL000 = pixelLL000
	
	local actionButton = CoD.GenericClickButton.new( menu, controller )
	actionButton:setLeftRight( true, false, 26, 161 )
	actionButton:setTopBottom( true, false, 62.87, 93.87 )
	actionButton:setAlpha( 0 )
	actionButton:subscribeToGlobalModel( controller, "MtxCommsRegistration", "action_title", function ( model )
		local actionTitle = Engine.GetModelValue( model )
		if actionTitle then
			actionButton.label:setText( Engine.Localize( actionTitle ) )
		end
	end )
	self:addElement( actionButton )
	self.actionButton = actionButton
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				label:completeAnimation()
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )

				ActionImage:completeAnimation()
				self.ActionImage:setAlpha( 1 )
				self.clipFinished( ActionImage, {} )

				actionButton:completeAnimation()
				self.actionButton:setAlpha( 0 )
				self.clipFinished( actionButton, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
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
		local f3_local12 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f3_local12( element, event )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyMemberBackingMask1:close()
		element.MOTDFooterImageContainer:close()
		element.Text:close()
		element.FEFeaturedFrame00:close()
		element.actionButton:close()
		element.label:close()
		element.ActionImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
