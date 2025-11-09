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
	CursorHintText:setRGB( 1, 1, 1 )
	CursorHintText:setTTF( "fonts/Entovo.ttf" )
	CursorHintText:setLetterSpacing( 0.5 )
	CursorHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CursorHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CursorHintText:subscribeToGlobalModel( controller, "HUDItems", "cursorHintText", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CursorHintText:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( CursorHintText, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 5 )
	end )
	self:addElement( CursorHintText )
	self.CursorHintText = CursorHintText
	
	self.close = function ( self )
		self.FEButtonPanel0:close()
		self.CursorHintText:close()
		CoD.cursorhint_text.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

