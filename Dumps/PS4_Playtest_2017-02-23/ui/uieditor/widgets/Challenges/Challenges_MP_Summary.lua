require( "ui.uieditor.menus.Challenges.Challenges_NearCompletion" )
require( "ui.uieditor.widgets.Challenges.Challenges_MP_Summary_ProgressWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_Summary_NearCompletionButton" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )

CoD.Challenges_MP_Summary = InheritFrom( LUI.UIElement )
CoD.Challenges_MP_Summary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_MP_Summary )
	self.id = "Challenges_MP_Summary"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 1740 )
	self:setTopBottom( 0, 0, 0, 780 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( 0, 0, 1041, 1685 )
	Image0000:setTopBottom( 0, 0, 575, 723 )
	Image0000:setAlpha( 0.05 )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( 0, 0, 1041, 1685 )
	Image000:setTopBottom( 0, 0, 413, 561 )
	Image000:setAlpha( 0.05 )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, 1041, 1685 )
	Image00:setTopBottom( 0, 0, 250, 398 )
	Image00:setAlpha( 0.05 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 1041, 1685 )
	Image0:setTopBottom( 0, 0, 85, 233 )
	Image0:setAlpha( 0.05 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ProgressWidget = CoD.Challenges_MP_Summary_ProgressWidget.new( menu, controller )
	ProgressWidget:setLeftRight( 1, 1, -700, -52 )
	ProgressWidget:setTopBottom( 0.5, 0.5, -308, 340 )
	self:addElement( ProgressWidget )
	self.ProgressWidget = ProgressWidget
	
	local NearCompletionButton = CoD.Challenges_Summary_NearCompletionButton.new( menu, controller )
	NearCompletionButton:mergeStateConditions( {
		{
			stateName = "AllChallengesComplete",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "ChallengesMPCategoryStats.mp", 1 )
			end
		}
	} )
	NearCompletionButton:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ChallengesMPCategoryStats.mp" ), function ( model )
		menu:updateElementState( NearCompletionButton, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ChallengesMPCategoryStats.mp"
		} )
	end )
	NearCompletionButton:setLeftRight( 0, 0, 17, 903 )
	NearCompletionButton:setTopBottom( 0, 0, 81.5, 474.5 )
	NearCompletionButton.NearCompletionGrid:setDataSource( "ChallengesNearCompletionList" )
	NearCompletionButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	NearCompletionButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( NearCompletionButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "AllChallengesComplete" ) then
			OpenPopup( self, "Challenges_NearCompletion", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "AllChallengesComplete" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
			return true
		else
			return false
		end
	end, false )
	self:addElement( NearCompletionButton )
	self.NearCompletionButton = NearCompletionButton
	
	local ChallengesTitle0 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle0:setLeftRight( 0, 0, 1043, 1337 )
	ChallengesTitle0:setTopBottom( 0, 0, 30, 78 )
	ChallengesTitle0.weaponNameLabel:setText( Engine.Localize( "MPUI_PROGRESS_CAPS" ) )
	self:addElement( ChallengesTitle0 )
	self.ChallengesTitle0 = ChallengesTitle0
	
	NearCompletionButton.id = "NearCompletionButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.NearCompletionButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ProgressWidget:close()
		self.NearCompletionButton:close()
		self.ChallengesTitle0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

