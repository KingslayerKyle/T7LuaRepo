-- e11da8a3d6c6f7068e68df62c2282891
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_Slider_Control_Item_Small" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller, menu )
	self:linkToElementModel( self, "currentSelection", true, function ( model )
		local f2_local0, f2_local1 = self.Slider:getRowAndColumnForIndex( Engine.GetModelValue( model ) - 1 )
		self.Slider:setActiveIndex( f2_local0, f2_local1, 0 )
	end )
end

CoD.StartMenu_Options_Slider_Small = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Slider_Small.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Slider_Small )
	self.id = "StartMenu_Options_Slider_Small"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 388 )
	self:setTopBottom( true, false, 0, 55 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, -182.47 )
	StartMenuframenoBG0:setTopBottom( true, true, 3, -3 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local StartMenuframenoBG1 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG1:setLeftRight( true, true, 208.53, -1.47 )
	StartMenuframenoBG1:setTopBottom( true, true, 3, -3 )
	self:addElement( StartMenuframenoBG1 )
	self.StartMenuframenoBG1 = StartMenuframenoBG1
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 20, 188 )
	Title:setTopBottom( false, false, -11, 11 )
	Title:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			Title:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Slider = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	Slider:makeFocusable()
	Slider:setLeftRight( true, false, 227.27, 367.27 )
	Slider:setTopBottom( false, false, -15, 15 )
	Slider:setWidgetType( CoD.StartMenu_Options_Slider_Control_Item_Small )
	Slider:linkToElementModel( self, "optionsDatasource", true, function ( model )
		local optionsDatasource = Engine.GetModelValue( model )
		if optionsDatasource then
			Slider:setDataSource( optionsDatasource )
		end
	end )
	Slider:linkToElementModel( Slider, "alias", true, function ( model )
		local f6_local0 = Slider
		local f6_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "alias"
		}
		CoD.Menu.UpdateButtonShownState( f6_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	Slider:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f7_local0 = nil
		ProcessListAction( self, element, controller )
		return f7_local0
	end )
	Slider:registerEventHandler( "list_item_lose_focus", function ( element, event )
		local f8_local0 = nil
		if IsSelfModelValueNonEmptyString( element, controller, "alias" ) then
			StopMPMusicPreview( controller, element )
		end
		return f8_local0
	end )
	Slider:registerEventHandler( "gain_focus", function ( element, event )
		local f9_local0 = nil
		if element.gainFocus then
			f9_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f9_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
		return f9_local0
	end )
	Slider:registerEventHandler( "lose_focus", function ( element, event )
		local f10_local0 = nil
		if element.loseFocus then
			f10_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f10_local0 = element.super:loseFocus( event )
		end
		return f10_local0
	end )
	menu:AddButtonCallbackFunction( Slider, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "P", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		if IsSelfModelValueNonEmptyString( f11_arg0, f11_arg2, "alias" ) then
			StopMPMusicPreview( f11_arg2, f11_arg0 )
			PlayMPMusicPreview( f11_arg2, f11_arg0 )
			return true
		else
			
		end
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		if IsSelfModelValueNonEmptyString( f12_arg0, f12_arg2, "alias" ) then
			CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_PLAY_MUSIC_SAMPLE" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( Slider )
	self.Slider = Slider
	
	local altText = LUI.UIText.new()
	altText:setLeftRight( true, false, 214, 380 )
	altText:setTopBottom( false, false, -11, 11 )
	altText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	altText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	altText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	altText:linkToElementModel( self, "altText", true, function ( model )
		local _altText = Engine.GetModelValue( model )
		if _altText then
			altText:setText( Engine.Localize( _altText ) )
		end
	end )
	self:addElement( altText )
	self.altText = altText
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 209.53, -2.47 )
	FocusBarB:setTopBottom( false, true, -7, -3 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 209.53, -2.47 )
	FocusBarT:setTopBottom( true, false, 3, 7 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.7 )
				self.clipFinished( StartMenuframenoBG0, {} )

				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 0.7 )
				self.clipFinished( StartMenuframenoBG1, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )

				Slider:completeAnimation()
				self.Slider:setAlpha( 0.7 )
				self.clipFinished( Slider, {} )

				altText:completeAnimation()
				self.altText:setRGB( 1, 1, 1 )
				self.altText:setAlpha( 0.7 )
				self.clipFinished( altText, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 7 )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )

				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG1, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )

				Slider:completeAnimation()
				self.Slider:setAlpha( 1 )
				self.clipFinished( Slider, {} )

				altText:completeAnimation()
				self.altText:setRGB( 1, 0.41, 0 )
				self.altText:setAlpha( 1 )
				self.clipFinished( altText, {} )

				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )

				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0.6 )
				self.clipFinished( StartMenuframenoBG0, {} )

				StartMenuframenoBG1:completeAnimation()
				self.StartMenuframenoBG1:setAlpha( 0.6 )
				self.clipFinished( StartMenuframenoBG1, {} )

				Title:completeAnimation()
				self.Title:setRGB( 1, 1, 1 )
				self.clipFinished( Title, {} )

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

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsInDefaultState( element ) and IsSelfModelValueNil( element, controller, "action" ) then
			DisableMouseButton( self, controller )
		end
	end )
	Slider.id = "Slider"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.Slider:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.StartMenuframenoBG1:close()
		element.Slider:close()
		element.FocusBarB:close()
		element.FocusBarT:close()
		element.Title:close()
		element.altText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

