require( "ui.uieditor.widgets.button" )

CoD.LobbyPromptRow = InheritFrom( LUI.UIElement )
CoD.LobbyPromptRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LobbyPromptRow )
	self.id = "LobbyPromptRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 271 )
	self:setTopBottom( true, false, 0, 29 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local btnLobbyPromptSelection = CoD.button.new( menu, controller )
	btnLobbyPromptSelection:setLeftRight( true, false, 0, 610 )
	btnLobbyPromptSelection:setTopBottom( true, false, 0, 30 )
	btnLobbyPromptSelection:setRGB( 1, 1, 1 )
	btnLobbyPromptSelection:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			btnLobbyPromptSelection.buttoninternal0.Text0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( btnLobbyPromptSelection )
	self.btnLobbyPromptSelection = btnLobbyPromptSelection
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				btnLobbyPromptSelection:completeAnimation()
				self.btnLobbyPromptSelection:setRGB( 1, 1, 1 )
				self.clipFinished( btnLobbyPromptSelection, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local btnLobbyPromptSelectionFrame2 = function ( btnLobbyPromptSelection, event )
					local btnLobbyPromptSelectionFrame3 = function ( btnLobbyPromptSelection, event )
						if not event.interrupted then
							btnLobbyPromptSelection:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						btnLobbyPromptSelection:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( btnLobbyPromptSelection, event )
						else
							btnLobbyPromptSelection:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						btnLobbyPromptSelectionFrame3( btnLobbyPromptSelection, event )
						return 
					else
						btnLobbyPromptSelection:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						btnLobbyPromptSelection:setRGB( 1, 0.64, 0 )
						btnLobbyPromptSelection:registerEventHandler( "transition_complete_keyframe", btnLobbyPromptSelectionFrame3 )
					end
				end
				
				btnLobbyPromptSelection:completeAnimation()
				self.btnLobbyPromptSelection:setRGB( 1, 1, 1 )
				btnLobbyPromptSelectionFrame2( btnLobbyPromptSelection, {} )
			end
		}
	}
	btnLobbyPromptSelection.id = "btnLobbyPromptSelection"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.btnLobbyPromptSelection:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.btnLobbyPromptSelection:close()
		CoD.LobbyPromptRow.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

