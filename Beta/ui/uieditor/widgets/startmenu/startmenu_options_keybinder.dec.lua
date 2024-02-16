require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local KeyBoundHandler = function ( self, event )
	local model = self:getModel()
	if model then
		local command = Engine.GetModelValue( Engine.GetModel( model, "command" ) )
		local bindIndex = Engine.GetModelValue( Engine.GetModel( model, "bindIndex" ) )
		if command and bindIndex then
			self:setState( "DefaultState" )
			self.keybindText:setText( Engine.GetKeyBindingLocalizedString( event.controller, command, bindIndex, false, false ) )
		end
	end
end

local PostLoadFunc = function ( self, controller, menu )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			if not Engine.LastInput_Gamepad() then
				local keybindModel = self:getModel()
				if keybindModel then
					local command = Engine.GetModelValue( Engine.GetModel( keybindModel, "command" ) )
					local bindIndex = Engine.GetModelValue( Engine.GetModel( keybindModel, "bindIndex" ) )
					if command and bindIndex then
						self:setState( "WaitingForBind" )
						self.keybindText:setText( Engine.Localize( "KEY_UNBOUND" ) )
						Engine.ExecNow( controller, "clearKeyStates" )
						Engine.BindCommand( controller, command, bindIndex )
					end
				end
			end
			return true
		else
			
		end
	end )
	self:registerEventHandler( "key_bound", KeyBoundHandler )
	self:registerEventHandler( "input_source_changed", KeyBoundHandler )
	self:registerEventHandler( "options_refresh", KeyBoundHandler )
end

