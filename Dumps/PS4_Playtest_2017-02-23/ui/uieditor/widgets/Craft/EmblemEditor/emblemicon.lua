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
	self:setLeftRight( 0, 0, 0, 144 )
	self:setTopBottom( 0, 0, 0, 144 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local border = LUI.UIImage.new()
	border:setLeftRight( 0, 1, 0, 0 )
	border:setTopBottom( 0, 1, 0, 0 )
	border:setAlpha( 0.1 )
	self:addElement( border )
	self.border = border
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( 0, 1, 3, -3 )
	backgroundMask:setTopBottom( 0, 1, 3, -3 )
	backgroundMask:setRGB( 0, 0, 0 )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local drawIcon = LUI.UIElement.new()
	drawIcon:setLeftRight( 0.5, 0.5, -60, 60 )
	drawIcon:setTopBottom( 0.5, 0.5, -60, 60 )
	drawIcon:setAlpha( 0 )
	drawIcon:linkToElementModel( self, "iconID", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			drawIcon:setupDrawDecalById( modelValue )
		end
	end )
	self:addElement( drawIcon )
	self.drawIcon = drawIcon
	
	self.resetProperties = function ()
		drawIcon:completeAnimation()
		border:completeAnimation()
		drawIcon:setAlpha( 0 )
		border:setRGB( 1, 1, 1 )
		border:setAlpha( 0.1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				drawIcon:completeAnimation()
				self.drawIcon:setAlpha( 1 )
				self.clipFinished( drawIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.drawIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

