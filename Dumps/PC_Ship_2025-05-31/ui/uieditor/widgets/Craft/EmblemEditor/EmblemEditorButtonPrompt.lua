CoD.EmblemEditorButtonPrompt = InheritFrom( LUI.UIElement )
CoD.EmblemEditorButtonPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.EmblemEditorButtonPrompt )
	self.id = "EmblemEditorButtonPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 24 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( false, true, -24, 0 )
	buttonPromptImage:setTopBottom( true, false, 0, 24 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( false, true, -113, -30 )
	label:setTopBottom( true, false, 4, 20 )
	label:setText( Engine.Localize( "Button Prompt" ) )
	label:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
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

