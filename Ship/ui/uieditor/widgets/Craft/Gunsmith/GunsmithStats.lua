-- 0bc982dc8cd6cd0d96d6b824b661abf4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatsColumn" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatsVariantName" )

CoD.GunsmithStats = InheritFrom( LUI.UIElement )
CoD.GunsmithStats.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStats )
	self.id = "GunsmithStats"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 566 )
	self:setTopBottom( true, false, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local stats = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	stats:setLeftRight( false, true, -406, 0 )
	stats:setTopBottom( true, false, 0, 76 )
	stats:setWidgetType( CoD.GunsmithStatsColumn )
	stats:setHorizontalCount( 4 )
	stats:setDataSource( "GunsmithSnapshotStatsList" )
	stats:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		UpdateDataSource( self, stats, controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
	end )
	self:addElement( stats )
	self.stats = stats
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 147, 160 )
	spacer:setTopBottom( true, false, 0, 76 )
	spacer:setRGB( 0, 0, 0 )
	spacer:setAlpha( 0.6 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local statsname = CoD.GunsmithStatsVariantName.new( menu, controller )
	statsname:setLeftRight( true, false, -62, 147 )
	statsname:setTopBottom( true, false, 0, 76 )
	statsname:linkToElementModel( self, nil, false, function ( model )
		statsname:setModel( model, controller )
	end )
	self:addElement( statsname )
	self.statsname = statsname
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.stats:close()
		element.statsname:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
