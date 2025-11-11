require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemChainIcon" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayerNumber" )

CoD.LayerIcon = InheritFrom( LUI.UIElement )
CoD.LayerIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LayerIcon )
	self.id = "LayerIcon"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 180 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local layerIcon = LUI.UIElement.new()
	layerIcon:setLeftRight( 0, 1, 0, 0 )
	layerIcon:setTopBottom( 0, 1, 0, 0 )
	layerIcon:setScale( 0.9 )
	layerIcon:linkToElementModel( self, "layerAndGroupIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( controller, modelValue ) )
		end
	end )
	self:addElement( layerIcon )
	self.layerIcon = layerIcon
	
	local emptyLayerIcon = LUI.UIImage.new()
	emptyLayerIcon:setLeftRight( 0.5, 0.5, -66, 66 )
	emptyLayerIcon:setTopBottom( 0.5, 0.5, -66, 66 )
	emptyLayerIcon:setAlpha( 0 )
	emptyLayerIcon:setImage( RegisterImage( "uie_img_t7_menu_customclass_plus" ) )
	self:addElement( emptyLayerIcon )
	self.emptyLayerIcon = emptyLayerIcon
	
	local linkIcon = CoD.EmblemChainIcon.new( menu, controller )
	linkIcon:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return Emblems_IsLayerLinked( element, controller ) and not Emblem_IsLayerGrouped( element, controller )
			end
		}
	} )
	linkIcon:linkToElementModel( linkIcon, "isLinked", true, function ( model )
		menu:updateElementState( linkIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLinked"
		} )
	end )
	linkIcon:linkToElementModel( linkIcon, "isGrouped", true, function ( model )
		menu:updateElementState( linkIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isGrouped"
		} )
	end )
	linkIcon:setLeftRight( 1, 1, -24, 0 )
	linkIcon:setTopBottom( 0, 0, 6, 30 )
	linkIcon:linkToElementModel( self, nil, false, function ( model )
		linkIcon:setModel( model, controller )
	end )
	self:addElement( linkIcon )
	self.linkIcon = linkIcon
	
	local emblemLayerNumber = CoD.EmblemLayerNumber.new( menu, controller )
	emblemLayerNumber:mergeStateConditions( {
		{
			stateName = "GroupLayerNum",
			condition = function ( menu, element, event )
				return Emblems_IsLayerLinked( element, controller ) and Emblem_IsLayerGrouped( element, controller )
			end
		}
	} )
	emblemLayerNumber:linkToElementModel( emblemLayerNumber, "isLinked", true, function ( model )
		menu:updateElementState( emblemLayerNumber, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLinked"
		} )
	end )
	emblemLayerNumber:linkToElementModel( emblemLayerNumber, "isGrouped", true, function ( model )
		menu:updateElementState( emblemLayerNumber, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isGrouped"
		} )
	end )
	emblemLayerNumber:setLeftRight( 0, 0, 6, 81 )
	emblemLayerNumber:setTopBottom( 0, 0, 6, 30 )
	emblemLayerNumber:linkToElementModel( self, nil, false, function ( model )
		emblemLayerNumber:setModel( model, controller )
	end )
	self:addElement( emblemLayerNumber )
	self.emblemLayerNumber = emblemLayerNumber
	
	self.resetProperties = function ()
		layerIcon:completeAnimation()
		linkIcon:completeAnimation()
		emblemLayerNumber:completeAnimation()
		emptyLayerIcon:completeAnimation()
		layerIcon:setAlpha( 1 )
		layerIcon:setScale( 0.9 )
		linkIcon:setLeftRight( 1, 1, -24, 0 )
		linkIcon:setTopBottom( 0, 0, 6, 30 )
		linkIcon:setAlpha( 1 )
		emblemLayerNumber:setLeftRight( 0, 0, 6, 81 )
		emblemLayerNumber:setTopBottom( 0, 0, 6, 30 )
		emblemLayerNumber:setAlpha( 1 )
		emptyLayerIcon:setLeftRight( 0.5, 0.5, -66, 66 )
		emptyLayerIcon:setTopBottom( 0.5, 0.5, -66, 66 )
		emptyLayerIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				layerIcon:completeAnimation()
				self.layerIcon:setScale( 0.8 )
				self.clipFinished( layerIcon, {} )
				linkIcon:completeAnimation()
				self.linkIcon:setLeftRight( 1, 1, -24, 6 )
				self.linkIcon:setTopBottom( 0, 0, -3, 27 )
				self.clipFinished( linkIcon, {} )
				emblemLayerNumber:completeAnimation()
				self.emblemLayerNumber:setLeftRight( 0, 0, 0, 75 )
				self.emblemLayerNumber:setTopBottom( 0, 0, -3, 27 )
				self.clipFinished( emblemLayerNumber, {} )
			end
		},
		EmptyLayer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				layerIcon:completeAnimation()
				self.layerIcon:setAlpha( 0 )
				self.clipFinished( layerIcon, {} )
				emptyLayerIcon:completeAnimation()
				self.emptyLayerIcon:setLeftRight( 0.5, 0.5, -18, 18 )
				self.emptyLayerIcon:setTopBottom( 0.5, 0.5, -18, 18 )
				self.emptyLayerIcon:setAlpha( 1 )
				self.clipFinished( emptyLayerIcon, {} )
				linkIcon:completeAnimation()
				self.linkIcon:setAlpha( 0 )
				self.clipFinished( linkIcon, {} )
				emblemLayerNumber:completeAnimation()
				self.emblemLayerNumber:setAlpha( 0 )
				self.clipFinished( emblemLayerNumber, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.linkIcon:close()
		self.emblemLayerNumber:close()
		self.layerIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

