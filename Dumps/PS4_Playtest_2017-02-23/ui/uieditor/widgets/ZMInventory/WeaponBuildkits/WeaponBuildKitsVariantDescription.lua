require( "ui.uieditor.widgets.CAC.CAC_varientTitlePanel" )

CoD.WeaponBuildKitsVariantDescription = InheritFrom( LUI.UIElement )
CoD.WeaponBuildKitsVariantDescription.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WeaponBuildKitsVariantDescription )
	self.id = "WeaponBuildKitsVariantDescription"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 492 )
	self:setTopBottom( 0, 0, 0, 33 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( 0, 0, 0, 492 )
	CACvarientTitlePanel0:setTopBottom( 0, 0, 0, 33 )
	CACvarientTitlePanel0:setAlpha( 0.25 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( 0.5, 0.5, -246, 246 )
	highlightedDescription:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	highlightedDescription:setText( Engine.Localize( "ZMUI_CUSTOMIZE_FOR_WALL_BUYS_AND_MYSTERY_BOXES" ) )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( highlightedDescription, "setText", function ( element, text )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CACvarientTitlePanel0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

