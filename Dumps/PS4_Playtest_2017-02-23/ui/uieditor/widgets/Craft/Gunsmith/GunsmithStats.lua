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
	self:setLeftRight( 0, 0, 0, 849 )
	self:setTopBottom( 0, 0, 0, 114 )
	self.anyChildUsesUpdateState = true
	
	local stats = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	stats:setLeftRight( 1, 1, -607, -1 )
	stats:setTopBottom( 0, 0, 0, 114 )
	stats:setWidgetType( CoD.GunsmithStatsColumn )
	stats:setHorizontalCount( 4 )
	stats:setDataSource( "GunsmithSnapshotStatsList" )
	stats:subscribeToGlobalModel( controller, "GunsmithSnapshot", "SessionMode", function ( model )
		local element = stats
		UpdateDataSource( self, element, controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
	end )
	self:addElement( stats )
	self.stats = stats
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( 0, 0, 220, 240 )
	spacer:setTopBottom( 0, 0, 0, 114 )
	spacer:setRGB( 0, 0, 0 )
	spacer:setAlpha( 0.6 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local statsname = CoD.GunsmithStatsVariantName.new( menu, controller )
	statsname:setLeftRight( 0, 0, -93, 221 )
	statsname:setTopBottom( 0, 0, 0, 114 )
	statsname:linkToElementModel( self, nil, false, function ( model )
		statsname:setModel( model, controller )
	end )
	self:addElement( statsname )
	self.statsname = statsname
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.stats:close()
		self.statsname:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

