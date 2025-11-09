CoD.WildcardSlotItemWidget = InheritFrom( LUI.UIElement )
CoD.WildcardSlotItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardSlotItemWidget )
	self.id = "WildcardSlotItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 292 )
	self:setTopBottom( true, false, 0, 68 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.34, 0.37, 0.46 )
	background:setAlpha( 0.3 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( true, false, 0, 51 )
	nameLabel:setTopBottom( true, false, 43, 68 )
	nameLabel:setRGB( 0.9, 0.9, 0.9 )
	nameLabel:setAlpha( 0 )
	nameLabel:setTTF( "fonts/default.ttf" )
	nameLabel:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			nameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	local wildcardImage = LUI.UIImage.new()
	wildcardImage:setLeftRight( false, true, -61, -7 )
	wildcardImage:setTopBottom( true, false, 7, 61 )
	wildcardImage:setRGB( 1, 1, 1 )
	wildcardImage:setAlpha( 0 )
	wildcardImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	wildcardImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			wildcardImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( wildcardImage )
	self.wildcardImage = wildcardImage
	
	local plus = LUI.UIImage.new()
	plus:setLeftRight( false, false, -16, 16 )
	plus:setTopBottom( false, false, -16, 16 )
	plus:setRGB( 0.4, 0.44, 0.52 )
	plus:setAlpha( 0 )
	plus:setImage( RegisterImage( "uie_kd_chart_plus" ) )
	plus:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( plus )
	self.plus = plus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setRGB( 0.34, 0.37, 0.46 )
				self.background:setAlpha( 0.3 )
				self.clipFinished( background, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 1 )
				self.clipFinished( nameLabel, {} )
				wildcardImage:completeAnimation()
				self.wildcardImage:setAlpha( 1 )
				self.clipFinished( wildcardImage, {} )
				plus:completeAnimation()
				self.plus:setAlpha( 0 )
				self.clipFinished( plus, {} )
			end
		},
		Unequipped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				background:completeAnimation()
				self.background:setRGB( 0.34, 0.37, 0.46 )
				self.background:setAlpha( 0.3 )
				self.clipFinished( background, {} )
				nameLabel:completeAnimation()
				self.nameLabel:setAlpha( 0 )
				self.clipFinished( nameLabel, {} )
				wildcardImage:completeAnimation()
				self.wildcardImage:setAlpha( 0 )
				self.clipFinished( wildcardImage, {} )
				plus:completeAnimation()
				self.plus:setRGB( 0.4, 0.44, 0.52 )
				self.plus:setAlpha( 0.3 )
				self.clipFinished( plus, {} )
			end
		}
	}
	self.close = function ( self )
		self.nameLabel:close()
		self.wildcardImage:close()
		CoD.WildcardSlotItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

