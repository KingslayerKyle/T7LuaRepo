CoD.EmblemIcon = InheritFrom( LUI.UIElement )
CoD.EmblemIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemIcon )
	self.id = "EmblemIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 96 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local border = LUI.UIImage.new()
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 1, 1, 1 )
	border:setAlpha( 0.1 )
	border:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( border )
	self.border = border
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( true, true, 2, -2 )
	backgroundMask:setTopBottom( true, true, 2, -2 )
	backgroundMask:setRGB( 0, 0, 0 )
	backgroundMask:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local drawIcon = LUI.UIElement.new()
	drawIcon:setLeftRight( false, false, -40, 40 )
	drawIcon:setTopBottom( false, false, -40, 40 )
	drawIcon:setRGB( 1, 1, 1 )
	drawIcon:setAlpha( 0 )
	drawIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	drawIcon:linkToElementModel( self, "iconID", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			drawIcon:setupDrawEmblemById( modelValue )
		end
	end )
	self:addElement( drawIcon )
	self.drawIcon = drawIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				border:completeAnimation()
				self.border:setRGB( 1, 1, 1 )
				self.border:setAlpha( 0.1 )
				self.clipFinished( border, {} )
				drawIcon:completeAnimation()
				self.drawIcon:setAlpha( 1 )
				self.clipFinished( drawIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				border:completeAnimation()
				self.border:setRGB( 1, 0.41, 0 )
				self.border:setAlpha( 1 )
				self.clipFinished( border, {} )
				drawIcon:completeAnimation()
				self.drawIcon:setAlpha( 1 )
				self.clipFinished( drawIcon, {} )
			end
		}
	}
	self.close = function ( self )
		self.drawIcon:close()
		CoD.EmblemIcon.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