CoD.StartMenu_Options_KeyBinder = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_KeyBinder.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_KeyBinder )
	self.id = "StartMenu_Options_KeyBinder"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 34 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( true, true, 4, -3 )
	fullBacking:setTopBottom( true, true, 2, -2.75 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local keybindBacking = LUI.UIImage.new()
	keybindBacking:setLeftRight( false, true, -250, -60 )
	keybindBacking:setTopBottom( true, true, 5, -5 )
	keybindBacking:setRGB( 0.39, 0.39, 0.39 )
	keybindBacking:setAlpha( 0 )
	self:addElement( keybindBacking )
	self.keybindBacking = keybindBacking
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	StartMenuframenoBG0:setRGB( 0.87, 0.37, 0 )
	StartMenuframenoBG0:setAlpha( 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 201, 497 )
	Image0:setTopBottom( true, false, 2, 31.25 )
	Image0:setRGB( 1, 0.49, 0 )
	Image0:setAlpha( 0 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local actionText = LUI.UITightText.new()
	actionText:setLeftRight( true, false, 10, 200 )
	actionText:setTopBottom( true, false, 5.5, 30.5 )
	actionText:setTTF( "fonts/default.ttf" )
	self:addElement( actionText )
	self.actionText = actionText
	
	local keybindText = LUI.UIText.new()
	keybindText:setLeftRight( false, true, -300, -5 )
	keybindText:setTopBottom( true, false, 5, 29.5 )
	keybindText:setText( Engine.Localize( "MENU_NEW" ) )
	keybindText:setTTF( "fonts/default.ttf" )
	keybindText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	keybindText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( keybindText )
	self.keybindText = keybindText
	
	local StartMenuframenoBG000 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG000:setLeftRight( true, true, 2, 0 )
	StartMenuframenoBG000:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG000 )
	self.StartMenuframenoBG000 = StartMenuframenoBG000
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 201, -3 )
	FocusBarB:setTopBottom( false, true, -5.5, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 201, -3 )
	FocusBarT:setTopBottom( true, false, 0, 2 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.actionText:linkToElementModel( self, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			actionText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				fullBacking:completeAnimation()
				self.fullBacking:setLeftRight( true, true, 4, -2 )
				self.fullBacking:setTopBottom( true, true, 2, -2.75 )
				self.fullBacking:setRGB( 0.1, 0.1, 0.1 )
				self.clipFinished( fullBacking, {} )
				keybindBacking:completeAnimation()
				self.keybindBacking:setRGB( 0.39, 0.39, 0.39 )
				self.keybindBacking:setAlpha( 0 )
				self.clipFinished( keybindBacking, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setRGB( 0.87, 0.37, 0 )
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 4, 497 )
				self.Image0:setTopBottom( true, false, 2, 31.25 )
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				actionText:completeAnimation()
				self.actionText:setLeftRight( true, false, 10, 200 )
				self.actionText:setTopBottom( true, false, 5.5, 30.5 )
				self.actionText:setAlpha( 1 )
				self.clipFinished( actionText, {} )
				keybindText:completeAnimation()
				self.keybindText:setRGB( 1, 1, 1 )
				self.keybindText:setAlpha( 0.5 )
				self.clipFinished( keybindText, {} )
				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setLeftRight( true, true, 2, 0 )
				self.StartMenuframenoBG000:setTopBottom( true, true, 0, 0 )
				self.clipFinished( StartMenuframenoBG000, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 9 )
				fullBacking:completeAnimation()
				self.fullBacking:setRGB( 0.1, 0.1, 0.1 )
				self.clipFinished( fullBacking, {} )
				keybindBacking:completeAnimation()
				self.keybindBacking:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( keybindBacking, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, true, 2, 0 )
				self.StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
				self.StartMenuframenoBG0:setRGB( 0.87, 0.37, 0 )
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 4, 497 )
				self.Image0:setTopBottom( true, false, 2, 31.25 )
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				actionText:completeAnimation()
				self.actionText:setLeftRight( true, false, 10, 200 )
				self.actionText:setTopBottom( true, false, 5.5, 30.5 )
				self.actionText:setAlpha( 1 )
				self.clipFinished( actionText, {} )
				keybindText:completeAnimation()
				self.keybindText:setRGB( 1, 1, 1 )
				self.keybindText:setAlpha( 1 )
				self.clipFinished( keybindText, {} )
				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setLeftRight( true, true, 2, 0 )
				self.StartMenuframenoBG000:setTopBottom( true, true, 0, 0 )
				self.clipFinished( StartMenuframenoBG000, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 2, 0 )
				self.FocusBarB:setTopBottom( false, true, -5.5, 0 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 2, 0 )
				self.FocusBarT:setTopBottom( true, false, 0, 4 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		WaitingForBind = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )
				fullBacking:completeAnimation()
				self.fullBacking:setLeftRight( true, true, 4, -2 )
				self.fullBacking:setTopBottom( true, true, 2, -2.75 )
				self.fullBacking:setRGB( 0.39, 0.39, 0.39 )
				self.clipFinished( fullBacking, {} )
				keybindBacking:completeAnimation()
				self.keybindBacking:setRGB( 0.1, 0.1, 0.1 )
				self.clipFinished( keybindBacking, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, true, 2, 0 )
				self.StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 4, 498 )
				self.Image0:setTopBottom( true, false, 2, 31.25 )
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				actionText:completeAnimation()
				self.actionText:setAlpha( 1 )
				self.clipFinished( actionText, {} )
				keybindText:completeAnimation()
				self.keybindText:setRGB( 1, 1, 1 )
				self.clipFinished( keybindText, {} )
				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setLeftRight( true, true, 2, 0 )
				self.StartMenuframenoBG000:setTopBottom( true, true, 0, 0 )
				self.clipFinished( StartMenuframenoBG000, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 8 )
				fullBacking:completeAnimation()
				self.fullBacking:setLeftRight( true, true, 4, -2 )
				self.fullBacking:setTopBottom( true, true, 2, -2.75 )
				self.fullBacking:setRGB( 0.39, 0.39, 0.39 )
				self.clipFinished( fullBacking, {} )
				keybindBacking:completeAnimation()
				self.keybindBacking:setRGB( 0.1, 0.1, 0.1 )
				self.clipFinished( keybindBacking, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setLeftRight( true, true, 2, 0 )
				self.StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 4, 498 )
				self.Image0:setTopBottom( true, false, 2, 31.25 )
				self.Image0:setAlpha( 0.67 )
				self.clipFinished( Image0, {} )
				keybindText:completeAnimation()
				self.keybindText:setRGB( 1, 1, 1 )
				self.clipFinished( keybindText, {} )
				StartMenuframenoBG000:completeAnimation()
				self.StartMenuframenoBG000:setLeftRight( true, true, 2, 0 )
				self.StartMenuframenoBG000:setTopBottom( true, true, 0, 0 )
				self.StartMenuframenoBG000:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG000, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG000:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.actionText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

