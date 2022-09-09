-- a57c663ba04319cdc50e10d9b5e15d4b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Chat.checkboxNoLabel" )
require( "ui.uieditor.widgets.ChannelFilterColorButton" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
end

CoD.ChannelFilterOptionsContainer = InheritFrom( LUI.UIElement )
CoD.ChannelFilterOptionsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChannelFilterOptionsContainer )
	self.id = "ChannelFilterOptionsContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 14 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 104 )
	background:setTopBottom( true, false, 0, 14 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local checkboxNoLabel = CoD.checkboxNoLabel.new( menu, controller )
	checkboxNoLabel:setLeftRight( true, false, 1, 13 )
	checkboxNoLabel:setTopBottom( true, false, 1, 13 )
	checkboxNoLabel:linkToElementModel( self, nil, false, function ( model )
		checkboxNoLabel:setModel( model, controller )
	end )
	self:addElement( checkboxNoLabel )
	self.checkboxNoLabel = checkboxNoLabel
	
	local label = LUI.UIText.new()
	label:setLeftRight( true, false, 16, 88 )
	label:setTopBottom( true, false, 0, 14 )
	label:setText( Engine.Localize( "MENU_NEW" ) )
	label:setTTF( "fonts/default.ttf" )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( label )
	self.label = label
	
	local ChannelFilterColorButton = CoD.ChannelFilterColorButton.new( menu, controller )
	ChannelFilterColorButton:setLeftRight( true, false, 91, 103 )
	ChannelFilterColorButton:setTopBottom( true, false, 1, 13 )
	ChannelFilterColorButton:setAlpha( 0 )
	ChannelFilterColorButton:linkToElementModel( self, nil, false, function ( model )
		ChannelFilterColorButton:setModel( model, controller )
	end )
	ChannelFilterColorButton:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	ChannelFilterColorButton:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( ChannelFilterColorButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ChannelFilterColorButton )
	self.ChannelFilterColorButton = ChannelFilterColorButton
	
	local FocusBarB0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB0:setLeftRight( false, false, -88.5, 88.5 )
	FocusBarB0:setTopBottom( false, false, 5, 9 )
	FocusBarB0:setAlpha( 0.5 )
	FocusBarB0:setZoom( 1 )
	FocusBarB0:setScale( 0.6 )
	self:addElement( FocusBarB0 )
	self.FocusBarB0 = FocusBarB0
	
	local FEFocusBarTOP = CoD.FE_FocusBarContainer.new( menu, controller )
	FEFocusBarTOP:setLeftRight( false, false, -88.5, 88.5 )
	FEFocusBarTOP:setTopBottom( false, false, -9, -5 )
	FEFocusBarTOP:setAlpha( 0.5 )
	FEFocusBarTOP:setZoom( 1 )
	FEFocusBarTOP:setScale( 0.6 )
	self:addElement( FEFocusBarTOP )
	self.FEFocusBarTOP = FEFocusBarTOP
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				checkboxNoLabel:completeAnimation()
				self.checkboxNoLabel:setRGB( 1, 1, 1 )
				self.clipFinished( checkboxNoLabel, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setAlpha( 0 )
				self.clipFinished( FocusBarB0, {} )

				FEFocusBarTOP:completeAnimation()
				self.FEFocusBarTOP:setAlpha( 0 )
				self.clipFinished( FEFocusBarTOP, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )

				checkboxNoLabel:completeAnimation()
				self.checkboxNoLabel:setRGB( 1, 0.41, 0 )
				self.clipFinished( checkboxNoLabel, {} )

				FocusBarB0:completeAnimation()
				self.FocusBarB0:setLeftRight( false, false, -88.5, 88.5 )
				self.FocusBarB0:setTopBottom( false, false, 5, 9 )
				self.FocusBarB0:setAlpha( 1 )
				self.clipFinished( FocusBarB0, {} )

				FEFocusBarTOP:completeAnimation()
				self.FEFocusBarTOP:setAlpha( 1 )
				self.clipFinished( FEFocusBarTOP, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.checkboxNoLabel:close()
		element.ChannelFilterColorButton:close()
		element.FocusBarB0:close()
		element.FEFocusBarTOP:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
