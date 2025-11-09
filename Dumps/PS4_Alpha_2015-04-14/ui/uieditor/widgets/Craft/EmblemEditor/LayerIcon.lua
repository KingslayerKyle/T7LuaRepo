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
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local layerIcon = LUI.UIElement.new()
	layerIcon:setLeftRight( true, true, 0, 0 )
	layerIcon:setTopBottom( true, true, 0, 0 )
	layerIcon:setRGB( 1, 1, 1 )
	layerIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	layerIcon:linkToElementModel( self, "layerIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			layerIcon:setupEmblemSelector( modelValue )
		end
	end )
	self:addElement( layerIcon )
	self.layerIcon = layerIcon
	
	local emptyLayerIcon = LUI.UIImage.new()
	emptyLayerIcon:setLeftRight( true, true, 16, -16 )
	emptyLayerIcon:setTopBottom( true, true, 16, -16 )
	emptyLayerIcon:setRGB( 1, 1, 1 )
	emptyLayerIcon:setAlpha( 0 )
	emptyLayerIcon:setImage( RegisterImage( "uie_img_t7_menu_customclass_plus" ) )
	emptyLayerIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( emptyLayerIcon )
	self.emptyLayerIcon = emptyLayerIcon
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 0, 7 )
	Label0:setTopBottom( true, false, 0, 16 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	Label0:linkToElementModel( self, "layerIndex", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( ConvertPSLayerIdxToLayerNum( modelValue ) ) )
		end
	end )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				layerIcon:completeAnimation()
				self.layerIcon:setAlpha( 1 )
				self.clipFinished( layerIcon, {} )
				emptyLayerIcon:completeAnimation()
				self.emptyLayerIcon:setAlpha( 0 )
				self.clipFinished( emptyLayerIcon, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 0, 7 )
				self.Label0:setTopBottom( true, false, 0, 16 )
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
			end
		},
		EmptyLayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				layerIcon:completeAnimation()
				self.layerIcon:setAlpha( 0 )
				self.clipFinished( layerIcon, {} )
				emptyLayerIcon:completeAnimation()
				self.emptyLayerIcon:setLeftRight( true, true, 16, -16 )
				self.emptyLayerIcon:setTopBottom( true, true, 16, -16 )
				self.emptyLayerIcon:setRGB( 1, 1, 1 )
				self.emptyLayerIcon:setAlpha( 1 )
				self.clipFinished( emptyLayerIcon, {} )
				Label0:completeAnimation()
				self.Label0:setLeftRight( true, false, 0, 5 )
				self.Label0:setTopBottom( true, false, 0, 16 )
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
			end
		}
	}
	self.close = function ( self )
		self.layerIcon:close()
		self.Label0:close()
		CoD.LayerIcon.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

