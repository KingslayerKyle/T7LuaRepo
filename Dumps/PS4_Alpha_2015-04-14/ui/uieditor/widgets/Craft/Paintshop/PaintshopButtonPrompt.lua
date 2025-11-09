CoD.PaintshopButtonPrompt = InheritFrom( LUI.UIElement )
CoD.PaintshopButtonPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.PaintshopButtonPrompt )
	self.id = "PaintshopButtonPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 24 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 0, 24 )
	buttonPromptImage:setTopBottom( true, false, 0, 24 )
	buttonPromptImage:setRGB( 1, 1, 1 )
	buttonPromptImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 47, 130 )
	label:setTopBottom( true, false, 2, 21 )
	label:setRGB( 1, 1, 1 )
	label:setText( Engine.Localize( "Button Prompt" ) )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( label )
	self.label = label
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 1 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( true, false, 0, 32 )
				self.buttonPromptImage:setTopBottom( true, false, 0, 31 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

