-- 1e9d68cdf102a560ddadabf6e068b589
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Theater.Theater_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.EndGameFlow.KillcamWidgetFctnLine" )
require( "ui.uieditor.widgets.Demo.DemoControlsButton" )

CoD.DemoPlaybackControls = InheritFrom( LUI.UIElement )
CoD.DemoPlaybackControls.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DemoPlaybackControls )
	self.id = "DemoPlaybackControls"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 494 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local TheaterFrameWidget0 = CoD.Theater_FrameWidget.new( menu, controller )
	TheaterFrameWidget0:setLeftRight( true, false, -21.5, 516.5 )
	TheaterFrameWidget0:setTopBottom( true, false, -7, 101.63 )
	self:addElement( TheaterFrameWidget0 )
	self.TheaterFrameWidget0 = TheaterFrameWidget0
	
	local LeftPanel = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	LeftPanel:setLeftRight( true, true, 2, -2 )
	LeftPanel:setTopBottom( true, true, 0, 0 )
	LeftPanel:setRGB( 0.5, 0.5, 0.5 )
	LeftPanel:setAlpha( 0 )
	self:addElement( LeftPanel )
	self.LeftPanel = LeftPanel
	
	local LeftPanelLnT0 = CoD.KillcamWidgetFctnLine.new( menu, controller )
	LeftPanelLnT0:setLeftRight( true, true, 113, -110 )
	LeftPanelLnT0:setTopBottom( true, false, -7, 0 )
	LeftPanelLnT0:setRGB( 0, 0, 0 )
	LeftPanelLnT0:setAlpha( 0.2 )
	self:addElement( LeftPanelLnT0 )
	self.LeftPanelLnT0 = LeftPanelLnT0
	
	local LeftPanelLnT00 = CoD.KillcamWidgetFctnLine.new( menu, controller )
	LeftPanelLnT00:setLeftRight( true, true, 22, -23 )
	LeftPanelLnT00:setTopBottom( false, true, -2, 6 )
	LeftPanelLnT00:setRGB( 0, 0, 0 )
	LeftPanelLnT00:setAlpha( 0.2 )
	LeftPanelLnT00:setXRot( 180 )
	self:addElement( LeftPanelLnT00 )
	self.LeftPanelLnT00 = LeftPanelLnT00
	
	local DemoControls0 = LUI.UIElement.new()
	DemoControls0:setLeftRight( true, false, 0, 494 )
	DemoControls0:setTopBottom( true, false, -144, -36 )
	DemoControls0:setAlpha( 0 )
	DemoControls0:setupDemoControls()
	self:addElement( DemoControls0 )
	self.DemoControls0 = DemoControls0
	
	local Timeline = LUI.UIElement.new()
	Timeline:setLeftRight( true, false, 52, 443 )
	Timeline:setTopBottom( true, false, 29.5, 43 )
	Timeline:setupDemoTimeline()
	self:addElement( Timeline )
	self.Timeline = Timeline
	
	local ButtonList = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( false, false, -220, 220 )
	ButtonList:setTopBottom( true, false, 48, 93 )
	ButtonList:setWidgetType( CoD.DemoControlsButton )
	ButtonList:setHorizontalCount( 11 )
	ButtonList:setSpacing( 0 )
	ButtonList:setDataSource( "DemoControlsButtons" )
	ButtonList:linkToElementModel( ButtonList, "disabled", true, function ( model )
		local f2_local0 = ButtonList
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "demo.drawDemoControls" ), function ( model )
		local f3_local0 = ButtonList
		local f3_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "demo.drawDemoControls"
		}
		CoD.Menu.UpdateButtonShownState( f3_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f4_local0 = nil
		if element.gainFocus then
			f4_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f4_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f4_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f5_local0 = nil
		if element.loseFocus then
			f5_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f5_local0 = element.super:loseFocus( event )
		end
		return f5_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		if not IsDisabled( f6_arg0, f6_arg2 ) and IsGlobalModelValueTrue( f6_arg0, f6_arg2, "demo.drawDemoControls" ) then
			ProcessListAction( self, f6_arg0, f6_arg2 )
			return true
		else
			
		end
	end, function ( f7_arg0, f7_arg1, f7_arg2 )
		if not IsDisabled( f7_arg0, f7_arg2 ) and IsGlobalModelValueTrue( f7_arg0, f7_arg2, "demo.drawDemoControls" ) then
			CoD.Menu.SetButtonLabel( f7_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local HintText = LUI.UIText.new()
	HintText:setLeftRight( false, false, -220, 220 )
	HintText:setTopBottom( true, false, 0, 22 )
	HintText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	HintText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	HintText:setShaderVector( 0, 0, 0, 0, 0 )
	HintText:setShaderVector( 1, 0, 0, 0, 0 )
	HintText:setShaderVector( 2, 1, 0, 0, 0 )
	HintText:setLetterSpacing( 1 )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	HintText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( HintText )
	self.HintText = HintText
	
	HintText:linkToElementModel( ButtonList, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			HintText:setText( Engine.Localize( hintText ) )
		end
	end )
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TheaterFrameWidget0:close()
		element.LeftPanel:close()
		element.LeftPanelLnT0:close()
		element.LeftPanelLnT00:close()
		element.ButtonList:close()
		element.HintText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
