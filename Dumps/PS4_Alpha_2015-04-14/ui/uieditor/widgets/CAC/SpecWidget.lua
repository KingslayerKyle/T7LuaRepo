require( "ui.uieditor.widgets.CAC.SpecWidget_Internal" )

CoD.SpecWidget = InheritFrom( LUI.UIElement )
CoD.SpecWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecWidget )
	self.id = "SpecWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 142 )
	self:setTopBottom( true, false, 0, 35 )
	
	local modSpec = CoD.SpecWidget_Internal.new( menu, controller )
	modSpec:setLeftRight( true, false, 0, 70 )
	modSpec:setTopBottom( true, false, 0, 35 )
	modSpec:setRGB( 1, 1, 1 )
	modSpec.valueText:setText( Engine.Localize( "5" ) )
	self:addElement( modSpec )
	self.modSpec = modSpec
	
	local techSpec = CoD.SpecWidget_Internal.new( menu, controller )
	techSpec:setLeftRight( false, true, -70, 0 )
	techSpec:setTopBottom( true, false, 0, 35 )
	techSpec:setRGB( 1, 1, 1 )
	techSpec.iconImage:setImage( RegisterImage( "uie_t7_menu_tech_spec_token" ) )
	techSpec.valueText:setText( Engine.Localize( "5" ) )
	self:addElement( techSpec )
	self.techSpec = techSpec
	
	self.close = function ( self )
		self.modSpec:close()
		self.techSpec:close()
		CoD.SpecWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

