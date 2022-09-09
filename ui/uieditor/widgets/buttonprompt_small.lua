-- 5afb17a447ed3f533e5dfb084c969aa9
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 31 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 0, 24 )
	buttonPromptImage:setTopBottom( true, false, 3.5, 27.5 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 28, 132 )
	label:setTopBottom( false, false, -7.5, 8.5 )
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
				self.label:setLeftRight( true, false, 32, 136 )
				self.label:setTopBottom( false, false, -8, 8 )
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
		},
		Dim = {
			DefaultClip = function ()
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
