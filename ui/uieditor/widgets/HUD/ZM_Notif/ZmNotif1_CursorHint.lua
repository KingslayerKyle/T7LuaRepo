-- 75501af04f862bf01c53835ea945b89b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.ZmNotif1_CursorHint = InheritFrom( LUI.UIElement )
CoD.ZmNotif1_CursorHint.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmNotif1_CursorHint )
	self.id = "ZmNotif1_CursorHint"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 20 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, -2, 2 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.4 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local CursorHintText = LUI.UIText.new()
	CursorHintText:setLeftRight( false, false, -256, 256 )
	CursorHintText:setTopBottom( true, false, 0, 20 )
	CursorHintText:setText( Engine.Localize( "MENU_NEW" ) )
	CursorHintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CursorHintText:setLetterSpacing( 0.5 )
	CursorHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	CursorHintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( CursorHintText, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWrapped( self, element, 5, 0 )
	end )
	self:addElement( CursorHintText )
	self.CursorHintText = CursorHintText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

