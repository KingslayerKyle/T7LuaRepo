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
	border:setAlpha( 0.1 )
	self:addElement( border )
	self.border = border
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( true, true, 2, -2 )
	backgroundMask:setTopBottom( true, true, 2, -2 )
	backgroundMask:setRGB( 0, 0, 0 )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local drawIcon = LUI.UIElement.new()
	drawIcon:setLeftRight( false, false, -40, 40 )
	drawIcon:setTopBottom( false, false, -40, 40 )
	drawIcon:setAlpha( 0 )
	drawIcon:linkToElementModel( self, "iconID", true, function ( model )
		local iconID = Engine.GetModelValue( model )
		if iconID then
			drawIcon:setupDrawDecalById( iconID )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.drawIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

