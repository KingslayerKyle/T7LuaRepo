-- 7c462e79aa1b92e815653f07daa2a64a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Chat.ChatClientChatEntryContainerNew" )
require( "ui.uieditor.widgets.Chat.ChatClientInputTextBox" )

local PostLoadFunc = function ( self, controller, menu )
	self:setPriority( 10000 )
end

CoD.IngameChatClient = InheritFrom( LUI.UIElement )
CoD.IngameChatClient.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IngameChatClient )
	self.id = "IngameChatClient"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 250 )
	self.anyChildUsesUpdateState = true
	
	local ChatEntriesList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	ChatEntriesList:makeFocusable()
	ChatEntriesList:setLeftRight( false, false, -180, 162 )
	ChatEntriesList:setTopBottom( false, true, -144, -36 )
	ChatEntriesList:setDataSource( "ChatClientEntriesList" )
	ChatEntriesList:setWidgetType( CoD.ChatClientChatEntryContainerNew )
	ChatEntriesList:setVerticalCount( 6 )
	ChatEntriesList:setSpacing( 0 )
	self:addElement( ChatEntriesList )
	self.ChatEntriesList = ChatEntriesList
	
	local InputText = CoD.ChatClientInputTextBox.new( menu, controller )
	InputText:setLeftRight( true, false, 0, 342 )
	InputText:setTopBottom( true, false, 218, 250 )
	InputText:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		InputText:setModel( model, controller )
	end )
	InputText:subscribeToGlobalModel( controller, "ChatClientGlobal", "update", function ( model )
		ChatClientInputTextFieldUpdatePrompt( self, InputText, controller )
	end )
	InputText:mergeStateConditions( {
		{
			stateName = "Chatting",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ChattingIngame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ChatClientEnabled( controller )
			end
		}
	} )
	InputText:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "ChatClientGlobal.update" ), function ( model )
		menu:updateElementState( InputText, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ChatClientGlobal.update"
		} )
	end )
	self:addElement( InputText )
	self.InputText = InputText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				InputText:completeAnimation()
				self.InputText:setAlpha( 0 )
				self.clipFinished( InputText, {} )
			end
		},
		Chatting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				InputText:completeAnimation()
				self.InputText:setAlpha( 1 )
				self.clipFinished( InputText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Chatting",
			condition = function ( menu, element, event )
				return ChatClientIsChatting( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "ChatClientGlobal.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ChatClientGlobal.update"
		} )
	end )
	ChatEntriesList.id = "ChatEntriesList"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChatEntriesList:close()
		element.InputText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

