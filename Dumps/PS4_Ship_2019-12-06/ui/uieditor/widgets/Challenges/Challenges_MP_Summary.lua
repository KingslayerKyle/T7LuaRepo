require( "ui.uieditor.widgets.Challenges.Challenges_MP_Summary_ProgressWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_Summary_NearCompletionButton" )
require( "ui.uieditor.menus.Challenges.Challenges_NearCompletion" )
require( "ui.uieditor.widgets.Challenges.Challenges_Title" )
require( "ui.uieditor.widgets.Challenges.Challenges_OneHundredPercentWidget" )

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
	self:setLeftRight( true, false, 0, 1160 )
	self:setTopBottom( true, false, 0, 520 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Image0000 = LUI.UIImage.new()
	Image0000:setLeftRight( true, false, 694, 1123.61 )
	Image0000:setTopBottom( true, false, 383.25, 482.25 )
	Image0000:setAlpha( 0.05 )
	self:addElement( Image0000 )
	self.Image0000 = Image0000
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( true, false, 694, 1123.61 )
	Image000:setTopBottom( true, false, 275.25, 374.25 )
	Image000:setAlpha( 0.05 )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( true, false, 694, 1123.61 )
	Image00:setTopBottom( true, false, 166.25, 265.25 )
	Image00:setAlpha( 0.05 )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 694, 1123.61 )
	Image0:setTopBottom( true, false, 56.25, 155.25 )
	Image0:setAlpha( 0.05 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local ProgressWidget = CoD.Challenges_MP_Summary_ProgressWidget.new( menu, controller )
	ProgressWidget:setLeftRight( false, true, -467, -35 )
	ProgressWidget:setTopBottom( false, false, -205.5, 226.5 )
	self:addElement( ProgressWidget )
	self.ProgressWidget = ProgressWidget
	
	local NearCompletionButton = CoD.Challenges_Summary_NearCompletionButton.new( menu, controller )
	NearCompletionButton:setLeftRight( true, false, 11, 602 )
	NearCompletionButton:setTopBottom( true, false, 54.5, 316.5 )
	NearCompletionButton.NearCompletionGrid:setDataSource( "ChallengesNearCompletionList" )
	NearCompletionButton:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = nil
		if element.gainFocus then
			f2_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f2_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f2_local0
	end )
	NearCompletionButton:registerEventHandler( "lose_focus", function ( element, event )
		local f3_local0 = nil
		if element.loseFocus then
			f3_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f3_local0 = element.super:loseFocus( event )
		end
		return f3_local0
	end )
	menu:AddButtonCallbackFunction( NearCompletionButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsElementInState( element, "AllChallengesComplete" ) then
			OpenPopup( self, "Challenges_NearCompletion", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsElementInState( element, "AllChallengesComplete" ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
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
	self:addElement( NearCompletionButton )
	self.NearCompletionButton = NearCompletionButton
	
	local ChallengesTitle0 = CoD.Challenges_Title.new( menu, controller )
	ChallengesTitle0:setLeftRight( true, false, 695, 891 )
	ChallengesTitle0:setTopBottom( true, false, 20, 52.25 )
	ChallengesTitle0.weaponNameLabel:setText( Engine.Localize( "MPUI_PROGRESS_CAPS" ) )
	self:addElement( ChallengesTitle0 )
	self.ChallengesTitle0 = ChallengesTitle0
	
	local OneHundredPercentWidget = CoD.Challenges_OneHundredPercentWidget.new( menu, controller )
	OneHundredPercentWidget:setLeftRight( true, false, 11, 602 )
	OneHundredPercentWidget:setTopBottom( true, false, 383.25, 481.25 )
	OneHundredPercentWidget.EmblemSubtitle:setText( Engine.Localize( "CHALLENGE_DARK_OPS_COMPLETED_ALL_CHALLENGES_DESC" ) )
	OneHundredPercentWidget.weaponNameLabel:setText( Engine.Localize( "CHALLENGE_DARK_OPS_COMPLETED_ALL_CHALLENGES" ) )
	OneHundredPercentWidget.ChallengesTitle.weaponNameLabel:setText( Engine.Localize( "MENU_CHALLENGES_MASTER" ) )
	OneHundredPercentWidget:subscribeToGlobalModel( controller, "OneHundredPercentCallingCard", nil, function ( model )
		OneHundredPercentWidget:setModel( model, controller )
	end )
	OneHundredPercentWidget:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "mp", function ( model )
		local mp = Engine.GetModelValue( model )
		if mp then
			OneHundredPercentWidget.PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, mp ) )
		end
	end )
	OneHundredPercentWidget:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "mp", function ( model )
		local mp = Engine.GetModelValue( model )
		if mp then
			OneHundredPercentWidget.PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( mp, 1 ), CoD.GetVectorComponentFromString( mp, 2 ), CoD.GetVectorComponentFromString( mp, 3 ), CoD.GetVectorComponentFromString( mp, 4 ) )
		end
	end )
	OneHundredPercentWidget:subscribeToGlobalModel( controller, "ChallengesMPCategoryStats", "mp", function ( model )
		local mp = Engine.GetModelValue( model )
		if mp then
			OneHundredPercentWidget.PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( mp ) )
		end
	end )
	OneHundredPercentWidget:subscribeToGlobalModel( controller, "OneHundredPercentCallingCard", nil, function ( model )
		OneHundredPercentWidget.MasterCallingCardIcon:setModel( model, controller )
	end )
	self:addElement( OneHundredPercentWidget )
	self.OneHundredPercentWidget = OneHundredPercentWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				OneHundredPercentWidget:completeAnimation()
				self.OneHundredPercentWidget:setLeftRight( true, false, 11, 602 )
				self.OneHundredPercentWidget:setTopBottom( true, false, 383.25, 481.25 )
				self.clipFinished( OneHundredPercentWidget, {} )
			end
		}
	}
	NearCompletionButton.id = "NearCompletionButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.NearCompletionButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ProgressWidget:close()
		element.NearCompletionButton:close()
		element.ChallengesTitle0:close()
		element.OneHundredPercentWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

