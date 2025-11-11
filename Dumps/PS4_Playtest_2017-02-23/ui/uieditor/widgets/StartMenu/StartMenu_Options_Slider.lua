require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Control_Item" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "currentSelection", true, function ( model )
		local selectedIndex = Engine.GetModelValue( model )
		local row, col = self.Slider:getRowAndColumnForIndex( selectedIndex - 1 )
		self.Slider:setActiveIndex( row, col, 0 )
	end )
end

CoD.StartMenu_Options_Slider = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Slider.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Slider )
	self.id = "StartMenu_Options_Slider"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1005 )
	self:setTopBottom( 0, 0, 0, 82 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 58, -508 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 4, -4 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( 0, 1, 506, -188 )
	StartMenuframenoBG1:setTopBottom( 0, 1, 4, -4 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 89, 422 )
	Title:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Slider = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	Slider:makeFocusable()
	Slider:mergeStateConditions( {
		{
			stateName = "ArrowsHidden",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "hideArrows" )
			end
		},
		{
			stateName = "LeftArrowHidden",
			condition = function ( menu, element, event )
				local f6_local0
				if not ListLoopEdgesEnabled( self, "Slider" ) then
					f6_local0 = IsFirstListElement( element )
				else
					f6_local0 = false
				end
				return f6_local0
			end
		},
		{
			stateName = "RightArrowHidden",
			condition = function ( menu, element, event )
				local f7_local0
				if not ListLoopEdgesEnabled( self, "Slider" ) then
					f7_local0 = IsLastListElement( element )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	Slider:setLeftRight( 0, 0, 536, 788 )
	Slider:setTopBottom( 0, 0, 19, 64 )
	Slider:setWidgetType( CoD.StartMenu_Options_Slider_Control_Item )
	Slider:linkToElementModel( self, "optionsDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Slider:setDataSource( modelValue )
		end
	end )
	Slider:linkToElementModel( Slider, "alias", true, function ( model )
		local element = Slider
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "alias"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	Slider:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	Slider:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local retVal = nil
		if IsSelfModelValueNonEmptyString( element, controller, "alias" ) then
			StopMPMusicPreview( controller, element )
		end
		return retVal
	end )
	Slider:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return retVal
	end )
	Slider:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( Slider, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( element, menu, controller, model )
		if IsSelfModelValueNonEmptyString( element, controller, "alias" ) then
			StopMPMusicPreview( controller, element )
			PlayMPMusicPreview( controller, element )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsSelfModelValueNonEmptyString( element, controller, "alias" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_PLAY_MUSIC_SAMPLE", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Slider )
	self.Slider = Slider
	
	local altText = LUI.UIText.new()
	altText:setLeftRight( 0, 0, 506, 814 )
	altText:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	altText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	altText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	altText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	altText:linkToElementModel( self, "altText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			altText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( altText )
	self.altText = altText
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 507, -191 )
	FocusBarB:setTopBottom( 1, 1, -11, -5 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 506, -188 )
	FocusBarT:setTopBottom( 0, 0, 5, 11 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.resetProperties = function ()
		StartMenuframenoBG0:completeAnimation()
		StartMenuframenoBG1:completeAnimation()
		Slider:completeAnimation()
		altText:completeAnimation()
		FocusBarT:completeAnimation()
		FocusBarB:completeAnimation()
		StartMenuframenoBG0:setAlpha( 1 )
		StartMenuframenoBG1:setAlpha( 1 )
		Slider:setAlpha( 1 )
		altText:setRGB( 1, 1, 1 )
		altText:setAlpha( 1 )
		FocusBarT:setAlpha( 0 )
		FocusBarB:setLeftRight( 0, 1, 507, -191 )
		FocusBarB:setTopBottom( 1, 1, -11, -5 )
		FocusBarB:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.7 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 0.7 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 0.7 )
				self.clipFinished( Slider, {} )
				altText:completeAnimation()
				self.altText:setAlpha( 0.7 )
				self.clipFinished( altText, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				altText:completeAnimation()
				self.altText:setRGB( 1, 0.41, 0 )
				self.clipFinished( altText, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( 0, 1, 506, -188 )
				self.FocusBarB:setTopBottom( 1, 1, -11, -5 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.6 )
				self.clipFinished( StartMenuframenoBG0, {} )
				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 0.6 )
				self.clipFinished( StartMenuframenoBG1, {} )
				Slider:completeAnimation()
				self.Slider:setAlpha( 0.4 )
				self.clipFinished( Slider, {} )
				altText:completeAnimation()
				self.altText:setAlpha( 0.4 )
				self.clipFinished( altText, {} )
			end
		}
	}
	self:mergeStateConditions( {
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
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsInDefaultState( element ) and IsSelfModelValueNil( element, controller, "action" ) and IsSelfPropertyValue( self, "action", nil ) then
			DisableMouseButton( self, controller )
		end
	end )
	Slider.id = "Slider"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Slider:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.StartMenuframenoBG1:close()
		self.Slider:close()
		self.FocusBarB:close()
		self.FocusBarT:close()
		self.Title:close()
		self.altText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

