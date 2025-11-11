require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatElement" )

CoD.GunsmithStatsColumn = InheritFrom( LUI.UIElement )
CoD.GunsmithStatsColumn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStatsColumn )
	self.id = "GunsmithStatsColumn"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 114 )
	self.anyChildUsesUpdateState = true
	
	local stats = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	stats:setLeftRight( 0, 0, 0, 150 )
	stats:setTopBottom( 0, 0, 1, 113 )
	stats:setWidgetType( CoD.GunsmithStatElement )
	stats:setVerticalCount( 3 )
	stats:linkToElementModel( self, "SnapshotStatsColumn", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			stats:setDataSource( modelValue )
		end
	end )
	self:addElement( stats )
	self.stats = stats
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.stats:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

