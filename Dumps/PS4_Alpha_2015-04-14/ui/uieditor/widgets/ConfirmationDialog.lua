require( "ui.uieditor.widgets.button" )

CoD.ConfirmationDialog = InheritFrom( LUI.UIElement )
CoD.ConfirmationDialog.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ConfirmationDialog )
	self.id = "ConfirmationDialog"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 654 )
	self:setTopBottom( true, false, 0, 361 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 0, 500 )
	Title:setTopBottom( true, false, 0, 39 )
	Title:setRGB( 1, 1, 1 )
	Title:setText( Engine.Localize( "MENU_CONTINUE_RESTART_CHECKPOINT" ) )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 0, 654 )
	TextBox0:setTopBottom( true, false, 43.95, 79.95 )
	TextBox0:setRGB( 1, 1, 1 )
	TextBox0:setText( Engine.Localize( "MENU_CHECKPOINT_RESTART_TEXT" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Resume = CoD.button.new( menu, controller )
	Resume:setLeftRight( true, false, 0, 250 )
	Resume:setTopBottom( true, false, 331.3, 361.3 )
	Resume:setRGB( 1, 1, 1 )
	Resume.buttoninternal0.Text0:setText( Engine.Localize( "MENU_RESUMEGAME_CAPS" ) )
	Resume:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SetResponseNo( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Resume )
	self.Resume = Resume
	
	local Restart = CoD.button.new( menu, controller )
	Restart:setLeftRight( true, false, 0, 250 )
	Restart:setTopBottom( true, false, 301.3, 331.3 )
	Restart:setRGB( 1, 1, 1 )
	Restart.buttoninternal0.Text0:setText( Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" ) )
	Restart:registerEventHandler( "button_action", function ( element, event )
		local retVal = nil
		SetResponseYes( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( Restart )
	self.Restart = Restart
	
	Resume.navigation = {
		up = Restart
	}
	Restart.navigation = {
		down = Resume
	}
	Resume.id = "Resume"
	Restart.id = "Restart"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Resume:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.Resume:close()
		self.Restart:close()
		CoD.ConfirmationDialog.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

