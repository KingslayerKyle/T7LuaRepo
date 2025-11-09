require( "ui.uieditor.widgets.FooterButtonPrompt" )
require( "ui.uieditor.widgets.CodCaster.CodCasterKeyboardShortcutButtonPrompt" )

CoD.CodCasterButtons = InheritFrom( LUI.UIElement )
CoD.CodCasterButtons.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CodCasterButtons )
	self.id = "CodCasterButtons"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local spacer0 = LUI.UIImage.new()
	spacer0:setLeftRight( false, false, -640, -596 )
	spacer0:setTopBottom( false, false, -16, 16 )
	spacer0:setAlpha( 0 )
	self:addElement( spacer0 )
	self.spacer0 = spacer0
	
	local SelectPlayer = CoD.FooterButtonPrompt.new( menu, controller )
	SelectPlayer:setLeftRight( true, false, 44, 162 )
	SelectPlayer:setTopBottom( true, false, 0, 32 )
	SelectPlayer.label:setText( Engine.Localize( "CODCASTER_SELECT_PLAYER" ) )
	SelectPlayer.keyPrompt.keybind:setText( Engine.Localize( "KEY_ENTER" ) )
	SelectPlayer:subscribeToGlobalModel( controller, "Controller", "primary_button_image", function ( model )
		local primaryButtonImage = Engine.GetModelValue( model )
		if primaryButtonImage then
			SelectPlayer.buttonPromptImage:setImage( RegisterImage( primaryButtonImage ) )
		end
	end )
	SelectPlayer:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and AlwaysTrue()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f4_local0
				if not IsGamepad( controller ) then
					f4_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f4_local0 = false
				end
				return f4_local0
			end
		}
	} )
	SelectPlayer:linkToElementModel( SelectPlayer, nil, true, function ( model )
		menu:updateElementState( SelectPlayer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if SelectPlayer.m_eventHandlers.input_source_changed then
		local HighlightPlayer = SelectPlayer.m_eventHandlers.input_source_changed
		SelectPlayer:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return HighlightPlayer( element, event )
		end )
	else
		SelectPlayer:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	SelectPlayer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( SelectPlayer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( SelectPlayer )
	self.SelectPlayer = SelectPlayer
	
	local HighlightPlayer = CoD.FooterButtonPrompt.new( menu, controller )
	HighlightPlayer:setLeftRight( true, false, 162, 293 )
	HighlightPlayer:setTopBottom( true, false, 0, 32 )
	HighlightPlayer.label:setText( Engine.Localize( "CODCASTER_HIGHLIGHT_PLAYER" ) )
	HighlightPlayer.keyPrompt.keybind:setText( Engine.Localize( "KEY_ARROWS" ) )
	HighlightPlayer:subscribeToGlobalModel( controller, "Controller", "dpad_ud_button_image", function ( model )
		local dpadUdButtonImage = Engine.GetModelValue( model )
		if dpadUdButtonImage then
			HighlightPlayer.buttonPromptImage:setImage( RegisterImage( dpadUdButtonImage ) )
		end
	end )
	HighlightPlayer:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and AlwaysTrue()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f10_local0
				if not IsGamepad( controller ) then
					f10_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f10_local0 = false
				end
				return f10_local0
			end
		}
	} )
	HighlightPlayer:linkToElementModel( HighlightPlayer, nil, true, function ( model )
		menu:updateElementState( HighlightPlayer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if HighlightPlayer.m_eventHandlers.input_source_changed then
		local spacer = HighlightPlayer.m_eventHandlers.input_source_changed
		HighlightPlayer:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return spacer( element, event )
		end )
	else
		HighlightPlayer:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	HighlightPlayer:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( HighlightPlayer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( HighlightPlayer )
	self.HighlightPlayer = HighlightPlayer
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( false, false, -347, -255 )
	spacer:setTopBottom( false, false, -16, 16 )
	spacer:setAlpha( 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local QuickSettingsSideBar = CoD.FooterButtonPrompt.new( menu, controller )
	QuickSettingsSideBar:setLeftRight( true, false, 385, 517.25 )
	QuickSettingsSideBar:setTopBottom( true, false, 0, 32 )
	QuickSettingsSideBar.label:setText( Engine.Localize( "CODCASTER_QUICK_SETTINGS" ) )
	QuickSettingsSideBar.keyPrompt.keybind:setText( Engine.Localize( "Q" ) )
	QuickSettingsSideBar:subscribeToGlobalModel( controller, "Controller", "left_trigger_button_image", function ( model )
		local leftTriggerButtonImage = Engine.GetModelValue( model )
		if leftTriggerButtonImage then
			QuickSettingsSideBar.buttonPromptImage:setImage( RegisterImage( leftTriggerButtonImage ) )
		end
	end )
	QuickSettingsSideBar:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and AlwaysTrue()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f16_local0
				if not IsGamepad( controller ) then
					f16_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f16_local0 = false
				end
				return f16_local0
			end
		}
	} )
	QuickSettingsSideBar:linkToElementModel( QuickSettingsSideBar, nil, true, function ( model )
		menu:updateElementState( QuickSettingsSideBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if QuickSettingsSideBar.m_eventHandlers.input_source_changed then
		local SettingsSideBar = QuickSettingsSideBar.m_eventHandlers.input_source_changed
		QuickSettingsSideBar:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return SettingsSideBar( element, event )
		end )
	else
		QuickSettingsSideBar:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	QuickSettingsSideBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( QuickSettingsSideBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( QuickSettingsSideBar )
	self.QuickSettingsSideBar = QuickSettingsSideBar
	
	local SettingsSideBar = CoD.FooterButtonPrompt.new( menu, controller )
	SettingsSideBar:setLeftRight( true, false, 517.25, 616.25 )
	SettingsSideBar:setTopBottom( true, false, 0, 32 )
	SettingsSideBar.label:setText( Engine.Localize( "CODCASTER_SETTINGS" ) )
	SettingsSideBar.keyPrompt.keybind:setText( Engine.Localize( "S" ) )
	SettingsSideBar:subscribeToGlobalModel( controller, "Controller", "right_trigger_button_image", function ( model )
		local rightTriggerButtonImage = Engine.GetModelValue( model )
		if rightTriggerButtonImage then
			SettingsSideBar.buttonPromptImage:setImage( RegisterImage( rightTriggerButtonImage ) )
		end
	end )
	SettingsSideBar:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and AlwaysTrue()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f22_local0
				if not IsGamepad( controller ) then
					f22_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f22_local0 = false
				end
				return f22_local0
			end
		}
	} )
	SettingsSideBar:linkToElementModel( SettingsSideBar, nil, true, function ( model )
		menu:updateElementState( SettingsSideBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if SettingsSideBar.m_eventHandlers.input_source_changed then
		local Toolbar = SettingsSideBar.m_eventHandlers.input_source_changed
		SettingsSideBar:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return Toolbar( element, event )
		end )
	else
		SettingsSideBar:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	SettingsSideBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( SettingsSideBar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( SettingsSideBar )
	self.SettingsSideBar = SettingsSideBar
	
	local Toolbar = CoD.FooterButtonPrompt.new( menu, controller )
	Toolbar:setLeftRight( true, false, 616.25, 758.25 )
	Toolbar:setTopBottom( true, false, 0, 32 )
	Toolbar.label:setText( Engine.Localize( "CODCASTER_DS_TOOLBAR" ) )
	Toolbar.keyPrompt.keybind:setText( Engine.Localize( "KEY_SPACE" ) )
	Toolbar:subscribeToGlobalModel( controller, "Controller", "secondary_button_image", function ( model )
		local secondaryButtonImage = Engine.GetModelValue( model )
		if secondaryButtonImage then
			Toolbar.buttonPromptImage:setImage( RegisterImage( secondaryButtonImage ) )
		end
	end )
	Toolbar:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and AlwaysTrue()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f28_local0
				if not IsGamepad( controller ) then
					f28_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f28_local0 = false
				end
				return f28_local0
			end
		}
	} )
	Toolbar:linkToElementModel( Toolbar, nil, true, function ( model )
		menu:updateElementState( Toolbar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if Toolbar.m_eventHandlers.input_source_changed then
		local Map = Toolbar.m_eventHandlers.input_source_changed
		Toolbar:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return Map( element, event )
		end )
	else
		Toolbar:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	Toolbar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( Toolbar, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( Toolbar )
	self.Toolbar = Toolbar
	
	local Map = CoD.FooterButtonPrompt.new( menu, controller )
	Map:setLeftRight( true, false, 758.25, 845.25 )
	Map:setTopBottom( true, false, 0, 32 )
	Map.label:setText( Engine.Localize( "MENU_MAP" ) )
	Map.keyPrompt.keybind:setText( Engine.Localize( "M" ) )
	Map:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			Map.buttonPromptImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	Map:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and AlwaysTrue()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f34_local0
				if not IsGamepad( controller ) then
					f34_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f34_local0 = false
				end
				return f34_local0
			end
		}
	} )
	Map:linkToElementModel( Map, nil, true, function ( model )
		menu:updateElementState( Map, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if Map.m_eventHandlers.input_source_changed then
		local LoadoutView = Map.m_eventHandlers.input_source_changed
		Map:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return LoadoutView( element, event )
		end )
	else
		Map:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	Map:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( Map, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( Map )
	self.Map = Map
	
	local LoadoutView = CoD.FooterButtonPrompt.new( menu, controller )
	LoadoutView:setLeftRight( true, false, 845.25, 985.25 )
	LoadoutView:setTopBottom( true, false, 0, 32 )
	LoadoutView.label:setText( Engine.Localize( "CODCASTER_LOADOUT" ) )
	LoadoutView.keyPrompt.keybind:setText( Engine.Localize( "R" ) )
	LoadoutView:subscribeToGlobalModel( controller, "Controller", "alt2_button_image", function ( model )
		local alt2ButtonImage = Engine.GetModelValue( model )
		if alt2ButtonImage then
			LoadoutView.buttonPromptImage:setImage( RegisterImage( alt2ButtonImage ) )
		end
	end )
	LoadoutView:mergeStateConditions( {
		{
			stateName = "Enabled",
			condition = function ( menu, element, event )
				return IsGamepad( controller ) and AlwaysTrue()
			end
		},
		{
			stateName = "EnabledPC",
			condition = function ( menu, element, event )
				local f40_local0
				if not IsGamepad( controller ) then
					f40_local0 = not ShouldHideButtonPromptForPC( element, controller )
				else
					f40_local0 = false
				end
				return f40_local0
			end
		}
	} )
	LoadoutView:linkToElementModel( LoadoutView, nil, true, function ( model )
		menu:updateElementState( LoadoutView, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	if LoadoutView.m_eventHandlers.input_source_changed then
		local spacer2 = LoadoutView.m_eventHandlers.input_source_changed
		LoadoutView:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return spacer2( element, event )
		end )
	else
		LoadoutView:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	LoadoutView:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( LoadoutView, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:addElement( LoadoutView )
	self.LoadoutView = LoadoutView
	
	local spacer2 = LUI.UIImage.new()
	spacer2:setLeftRight( false, false, 345.25, 462.25 )
	spacer2:setTopBottom( false, false, -16, 16 )
	spacer2:setAlpha( 0 )
	self:addElement( spacer2 )
	self.spacer2 = spacer2
	
	local CodCasterKeyboardShortcutButtonPrompt0 = CoD.CodCasterKeyboardShortcutButtonPrompt.new( menu, controller )
	CodCasterKeyboardShortcutButtonPrompt0:setLeftRight( true, false, 1102.25, 1242.25 )
	CodCasterKeyboardShortcutButtonPrompt0:setTopBottom( true, false, 0, 32 )
	self:addElement( CodCasterKeyboardShortcutButtonPrompt0 )
	self.CodCasterKeyboardShortcutButtonPrompt0 = CodCasterKeyboardShortcutButtonPrompt0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				SelectPlayer:completeAnimation()
				self.SelectPlayer:setRGB( 1, 1, 1 )
				self.SelectPlayer:setAlpha( 1 )
				self.clipFinished( SelectPlayer, {} )
				HighlightPlayer:completeAnimation()
				self.HighlightPlayer:setRGB( 1, 1, 1 )
				self.HighlightPlayer:setAlpha( 1 )
				self.clipFinished( HighlightPlayer, {} )
				QuickSettingsSideBar:completeAnimation()
				self.QuickSettingsSideBar:setRGB( 1, 1, 1 )
				self.QuickSettingsSideBar:setAlpha( 1 )
				self.clipFinished( QuickSettingsSideBar, {} )
				SettingsSideBar:completeAnimation()
				self.SettingsSideBar:setRGB( 1, 1, 1 )
				self.SettingsSideBar:setAlpha( 1 )
				self.clipFinished( SettingsSideBar, {} )
				Toolbar:completeAnimation()
				self.Toolbar:setRGB( 1, 1, 1 )
				self.Toolbar:setAlpha( 1 )
				self.clipFinished( Toolbar, {} )
				Map:completeAnimation()
				self.Map:setRGB( 1, 1, 1 )
				self.Map:setAlpha( 1 )
				self.clipFinished( Map, {} )
				LoadoutView:completeAnimation()
				self.LoadoutView:setRGB( 1, 1, 1 )
				self.LoadoutView:setAlpha( 1 )
				self.clipFinished( LoadoutView, {} )
			end
		},
		QuickSettingsSideBarOpened = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				SelectPlayer:completeAnimation()
				self.SelectPlayer:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( SelectPlayer, {} )
				HighlightPlayer:completeAnimation()
				self.HighlightPlayer:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( HighlightPlayer, {} )
				SettingsSideBar:completeAnimation()
				self.SettingsSideBar:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( SettingsSideBar, {} )
				Toolbar:completeAnimation()
				self.Toolbar:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( Toolbar, {} )
				Map:completeAnimation()
				self.Map:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( Map, {} )
				LoadoutView:completeAnimation()
				self.LoadoutView:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( LoadoutView, {} )
			end
		},
		SettingsSideBarOpened = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				SelectPlayer:completeAnimation()
				self.SelectPlayer:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( SelectPlayer, {} )
				HighlightPlayer:completeAnimation()
				self.HighlightPlayer:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( HighlightPlayer, {} )
				QuickSettingsSideBar:completeAnimation()
				self.QuickSettingsSideBar:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( QuickSettingsSideBar, {} )
				SettingsSideBar:completeAnimation()
				self.SettingsSideBar:setRGB( 1, 1, 1 )
				self.clipFinished( SettingsSideBar, {} )
				Toolbar:completeAnimation()
				self.Toolbar:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( Toolbar, {} )
				Map:completeAnimation()
				self.Map:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( Map, {} )
				LoadoutView:completeAnimation()
				self.LoadoutView:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( LoadoutView, {} )
			end
		},
		ScoreboardOpened = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				SelectPlayer:completeAnimation()
				self.SelectPlayer:setRGB( ColorSet.WaypointNeutral.r, ColorSet.WaypointNeutral.g, ColorSet.WaypointNeutral.b )
				self.clipFinished( SelectPlayer, {} )
				HighlightPlayer:completeAnimation()
				self.HighlightPlayer:setRGB( ColorSet.WaypointNeutral.r, ColorSet.WaypointNeutral.g, ColorSet.WaypointNeutral.b )
				self.clipFinished( HighlightPlayer, {} )
				QuickSettingsSideBar:completeAnimation()
				self.QuickSettingsSideBar:setRGB( 0.37, 0.37, 0.36 )
				self.clipFinished( QuickSettingsSideBar, {} )
				SettingsSideBar:completeAnimation()
				self.SettingsSideBar:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( SettingsSideBar, {} )
				Toolbar:completeAnimation()
				self.Toolbar:setRGB( ColorSet.WaypointNeutral.r, ColorSet.WaypointNeutral.g, ColorSet.WaypointNeutral.b )
				self.clipFinished( Toolbar, {} )
				Map:completeAnimation()
				self.Map:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( Map, {} )
				LoadoutView:completeAnimation()
				self.LoadoutView:setRGB( ColorSet.CodCaster.r, ColorSet.CodCaster.g, ColorSet.CodCaster.b )
				self.clipFinished( LoadoutView, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "QuickSettingsSideBarOpened",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "CodCaster.showQuickSettingsSideBar", 1 )
			end
		},
		{
			stateName = "SettingsSideBarOpened",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "CodCaster.showSettingsSideBar", 1 )
			end
		},
		{
			stateName = "ScoreboardOpened",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showQuickSettingsSideBar" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showQuickSettingsSideBar"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.showSettingsSideBar" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.showSettingsSideBar"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SelectPlayer:close()
		element.HighlightPlayer:close()
		element.QuickSettingsSideBar:close()
		element.SettingsSideBar:close()
		element.Toolbar:close()
		element.Map:close()
		element.LoadoutView:close()
		element.CodCasterKeyboardShortcutButtonPrompt0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

