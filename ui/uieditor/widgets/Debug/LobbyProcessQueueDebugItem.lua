-- 6d64fd395ca653498b434877ba9db47f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Debug.LobbyProcessQueueDebugItemText" )

CoD.LobbyProcessQueueDebugItem = InheritFrom( LUI.UIElement )
CoD.LobbyProcessQueueDebugItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LobbyProcessQueueDebugItem )
	self.id = "LobbyProcessQueueDebugItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 10 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	Background:setAlpha( 0.7 )
	self:addElement( Background )
	self.Background = Background
	
	local LobbyProcessQueueDebugItemText = CoD.LobbyProcessQueueDebugItemText.new( menu, controller )
	LobbyProcessQueueDebugItemText:setLeftRight( true, false, 0, 500 )
	LobbyProcessQueueDebugItemText:setTopBottom( true, false, -2, 12 )
	LobbyProcessQueueDebugItemText.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	LobbyProcessQueueDebugItemText:linkToElementModel( self, nil, false, function ( model )
		LobbyProcessQueueDebugItemText:setModel( model, controller )
	end )
	LobbyProcessQueueDebugItemText:linkToElementModel( self, "processName", true, function ( model )
		local processName = Engine.GetModelValue( model )
		if processName then
			LobbyProcessQueueDebugItemText.Name:setText( Engine.Localize( processName ) )
		end
	end )
	self:addElement( LobbyProcessQueueDebugItemText )
	self.LobbyProcessQueueDebugItemText = LobbyProcessQueueDebugItemText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Process = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Background:completeAnimation()
				self.Background:setRGB( 0, 0.04, 0.43 )
				self.Background:setAlpha( 0.7 )
				self.clipFinished( Background, {} )

				LobbyProcessQueueDebugItemText:completeAnimation()

				LobbyProcessQueueDebugItemText.Name:completeAnimation()
				self.LobbyProcessQueueDebugItemText.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( LobbyProcessQueueDebugItemText, {} )
			end
		},
		Action = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Background:completeAnimation()
				self.Background:setRGB( 0, 0, 0 )
				self.Background:setAlpha( 0.7 )
				self.clipFinished( Background, {} )

				LobbyProcessQueueDebugItemText:completeAnimation()

				LobbyProcessQueueDebugItemText.Name:completeAnimation()
				self.LobbyProcessQueueDebugItemText.Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( LobbyProcessQueueDebugItemText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Process",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "process" )
			end
		},
		{
			stateName = "Action",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "action" )
			end
		}
	} )
	self:linkToElementModel( self, "type", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "type"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LobbyProcessQueueDebugItemText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
