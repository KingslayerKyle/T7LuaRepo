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
	self:setLeftRight( 0, 0, 0, 321 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( 0, 0, 0, 36 )
	buttonPromptImage:setTopBottom( 0, 0, 0, 36 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UIText.new()
	label:setLeftRight( 0, 1, 61, -9 )
	label:setTopBottom( 0, 0, 3, 31 )
	label:setText( Engine.Localize( "Button Prompt" ) )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( label )
	self.label = label
	
	self.resetProperties = function ()
		label:completeAnimation()
		buttonPromptImage:completeAnimation()
		label:setAlpha( 1 )
		buttonPromptImage:setLeftRight( 0, 0, 0, 36 )
		buttonPromptImage:setTopBottom( 0, 0, 0, 36 )
		buttonPromptImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Hide = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( 0, 0, 0, 48 )
				self.buttonPromptImage:setTopBottom( 0, 0, 0, 46 )
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

