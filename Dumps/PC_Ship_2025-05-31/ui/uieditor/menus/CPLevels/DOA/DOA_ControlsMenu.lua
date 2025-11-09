require( "ui.uieditor.widgets.StartMenu.DOA.DOA_ControlHelp" )
require( "ui.uieditor.widgets.StartMenu.DOA.DOA_ControlKBMouse" )

LUI.createMenu.DOA_ControlsMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "DOA_ControlsMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DOA_ControlsMenu.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local DOAControlHelp0 = CoD.DOA_ControlHelp.new( self, controller )
	DOAControlHelp0:setLeftRight( true, false, -66, 710 )
	DOAControlHelp0:setTopBottom( false, true, -459, 125 )
	self:addElement( DOAControlHelp0 )
	self.DOAControlHelp0 = DOAControlHelp0
	
	local hintlabel0 = LUI.UITightText.new()
	hintlabel0:setLeftRight( false, true, -710, -658 )
	hintlabel0:setTopBottom( false, false, 238, 281 )
	hintlabel0:setText( Engine.Localize( "DOA_HINT" ) )
	hintlabel0:setTTF( "fonts/default.ttf" )
	self:addElement( hintlabel0 )
	self.hintlabel0 = hintlabel0
	
	local hintbox = LUI.UIText.new()
	hintbox:setLeftRight( true, false, 637, 1214 )
	hintbox:setTopBottom( true, false, 598, 641 )
	hintbox:setTTF( "fonts/default.ttf" )
	hintbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	hintbox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	hintbox:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", "hint", function ( model )
		local hint = Engine.GetModelValue( model )
		if hint then
			hintbox:setText( Engine.Localize( hint ) )
		end
	end )
	self:addElement( hintbox )
	self.hintbox = hintbox
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 118, 536 )
	Title:setTopBottom( true, false, 292.5, 344.75 )
	Title:setRGB( 0.99, 0.8, 0.33 )
	Title:setText( Engine.Localize( "CP_DOA_BO3_REDINS_RALLY" ) )
	Title:setTTF( "fonts/UnitedSansSmCdBd_0.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( Title )
	self.Title = Title
	
	local instructions = LUI.UIText.new()
	instructions:setLeftRight( true, false, 74, 580 )
	instructions:setTopBottom( true, false, 335.63, 369.88 )
	instructions:setRGB( 0.99, 0.8, 0.33 )
	instructions:setTTF( "fonts/default.ttf" )
	instructions:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	instructions:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	instructions:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", "instruct", function ( model )
		local instruct = Engine.GetModelValue( model )
		if instruct then
			instructions:setText( Engine.Localize( instruct ) )
		end
	end )
	self:addElement( instructions )
	self.instructions = instructions
	
	local DOAControlKBMouse = CoD.DOA_ControlKBMouse.new( self, controller )
	DOAControlKBMouse:setLeftRight( true, false, 74, 850 )
	DOAControlKBMouse:setTopBottom( true, false, 150.88, 734.88 )
	self:addElement( DOAControlKBMouse )
	self.DOAControlKBMouse = DOAControlKBMouse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DOAControlHelp0:completeAnimation()
				self.DOAControlHelp0:setAlpha( 1 )
				self.clipFinished( DOAControlHelp0, {} )
				DOAControlKBMouse:completeAnimation()
				self.DOAControlKBMouse:setAlpha( 0 )
				self.clipFinished( DOAControlKBMouse, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				DOAControlHelp0:completeAnimation()
				self.DOAControlHelp0:setAlpha( 0 )
				self.clipFinished( DOAControlHelp0, {} )
				DOAControlKBMouse:completeAnimation()
				self.DOAControlKBMouse:setAlpha( 1 )
				self.clipFinished( DOAControlKBMouse, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local8 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return f1_local8( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DOAControlHelp0:close()
		element.DOAControlKBMouse:close()
		element.hintbox:close()
		element.instructions:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "DOA_ControlsMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

