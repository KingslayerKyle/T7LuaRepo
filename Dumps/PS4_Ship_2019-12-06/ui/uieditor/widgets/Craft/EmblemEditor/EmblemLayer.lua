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
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 15, -15 )
	background:setTopBottom( true, true, 15, -15 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( true, true, 15, -15 )
	backgroundMask:setTopBottom( true, true, 15, -15 )
	backgroundMask:setRGB( 0, 0, 0 )
	backgroundMask:setAlpha( 0 )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local layerIcon = CoD.LayerIcon.new( menu, controller )
	layerIcon:setLeftRight( true, true, 0, 0 )
	layerIcon:setTopBottom( true, true, 0, 0 )
	layerIcon:linkToElementModel( self, nil, false, function ( model )
		layerIcon:setModel( model, controller )
	end )
	layerIcon:mergeStateConditions( {
		{
			stateName = "EmptyLayer",
			condition = function ( menu, element, event )
				return IsLayerEmpty( self, element, controller )
			end
		}
	} )
	self:addElement( layerIcon )
	self.layerIcon = layerIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 15, -15 )
				self.background:setTopBottom( true, true, 15, -15 )
				self.clipFinished( background, {} )
				layerIcon:completeAnimation()
				self.layerIcon:setScale( 1 )
				self.clipFinished( layerIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.layerIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

