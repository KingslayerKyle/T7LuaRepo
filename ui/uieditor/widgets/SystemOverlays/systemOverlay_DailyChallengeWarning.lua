-- e73aa407b7345265980326c8864235cd
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 320 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 438, 1280 )
	bg:setTopBottom( true, false, 0, 320 )
	bg:setRGB( 0, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local RewardGradient = LUI.UIImage.new()
	RewardGradient:setLeftRight( true, false, 0, 438 )
	RewardGradient:setTopBottom( true, false, 0, 320 )
	RewardGradient:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_gradient" ) )
	RewardGradient:setShaderVector( 0, 0.15, 0.16, 0.18, 1 )
	RewardGradient:setShaderVector( 1, 0, 0, 0, 1 )
	RewardGradient:setShaderVector( 2, 0.8, 0, 0, 0 )
	self:addElement( RewardGradient )
	self.RewardGradient = RewardGradient
	
	local DailyChallenge = LUI.UIText.new()
	DailyChallenge:setLeftRight( false, false, -200, 495.37 )
	DailyChallenge:setTopBottom( true, false, 12.66, 52.66 )
	DailyChallenge:setTTF( "fonts/escom.ttf" )
	DailyChallenge:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DailyChallenge:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	DailyChallenge:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			DailyChallenge:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( DailyChallenge )
	self.DailyChallenge = DailyChallenge
	
	local ChallengeDescription = LUI.UIText.new()
	ChallengeDescription:setLeftRight( false, false, -198, 495.37 )
	ChallengeDescription:setTopBottom( true, false, 125.24, 149.24 )
	ChallengeDescription:setTTF( "fonts/default.ttf" )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	ChallengeDescription:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			ChallengeDescription:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	local ChallengeButtonlist = LUI.UIList.new( menu, controller, 2, 0, nil, true, false, 0, 0, false, false )
	ChallengeButtonlist:makeFocusable()
	ChallengeButtonlist:setLeftRight( true, false, 440, 990 )
	ChallengeButtonlist:setTopBottom( true, false, 232.97, 298.97 )
	ChallengeButtonlist:setWidgetType( CoD.CACGenericButton )
	ChallengeButtonlist:setVerticalCount( 2 )
	ChallengeButtonlist:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			ChallengeButtonlist:setDataSource( listDatasource )
		end
	end )
	ChallengeButtonlist:linkToElementModel( ChallengeButtonlist, "disabled", true, function ( model )
		local f5_local0 = ChallengeButtonlist
		local f5_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f5_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ChallengeButtonlist:registerEventHandler( "menu_opened", function ( element, event )
		local f6_local0 = nil
		ClearSavedState( self, controller )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	ChallengeButtonlist:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	ChallengeButtonlist:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	menu:AddButtonCallbackFunction( ChallengeButtonlist, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "N", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		if not IsDisabled( f9_arg0, f9_arg2 ) then
			ProcessListAction( self, f9_arg0, f9_arg2 )
			return true
		else
			
		end
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		if not IsDisabled( f10_arg0, f10_arg2 ) then
			CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
				self:setupElementClipCounter( 3 )
				DailyChallenge:completeAnimation()
				self.DailyChallenge:setAlpha( 1 )
				self.clipFinished( DailyChallenge, {} )
				ChallengeDescription:completeAnimation()
				self.ChallengeDescription:setAlpha( 1 )
				self.clipFinished( ChallengeDescription, {} )
				ChallengeButtonlist:completeAnimation()
				self.ChallengeButtonlist:setAlpha( 1 )
				self.clipFinished( ChallengeButtonlist, {} )
			end
		}
	}
	ChallengeButtonlist.id = "ChallengeButtonlist"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.ChallengeButtonlist:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChallengeButtonlist:close()
		element.DailyChallenge:close()
		element.ChallengeDescription:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

