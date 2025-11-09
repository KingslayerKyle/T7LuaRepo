require( "ui.uieditor.widgets.Border" )

CoD.heroCustomizationListButton = InheritFrom( LUI.UIElement )
CoD.heroCustomizationListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.heroCustomizationListButton )
	self.id = "heroCustomizationListButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 233 )
	self:setTopBottom( true, false, 0, 51 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local sizeElement = LUI.UIFrame.new( menu, controller, 0, 0 )
	sizeElement:setLeftRight( true, false, 0, 233 )
	sizeElement:setTopBottom( true, false, 0, 51 )
	sizeElement:setRGB( 1, 1, 1 )
	self:addElement( sizeElement )
	self.sizeElement = sizeElement
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.58, 0.58, 0.6 )
	background:setAlpha( 0.25 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, false, 2, 48 )
	itemImage:setTopBottom( false, false, -23.5, 23.5 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImage:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setRGB( modelValue )
		end
	end )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local itemName = LUI.UITightText.new()
	itemName:setLeftRight( true, false, 62, 105 )
	itemName:setTopBottom( false, false, -12.5, 12.5 )
	itemName:setRGB( 1, 1, 1 )
	itemName:setTTF( "fonts/default.ttf" )
	itemName:linkToElementModel( self, "shortHeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( itemName )
	self.itemName = itemName
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 233 )
				self.sizeElement:setTopBottom( true, false, 0, 51 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 0, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 2, 48 )
				self.itemImage:setTopBottom( false, false, -23.5, 23.5 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 1, 1 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 0, 0 )
				self.border:setTopBottom( true, true, 0, 0 )
				self.border:setRGB( 1, 1, 1 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 233 )
				self.sizeElement:setTopBottom( true, false, 0, 51 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 0, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 2, 48 )
				self.itemImage:setTopBottom( false, false, -23.5, 23.5 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 0.41, 0 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 0, 0 )
				self.border:setTopBottom( true, true, 0, 0 )
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		},
		NoListFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 233 )
				self.sizeElement:setTopBottom( true, false, 0, 51 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 0, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 2, 48 )
				self.itemImage:setTopBottom( false, false, -23.5, 23.5 )
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 0.47, 0.47, 0.47 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 0, 0 )
				self.border:setTopBottom( true, true, 0, 0 )
				self.border:setRGB( 0.89, 0.89, 0.89 )
				self.border:setAlpha( 0.1 )
				self.clipFinished( border, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 233 )
				self.sizeElement:setTopBottom( true, false, 0, 51 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 0, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 2, 48 )
				self.itemImage:setTopBottom( false, false, -23.5, 23.5 )
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 1, 1 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 0, 0 )
				self.border:setTopBottom( true, true, 0, 0 )
				self.border:setRGB( 0.89, 0.89, 0.89 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		},
		SubCategory = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 233 )
				self.sizeElement:setTopBottom( true, false, 0, 38 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 12, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 14, 48 )
				self.itemImage:setTopBottom( false, false, -17, 17 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 1, 1 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 12, 0 )
				self.border:setTopBottom( true, true, 0, 0 )
				self.border:setRGB( 1, 1, 1 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 233 )
				self.sizeElement:setTopBottom( true, false, 0, 38 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 12, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 14, 48 )
				self.itemImage:setTopBottom( false, false, -17, 17 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 0.41, 0 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 12, 0 )
				self.border:setTopBottom( true, true, 0, 0 )
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		},
		SubCategory_NoFocus = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 233 )
				self.sizeElement:setTopBottom( true, false, 0, 38 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 12, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 14, 48 )
				self.itemImage:setTopBottom( false, false, -17, 17 )
				self.itemImage:setAlpha( 0.5 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 0.47, 0.47, 0.47 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 12, 0 )
				self.border:setTopBottom( true, true, 0, 0 )
				self.border:setRGB( 0.89, 0.89, 0.89 )
				self.border:setAlpha( 0.1 )
				self.clipFinished( border, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 5 )
				sizeElement:completeAnimation()
				self.sizeElement:setLeftRight( true, false, 0, 233 )
				self.sizeElement:setTopBottom( true, false, 0, 38 )
				self.clipFinished( sizeElement, {} )
				background:completeAnimation()
				self.background:setLeftRight( true, true, 12, 0 )
				self.background:setTopBottom( true, true, 0, 0 )
				self.clipFinished( background, {} )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, false, 14, 48 )
				self.itemImage:setTopBottom( false, false, -17, 17 )
				self.itemImage:setAlpha( 1 )
				self.clipFinished( itemImage, {} )
				itemName:completeAnimation()
				self.itemName:setRGB( 1, 1, 1 )
				self.clipFinished( itemName, {} )
				border:completeAnimation()
				self.border:setLeftRight( true, true, 12, 0 )
				self.border:setTopBottom( true, true, 0, 0 )
				self.border:setRGB( 0.89, 0.89, 0.89 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoListFocus",
			condition = function ( menu, element, event )
				local f13_local0
				if not IsParentListInFocus( element ) then
					f13_local0 = not IsSmallHeroCategory( element )
				else
					f13_local0 = false
				end
				return f13_local0
			end
		},
		{
			stateName = "SubCategory",
			condition = function ( menu, element, event )
				return IsSmallHeroCategory( element ) and IsParentListInFocus( element )
			end
		},
		{
			stateName = "SubCategory_NoFocus",
			condition = function ( menu, element, event )
				return IsSmallHeroCategory( element ) and not IsParentListInFocus( element )
			end
		}
	} )
	sizeElement.id = "sizeElement"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.sizeElement:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.border:close()
		self.itemImage:close()
		self.itemName:close()
		CoD.heroCustomizationListButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

