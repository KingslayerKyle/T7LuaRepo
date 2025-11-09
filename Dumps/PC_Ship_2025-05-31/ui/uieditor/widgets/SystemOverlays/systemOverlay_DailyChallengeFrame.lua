require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_DailyChallenge" )
require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )

CoD.systemOverlay_DailyChallengeFrame = InheritFrom( LUI.UIElement )
CoD.systemOverlay_DailyChallengeFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_DailyChallengeFrame )
	self.id = "systemOverlay_DailyChallengeFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local systemOverlayDailyChallenge = CoD.systemOverlay_DailyChallenge.new( menu, controller )
	systemOverlayDailyChallenge:setLeftRight( false, false, -640, 640 )
	systemOverlayDailyChallenge:setTopBottom( true, false, 0, 320 )
	systemOverlayDailyChallenge:linkToElementModel( self, nil, false, function ( model )
		systemOverlayDailyChallenge:setModel( model, controller )
	end )
	self:addElement( systemOverlayDailyChallenge )
	self.systemOverlayDailyChallenge = systemOverlayDailyChallenge
	
	local ChallengeButtonlist = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	ChallengeButtonlist:makeFocusable()
	ChallengeButtonlist:setLeftRight( true, false, 440, 990 )
	ChallengeButtonlist:setTopBottom( true, false, 234.11, 300.11 )
	ChallengeButtonlist:setWidgetType( CoD.CACGenericButton )
	ChallengeButtonlist:setVerticalCount( 2 )
	ChallengeButtonlist:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			ChallengeButtonlist:setDataSource( listDatasource )
		end
	end )
	ChallengeButtonlist:linkToElementModel( ChallengeButtonlist, "disabled", true, function ( model )
		local f4_local0 = ChallengeButtonlist
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ChallengeButtonlist:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	ChallengeButtonlist:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	menu:AddButtonCallbackFunction( ChallengeButtonlist, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "N", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ChallengeButtonlist )
	self.ChallengeButtonlist = ChallengeButtonlist
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				systemOverlayDailyChallenge:completeAnimation()
				self.systemOverlayDailyChallenge:setAlpha( 1 )
				self.clipFinished( systemOverlayDailyChallenge, {} )
			end
		}
	}
	ChallengeButtonlist.id = "ChallengeButtonlist"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ChallengeButtonlist:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.systemOverlayDailyChallenge:close()
		element.ChallengeButtonlist:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

