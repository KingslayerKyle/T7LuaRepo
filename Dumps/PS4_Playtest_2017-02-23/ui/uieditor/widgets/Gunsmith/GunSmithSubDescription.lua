require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.GunSmithSubDescription = InheritFrom( LUI.UIElement )
CoD.GunSmithSubDescription.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunSmithSubDescription )
	self.id = "GunSmithSubDescription"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 385 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.25 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local weaponDescTextBox = LUI.UIText.new()
	weaponDescTextBox:setLeftRight( 0, 0, 5, 386 )
	weaponDescTextBox:setTopBottom( 0, 0, 0, 33 )
	weaponDescTextBox:setAlpha( 0.7 )
	weaponDescTextBox:setText( Engine.Localize( "WEAPON_PDW57_DESC" ) )
	weaponDescTextBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	weaponDescTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( weaponDescTextBox, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( weaponDescTextBox )
	self.weaponDescTextBox = weaponDescTextBox
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACvarientTitlePanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

