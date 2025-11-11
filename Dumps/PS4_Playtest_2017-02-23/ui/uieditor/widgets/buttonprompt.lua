CoD.buttonprompt = InheritFrom( LUI.UIElement )
CoD.buttonprompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.buttonprompt )
	self.id = "buttonprompt"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 321 )
	self:setTopBottom( 0, 0, 0, 46 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( 0, 0, 0, 38 )
	buttonPromptImage:setTopBottom( 0, 0, 5, 41 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( 0, 0, 43, 112 )
	label:setTopBottom( 0, 0, 11, 39 )
	label:setText( Engine.Localize( "Select" ) )
	label:setTTF( "fonts/default.ttf" )
	self:addElement( label )
	self.label = label
	
	self.resetProperties = function ()
		label:completeAnimation()
		buttonPromptImage:completeAnimation()
		label:setAlpha( 1 )
		buttonPromptImage:setLeftRight( 0, 0, 0, 38 )
		buttonPromptImage:setTopBottom( 0, 0, 5, 41 )
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
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
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

