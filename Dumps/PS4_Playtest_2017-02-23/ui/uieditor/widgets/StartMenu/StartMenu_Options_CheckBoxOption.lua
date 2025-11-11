require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

local PostLoadFunc = function ( self, controller, menu )
	self:registerEventHandler( "options_refresh", function ( self, event )
		self:processEvent( {
			name = "update_state",
			controller = event.controller
		} )
	end )
	CoD.Menu.AddButtonCallbackFunction( menu, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not self.disabled and not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
			if type( self.checkboxAction ) == "function" then
				self.checkboxAction( controller, self )
				self:processEvent( {
					name = "update_state",
					controller = controller
				} )
			end
			return true
		else
			
		end
	end )
end

CoD.StartMenu_Options_CheckBoxOption = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_CheckBoxOption.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_CheckBoxOption )
	self.id = "StartMenu_Options_CheckBoxOption"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 750 )
	self:setTopBottom( 0, 0, 0, 51 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local fullBacking = LUI.UIImage.new()
	fullBacking:setLeftRight( 0, 1, 0, 0 )
	fullBacking:setTopBottom( 0, 1, 0, 0 )
	fullBacking:setRGB( 0.1, 0.1, 0.1 )
	fullBacking:setAlpha( 0 )
	self:addElement( fullBacking )
	self.fullBacking = fullBacking
	
	local fullBorder = CoD.StartMenu_frame_noBG.new( menu, controller )
	fullBorder:setLeftRight( 0, 1, 0, 0 )
	fullBorder:setTopBottom( 0, 1, 0, 0 )
	fullBorder:setRGB( 0.87, 0.37, 0 )
	fullBorder:setAlpha( 0 )
	self:addElement( fullBorder )
	self.fullBorder = fullBorder
	
	local checkboxBacking = CoD.StartMenu_frame_noBG.new( menu, controller )
	checkboxBacking:setLeftRight( 0, 1, -13, -665 )
	checkboxBacking:setTopBottom( 0, 1, -20, 20 )
	checkboxBacking:setScale( 0.3 )
	self:addElement( checkboxBacking )
	self.checkboxBacking = checkboxBacking
	
	local CheckboxBkg = LUI.UIImage.new()
	CheckboxBkg:setLeftRight( 0, 0, 22, 50 )
	CheckboxBkg:setTopBottom( 0, 0, 13, 39 )
	CheckboxBkg:setAlpha( 0 )
	CheckboxBkg:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox_empty" ) )
	self:addElement( CheckboxBkg )
	self.CheckboxBkg = CheckboxBkg
	
	local checkboxCheck = LUI.UIImage.new()
	checkboxCheck:setLeftRight( 0, 0, 22, 50 )
	checkboxCheck:setTopBottom( 0, 0, 13, 39 )
	checkboxCheck:setImage( RegisterImage( "uie_t7_menu_cacselection_checkbox" ) )
	self:addElement( checkboxCheck )
	self.checkboxCheck = checkboxCheck
	
	local labelText = LUI.UITightText.new()
	labelText:setLeftRight( 0, 0, 70, 750 )
	labelText:setTopBottom( 0, 0, 7, 45 )
	labelText:setTTF( "fonts/default.ttf" )
	labelText:linkToElementModel( self, "label", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			labelText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( labelText )
	self.labelText = labelText
	
	local StartMenuframenoBG00 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG00:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG00:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG00 )
	self.StartMenuframenoBG00 = StartMenuframenoBG00
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 4, 0 )
	FocusBarT:setTopBottom( 0, 0, 0, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -8, 0 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.resetProperties = function ()
		checkboxBacking:completeAnimation()
		checkboxCheck:completeAnimation()
		CheckboxBkg:completeAnimation()
		FocusBarB:completeAnimation()
		fullBorder:completeAnimation()
		FocusBarT:completeAnimation()
		labelText:completeAnimation()
		checkboxBacking:setRGB( 1, 1, 1 )
		checkboxCheck:setRGB( 1, 1, 1 )
		checkboxCheck:setAlpha( 1 )
		CheckboxBkg:setRGB( 1, 1, 1 )
		CheckboxBkg:setAlpha( 0 )
		FocusBarB:setAlpha( 0 )
		fullBorder:setAlpha( 0 )
		FocusBarT:setLeftRight( 0, 1, 4, 0 )
		FocusBarT:setTopBottom( 0, 0, 0, 6 )
		FocusBarT:setAlpha( 0 )
		labelText:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.78, 0.78, 0.78 )
				self.clipFinished( checkboxBacking, {} )
				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setAlpha( 1 )
				self.clipFinished( CheckboxBkg, {} )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 1, 0.45, 0 )
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
				FocusBarB:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				FocusBarB:setAlpha( 0 )
				FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 1 )
				self.clipFinished( fullBorder, {} )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( checkboxBacking, {} )
				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setRGB( 1, 0.41, 0 )
				self.CheckboxBkg:setAlpha( 1 )
				self.clipFinished( CheckboxBkg, {} )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, 0, 0 )
				self.FocusBarT:setTopBottom( 0, 0, 0, 6 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Checked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.78, 0.78, 0.78 )
				self.clipFinished( checkboxBacking, {} )
				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setAlpha( 0.5 )
				self.clipFinished( CheckboxBkg, {} )
				local checkboxCheckFrame2 = function ( checkboxCheck, event )
					if not event.interrupted then
						checkboxCheck:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					checkboxCheck:setRGB( 1, 1, 1 )
					checkboxCheck:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( checkboxCheck, event )
					else
						checkboxCheck:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 1, 1, 1 )
				self.checkboxCheck:setAlpha( 1 )
				checkboxCheckFrame2( checkboxCheck, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				fullBorder:completeAnimation()
				self.fullBorder:setAlpha( 1 )
				self.clipFinished( fullBorder, {} )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.87, 0.37, 0 )
				self.clipFinished( checkboxBacking, {} )
				local checkboxCheckFrame2 = function ( checkboxCheck, event )
					if not event.interrupted then
						checkboxCheck:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					checkboxCheck:setRGB( 0.98, 0.44, 0.04 )
					if event.interrupted then
						self.clipFinished( checkboxCheck, event )
					else
						checkboxCheck:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 0.87, 0.37, 0 )
				checkboxCheckFrame2( checkboxCheck, {} )
				local FocusBarTFrame2 = function ( FocusBarT, event )
					if not event.interrupted then
						FocusBarT:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					FocusBarT:setLeftRight( 0, 1, 0, 0 )
					FocusBarT:setTopBottom( 0, 0, 0, 6 )
					FocusBarT:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusBarT, event )
					else
						FocusBarT:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( 0, 1, 0, 0 )
				self.FocusBarT:setTopBottom( 0, 0, 0, 6 )
				self.FocusBarT:setAlpha( 1 )
				FocusBarTFrame2( FocusBarT, {} )
				FocusBarB:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				FocusBarB:setAlpha( 1 )
				FocusBarB:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				checkboxBacking:completeAnimation()
				self.checkboxBacking:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( checkboxBacking, {} )
				CheckboxBkg:completeAnimation()
				self.CheckboxBkg:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( CheckboxBkg, {} )
				checkboxCheck:completeAnimation()
				self.checkboxCheck:setRGB( 0.2, 0.2, 0.2 )
				self.checkboxCheck:setAlpha( 0 )
				self.clipFinished( checkboxCheck, {} )
				labelText:completeAnimation()
				self.labelText:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( labelText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Checked",
			condition = function ( menu, element, event )
				return CheckBoxOptionChecked( element, event )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.fullBorder:close()
		self.checkboxBacking:close()
		self.StartMenuframenoBG00:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.labelText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

