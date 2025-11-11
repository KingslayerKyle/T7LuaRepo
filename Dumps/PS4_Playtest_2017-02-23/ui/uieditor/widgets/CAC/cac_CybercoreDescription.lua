require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.cac_CybercoreDescription = InheritFrom( LUI.UIElement )
CoD.cac_CybercoreDescription.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_CybercoreDescription )
	self.id = "cac_CybercoreDescription"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( 0, 0, 0, 675 )
	self:setTopBottom( 0, 0, 0, 39 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setTopBottom( 0, 1, 0, 0 )
	CACvarientTitlePanel0:setAlpha( 0.4 )
	LUI.OverrideFunction_CallOriginalFirst( CACvarientTitlePanel0, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedLeftAlign( self, element, 0, 0 )
	end )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local description = LUI.UIText.new()
	description:setLeftRight( 0, 0, 4, 666 )
	description:setTopBottom( 0, 0, 2, 36 )
	description:setText( Engine.Localize( "WEAPON_GADGET_SYSTEM_OVERLOAD_DESC" ) )
	description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( description, "setText", function ( element, text )
		ScaleWidgetToLabelWrappedLeftAlign( self, element, 10, 5 )
	end )
	self:addElement( description )
	self.description = description
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACvarientTitlePanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

