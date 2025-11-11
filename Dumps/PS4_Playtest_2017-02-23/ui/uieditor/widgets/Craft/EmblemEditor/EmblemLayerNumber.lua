CoD.EmblemLayerNumber = InheritFrom( LUI.UIElement )
CoD.EmblemLayerNumber.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemLayerNumber )
	self.id = "EmblemLayerNumber"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 108 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local topbar = LUI.UIImage.new()
	topbar:setLeftRight( 0, 0, 0, 96 )
	topbar:setTopBottom( 0, 0, 0, 24 )
	topbar:setRGB( 0, 0, 0 )
	topbar:setAlpha( 0 )
	self:addElement( topbar )
	self.topbar = topbar
	
	local layerNumber = LUI.UITightText.new()
	layerNumber:setLeftRight( 0, 0, 30, 75 )
	layerNumber:setTopBottom( 0, 1, 0, 0 )
	layerNumber:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	layerNumber:linkToElementModel( self, "layerNumberString", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			layerNumber:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( layerNumber )
	self.layerNumber = layerNumber
	
	local groupIcon = LUI.UIImage.new()
	groupIcon:setLeftRight( 0, 0, 0, 30 )
	groupIcon:setTopBottom( 0.5, 0.5, -15, 15 )
	groupIcon:setImage( RegisterImage( "uie_t7_menu_emblem_group" ) )
	self:addElement( groupIcon )
	self.groupIcon = groupIcon
	
	self.resetProperties = function ()
		groupIcon:completeAnimation()
		layerNumber:completeAnimation()
		groupIcon:setAlpha( 1 )
		layerNumber:setLeftRight( 0, 0, 30, 75 )
		layerNumber:setTopBottom( 0, 1, 0, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				layerNumber:completeAnimation()
				self.layerNumber:setLeftRight( 0, 0, -0.5, 43.5 )
				self.layerNumber:setTopBottom( 0, 1, 0, 0 )
				self.clipFinished( layerNumber, {} )
				groupIcon:completeAnimation()
				self.groupIcon:setAlpha( 0 )
				self.clipFinished( groupIcon, {} )
			end
		},
		GroupLayerNum = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.layerNumber:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

