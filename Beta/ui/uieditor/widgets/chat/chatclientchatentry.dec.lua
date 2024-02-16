require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( self, controller, menu )
	if not CoD.isPC then
		return 
	else
		self:registerEventHandler( "update_state", function ( self, event )
			local entryleft, entrytop, entryright, entrybottom = self:getLocalRect()
			local height, width, right, left = nil
			left = entryleft
			right = left + self.entryTimestampText:getTextWidth()
			self.entryTimestampText:setLeftRight( true, false, left, right )
			left = right + 2
			right = left + self.entryChannelText:getTextWidth()
			self.entryChannelText:setLeftRight( true, false, left, right )
			left = right + 2
			right = left + self.entryNameText:getTextWidth()
			self.entryNameText:setLeftRight( true, false, left, right )
			self.entryBodyText:setLeftRight( true, false, right + 2, entryright )
			local f2_local0, f2_local1 = self.entryBodyText:getTextWidthAndHeight()
			height = f2_local1
			if f2_local0 > 0 then
				self:setTopBottom( true, false, 0, height )
			else
				self:setTopBottom( true, false, 0, 0 )
			end
		end )
	end
end

CoD.ChatClientChatEntry = InheritFrom( LUI.UIElement )
CoD.ChatClientChatEntry.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientChatEntry )
	self.id = "ChatClientChatEntry"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 410 )
	self:setTopBottom( true, false, 0, 18 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.18, 0.18, 0.18 )
	Background:setAlpha( 0.7 )
	self:addElement( Background )
	self.Background = Background
	
	local entryBodyText = LUI.UIText.new()
	entryBodyText:setLeftRight( true, false, 161, 410 )
	entryBodyText:setTopBottom( true, false, 0, 18 )
	entryBodyText:setTTF( "fonts/default.ttf" )
	entryBodyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	entryBodyText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( entryBodyText )
	self.entryBodyText = entryBodyText
	
	local entryNameText = LUI.UIText.new()
	entryNameText:setLeftRight( true, false, 86, 161 )
	entryNameText:setTopBottom( true, false, 0, 18 )
	entryNameText:setTTF( "fonts/default.ttf" )
	entryNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	entryNameText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( entryNameText, "setText", function ( element, text )
		
	end )
	self:addElement( entryNameText )
	self.entryNameText = entryNameText
	
	local entryChannelText = LUI.UIText.new()
	entryChannelText:setLeftRight( true, false, 48, 86 )
	entryChannelText:setTopBottom( true, false, 0, 18 )
	entryChannelText:setTTF( "fonts/default.ttf" )
	entryChannelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	entryChannelText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( entryChannelText )
	self.entryChannelText = entryChannelText
	
	local entryTimestampText = LUI.UIText.new()
	entryTimestampText:setLeftRight( true, false, 0, 48 )
	entryTimestampText:setTopBottom( true, false, 0, 18 )
	entryTimestampText:setTTF( "fonts/default.ttf" )
	entryTimestampText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	entryTimestampText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( entryTimestampText )
	self.entryTimestampText = entryTimestampText
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	Border:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	Border:setAlpha( 0 )
	self:addElement( Border )
	self.Border = Border
	
	self.entryBodyText:linkToElementModel( self, "text", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			entryBodyText:setText( modelValue )
		end
	end )
	self.entryNameText:linkToElementModel( self, "chColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			entryNameText:setRGB( modelValue )
		end
	end )
	self.entryNameText:linkToElementModel( self, "fullname", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			entryNameText:setText( modelValue )
		end
	end )
	self.entryChannelText:linkToElementModel( self, "chColor", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			entryChannelText:setRGB( modelValue )
		end
	end )
	self.entryChannelText:linkToElementModel( self, "chText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			entryChannelText:setText( modelValue )
		end
	end )
	self.entryTimestampText:linkToElementModel( self, "timestamp", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			entryTimestampText:setText( modelValue )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.7 )
				self.clipFinished( Background, {} )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
		self.entryBodyText:close()
		self.entryNameText:close()
		self.entryChannelText:close()
		self.entryTimestampText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

