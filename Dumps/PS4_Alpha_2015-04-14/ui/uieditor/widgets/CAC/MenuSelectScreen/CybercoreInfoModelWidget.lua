require( "ui.uieditor.widgets.CAC.PurchaseInstructionWidget" )

CoD.CybercoreInfoModelWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreInfoModelWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreInfoModelWidget )
	self.id = "CybercoreInfoModelWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 600 )
	
	local descriptionBacking = LUI.UIImage.new()
	descriptionBacking:setLeftRight( true, true, 0, 0 )
	descriptionBacking:setTopBottom( true, true, 318, 0 )
	descriptionBacking:setRGB( 0.59, 0.59, 0.59 )
	descriptionBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( descriptionBacking )
	self.descriptionBacking = descriptionBacking
	
	local imageBacking = LUI.UIImage.new()
	imageBacking:setLeftRight( false, false, -128, 128 )
	imageBacking:setTopBottom( true, false, 0, 256 )
	imageBacking:setRGB( 0.31, 0.31, 0.31 )
	imageBacking:setAlpha( 0.25 )
	imageBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imageBacking )
	self.imageBacking = imageBacking
	
	local nameBacking = LUI.UIImage.new()
	nameBacking:setLeftRight( true, true, 0, 0 )
	nameBacking:setTopBottom( true, false, 256, 318 )
	nameBacking:setRGB( 0.2, 0.2, 0.2 )
	nameBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( nameBacking )
	self.nameBacking = nameBacking
	
	local image = LUI.UIImage.new()
	image:setLeftRight( false, false, -128, 128 )
	image:setTopBottom( true, false, 0, 256 )
	image:setRGB( 1, 1, 1 )
	image:setAlpha( 0.5 )
	image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( image )
	self.image = image
	
	local name = LUI.UIText.new()
	name:setLeftRight( true, true, 0, 0 )
	name:setTopBottom( true, false, 263.5, 310.5 )
	name:setRGB( 1, 1, 1 )
	name:setTTF( "fonts/default.ttf" )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	name:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local description = LUI.UIText.new()
	description:setLeftRight( true, true, 10, -10 )
	description:setTopBottom( true, false, 330, 355 )
	description:setRGB( 1, 1, 1 )
	description:setTTF( "fonts/default.ttf" )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	description:linkToElementModel( self, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( description )
	self.description = description
	
	local purchaseInstruction = CoD.PurchaseInstructionWidget.new( menu, controller )
	purchaseInstruction:setLeftRight( false, true, -355.55, 0 )
	purchaseInstruction:setTopBottom( true, false, 156, 256 )
	purchaseInstruction:setRGB( 1, 1, 1 )
	purchaseInstruction.PurchaseInstruction:setText( Engine.Localize( "Upgrade for 1 Fabrication Token" ) )
	self:addElement( purchaseInstruction )
	self.purchaseInstruction = purchaseInstruction
	
	self.close = function ( self )
		self.purchaseInstruction:close()
		self.image:close()
		self.name:close()
		self.description:close()
		CoD.CybercoreInfoModelWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

