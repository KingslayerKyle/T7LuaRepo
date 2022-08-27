-- f2d9a3e347bbab792c005a53d8fc6bb7
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	
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
	self:setLeftRight( true, false, 0, 180 )
	self:setTopBottom( true, false, 0, 40 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, true, 0, 0 )
	text:setTopBottom( true, false, 0, 40 )
	text:setTTF( "fonts/default.ttf" )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "tabName", true, function ( model )
		local tabName = Engine.GetModelValue( model )
		if tabName then
			text:setText( Engine.Localize( tabName ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local buttonText = LUI.UIText.new()
	buttonText:setLeftRight( true, true, 0, 0 )
	buttonText:setTopBottom( true, false, 10.5, 29.5 )
	buttonText:setAlpha( 0 )
	buttonText:setTTF( "fonts/default.ttf" )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	buttonText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	buttonText:linkToElementModel( self, "tabIcon", true, function ( model )
		local tabIcon = Engine.GetModelValue( model )
		if tabIcon then
			buttonText:setText( Engine.Localize( tabIcon ) )
		end
	end )
	self:addElement( buttonText )
	self.buttonText = buttonText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				text:completeAnimation()
				self.text:setRGB( 1, 1, 1 )
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
				buttonText:completeAnimation()
				self.buttonText:setAlpha( 0 )
				self.clipFinished( buttonText, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setRGB( 1, 0.41, 0 )
				self.text:setAlpha( 1 )
				self.clipFinished( text, {} )
			end
		},
		NavButton = {
			DefaultClip = function ()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.text:close()
		element.buttonText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

