-- 72dab4a092f388bfa00b0f78321f47a4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Chat.inGame.IngameChatClient" )

CoD.IngameChatClientContainer = InheritFrom( LUI.UIElement )
CoD.IngameChatClientContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IngameChatClientContainer )
	self.id = "IngameChatClientContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local ChatClient = CoD.IngameChatClient.new( menu, controller )
	ChatClient:setLeftRight( true, false, 0, 360 )
	ChatClient:setTopBottom( true, false, 182.5, 432.5 )
	self:addElement( ChatClient )
	self.ChatClient = ChatClient
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ChatClient:completeAnimation()
				self.ChatClient:setLeftRight( true, false, 0, 360 )
				self.ChatClient:setTopBottom( true, false, 182.5, 432.5 )
				self.ChatClient:setAlpha( 1 )
				self.clipFinished( ChatClient, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ChatClient:completeAnimation()
				self.ChatClient:setLeftRight( true, false, 0, 360 )
				self.ChatClient:setTopBottom( true, false, 182.5, 432.5 )
				self.ChatClient:setAlpha( 0 )
				self.clipFinished( ChatClient, {} )
			end
		},
		ScoresUp = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ChatClient:completeAnimation()
				self.ChatClient:setLeftRight( true, false, 0, 360 )
				self.ChatClient:setTopBottom( true, false, 470, 720 )
				self.clipFinished( ChatClient, {} )
			end
		},
		ScoresForceUp = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ChatClient:completeAnimation()
				self.ChatClient:setLeftRight( true, false, 0, 360 )
				self.ChatClient:setTopBottom( true, false, 470, 720 )
				self.clipFinished( ChatClient, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not ChatClientShow( controller )
			end
		},
		{
			stateName = "ScoresUp",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "ScoresForceUp",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "forceScoreboard", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChatClient:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

