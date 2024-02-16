-- 8396e08d6a3b79c5acc206434a9078a0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Scorestreaks.CallingScorestreaks.GenericProjectedTabletInternal" )

CoD.GenericProjectedTablet = InheritFrom( LUI.UIElement )
CoD.GenericProjectedTablet.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GenericProjectedTablet )
	self.id = "GenericProjectedTablet"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 720 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local GenericProjectedTabletInternal = CoD.GenericProjectedTabletInternal.new( menu, controller )
	GenericProjectedTabletInternal:setLeftRight( true, true, 0, 0 )
	GenericProjectedTabletInternal:setTopBottom( true, true, 0, 0 )
	Engine.SetupUI3DWindow( controller, 1, 720, 720 )
	GenericProjectedTabletInternal:setUI3DWindow( 1 )
	self:addElement( GenericProjectedTabletInternal )
	self.GenericProjectedTabletInternal = GenericProjectedTabletInternal
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GenericProjectedTabletInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
