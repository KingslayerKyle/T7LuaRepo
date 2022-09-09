-- 4ac45f9aa473388f3570f22b3cf8d66e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_MemberBlurPanelContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
end

CoD.SplitscreenLobbyButtonPC = InheritFrom( LUI.UIElement )
CoD.SplitscreenLobbyButtonPC.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SplitscreenLobbyButtonPC )
	self.id = "SplitscreenLobbyButtonPC"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 490 )
	self:setTopBottom( true, false, 0, 27 )
	self.anyChildUsesUpdateState = true
	
	local ButtonBackGround = LUI.UIImage.new()
	ButtonBackGround:setLeftRight( true, false, 60, 408 )
	ButtonBackGround:setTopBottom( true, false, -0.5, 27 )
	self:addElement( ButtonBackGround )
	self.ButtonBackGround = ButtonBackGround
	
	local FEMemberBlurPanelContainer0 = CoD.FE_MemberBlurPanelContainer.new( menu, controller )
	FEMemberBlurPanelContainer0:setLeftRight( true, true, 60, -82 )
	FEMemberBlurPanelContainer0:setTopBottom( false, false, -14, 13.5 )
	FEMemberBlurPanelContainer0:setRGB( 0.5, 0.5, 0.5 )
	FEMemberBlurPanelContainer0.FEMemberBlurPanel0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( FEMemberBlurPanelContainer0 )
	self.FEMemberBlurPanelContainer0 = FEMemberBlurPanelContainer0
	
	local TextLabel = LUI.UIText.new()
	TextLabel:setLeftRight( true, false, 68, 401 )
	TextLabel:setTopBottom( true, false, 4, 24 )
	TextLabel:setText( Engine.Localize( "Splitscreen Dynamic Label" ) )
	TextLabel:setTTF( "fonts/default.ttf" )
	TextLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	TextLabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextLabel )
	self.TextLabel = TextLabel
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, true, 60, -82 )
	Image:setTopBottom( true, true, -1, 1 )
	Image:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframefull" ) )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	Image:setShaderVector( 0, 0.07, 0.62, 0.42, 0.39 )
	Image:setupNineSliceShader( 26, 18 )
	self:addElement( Image )
	self.Image = Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 0 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setAlpha( 0 )
				self.clipFinished( TextLabel, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 0 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setAlpha( 0 )
				self.clipFinished( TextLabel, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		},
		MapController = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 1 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setRGB( 1, 1, 1 )
				self.TextLabel:setAlpha( 1 )
				self.TextLabel:setText( Engine.Localize( "PLATFORM_SPLITSCREEN_MAP_CONTROLLER" ) )
				self.clipFinished( TextLabel, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 1 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.TextLabel:setAlpha( 1 )
				self.TextLabel:setText( Engine.Localize( "PLATFORM_SPLITSCREEN_MAP_CONTROLLER" ) )
				self.clipFinished( TextLabel, {} )
			end
		},
		Available = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 0 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setRGB( 1, 1, 1 )
				self.TextLabel:setAlpha( 1 )
				self.TextLabel:setText( Engine.Localize( "PLATFORM_SPLITSCREEN_ACTIVATE" ) )
				self.clipFinished( TextLabel, {} )

				Image:completeAnimation()
				self.Image:setLeftRight( true, true, 60, -82 )
				self.Image:setTopBottom( true, true, -1, 1 )
				self.Image:setRGB( 1, 1, 1 )
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 4 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 0 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.TextLabel:setAlpha( 1 )
				self.TextLabel:setText( Engine.Localize( "PLATFORM_SPLITSCREEN_ACTIVATE" ) )
				self.clipFinished( TextLabel, {} )

				Image:completeAnimation()
				self.Image:setRGB( 1, 0.41, 0 )
				self.clipFinished( Image, {} )
			end
		},
		Active = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 0 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setRGB( 1, 1, 1 )
				self.TextLabel:setAlpha( 1 )
				self.TextLabel:setText( Engine.Localize( "PLATFORM_SPLITSCREEN_DEACTIVATE" ) )
				self.clipFinished( TextLabel, {} )

				Image:completeAnimation()
				self.Image:setRGB( 1, 1, 1 )
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 4 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 0 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 1 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.TextLabel:setAlpha( 1 )
				self.TextLabel:setText( Engine.Localize( "PLATFORM_SPLITSCREEN_DEACTIVATE" ) )
				self.clipFinished( TextLabel, {} )

				Image:completeAnimation()
				self.Image:setRGB( 1, 0.41, 0 )
				self.clipFinished( Image, {} )
			end
		},
		AddController = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				ButtonBackGround:completeAnimation()
				self.ButtonBackGround:setAlpha( 0 )
				self.clipFinished( ButtonBackGround, {} )

				FEMemberBlurPanelContainer0:completeAnimation()
				self.FEMemberBlurPanelContainer0:setAlpha( 0 )
				self.clipFinished( FEMemberBlurPanelContainer0, {} )

				TextLabel:completeAnimation()
				self.TextLabel:setRGB( 1, 1, 1 )
				self.TextLabel:setAlpha( 1 )
				self.TextLabel:setText( Engine.Localize( "PLATFORM_FEEDER_SECONDARY_CONTROLLER_PLUGIN" ) )
				self.clipFinished( TextLabel, {} )

				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueTrue( element, controller, "lobbyRoot.inspectionView" )
			end
		},
		{
			stateName = "MapController",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				local f14_local0 = IsSplitscreenPlayAvailable()
				if f14_local0 then
					f14_local0 = IsSplitscreenLobbyRoomAvailable()
					if f14_local0 then
						f14_local0 = GamepadsConnectedAny()
					end
				end
				return f14_local0
			end
		},
		{
			stateName = "Active",
			condition = function ( menu, element, event )
				return IsSplitscreenPlayAvailable() and IsSplitscreenPlayerSignedIn()
			end
		},
		{
			stateName = "AddController",
			condition = function ( menu, element, event )
				return ShouldShowAddController( menu, element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.inspectionView" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.inspectionView"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.platformUpdate"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.gameClient.update"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.privateClient.update"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy.maxPlayers" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PartyPrivacy.maxPlayers"
		} )
	end )
	if self.m_eventHandlers.controller_inserted then
		local f2_local5 = self.m_eventHandlers.controller_inserted
		self:registerEventHandler( "controller_inserted", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f2_local5( element, event )
		end )
	else
		self:registerEventHandler( "controller_inserted", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_removed then
		local f2_local5 = self.m_eventHandlers.controller_removed
		self:registerEventHandler( "controller_removed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f2_local5( element, event )
		end )
	else
		self:registerEventHandler( "controller_removed", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_start then
		local f2_local5 = self.m_eventHandlers.controller_used_start
		self:registerEventHandler( "controller_used_start", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f2_local5( element, event )
		end )
	else
		self:registerEventHandler( "controller_used_start", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_stop then
		local f2_local5 = self.m_eventHandlers.controller_used_stop
		self:registerEventHandler( "controller_used_stop", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f2_local5( element, event )
		end )
	else
		self:registerEventHandler( "controller_used_stop", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMemberBlurPanelContainer0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
