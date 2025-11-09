require( "ui.uieditor.widgets.CPSystems.TacticalMode.TacticalModeWidget_Internal" )

CoD.TacticalModeWidget = InheritFrom( LUI.UIElement )
CoD.TacticalModeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalModeWidget )
	self.id = "TacticalModeWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 118 )
	self:setTopBottom( true, false, 0, 114 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.TacticalModeWidget_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	internal:setRGB( 1, 1, 1 )
	internal:linkToElementModel( self, "alpha", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			internal:setAlpha( modelValue )
		end
	end )
	internal:linkToElementModel( self, nil, false, function ( model )
		internal:setModel( model, controller )
	end )
	self:addElement( internal )
	self.internal = internal
	
	self.close = function ( self )
		self.internal:close()
		CoD.TacticalModeWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

