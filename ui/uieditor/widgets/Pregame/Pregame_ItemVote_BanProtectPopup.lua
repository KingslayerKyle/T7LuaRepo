-- 8acbadc2ec2e17eed2a3f5eb47cfafca
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.Customization.CACGenericButton" )
require( "ui.uieditor.widgets.Pregame.Pregame_ItemVote_BanProtectPopup_Alert" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Engine.GetModelForController( controller, "Pregame.remainingVotes" )
	local f1_local1 = Engine.GetModelValue( f1_local0 )
	self:subscribeToModel( f1_local0, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue and modelValue < f1_local1 then
			GoBack( menu, controller )
		end
	end, false )
	local f1_local2 = self.ButtonList.navigateItemUp
	self.ButtonList.navigateItemUp = function ( f3_arg0 )
		f1_local2( f3_arg0 )
		f1_local2( f3_arg0 )
	end
	
	local f1_local3 = self.ButtonList.navigateItemDown
	self.ButtonList.navigateItemDown = function ( f4_arg0 )
		f1_local3( f4_arg0 )
		f1_local3( f4_arg0 )
	end
	
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
	Title:setLeftRight( true, false, 411.89, 1200 )
	Title:setTopBottom( true, false, 20.5, 54.5 )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 411.89, 1200 )
	Description:setTopBottom( true, false, 60.5, 80.5 )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Description:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			Description:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( Description )
	self.Description = Description
	
	local ButtonList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	ButtonList:makeFocusable()
	ButtonList:setLeftRight( true, false, 411.89, 1159.89 )
	ButtonList:setTopBottom( false, true, -110.5, -10.5 )
	ButtonList:setWidgetType( CoD.CACGenericButton )
	ButtonList:setVerticalCount( 3 )
	ButtonList:linkToElementModel( self, "listDatasource", true, function ( model )
		local listDatasource = Engine.GetModelValue( model )
		if listDatasource then
			ButtonList:setDataSource( listDatasource )
		end
	end )
	ButtonList:linkToElementModel( ButtonList, "disabled", true, function ( model )
		local f9_local0 = ButtonList
		local f9_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		}
		CoD.Menu.UpdateButtonShownState( f9_local0, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ButtonList:registerEventHandler( "gain_focus", function ( element, event )
		local f10_local0 = nil
		if element.gainFocus then
			f10_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f10_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f10_local0
	end )
	ButtonList:registerEventHandler( "lose_focus", function ( element, event )
		local f11_local0 = nil
		if element.loseFocus then
			f11_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f11_local0 = element.super:loseFocus( event )
		end
		return f11_local0
	end )
	menu:AddButtonCallbackFunction( ButtonList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		if not IsDisabled( f12_arg0, f12_arg2 ) then
			ProcessListAction( self, f12_arg0, f12_arg2 )
			return true
		else
			
		end
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		if not IsDisabled( f13_arg0, f13_arg2 ) then
			CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
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
		local image = Engine.GetModelValue( model )
		if image then
			Image:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( Image )
	self.Image = Image
	
	local PregameItemVoteBanProtectPopupAlert = CoD.Pregame_ItemVote_BanProtectPopup_Alert.new( menu, controller )
	PregameItemVoteBanProtectPopupAlert:setLeftRight( true, false, 381.89, 1200 )
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
		UpdateSelfElementState( menu, self, controller )
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
		element.ButtonList:close()
		element.PregameItemVoteBanProtectPopupAlert:close()
		element.Title:close()
		element.Description:close()
		element.Image:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

