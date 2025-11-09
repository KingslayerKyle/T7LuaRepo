CoD.GroupsTabWidget = InheritFrom( LUI.UIElement )
CoD.GroupsTabWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsTabWidget )
	self.id = "GroupsTabWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 36 )
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 0, 0 )
	Text:setTopBottom( true, false, 2.5, 32.5 )
	Text:setRGB( 1, 1, 1 )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Text:linkToElementModel( self, "tabName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local buttonText = LUI.UIText.new()
	buttonText:setLeftRight( true, true, 0, 0 )
	buttonText:setTopBottom( true, false, 7.5, 32.5 )
	buttonText:setRGB( 1, 1, 1 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )
				Text:completeAnimation()
				self.Text:setRGB( 1, 0.41, 0 )
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end
		},
		NavButton = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 1 )
				self.clipFinished( buttonText, {} )
			end
		},
		DisabledState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Text:completeAnimation()
				self.Text:setRGB( 0.59, 0.59, 0.59 )
				self.clipFinished( Text, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NavButton",
			condition = function ( menu, element, event )
				return ShouldDisplayButton( element, controller )
			end
		},
		{
			stateName = "DisabledState",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self.close = function ( self )
		self.Text:close()
		self.buttonText:close()
		CoD.GroupsTabWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

