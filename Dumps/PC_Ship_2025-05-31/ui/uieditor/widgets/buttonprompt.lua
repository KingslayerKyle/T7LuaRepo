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
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 31 )
	
	local buttonPromptImage = LUI.UIImage.new()
	buttonPromptImage:setLeftRight( true, false, 0, 25.03 )
	buttonPromptImage:setTopBottom( true, false, 3.38, 27.63 )
	self:addElement( buttonPromptImage )
	self.buttonPromptImage = buttonPromptImage
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 29, 75 )
	label:setTopBottom( true, false, 7, 26 )
	label:setText( Engine.Localize( "Select" ) )
	label:setTTF( "fonts/default.ttf" )
	self:addElement( label )
	self.label = label
	
	local keyshortcut = LUI.UIText.new()
	keyshortcut:setLeftRight( true, false, -0.48, 27.52 )
	keyshortcut:setTopBottom( true, false, 3.38, 28.38 )
	keyshortcut:setAlpha( 0 )
	keyshortcut:setText( Engine.Localize( "" ) )
	keyshortcut:setTTF( "fonts/default.ttf" )
	keyshortcut:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	keyshortcut:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( keyshortcut )
	self.keyshortcut = keyshortcut
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 1 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				keyshortcut:completeAnimation()
				self.keyshortcut:setAlpha( 0 )
				self.clipFinished( keyshortcut, {} )
			end,
			Hide = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setLeftRight( true, false, 0, 32 )
				self.buttonPromptImage:setTopBottom( true, false, 0, 31 )
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
				keyshortcut:completeAnimation()
				self.keyshortcut:setAlpha( 0 )
				self.clipFinished( keyshortcut, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 0 )
				self.clipFinished( label, {} )
				keyshortcut:completeAnimation()
				self.keyshortcut:setAlpha( 0 )
				self.clipFinished( keyshortcut, {} )
			end
		},
		DefaultStatePC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				buttonPromptImage:completeAnimation()
				self.buttonPromptImage:setAlpha( 0 )
				self.clipFinished( buttonPromptImage, {} )
				label:completeAnimation()
				self.label:setAlpha( 1 )
				self.clipFinished( label, {} )
				keyshortcut:completeAnimation()
				self.keyshortcut:setAlpha( 1 )
				self.clipFinished( keyshortcut, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
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
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

