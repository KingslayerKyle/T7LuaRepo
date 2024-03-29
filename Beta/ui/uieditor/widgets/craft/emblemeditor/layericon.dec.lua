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
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local layerIcon = LUI.UIElement.new()
	layerIcon:setLeftRight( true, true, 0, 0 )
	layerIcon:setTopBottom( true, true, 0, 0 )
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
	emptyLayerIcon:setLeftRight( false, false, -44, 44 )
	emptyLayerIcon:setTopBottom( false, false, -44, 44 )
	emptyLayerIcon:setAlpha( 0 )
	emptyLayerIcon:setImage( RegisterImage( "uie_img_t7_menu_customclass_plus" ) )
	self:addElement( emptyLayerIcon )
	self.emptyLayerIcon = emptyLayerIcon
	
	local linkIcon = CoD.EmblemChainIcon.new( menu, controller )
	linkIcon:setLeftRight( false, true, -16, 0 )
	linkIcon:setTopBottom( true, false, 4, 20 )
	linkIcon:linkToElementModel( self, nil, false, function ( model )
		linkIcon:setModel( model, controller )
	end )
	linkIcon:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				local f4_local0 = Emblems_IsLayerLinked( element, controller )
				if f4_local0 then
					f4_local0 = not Emblem_IsLayerGrouped( element, controller )
				end
				return f4_local0
			end
		}
	} )
	linkIcon:linkToElementModel( "isLinked", true, function ( model )
		menu:updateElementState( linkIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLinked"
		} )
	end )
	linkIcon:linkToElementModel( "isGrouped", true, function ( model )
		menu:updateElementState( linkIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isGrouped"
		} )
	end )
	self:addElement( linkIcon )
	self.linkIcon = linkIcon
	
	local emblemLayerNumber = CoD.EmblemLayerNumber.new( menu, controller )
	emblemLayerNumber:setLeftRight( true, false, 4, 54 )
	emblemLayerNumber:setTopBottom( true, false, 4, 20 )
	emblemLayerNumber:linkToElementModel( self, nil, false, function ( model )
		emblemLayerNumber:setModel( model, controller )
	end )
	emblemLayerNumber:mergeStateConditions( {
		{
			stateName = "GroupLayerNum",
			condition = function ( menu, element, event )
				local f8_local0 = Emblems_IsLayerLinked( element, controller )
				if f8_local0 then
					f8_local0 = Emblem_IsLayerGrouped( element, controller )
				end
				return f8_local0
			end
		}
	} )
	emblemLayerNumber:linkToElementModel( "isLinked", true, function ( model )
		menu:updateElementState( emblemLayerNumber, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLinked"
		} )
	end )
	emblemLayerNumber:linkToElementModel( "isGrouped", true, function ( model )
		menu:updateElementState( emblemLayerNumber, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isGrouped"
		} )
	end )
	self:addElement( emblemLayerNumber )
	self.emblemLayerNumber = emblemLayerNumber
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				layerIcon:completeAnimation()
				self.layerIcon:setLeftRight( true, true, 0, 0 )
				self.layerIcon:setTopBottom( true, true, 0, 0 )
				self.layerIcon:setAlpha( 1 )
				self.layerIcon:setScale( 0.8 )
				self.clipFinished( layerIcon, {} )
				emptyLayerIcon:completeAnimation()
				self.emptyLayerIcon:setAlpha( 0 )
				self.clipFinished( emptyLayerIcon, {} )
				linkIcon:completeAnimation()
				self.linkIcon:setLeftRight( false, true, -16, 4 )
				self.linkIcon:setTopBottom( true, false, -2, 18 )
				self.linkIcon:setAlpha( 1 )
				self.clipFinished( linkIcon, {} )
				emblemLayerNumber:completeAnimation()
				self.emblemLayerNumber:setLeftRight( true, false, 0, 50 )
				self.emblemLayerNumber:setTopBottom( true, false, -2, 18 )
				self.emblemLayerNumber:setAlpha( 1 )
				self.clipFinished( emblemLayerNumber, {} )
			end
		},
		EmptyLayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				layerIcon:completeAnimation()
				self.layerIcon:setAlpha( 0 )
				self.clipFinished( layerIcon, {} )
				emptyLayerIcon:completeAnimation()
				self.emptyLayerIcon:setLeftRight( false, false, -12, 12 )
				self.emptyLayerIcon:setTopBottom( false, false, -12, 12 )
				self.emptyLayerIcon:setRGB( 1, 1, 1 )
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

