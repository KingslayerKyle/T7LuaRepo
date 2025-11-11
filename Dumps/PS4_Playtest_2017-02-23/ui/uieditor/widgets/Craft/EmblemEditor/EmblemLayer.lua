require( "ui.uieditor.widgets.Craft.EmblemEditor.LayerIcon" )

CoD.EmblemLayer = InheritFrom( LUI.UIElement )
CoD.EmblemLayer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemLayer )
	self.id = "EmblemLayer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 22, -22 )
	background:setTopBottom( 0, 1, 22, -22 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( 0, 1, 22, -22 )
	backgroundMask:setTopBottom( 0, 1, 22, -22 )
	backgroundMask:setRGB( 0, 0, 0 )
	backgroundMask:setAlpha( 0 )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local layerIcon = CoD.LayerIcon.new( menu, controller )
	layerIcon:mergeStateConditions( {
		{
			stateName = "EmptyLayer",
			condition = function ( menu, element, event )
				return IsLayerEmpty( self, element, controller )
			end
		}
	} )
	layerIcon:setLeftRight( 0, 1, 0, 0 )
	layerIcon:setTopBottom( 0, 1, 0, 0 )
	layerIcon:linkToElementModel( self, nil, false, function ( model )
		layerIcon:setModel( model, controller )
	end )
	self:addElement( layerIcon )
	self.layerIcon = layerIcon
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.layerIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

