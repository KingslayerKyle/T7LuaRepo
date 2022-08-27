-- 9542c6c084a0acf1f828fcbd099592ba
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.codcaster_options_button_small" )

CoD.Leaderboard_ResetFilter = InheritFrom( LUI.UIElement )
CoD.Leaderboard_ResetFilter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_ResetFilter )
	self.id = "Leaderboard_ResetFilter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 450 )
	self:setTopBottom( true, false, 0, 152 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local ListReset = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ListReset:makeFocusable()
	ListReset:setLeftRight( true, false, 0, 450 )
	ListReset:setTopBottom( true, false, 48, 118 )
	ListReset:setWidgetType( CoD.codcaster_options_button_small )
	ListReset:setVerticalCount( 2 )
	ListReset:setDataSource( "LeaderboardResetOptions" )
	ListReset:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	ListReset:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( ListReset, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		ProcessListAction( self, f4_arg0, f4_arg2 )
		GoBack( self, f4_arg2 )
		return true
	end, function ( f5_arg0, f5_arg1, f5_arg2 )
		CoD.Menu.SetButtonLabel( f5_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ListReset )
	self.ListReset = ListReset
	
	local ResetTitle = LUI.UIText.new()
	ResetTitle:setLeftRight( false, true, -435, -67.5 )
	ResetTitle:setTopBottom( true, false, 0, 34 )
	ResetTitle:setRGB( 1, 0.39, 0 )
	ResetTitle:setText( LocalizeToUpperString( "MENU_LB_RESET_LEADERBOARDS" ) )
	ResetTitle:setTTF( "fonts/escom.ttf" )
	ResetTitle:setLetterSpacing( 1 )
	ResetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResetTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ResetTitle )
	self.ResetTitle = ResetTitle
	
	local ResetHint = LUI.UIText.new()
	ResetHint:setLeftRight( true, false, 15, 437 )
	ResetHint:setTopBottom( true, false, 126.45, 152.45 )
	ResetHint:setTTF( "fonts/default.ttf" )
	ResetHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ResetHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ResetHint )
	self.ResetHint = ResetHint
	
	ResetHint:linkToElementModel( ListReset, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			ResetHint:setText( Engine.Localize( hintText ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ListReset:completeAnimation()
				self.ListReset:setAlpha( 1 )
				self.clipFinished( ListReset, {} )
				ResetTitle:completeAnimation()
				self.ResetTitle:setAlpha( 1 )
				self.clipFinished( ResetTitle, {} )
				ResetHint:completeAnimation()
				self.ResetHint:setAlpha( 1 )
				self.clipFinished( ResetHint, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				ListReset:completeAnimation()
				self.ListReset:setAlpha( 0 )
				self.clipFinished( ListReset, {} )
				ResetTitle:completeAnimation()
				self.ResetTitle:setAlpha( 0 )
				self.clipFinished( ResetTitle, {} )
				ResetHint:completeAnimation()
				self.ResetHint:setAlpha( 0 )
				self.clipFinished( ResetHint, {} )
			end
		}
	}
	ListReset.id = "ListReset"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ListReset:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ListReset:close()
		element.ResetHint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

