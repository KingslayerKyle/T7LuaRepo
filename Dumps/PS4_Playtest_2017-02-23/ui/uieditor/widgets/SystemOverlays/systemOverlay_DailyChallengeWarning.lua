require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )

CoD.systemOverlay_DailyChallengeWarning = InheritFrom( LUI.UIElement )
CoD.systemOverlay_DailyChallengeWarning.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_DailyChallengeWarning )
	self.id = "systemOverlay_DailyChallengeWarning"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 480 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 657, 1920 )
	bg:setTopBottom( 0, 0, 0, 480 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local RewardGradient = LUI.UIImage.new()
	RewardGradient:setLeftRight( 0, 0, 0, 657 )
	RewardGradient:setTopBottom( 0, 0, 0, 480 )
	self:addElement( RewardGradient )
	self.RewardGradient = RewardGradient
	
	local DailyChallenge = LUI.UIText.new()
	DailyChallenge:setLeftRight( 0.5, 0.5, -300, 743 )
	DailyChallenge:setTopBottom( 0, 0, 19, 79 )
	DailyChallenge:setTTF( "fonts/escom.ttf" )
	DailyChallenge:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DailyChallenge:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	DailyChallenge:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			DailyChallenge:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( DailyChallenge )
	self.DailyChallenge = DailyChallenge
	
	local ChallengeDescription = LUI.UIText.new()
	ChallengeDescription:setLeftRight( 0.5, 0.5, -297, 743 )
	ChallengeDescription:setTopBottom( 0, 0, 188, 224 )
	ChallengeDescription:setTTF( "fonts/default.ttf" )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ChallengeDescription:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChallengeDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	local ChallengeButtonlist = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	ChallengeButtonlist:makeFocusable()
	ChallengeButtonlist:setLeftRight( 0, 0, 511, 1633 )
	ChallengeButtonlist:setTopBottom( 0, 0, 350, 448 )
	ChallengeButtonlist:setWidgetType( CoD.CACGenericButton )
	ChallengeButtonlist:setVerticalCount( 2 )
	ChallengeButtonlist:linkToElementModel( self, "listDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ChallengeButtonlist:setDataSource( modelValue )
		end
	end )
	ChallengeButtonlist:linkToElementModel( ChallengeButtonlist, "disabled", true, function ( model )
		local element = ChallengeButtonlist
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ChallengeButtonlist:registerEventHandler( "menu_opened", function ( element, event )
		local retVal = nil
		ClearSavedState( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	ChallengeButtonlist:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChallengeButtonlist:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ChallengeButtonlist, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "N", function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsDisabled( element, controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( ChallengeButtonlist )
	self.ChallengeButtonlist = ChallengeButtonlist
	
	ChallengeButtonlist.id = "ChallengeButtonlist"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ChallengeButtonlist:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChallengeButtonlist:close()
		self.DailyChallenge:close()
		self.ChallengeDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

