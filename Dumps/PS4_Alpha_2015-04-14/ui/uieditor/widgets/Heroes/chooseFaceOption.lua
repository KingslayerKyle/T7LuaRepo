require( "ui.uieditor.widgets.Border" )

CoD.chooseFaceOption = InheritFrom( LUI.UIElement )
CoD.chooseFaceOption.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.chooseFaceOption )
	self.id = "chooseFaceOption"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local itemImage = LUI.UIImage.new()
	itemImage:setLeftRight( true, true, 0, 0 )
	itemImage:setTopBottom( true, true, 0, 0 )
	itemImage:setRGB( 1, 1, 1 )
	itemImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	itemImage:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( itemImage )
	self.itemImage = itemImage
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 0.58, 0.58, 0.6 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( 0.58, 0.58, 0.6 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.clipFinished( border, {} )
			end
		},
		ColorOption = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				itemImage:completeAnimation()
				self.itemImage:setLeftRight( true, true, 0, 0 )
				self.itemImage:setTopBottom( true, false, 0, 85 )
				self.clipFinished( itemImage, {} )
				border:completeAnimation()
				self.border:setRGB( 0.58, 0.58, 0.6 )
				self.clipFinished( border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.clipFinished( border, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ColorOption",
			condition = function ( menu, element, event )
				return IsHeroColorOption( element )
			end
		}
	} )
	self.close = function ( self )
		self.border:close()
		self.itemImage:close()
		CoD.chooseFaceOption.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

