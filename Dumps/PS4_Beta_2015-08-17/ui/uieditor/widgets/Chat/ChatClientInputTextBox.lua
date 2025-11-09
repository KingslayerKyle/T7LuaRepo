require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( self, controller, menu )
	self.arrangeText = function ( self )
		local entryleft, entrytop, entryright, entrybottom = self:getLocalRect()
		local height, width, right, left = nil
		left = 4
		right = left + self.channelText:getTextWidth()
		self.channelText:setLeftRight( true, false, left, right )
		self.InputText:setLeftRight( true, false, right + 2, entryright - entryleft - 2 )
	end
	
end

CoD.ChatClientInputTextBox = InheritFrom( LUI.UIElement )
CoD.ChatClientInputTextBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientInputTextBox )
	self.id = "ChatClientInputTextBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 346 )
	self:setTopBottom( true, false, 0, 32 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	Background:setAlpha( 0.8 )
	self:addElement( Background )
	self.Background = Background
	
	local InputText = LUI.UIText.new()
	InputText:setLeftRight( true, false, 44, 342 )
	InputText:setTopBottom( true, false, 7, 25 )
	InputText:setTTF( "fonts/default.ttf" )
	InputText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	InputText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	InputText:linkToElementModel( self, "inputText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InputText:setText( modelValue )
		end
	end )
	self:addElement( InputText )
	self.InputText = InputText
	
	local channelText = LUI.UIText.new()
	channelText:setLeftRight( true, false, 4, 44 )
	channelText:setTopBottom( true, false, 7, 25 )
	channelText:setTTF( "fonts/default.ttf" )
	channelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	channelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	channelText:linkToElementModel( self, "inputChannelColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			channelText:setRGB( modelValue )
		end
	end )
	channelText:linkToElementModel( self, "inputChannelText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			channelText:setText( modelValue )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( channelText, "setText", function ( element, text )
		ChatClientInputArrangeText( self, element, controller )
	end )
	self:addElement( channelText )
	self.channelText = channelText
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	Border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	self:addElement( Border )
	self.Border = Border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.75 )
				self.clipFinished( Background, {} )
				InputText:completeAnimation()
				self.InputText:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.InputText:setAlpha( 1 )
				self.clipFinished( InputText, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.75 )
				self.clipFinished( Background, {} )
				InputText:completeAnimation()
				self.InputText:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
				self.InputText:setAlpha( 1 )
				self.clipFinished( InputText, {} )
				Border:completeAnimation()
				Border.FETitleNumBrdr0:completeAnimation()
				self.Border:setAlpha( 1 )
				self.Border.FETitleNumBrdr0:setAlpha( 1 )
				self.clipFinished( Border, {} )
			end
		},
		Chatting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				InputText:completeAnimation()
				self.InputText:setRGB( 1, 1, 1 )
				self.InputText:setAlpha( 1 )
				self.clipFinished( InputText, {} )
			end
		}
	}
	self:linkToElementModel( self, "inputText", true, function ( model )
		local element = self
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
		self.InputText:close()
		self.channelText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

