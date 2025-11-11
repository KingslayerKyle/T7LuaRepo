require( "ui.uieditor.widgets.Lobby.Common.FE_List1ButtonLarge_PH" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHelp" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LobbyStatus" )

local PreLoadFunc = function ( self, controller )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "BonusModesFlyoutOpen" ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "GameSettingsFlyoutOpen" ), false )
end

local PostLoadFunc = function ( self, controller, menu )
	self.ContextualHelp.Text:setText( self.ContextualHelp.Text:getText() )
end

CoD.FE_SelectionList = InheritFrom( LUI.UIElement )
CoD.FE_SelectionList.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_SelectionList )
	self.id = "FE_SelectionList"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 978 )
	self:setTopBottom( 0, 0, 0, 622 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local selectionList = LUI.UIList.new( menu, controller, -8, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( 0, 0, 52, 368 )
	selectionList:setTopBottom( 0, 0, -82, 546 )
	selectionList:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	selectionList:setVerticalCount( 10 )
	selectionList:setSpacing( -8 )
	selectionList:setDataSource( "LobbyButtons" )
	selectionList:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClip( self, "Intro", controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		SetButtonRecentlySelected( self, element, controller )
		return retVal
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local ContextualHelp = CoD.FE_ListHelp.new( menu, controller )
	ContextualHelp:setLeftRight( 0, 0, 0, 978 )
	ContextualHelp:setTopBottom( 0, 0, 459, 507 )
	self:addElement( ContextualHelp )
	self.ContextualHelp = ContextualHelp
	
	local FELobbyStatus = CoD.FE_LobbyStatus.new( menu, controller )
	FELobbyStatus:setLeftRight( 0, 0, 52, 469 )
	FELobbyStatus:setTopBottom( 0, 0, 507, 615 )
	self:addElement( FELobbyStatus )
	self.FELobbyStatus = FELobbyStatus
	
	self.resetProperties = function ()
		selectionList:completeAnimation()
		selectionList:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local selectionListFrame2 = function ( selectionList, event )
					local selectionListFrame3 = function ( selectionList, event )
						if not event.interrupted then
							selectionList:beginAnimation( "keyframe", 290, false, false, CoD.TweenType.Bounce )
						end
						selectionList:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( selectionList, event )
						else
							selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						selectionListFrame3( selectionList, event )
						return 
					else
						selectionList:beginAnimation( "keyframe", 569, false, false, CoD.TweenType.Linear )
						selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame3 )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 0 )
				selectionListFrame2( selectionList, {} )
			end,
			Update = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Bounce )
					end
					selectionList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 0.01 )
				selectionListFrame2( selectionList, {} )
			end
		},
		Prototype = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 0 )
				self.clipFinished( selectionList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Prototype",
			condition = function ( menu, element, event )
				return IsFreeCursorActive( controller ) and IsIntDvarNonZero( "mp_prototype" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "Prototype" ) then
			MakeNotFocusable( self.selectionList, controller )
		else
			MakeFocusable( self.selectionList )
		end
	end )
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.selectionList:close()
		self.ContextualHelp:close()
		self.FELobbyStatus:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

