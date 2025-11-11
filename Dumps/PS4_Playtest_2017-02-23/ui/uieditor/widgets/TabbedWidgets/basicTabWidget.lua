local PostLoadFunc = function ( self, controller )
	
end

CoD.basicTabWidget = InheritFrom( LUI.UIElement )
CoD.basicTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.basicTabWidget )
	self.id = "basicTabWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 270 )
	self:setTopBottom( 0, 0, 0, 60 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 1, 0, 0 )
	text:setTopBottom( 0, 0, 0, 60 )
	text:setTTF( "fonts/default.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "tabName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local buttonText = LUI.UIText.new()
	buttonText:setLeftRight( 0, 1, 0, 0 )
	buttonText:setTopBottom( 0, 0, 16, 44 )
	buttonText:setAlpha( 0 )
	buttonText:setTTF( "fonts/default.ttf" )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	buttonText:linkToElementModel( self, "tabIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			buttonText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( buttonText )
	self.buttonText = buttonText
	
	self.resetProperties = function ()
		text:completeAnimation()
		buttonText:completeAnimation()
		text:setRGB( 1, 1, 1 )
		text:setAlpha( 1 )
		buttonText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setRGB( 1, 0.41, 0 )
				self.clipFinished( text, {} )
			end
		},
		NavButton = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				text:completeAnimation()
				self.text:setAlpha( 0 )
				self.clipFinished( text, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 1 )
				self.clipFinished( buttonText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NavButton",
			condition = function ( menu, element, event )
				return ShouldDisplayButton( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "tabIcon", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "tabIcon"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.text:close()
		self.buttonText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

