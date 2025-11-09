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
	self:setLeftRight( true, false, 0, 652 )
	self:setTopBottom( true, false, 0, 415 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -26, 2 )
	Image3:setTopBottom( true, false, 0, 4 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local selectionList = LUI.UIList.new( menu, controller, -2, 0, nil, false, false, 0, 0, false, false )
	selectionList:makeFocusable()
	selectionList:setLeftRight( true, false, 0, 280 )
	selectionList:setTopBottom( true, false, 4, 306 )
	selectionList:setWidgetType( CoD.FE_List1ButtonLarge_PH )
	selectionList:setVerticalCount( 10 )
	selectionList:setSpacing( -2 )
	selectionList:setDataSource( "LobbyButtons" )
	selectionList:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		PlayClip( self, "Intro", controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	selectionList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f5_local0 = nil
		SetButtonRecentlySelected( self, element, controller )
		return f5_local0
	end )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f6_local0 = nil
		if element.gainFocus then
			f6_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f6_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f6_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f7_local0 = nil
		if element.loseFocus then
			f7_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f7_local0 = element.super:loseFocus( event )
		end
		return f7_local0
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ProcessListAction( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local ContextualHelp = CoD.FE_ListHelp.new( menu, controller )
	ContextualHelp:setLeftRight( true, false, 0, 652 )
	ContextualHelp:setTopBottom( true, false, 306, 338 )
	self:addElement( ContextualHelp )
	self.ContextualHelp = ContextualHelp
	
	local FELobbyStatus = CoD.FE_LobbyStatus.new( menu, controller )
	FELobbyStatus:setLeftRight( true, false, 2, 280 )
	FELobbyStatus:setTopBottom( true, false, 338, 410 )
	self:addElement( FELobbyStatus )
	self.FELobbyStatus = FELobbyStatus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				self.clipFinished( Image3, {} )
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 1 )
				self.clipFinished( selectionList, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						if not event.interrupted then
							Image3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						Image3:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image3, event )
						else
							Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				Image3Frame2( Image3, {} )
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
		DefaultStateArabic = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				self.clipFinished( Image3, {} )
				selectionList:completeAnimation()
				self.selectionList:setAlpha( 1 )
				self.clipFinished( selectionList, {} )
				ContextualHelp:completeAnimation()
				self.ContextualHelp:setLeftRight( true, false, 0, 280 )
				self.ContextualHelp:setTopBottom( true, false, 306, 338 )
				self.clipFinished( ContextualHelp, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 2 )
				local Image3Frame2 = function ( Image3, event )
					local Image3Frame3 = function ( Image3, event )
						if not event.interrupted then
							Image3:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Bounce )
						end
						Image3:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Image3, event )
						else
							Image3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image3Frame3( Image3, event )
						return 
					else
						Image3:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						Image3:registerEventHandler( "transition_complete_keyframe", Image3Frame3 )
					end
				end
				
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				Image3Frame2( Image3, {} )
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
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "DefaultStateArabic",
			condition = function ( menu, element, event )
				return IsCurrentLanguageArabic()
			end
		}
	} )
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.selectionList:close()
		element.ContextualHelp:close()
		element.FELobbyStatus:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

