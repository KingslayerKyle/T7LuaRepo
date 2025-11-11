require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.Prestige_Button_Title = InheritFrom( LUI.UIElement )
CoD.Prestige_Button_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_Button_Title )
	self.id = "Prestige_Button_Title"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 349 )
	self:setTopBottom( 0, 0, 0, 37 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanel0:setTopBottom( 0, 1, 0, 0 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.7 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local ButtonTitle = LUI.UIText.new()
	ButtonTitle:setLeftRight( 0, 1, 10, -10 )
	ButtonTitle:setTopBottom( 0, 0, 3, 33 )
	ButtonTitle:setText( Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL" ) )
	ButtonTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ButtonTitle:setLetterSpacing( 0.5 )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ButtonTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( ButtonTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( ButtonTitle )
	self.ButtonTitle = ButtonTitle
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

