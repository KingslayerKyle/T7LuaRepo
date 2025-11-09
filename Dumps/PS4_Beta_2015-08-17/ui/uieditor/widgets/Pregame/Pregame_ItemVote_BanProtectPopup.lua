require( "ui.uieditor.widgets.CharacterCustomization.list1ButtonNewStyle" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_BanProtectPopup_Alert" )

local PostLoadFunc = function ( self, controller, menu )
	local voteCountModel = Engine.GetModelForController( controller, "Pregame.remainingVotes" )
	local previousVoteCount = Engine.GetModelValue( voteCountModel )
	self:subscribeToModel( voteCountModel, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue and modelValue < previousVoteCount then
			GoBack( menu, controller )
		end
	end, false )
end

CoD.Pregame_ItemVote_BanProtectPopup = InheritFrom( LUI.UIElement )
CoD.Pregame_ItemVote_BanProtectPopup.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.Pregame_ItemVote_BanProtectPopup )
	self.id = "Pregame_ItemVote_BanProtectPopup"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 244 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 411.89, 1280 )
	Title:setTopBottom( true, false, 20.5, 54.5 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 411.89, 1280 )
	Description:setTopBottom( true, false, 60.5, 80.5 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Description:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, true )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 411.89, 691.89 )
	ButtonList:setTopBottom( false, true, -86.5, -20.5 )
	ButtonList:setWidgetType( CoD.list1ButtonNewStyle )
	ButtonList:setVerticalCount( 2 )
	ButtonList:linkToElementModel( self, "listDatasource", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ButtonList:setDataSource( modelValue )
		end
	end )
	ButtonList:linkToElementModel( ButtonList, "disabled", true, function ( model )
		local element = ButtonList
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if not IsDisabled( element, controller ) then
			ProcessListAction( self, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		if not IsDisabled( element, controller ) then
			return true
		else
			return false
		end
	end, false )
	self:addElement( ButtonList )
	self.ButtonList = ButtonList
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 61, 305 )
	Image:setTopBottom( true, false, 0, 244 )
	Image:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local PregameItemVoteBanProtectPopupAlert = CoD.Pregame_ItemVote_BanProtectPopup_Alert.new( menu, controller )
	PregameItemVoteBanProtectPopupAlert:setLeftRight( true, false, 381.89, 1250 )
	PregameItemVoteBanProtectPopupAlert:setTopBottom( true, false, 90, 122 )
	PregameItemVoteBanProtectPopupAlert.Text:setText( Engine.Localize( "Item Banned By: FEXTWOLF" ) )
	PregameItemVoteBanProtectPopupAlert:linkToElementModel( self, nil, false, function ( model )
		PregameItemVoteBanProtectPopupAlert:setModel( model, controller )
	end )
	self:addElement( PregameItemVoteBanProtectPopupAlert )
	self.PregameItemVoteBanProtectPopupAlert = PregameItemVoteBanProtectPopupAlert
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PregameItemVoteBanProtectPopupAlert:completeAnimation()
				PregameItemVoteBanProtectPopupAlert.BannedIcon:completeAnimation()
				PregameItemVoteBanProtectPopupAlert.ProtectedIcon:completeAnimation()
				self.PregameItemVoteBanProtectPopupAlert:setAlpha( 0 )
				self.PregameItemVoteBanProtectPopupAlert.BannedIcon:setAlpha( 0 )
				self.PregameItemVoteBanProtectPopupAlert.ProtectedIcon:setAlpha( 0 )
				self.clipFinished( PregameItemVoteBanProtectPopupAlert, {} )
			end
		},
		Banned = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PregameItemVoteBanProtectPopupAlert:completeAnimation()
				PregameItemVoteBanProtectPopupAlert.Text:completeAnimation()
				PregameItemVoteBanProtectPopupAlert.BannedIcon:completeAnimation()
				PregameItemVoteBanProtectPopupAlert.ProtectedIcon:completeAnimation()
				self.PregameItemVoteBanProtectPopupAlert:setAlpha( 1 )
				self.PregameItemVoteBanProtectPopupAlert.Text:setText( Engine.Localize( "MENU_BANNED_BY" ) )
				self.PregameItemVoteBanProtectPopupAlert.BannedIcon:setAlpha( 1 )
				self.PregameItemVoteBanProtectPopupAlert.ProtectedIcon:setAlpha( 0 )
				self.clipFinished( PregameItemVoteBanProtectPopupAlert, {} )
			end
		},
		Protected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PregameItemVoteBanProtectPopupAlert:completeAnimation()
				PregameItemVoteBanProtectPopupAlert.Text:completeAnimation()
				PregameItemVoteBanProtectPopupAlert.BannedIcon:completeAnimation()
				PregameItemVoteBanProtectPopupAlert.ProtectedIcon:completeAnimation()
				self.PregameItemVoteBanProtectPopupAlert:setAlpha( 1 )
				self.PregameItemVoteBanProtectPopupAlert.Text:setText( Engine.Localize( "MENU_PROTECTED_BY" ) )
				self.PregameItemVoteBanProtectPopupAlert.BannedIcon:setAlpha( 0 )
				self.PregameItemVoteBanProtectPopupAlert.ProtectedIcon:setAlpha( 1 )
				self.clipFinished( PregameItemVoteBanProtectPopupAlert, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Banned",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "state", Enum.VoteType.VOTE_TYPE_BAN )
			end
		},
		{
			stateName = "Protected",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "state", Enum.VoteType.VOTE_TYPE_PROTECT )
			end
		}
	} )
	self:linkToElementModel( self, "state", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "state"
		} )
	end )
	self:subscribeToGlobalModel( controller, "LobbyRoot", "Pregame.Update", function ( model )
		local element = self
		UpdateSelfElementState( menu, element, controller )
	end )
	ButtonList.id = "ButtonList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ButtonList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ButtonList:close()
		self.PregameItemVoteBanProtectPopupAlert:close()
		self.Title:close()
		self.Description:close()
		self.Image:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

