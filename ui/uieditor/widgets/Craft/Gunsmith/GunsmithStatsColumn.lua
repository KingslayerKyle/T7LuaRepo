-- 934681c7eb77cb689ca05093e95c9cd6
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local stats = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	stats:setLeftRight( true, false, 0, 100 )
	stats:setTopBottom( true, false, 0, 76 )
	stats:setWidgetType( CoD.GunsmithStatElement )
	stats:setVerticalCount( 3 )
	stats:linkToElementModel( self, "SnapshotStatsColumn", true, function ( model )
		local SnapshotStatsColumn = Engine.GetModelValue( model )
		if SnapshotStatsColumn then
			stats:setDataSource( SnapshotStatsColumn )
		end
	end )
	self:addElement( stats )
	self.stats = stats
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.stats:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

