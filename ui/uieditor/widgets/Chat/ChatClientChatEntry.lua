-- 1485468c80b93edc558c02cbaad4f0b1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

local PostLoadFunc = function ( self, controller, menu )
	if not CoD.isPC then
		return 
	else
		local f1_local0 = self.m_eventHandlers.update_state
		self:registerEventHandler( "update_state", function ( element, event )
			local f2_local0, f2_local1, f2_local2, f2_local3 = element:getLocalRect()
			local f2_local4, f2_local5, f2_local6, f2_local7 = nil
			f2_local7 = f2_local0
			f2_local6 = f2_local7 + element.entryTimestampText:getTextWidth()
			element.entryTimestampText:setLeftRight( true, false, f2_local7, f2_local6 )
			f2_local7 = f2_local6 + 2
			f2_local6 = f2_local7 + element.entryChannelText:getTextWidth()
			element.entryChannelText:setLeftRight( true, false, f2_local7, f2_local6 )
			f2_local7 = f2_local6 + 2
			f2_local6 = f2_local7 + element.entryNameText:getTextWidth()
			element.entryNameText:setLeftRight( true, false, f2_local7, f2_local6 )
			element.entryBodyText:setLeftRight( true, false, f2_local6 + 2, f2_local2 )
			local f2_local8, f2_local9 = element.entryBodyText:getTextWidthAndHeight()
			f2_local4 = f2_local9
			if f2_local8 > 0 then
				element:setTopBottom( true, false, 0, f2_local4 )
			else
				element:setTopBottom( true, false, 0, 0 )
			end
			return f1_local0( element, event )
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
	self:setLeftRight( true, false, 0, 342 )
	self:setTopBottom( true, false, 0, 18 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
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
	LUI.OverrideFunction_CallOriginalFirst( entryNameText, "setText", function ( element, controller )
		
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
		local text = Engine.GetModelValue( model )
		if text then
			entryBodyText:setText( text )
		end
	end )
	self.entryNameText:linkToElementModel( self, "chColor", true, function ( model )
		local chColor = Engine.GetModelValue( model )
		if chColor then
			entryNameText:setRGB( chColor )
		end
	end )
	self.entryNameText:linkToElementModel( self, "fullname", true, function ( model )
		local fullname = Engine.GetModelValue( model )
		if fullname then
			entryNameText:setText( fullname )
		end
	end )
	self.entryChannelText:linkToElementModel( self, "chColor", true, function ( model )
		local chColor = Engine.GetModelValue( model )
		if chColor then
			entryChannelText:setRGB( chColor )
		end
	end )
	self.entryChannelText:linkToElementModel( self, "chText", true, function ( model )
		local chText = Engine.GetModelValue( model )
		if chText then
			entryChannelText:setText( chText )
		end
	end )
	self.entryTimestampText:linkToElementModel( self, "timestamp", true, function ( model )
		local timestamp = Engine.GetModelValue( model )
		if timestamp then
			entryTimestampText:setText( timestamp )
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
		},
		InGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Background:completeAnimation()
				self.Background:setAlpha( 0.4 )
				self.clipFinished( Background, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
		element.entryBodyText:close()
		element.entryNameText:close()
		element.entryChannelText:close()
		element.entryTimestampText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

