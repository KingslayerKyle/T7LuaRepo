CoD.ResetDefaultClassButton = InheritFrom( LUI.UIElement )
CoD.ResetDefaultClassButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ResetDefaultClassButton )
	self.id = "ResetDefaultClassButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( true, true, 0, 0 )
	backgroundImage:setTopBottom( true, true, 0, 0 )
	backgroundImage:setRGB( 0.34, 0.37, 0.46 )
	backgroundImage:setAlpha( 0.3 )
	self:addElement( backgroundImage )
	self.backgroundImage = backgroundImage
	
	local buttonName = LUI.UIText.new()
	buttonName:setLeftRight( true, true, 5, -5 )
	buttonName:setTopBottom( true, false, 0, 30 )
	buttonName:setRGB( 0.5, 0.51, 0.52 )
	buttonName:setTTF( "fonts/default.ttf" )
	buttonName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	buttonName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( buttonName )
	self.buttonName = buttonName
	
	self.buttonName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				backgroundImage:completeAnimation()
				self.backgroundImage:setAlpha( 0 )
				self.clipFinished( backgroundImage, {} )
				buttonName:completeAnimation()
				self.buttonName:setRGB( 0.5, 0.51, 0.52 )
				self.buttonName:setAlpha( 1 )
				self.clipFinished( buttonName, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )
				backgroundImage:completeAnimation()
				self.backgroundImage:setAlpha( 0.35 )
				self.clipFinished( backgroundImage, {} )
				buttonName:completeAnimation()
				self.buttonName:setRGB( 1, 0.41, 0 )
				self.clipFinished( buttonName, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttonName:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

