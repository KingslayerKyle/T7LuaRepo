CoD.buttonprompt_small = InheritFrom( LUI.UIElement )
CoD.buttonprompt_small.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 4
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.buttonprompt_small )
	self.id = "buttonprompt_small"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 321 )
	self:setTopBottom( 0, 0, 0, 46 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( 0, 0, 0, 36 )
	buttonPromptImage:setTopBottom( 0, 0, 5, 41 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( 0, 0, 42, 198 )
	label:setTopBottom( 0.5, 0.5, -11, 13 )
	label:setText( Engine.Localize( "Button Prompt" ) )
	label:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( label )
	self.label = label
	
	self.resetProperties = function ()
		label:completeAnimation()
		buttonPromptImage:completeAnimation()
		label:setLeftRight( 0, 0, 42, 198 )
		label:setTopBottom( 0.5, 0.5, -11, 13 )
		label:setAlpha( 1 )
		buttonPromptImage:setLeftRight( 0, 0, 0, 36 )
		buttonPromptImage:setTopBottom( 0, 0, 5, 41 )
		buttonPromptImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				label:completeAnimation()
				self.label:setLeftRight( 0, 0, 48, 204 )
				self.label:setTopBottom( 0.5, 0.5, -12, 12 )
				self.clipFinished( label, {} )
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
		Dim = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0.3 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0.3 )
				self.clipFinished( label, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

