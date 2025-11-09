CoD.ChooseOutfitInfoArea = InheritFrom( LUI.UIElement )
CoD.ChooseOutfitInfoArea.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseOutfitInfoArea )
	self.id = "ChooseOutfitInfoArea"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 150 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	background:setShaderVector( 0, 1, 0, 0, 0 )
	background:setShaderVector( 1, 0.2, 0, 0, 0 )
	background:setShaderVector( 2, 1, 0, 0, 0 )
	background:setShaderVector( 3, 0, 0, 0, 0 )
	background:linkToElementModel( self, "background", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			background:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( background )
	self.background = background
	
	local outfitName = LUI.UITightText.new()
	outfitName:setLeftRight( true, false, 15, 215 )
	outfitName:setTopBottom( true, false, 15, 75 )
	outfitName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	outfitName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			outfitName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( outfitName )
	self.outfitName = outfitName
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, true, 15, -15 )
	description:setTopBottom( true, false, 75, 95 )
	description:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	description:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( description )
	self.description = description
	
	self.close = function ( self )
		self.background:close()
		self.outfitName:close()
		self.description:close()
		CoD.ChooseOutfitInfoArea.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

