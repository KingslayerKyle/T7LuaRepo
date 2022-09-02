-- 94d650c6c0a7374ebfe98804d914fc4e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleContainer" )
require( "ui.uieditor.widgets.Lobby.Connectivity.LocalWarning" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SelectionList" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsContainer" )
require( "ui.uieditor.widgets.Competitive.Competitive_SettingsSummary" )
require( "ui.uieditor.widgets.Lobby.LobbyDoubleXPWidgetContainer" )

local PostLoadFunc = function ( self, controller, menu )

	LUI.OverrideFunction_CallOriginalFirst( self.MenuTitleContainer.MenuTitle.TextBox1.Label0, "setText", function ()
		self.MenuTitleContainer:playClip( "Update" )
		self.selectionList:playClip( "Update" )
	end )
end

CoD.LeftContainer = InheritFrom( LUI.UIElement )
CoD.LeftContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LeftContainer )
	self.id = "LeftContainer"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 520 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local MenuTitleContainer = CoD.FE_3dTitleContainer.new( menu, controller )
	MenuTitleContainer:setLeftRight( true, false, -75, 445 )
	MenuTitleContainer:setTopBottom( true, false, 189.35, 335.35 )
	MenuTitleContainer:setYRot( 25 )
	MenuTitleContainer.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	self:addElement( MenuTitleContainer )
	self.MenuTitleContainer = MenuTitleContainer
	
	local LocalWarning = CoD.LocalWarning.new( menu, controller )
	LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
	LocalWarning:setTopBottom( true, false, 62, 82 )
	LocalWarning:setAlpha( 0 )
	LocalWarning:mergeStateConditions( {
		{
			stateName = "PlayingLive",
			condition = function ( menu, element, event )
				return IsLive()
			end
		},
		{
			stateName = "PlayingLocal",
			condition = function ( menu, element, event )
				return IsLAN()
			end
		}
	} )
	LocalWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( LocalWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	LocalWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( LocalWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:addElement( LocalWarning )
	self.LocalWarning = LocalWarning
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 37.9, 40.9 )
	LineSide:setTopBottom( true, false, 52, 640 )
	LineSide:setAlpha( 0.5 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local selectionList = CoD.FE_SelectionList.new( menu, controller )
	selectionList:setLeftRight( true, false, 37.39, 647.39 )
	selectionList:setTopBottom( true, false, 320, 666 )
	selectionList:setYRot( 25 )
	selectionList:setZoom( -150 )
	selectionList:registerEventHandler( "gain_focus", function ( element, event )
		local f8_local0 = nil
		if element.gainFocus then
			f8_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f8_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f8_local0
	end )
	selectionList:registerEventHandler( "lose_focus", function ( element, event )
		local f9_local0 = nil
		if element.loseFocus then
			f9_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f9_local0 = element.super:loseFocus( event )
		end
		return f9_local0
	end )
	menu:AddButtonCallbackFunction( selectionList, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		ProcessListAction( self, f10_arg0, f10_arg2 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	local FEFeaturedCardsContainer = CoD.FE_FeaturedCardsContainer.new( menu, controller )
	FEFeaturedCardsContainer:setLeftRight( true, false, 35.9, 395.9 )
	FEFeaturedCardsContainer:setTopBottom( true, false, 40, 203 )
	FEFeaturedCardsContainer:setYRot( 25 )
	self:addElement( FEFeaturedCardsContainer )
	self.FEFeaturedCardsContainer = FEFeaturedCardsContainer
	
	local CompetitiveSettingsSummary = CoD.Competitive_SettingsSummary.new( menu, controller )
	CompetitiveSettingsSummary:setLeftRight( true, false, 35, 387 )
	CompetitiveSettingsSummary:setTopBottom( true, false, 436, 659 )
	CompetitiveSettingsSummary:setYRot( 25 )
	self:addElement( CompetitiveSettingsSummary )
	self.CompetitiveSettingsSummary = CompetitiveSettingsSummary
	
	local LobbyDoubleXPWidgetContainer = CoD.LobbyDoubleXPWidgetContainer.new( menu, controller )
	LobbyDoubleXPWidgetContainer:setLeftRight( true, false, 0, 520 )
	LobbyDoubleXPWidgetContainer:setTopBottom( true, false, 0, 720 )
	LobbyDoubleXPWidgetContainer:setAlpha( 0 )
	self:addElement( LobbyDoubleXPWidgetContainer )
	self.LobbyDoubleXPWidgetContainer = LobbyDoubleXPWidgetContainer
	
	FEFeaturedCardsContainer:linkToElementModel( FEFeaturedCardsContainer.CardsList, nil, false, function ( model )
		FEFeaturedCardsContainer:setModel( model, controller )
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 189.35, 335.35 )
				self.MenuTitleContainer:setAlpha( 1 )
				self.clipFinished( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.clipFinished( LocalWarning, {} )

				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 320, 666 )
				self.selectionList:setAlpha( 1 )
				self.clipFinished( selectionList, {} )

				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setLeftRight( true, false, 35.9, 395.9 )
				self.FEFeaturedCardsContainer:setTopBottom( true, false, 40, 203 )
				self.FEFeaturedCardsContainer:setAlpha( 1 )
				self.clipFinished( FEFeaturedCardsContainer, {} )

				LobbyDoubleXPWidgetContainer:completeAnimation()
				self.LobbyDoubleXPWidgetContainer:setAlpha( 1 )
				self.clipFinished( LobbyDoubleXPWidgetContainer, {} )
			end,
			MoveSelectionListUp = function ()
				self:setupElementClipCounter( 3 )

				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer:setTopBottom( true, false, 24, 170 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:setTopBottom( true, false, 201.35, 347.35 )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 189.35, 335.35 )
				self.MenuTitleContainer:setAlpha( 1 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )
				local selectionListFrame2 = function ( selectionList, event )
					local selectionListFrame3 = function ( selectionList, event )
						if not event.interrupted then
							selectionList:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Linear )
						end
						selectionList:setLeftRight( true, false, 37.39, 647.39 )
						selectionList:setTopBottom( true, false, 134, 480 )
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
						selectionList:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						selectionList:setTopBottom( true, false, 332, 678 )
						selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame3 )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 320, 666 )
				selectionListFrame2( selectionList, {} )
				local FEFeaturedCardsContainerFrame2 = function ( FEFeaturedCardsContainer, event )
					local FEFeaturedCardsContainerFrame3 = function ( FEFeaturedCardsContainer, event )
						if not event.interrupted then
							FEFeaturedCardsContainer:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Bounce )
						end
						FEFeaturedCardsContainer:setLeftRight( true, false, 35.9, 395.9 )
						FEFeaturedCardsContainer:setTopBottom( true, false, 40, 203 )
						FEFeaturedCardsContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainer, event )
						else
							FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerFrame3( FEFeaturedCardsContainer, event )
						return 
					else
						FEFeaturedCardsContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerFrame3 )
					end
				end
				
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setLeftRight( true, false, 35.9, 395.9 )
				self.FEFeaturedCardsContainer:setTopBottom( true, false, 40, 203 )
				self.FEFeaturedCardsContainer:setAlpha( 1 )
				FEFeaturedCardsContainerFrame2( FEFeaturedCardsContainer, {} )
			end,
			SelectionListUp = function ()
				self:setupElementClipCounter( 4 )

				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer:setAlpha( 1 )
				self.clipFinished( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.clipFinished( LocalWarning, {} )

				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 134, 480 )
				self.selectionList:setAlpha( 1 )
				self.clipFinished( selectionList, {} )

				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 5 )

				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer:setTopBottom( true, false, 189.35, 335.35 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 189.35, 335.35 )
				self.MenuTitleContainer:setAlpha( 0 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.clipFinished( LocalWarning, {} )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( true, false, 42, 45 )
					LineSide:setTopBottom( true, false, 52, 640 )
					LineSide:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 3, 6 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				self.LineSide:setAlpha( 0 )
				LineSideFrame2( LineSide, {} )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					selectionList:setLeftRight( true, false, 37.39, 647.39 )
					selectionList:setTopBottom( true, false, 320, 666 )
					selectionList:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 242, 588 )
				self.selectionList:setAlpha( 1 )
				selectionListFrame2( selectionList, {} )

				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
			end,
			ListUp = function ()
				self:setupElementClipCounter( 5 )

				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer:setTopBottom( true, false, 24, 170 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 189.35, 335.35 )
				self.MenuTitleContainer:setAlpha( 1 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )
				local selectionListFrame2 = function ( selectionList, event )
					local selectionListFrame3 = function ( selectionList, event )
						if not event.interrupted then
							selectionList:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Linear )
						end
						selectionList:setLeftRight( true, false, 37.39, 647.39 )
						selectionList:setTopBottom( true, false, 134, 480 )
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
						selectionList:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						selectionList:registerEventHandler( "transition_complete_keyframe", selectionListFrame3 )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 320, 666 )
				selectionListFrame2( selectionList, {} )
				local FEFeaturedCardsContainerFrame2 = function ( FEFeaturedCardsContainer, event )
					local FEFeaturedCardsContainerFrame3 = function ( FEFeaturedCardsContainer, event )
						if not event.interrupted then
							FEFeaturedCardsContainer:beginAnimation( "keyframe", 310, true, false, CoD.TweenType.Bounce )
						end
						FEFeaturedCardsContainer:setLeftRight( true, false, 35.9, 395.9 )
						FEFeaturedCardsContainer:setTopBottom( true, false, 40, 203 )
						FEFeaturedCardsContainer:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainer, event )
						else
							FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerFrame3( FEFeaturedCardsContainer, event )
						return 
					else
						FEFeaturedCardsContainer:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerFrame3 )
					end
				end
				
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setLeftRight( true, false, 35.9, 395.9 )
				self.FEFeaturedCardsContainer:setTopBottom( true, false, 40, 203 )
				self.FEFeaturedCardsContainer:setAlpha( 1 )
				FEFeaturedCardsContainerFrame2( FEFeaturedCardsContainer, {} )
				local CompetitiveSettingsSummaryFrame2 = function ( CompetitiveSettingsSummary, event )
					local CompetitiveSettingsSummaryFrame3 = function ( CompetitiveSettingsSummary, event )
						if not event.interrupted then
							CompetitiveSettingsSummary:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
						end
						CompetitiveSettingsSummary:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( CompetitiveSettingsSummary, event )
						else
							CompetitiveSettingsSummary:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CompetitiveSettingsSummaryFrame3( CompetitiveSettingsSummary, event )
						return 
					else
						CompetitiveSettingsSummary:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
						CompetitiveSettingsSummary:registerEventHandler( "transition_complete_keyframe", CompetitiveSettingsSummaryFrame3 )
					end
				end
				
				CompetitiveSettingsSummary:completeAnimation()
				self.CompetitiveSettingsSummary:setAlpha( 0 )
				CompetitiveSettingsSummaryFrame2( CompetitiveSettingsSummary, {} )
				local f27_local4 = function ( f36_arg0, f36_arg1 )
					if not f36_arg1.interrupted then
						f36_arg0:beginAnimation( "keyframe", 519, false, false, CoD.TweenType.Bounce )
					end
					f36_arg0:setAlpha( 1 )
					if f36_arg1.interrupted then
						self.clipFinished( f36_arg0, f36_arg1 )
					else
						f36_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LobbyDoubleXPWidgetContainer:beginAnimation( "keyframe", 769, false, false, CoD.TweenType.Linear )
				LobbyDoubleXPWidgetContainer:setAlpha( 0 )
				LobbyDoubleXPWidgetContainer:registerEventHandler( "transition_complete_keyframe", f27_local4 )
			end
		},
		ListUp = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer:setAlpha( 1 )
				self.clipFinished( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )

				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 134, 480 )
				self.clipFinished( selectionList, {} )

				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )

				LobbyDoubleXPWidgetContainer:completeAnimation()
				self.LobbyDoubleXPWidgetContainer:setAlpha( 1 )
				self.clipFinished( LobbyDoubleXPWidgetContainer, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )

				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 529, false, false, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer:setTopBottom( true, false, 189.2, 335.2 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer:setAlpha( 1 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 409, true, true, CoD.TweenType.Linear )
					end
					selectionList:setLeftRight( true, false, 37.39, 647.39 )
					selectionList:setTopBottom( true, false, 320, 666 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 134, 480 )
				selectionListFrame2( selectionList, {} )
				local FEFeaturedCardsContainerFrame2 = function ( FEFeaturedCardsContainer, event )
					local FEFeaturedCardsContainerFrame3 = function ( FEFeaturedCardsContainer, event )
						if not event.interrupted then
							FEFeaturedCardsContainer:beginAnimation( "keyframe", 299, true, false, CoD.TweenType.Bounce )
						end
						FEFeaturedCardsContainer:setLeftRight( true, false, 35.9, 395.9 )
						FEFeaturedCardsContainer:setTopBottom( true, false, 40, 203 )
						FEFeaturedCardsContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FEFeaturedCardsContainer, event )
						else
							FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeaturedCardsContainerFrame3( FEFeaturedCardsContainer, event )
						return 
					else
						FEFeaturedCardsContainer:beginAnimation( "keyframe", 469, false, false, CoD.TweenType.Linear )
						FEFeaturedCardsContainer:registerEventHandler( "transition_complete_keyframe", FEFeaturedCardsContainerFrame3 )
					end
				end
				
				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setLeftRight( true, false, 35.9, 395.9 )
				self.FEFeaturedCardsContainer:setTopBottom( true, false, 40, 203 )
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				FEFeaturedCardsContainerFrame2( FEFeaturedCardsContainer, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 5 )

				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						end
						MenuTitleContainer:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer:setTopBottom( true, false, 24, 170 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer:setAlpha( 0 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( true, false, 38, 41 )
					LineSide:setTopBottom( true, false, 52, 640 )
					LineSide:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 3, 6 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				self.LineSide:setAlpha( 0 )
				LineSideFrame2( LineSide, {} )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					selectionList:setLeftRight( true, false, 37.39, 647.39 )
					selectionList:setTopBottom( true, false, 134, 480 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 54, 400 )
				selectionListFrame2( selectionList, {} )

				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
			end
		},
		mpLobbyOnline = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		mpLobbyOnlineGame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		mpLobbyOnlineCustom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		ListUpCopy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer:setAlpha( 1 )
				self.clipFinished( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )

				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 134, 480 )
				self.clipFinished( selectionList, {} )

				FEFeaturedCardsContainer:completeAnimation()
				self.FEFeaturedCardsContainer:setAlpha( 0 )
				self.clipFinished( FEFeaturedCardsContainer, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )

				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer:setTopBottom( true, false, 201.35, 347.35 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer:setAlpha( 1 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 409, true, true, CoD.TweenType.Linear )
					end
					selectionList:setLeftRight( true, false, 37.39, 647.39 )
					selectionList:setTopBottom( true, false, 332, 678 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 134, 480 )
				selectionListFrame2( selectionList, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )

				local MenuTitleContainerFrame2 = function ( MenuTitleContainer, event )
					local MenuTitleContainerFrame3 = function ( MenuTitleContainer, event )
						if not event.interrupted then
							MenuTitleContainer:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						end
						MenuTitleContainer:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer:setTopBottom( true, false, 24, 170 )
						MenuTitleContainer:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer, event )
						else
							MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainerFrame3( MenuTitleContainer, event )
						return 
					else
						MenuTitleContainer:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						MenuTitleContainer:registerEventHandler( "transition_complete_keyframe", MenuTitleContainerFrame3 )
					end
				end
				
				MenuTitleContainer:completeAnimation()
				self.MenuTitleContainer:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer:setAlpha( 0 )
				MenuTitleContainerFrame2( MenuTitleContainer, {} )

				LocalWarning:completeAnimation()
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )
				local LineSideFrame2 = function ( LineSide, event )
					if not event.interrupted then
						LineSide:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					LineSide:setLeftRight( true, false, 38, 41 )
					LineSide:setTopBottom( true, false, 52, 640 )
					LineSide:setAlpha( 0.5 )
					if event.interrupted then
						self.clipFinished( LineSide, event )
					else
						LineSide:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LineSide:completeAnimation()
				self.LineSide:setLeftRight( true, false, 3, 6 )
				self.LineSide:setTopBottom( true, false, 52, 640 )
				self.LineSide:setAlpha( 0 )
				LineSideFrame2( LineSide, {} )
				local selectionListFrame2 = function ( selectionList, event )
					if not event.interrupted then
						selectionList:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					selectionList:setLeftRight( true, false, 37.39, 647.39 )
					selectionList:setTopBottom( true, false, 134, 480 )
					if event.interrupted then
						self.clipFinished( selectionList, event )
					else
						selectionList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 54, 400 )
				selectionListFrame2( selectionList, {} )
			end
		}
	}
	selectionList.id = "selectionList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MenuTitleContainer:close()
		element.LocalWarning:close()
		element.selectionList:close()
		element.FEFeaturedCardsContainer:close()
		element.CompetitiveSettingsSummary:close()
		element.LobbyDoubleXPWidgetContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

