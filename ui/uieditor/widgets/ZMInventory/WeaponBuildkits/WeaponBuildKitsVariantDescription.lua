-- c6c530468cb20d63db995bffe14b37d9
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 328 )
	self:setTopBottom( true, false, 0, 22 )
	
	local CACvarientTitlePanel0 = CoD.CAC_varientTitlePanel.new( menu, controller )
	CACvarientTitlePanel0:setLeftRight( true, false, 0, 328 )
	CACvarientTitlePanel0:setTopBottom( true, false, 0, 22 )
	CACvarientTitlePanel0:setAlpha( 0.25 )
	self:addElement( CACvarientTitlePanel0 )
	self.CACvarientTitlePanel0 = CACvarientTitlePanel0
	
	local highlightedDescription = LUI.UIText.new()
	highlightedDescription:setLeftRight( false, false, -164, 164 )
	highlightedDescription:setTopBottom( false, false, -11, 11 )
	highlightedDescription:setText( Engine.Localize( "ZMUI_CUSTOMIZE_FOR_WALL_BUYS_AND_MYSTERY_BOXES" ) )
	highlightedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	highlightedDescription:setLineSpacing( 0.5 )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	highlightedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( highlightedDescription, "setText", function ( element, controller )
		ScaleWidgetToLabelWrapped( self, element, 0, 0 )
	end )
	self:addElement( highlightedDescription )
	self.highlightedDescription = highlightedDescription
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CACvarientTitlePanel0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

