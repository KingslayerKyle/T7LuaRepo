CoD.EmblemMaterialElement = InheritFrom( LUI.UIElement )
CoD.EmblemMaterialElement.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemMaterialElement )
	self.id = "EmblemMaterialElement"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 89 )
	self:setTopBottom( true, false, 0, 48 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setAlpha( 0 )
	self:addElement( background )
	self.background = background
	
	local emblemMaterial = LUI.UIImage.new()
	emblemMaterial:setLeftRight( true, false, 5, 84 )
	emblemMaterial:setTopBottom( true, false, 5, 43 )
	emblemMaterial:setupUIStreamedImage( "0" )
	emblemMaterial:linkToElementModel( self, "materialName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblemMaterial:setMaterial( GetCachedMaterialByMaterialName( modelValue ) )
		end
	end )
	self:addElement( emblemMaterial )
	self.emblemMaterial = emblemMaterial
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 2, -2 )
				self.background:setTopBottom( true, true, 2, -2 )
				self.background:setRGB( 1, 0.41, 0 )
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.emblemMaterial:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

