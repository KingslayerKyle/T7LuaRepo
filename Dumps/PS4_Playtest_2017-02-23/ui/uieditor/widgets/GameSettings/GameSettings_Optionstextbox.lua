require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.GameSettings_Optionstextbox = InheritFrom( LUI.UIElement )
CoD.GameSettings_Optionstextbox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GameSettings_Optionstextbox )
	self.id = "GameSettings_Optionstextbox"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 733 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.25 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0, 0, 5, 633 )
	TextBox:setTopBottom( 0, 0, 0, 33 )
	TextBox:setRGB( 0.74, 0.74, 0.74 )
	TextBox:setText( Engine.Localize( "WEAPON_PDW57_DESC" ) )
	TextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( TextBox, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACvarientTitlePanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

