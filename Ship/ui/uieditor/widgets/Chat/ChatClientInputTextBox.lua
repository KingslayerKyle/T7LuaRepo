-- abe3248cc18cf220fe3fb08a4b912c9d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

local f0_local0 = 14
local f0_local1 = 18
local PostLoadFunc = function ( self, controller, menu )
	self.arrangeText = function ( f2_arg0 )
		local f2_local0, f2_local1, f2_local2, f2_local3 = f2_arg0:getLocalRect()
		local f2_local4, f2_local5, f2_local6, f2_local7 = nil
		f2_local7 = 4
		f2_local6 = f2_local7 + f2_arg0.channelText:getTextWidth()
		f2_arg0.channelText:setLeftRight( true, false, f2_local7, f2_local6 )
		f2_arg0.InputText:setLeftRight( true, false, f2_local6 + 2, f2_local2 - f2_local0 - 2 )
		f2_local5, f2_local4 = f2_arg0.InputText:getTextWidthAndHeight()
		if f2_local4 < f0_local1 then
			f2_local4 = f0_local1
		end
		f2_arg0:setTopBottom( true, false, f2_local1, f2_local1 + f0_local0 + f2_local4 )
	end
	
end

CoD.ChatClientInputTextBox = InheritFrom( LUI.UIElement )
CoD.ChatClientInputTextBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.ChatClientInputTextBox )
	self.id = "ChatClientInputTextBox"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 346 )
	self:setTopBottom( true, false, 0, 32 )
	
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
		local inputText = Engine.GetModelValue( model )
		if inputText then
			InputText:setText( inputText )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( InputText, "setText", function ( element, controller )
		ChatClientInputArrangeText( self, element, controller )
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
		local inputChannelColor = Engine.GetModelValue( model )
		if inputChannelColor then
			channelText:setRGB( inputChannelColor )
		end
	end )
	channelText:linkToElementModel( self, "inputChannelText", true, function ( model )
		local inputChannelText = Engine.GetModelValue( model )
		if inputChannelText then
			channelText:setText( inputChannelText )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( channelText, "setText", function ( element, controller )
		ChatClientInputArrangeText( self, element, controller )
	end )
	self:addElement( channelText )
	self.channelText = channelText
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	Border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	Border:setAlpha( 0 )
	self:addElement( Border )
	self.Border = Border
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, 0, 0 )
	LineLeft:setTopBottom( true, false, -2, 2 )
	LineLeft:setAlpha( 0.55 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.75 )
				self.clipFinished( Background, {} )

				InputText:completeAnimation()
				self.InputText:setRGB( 1, 1, 1 )
				self.InputText:setAlpha( 0.75 )
				self.clipFinished( InputText, {} )

				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.75 )
				self.clipFinished( Background, {} )

				InputText:completeAnimation()
				self.InputText:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.InputText:setAlpha( 1 )
				self.clipFinished( InputText, {} )

				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		Chatting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.75 )
				self.clipFinished( Background, {} )

				InputText:completeAnimation()
				self.InputText:setRGB( 1, 1, 1 )
				self.InputText:setAlpha( 1 )
				self.clipFinished( InputText, {} )
			end
		},
		ChattingIngame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.4 )
				self.clipFinished( Background, {} )

				InputText:completeAnimation()
				self.InputText:setRGB( 1, 1, 1 )
				self.InputText:setAlpha( 1 )
				self.clipFinished( InputText, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Background:completeAnimation()
				self.Background:setAlpha( 0.75 )
				self.clipFinished( Background, {} )

				InputText:completeAnimation()
				self.InputText:setAlpha( 0.75 )
				self.clipFinished( InputText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
		element.InputText:close()
		element.channelText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
