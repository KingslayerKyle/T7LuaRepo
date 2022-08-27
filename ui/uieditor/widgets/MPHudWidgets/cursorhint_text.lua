-- 7953a427fd03ad8e1430fb29ab436bb0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.cursorhint_text = InheritFrom( LUI.UIElement )
CoD.cursorhint_text.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cursorhint_text )
	self.id = "cursorhint_text"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 20 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, -2, 2 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local CursorHintText = LUI.UIText.new()
	CursorHintText:setLeftRight( false, false, -173, 175 )
	CursorHintText:setTopBottom( true, false, 0, 20 )
	CursorHintText:setTTF( "fonts/escom.ttf" )
	CursorHintText:setLetterSpacing( 0.5 )
	CursorHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CursorHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CursorHintText:subscribeToGlobalModel( controller, "HUDItems", "cursorHintText", function ( model )
		local cursorHintText = Engine.GetModelValue( model )
		if cursorHintText then
			CursorHintText:setText( Engine.Localize( cursorHintText ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( CursorHintText, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 5, 0 )
	end )
	self:addElement( CursorHintText )
	self.CursorHintText = CursorHintText
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( false, false, -173, 175 )
	TextBox0:setTopBottom( true, false, 26, 42 )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setLetterSpacing( 1 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:subscribeToGlobalModel( controller, "HUDItems", "cursorHintTextLine2", function ( model )
		local cursorHintTextLine2 = Engine.GetModelValue( model )
		if cursorHintTextLine2 then
			TextBox0:setText( Engine.Localize( cursorHintTextLine2 ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.CursorHintText:close()
		element.TextBox0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

