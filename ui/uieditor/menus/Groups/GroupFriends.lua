-- 830657f65fb7977287d78002545b6c70
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )
require( "ui.uieditor.menus.Social.Social_PlayerDetailsPopup" )
require( "ui.uieditor.widgets.Groups.GroupsFriendsRosterRow" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 355
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "groupFriendsFiltered" )
end

LUI.createMenu.GroupFriends = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GroupFriends" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GroupFriends.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -356, 11 )
	Blackfade:setTopBottom( true, true, 0, 0 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local leftBackground = LUI.UIImage.new()
	leftBackground:setLeftRight( false, true, -430, 0 )
	leftBackground:setTopBottom( true, true, 0, 0 )
	leftBackground:setRGB( 0.04, 0.04, 0.04 )
	leftBackground:setAlpha( 0.98 )
	self:addElement( leftBackground )
	self.leftBackground = leftBackground
	
	local tileTexture = LUI.UIImage.new()
	tileTexture:setLeftRight( false, true, -430, 3 )
	tileTexture:setTopBottom( true, true, 0, 0 )
	tileTexture:setAlpha( 0.5 )
	tileTexture:setImage( RegisterImage( "uie_t7_tile_texture" ) )
	tileTexture:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll" ) )
	tileTexture:setShaderVector( 0, 30, 55, 0, 0 )
	tileTexture:setShaderVector( 1, 0, 0, 0, 0 )
	self:addElement( tileTexture )
	self.tileTexture = tileTexture
	
	local title = LUI.UIText.new()
	title:setLeftRight( false, true, -402.5, -180 )
	title:setTopBottom( true, false, 80, 116 )
	title:setRGB( 1, 0.47, 0 )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	title:subscribeToGlobalModel( controller, "SelectedGroup", "name", function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			title:setText( Engine.Localize( name ) )
		end
	end )
	self:addElement( title )
	self.title = title
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( f2_local1, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -551, -119 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	local Border0 = LUI.UIImage.new()
	Border0:setLeftRight( false, true, -431, -430 )
	Border0:setTopBottom( true, true, 0, 0 )
	Border0:setAlpha( 0.42 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	local Border00 = LUI.UIImage.new()
	Border00:setLeftRight( false, true, -431, -430 )
	Border00:setTopBottom( true, true, 0, 0 )
	Border00:setAlpha( 0.42 )
	self:addElement( Border00 )
	self.Border00 = Border00
	
	local FriendsList = LUI.UIList.new( f2_local1, controller, 2, 0, nil, false, false, 0, 0, false, false )
	FriendsList:makeFocusable()
	FriendsList:setLeftRight( true, false, 877.5, 1212.5 )
	FriendsList:setTopBottom( true, false, 132.5, 564.5 )
	FriendsList:setWidgetType( CoD.GroupsFriendsRosterRow )
	FriendsList:setVerticalCount( 7 )
	FriendsList:setVerticalCounter( CoD.verticalCounter )
	FriendsList:setDataSource( "SocialPlayersList" )
	FriendsList:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.filterGroupFriendsInProgress" ), function ( model )
		local f4_local0 = FriendsList
		local f4_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.filterGroupFriendsInProgress"
		}
		CoD.Menu.UpdateButtonShownState( f4_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	FriendsList:registerEventHandler( "gain_focus", function ( element, event )
		local f5_local0 = nil
		if element.gainFocus then
			f5_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f5_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f5_local0
	end )
	FriendsList:registerEventHandler( "lose_focus", function ( element, event )
		local f6_local0 = nil
		if element.loseFocus then
			f6_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f6_local0 = element.super:loseFocus( event )
		end
		return f6_local0
	end )
	f2_local1:AddButtonCallbackFunction( FriendsList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		if ListHasElements( f7_arg0 ) and not FilteringGroupFriends( f7_arg2 ) then
			SetSelectedFriendXUID( self, f7_arg0, f7_arg2 )
			OpenOverlay( self, "Social_PlayerDetailsPopup", f7_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		if ListHasElements( f8_arg0 ) and not FilteringGroupFriends( f8_arg2 ) then
			CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
			return true
		else
			return false
		end
	end, false )
	self:addElement( FriendsList )
	self.FriendsList = FriendsList
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( true, false, 981, 1109 )
	Spinner:setTopBottom( true, false, 284.5, 412.5 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local title0 = LUI.UIText.new()
	title0:setLeftRight( false, true, -402.5, -180 )
	title0:setTopBottom( true, false, 54, 80 )
	title0:setText( Engine.Localize( "GROUPS_VIEWING_FRIENDS_IN" ) )
	title0:setTTF( "fonts/escom.ttf" )
	title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title0 )
	self.title0 = title0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Spinner:completeAnimation()
				self.Spinner:setLeftRight( true, false, 981, 1109 )
				self.Spinner:setTopBottom( true, false, 284.5, 412.5 )
				self.Spinner:setAlpha( 1 )
				self.clipFinished( Spinner, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return FilteringGroupFriends( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.filterGroupFriendsInProgress" ), function ( model )
		f2_local1:updateElementState( self, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.filterGroupFriendsInProgress"
		} )
	end )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f13_local0 = nil
		CallCustomElementFunction_Self( self, "handleKeyboardComplete", element, controller, event )
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		GoBack( self, f14_arg2 )
		ClearSavedState( self, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	FriendsList.id = "FriendsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.FriendsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.fefooterRighSlideIn:close()
		element.FriendsList:close()
		element.title:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GroupFriends.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

