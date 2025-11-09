require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleContainer" )
require( "ui.uieditor.widgets.Lobby.Connectivity.LocalWarning" )
require( "ui.uieditor.widgets.Lobby.Common.HostStateString" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedContainer" )
require( "ui.uieditor.widgets.Lobby.Common.FE_SelectionList" )

local PostLoadFunc = function ( self, controller, menu )
	LUI.OverrideFunction_CallOriginalFirst( self.MenuTitleContainer0.MenuTitle.TextBox1.Label0, "setText", function ()
		self.MenuTitleContainer0:playClip( "Update" )
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
	
	local MenuTitleContainer0 = CoD.FE_3dTitleContainer.new( menu, controller )
	MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
	MenuTitleContainer0:setTopBottom( true, false, 201.35, 347.35 )
	MenuTitleContainer0:setRGB( 1, 1, 1 )
	MenuTitleContainer0:setYRot( 25 )
	MenuTitleContainer0.circles:setRGB( 1, 1, 1 )
	MenuTitleContainer0.diaglrg:setRGB( 1, 1, 1 )
	MenuTitleContainer0.diagsm:setRGB( 1, 1, 1 )
	MenuTitleContainer0.centersquare:setRGB( 1, 1, 1 )
	MenuTitleContainer0:subscribeToGlobalModel( controller, "Lobby", "lobbyTitle", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MenuTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MenuTitleContainer0 )
	self.MenuTitleContainer0 = MenuTitleContainer0
	
	local LocalWarning = CoD.LocalWarning.new( menu, controller )
	LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
	LocalWarning:setTopBottom( true, false, 62, 82 )
	LocalWarning:setRGB( 1, 1, 1 )
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
	LocalWarning:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( LocalWarning, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyNetworkMode"
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
	
	local HostStateString0 = CoD.HostStateString.new( menu, controller )
	HostStateString0:setLeftRight( true, false, 143.39, 543.39 )
	HostStateString0:setTopBottom( true, false, 374, 398 )
	HostStateString0:setRGB( 1, 1, 1 )
	HostStateString0:setAlpha( 0 )
	HostStateString0:setYRot( 25 )
	self:addElement( HostStateString0 )
	self.HostStateString0 = HostStateString0
	
	local FEFeatured0 = CoD.FE_FeaturedContainer.new( menu, controller )
	FEFeatured0:setLeftRight( true, false, 19, 461 )
	FEFeatured0:setTopBottom( true, false, 65, 203 )
	FEFeatured0:setRGB( 1, 1, 1 )
	FEFeatured0:setYRot( 25 )
	FEFeatured0:setZoom( -80 )
	FEFeatured0:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		PlayClip( self, "Intro", controller )
		PlayClipOnElement( self, {
			elementName = "FEFeatured0",
			clipName = "Intro"
		}, controller )
		PlayClipOnElement( self, {
			elementName = "MenuTitleContainer0",
			clipName = "Intro"
		}, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	FEFeatured0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f10_local0 = IsMainModeInvalidAndNotTheaterMode()
				if f10_local0 then
					if not IsBooleanDvarSet( "ui_execdemo" ) then
						f10_local0 = not IsLAN()
					else
						f10_local0 = false
					end
				end
				return f10_local0
			end
		}
	} )
	FEFeatured0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" ), function ( model )
		menu:updateElementState( FEFeatured0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyMainMode"
		} )
	end )
	FEFeatured0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( FEFeatured0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	FEFeatured0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( FEFeatured0, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyGlobalRoot.lobbyNetworkMode"
		} )
	end )
	self:addElement( FEFeatured0 )
	self.FEFeatured0 = FEFeatured0
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 37.9, 40.9 )
	LineSide:setTopBottom( true, false, 52, 640 )
	LineSide:setRGB( 1, 1, 1 )
	LineSide:setAlpha( 0.5 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local selectionList = CoD.FE_SelectionList.new( menu, controller )
	selectionList:setLeftRight( true, false, 37.39, 647.39 )
	selectionList:setTopBottom( true, false, 332, 678 )
	selectionList:setRGB( 1, 1, 1 )
	selectionList:setYRot( 25 )
	selectionList:setZoom( -150 )
	selectionList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ProcessListAction( self, element, controller )
		return retVal
	end )
	self:addElement( selectionList )
	self.selectionList = selectionList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 201.35, 347.35 )
				self.MenuTitleContainer0:setAlpha( 1 )
				self.clipFinished( MenuTitleContainer0, {} )
				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.clipFinished( LocalWarning, {} )
				FEFeatured0:completeAnimation()
				self.FEFeatured0:setLeftRight( true, false, 19, 461 )
				self.FEFeatured0:setTopBottom( true, false, 65, 203 )
				self.FEFeatured0:setRGB( 1, 1, 1 )
				self.clipFinished( FEFeatured0, {} )
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 332, 678 )
				self.selectionList:setAlpha( 1 )
				self.clipFinished( selectionList, {} )
			end,
			MoveSelectionListUp = function ()
				self:setupElementClipCounter( 3 )
				local MenuTitleContainer0Frame2 = function ( MenuTitleContainer0, event )
					local MenuTitleContainer0Frame3 = function ( MenuTitleContainer0, event )
						if not event.interrupted then
							MenuTitleContainer0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
						MenuTitleContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer0, event )
						else
							MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainer0Frame3( MenuTitleContainer0, event )
						return 
					else
						MenuTitleContainer0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", MenuTitleContainer0Frame3 )
					end
				end
				
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 201.35, 347.35 )
				self.MenuTitleContainer0:setAlpha( 1 )
				MenuTitleContainer0Frame2( MenuTitleContainer0, {} )
				local FEFeatured0Frame2 = function ( FEFeatured0, event )
					if not event.interrupted then
						FEFeatured0:beginAnimation( "keyframe", 239, true, true, CoD.TweenType.Linear )
					end
					FEFeatured0:setLeftRight( true, false, 19, 461 )
					FEFeatured0:setTopBottom( true, false, -35, 103 )
					if event.interrupted then
						self.clipFinished( FEFeatured0, event )
					else
						FEFeatured0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEFeatured0:completeAnimation()
				self.FEFeatured0:setLeftRight( true, false, 19, 461 )
				self.FEFeatured0:setTopBottom( true, false, 65, 203 )
				FEFeatured0Frame2( FEFeatured0, {} )
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
				self.selectionList:setTopBottom( true, false, 332, 678 )
				selectionListFrame2( selectionList, {} )
			end,
			SelectionListUp = function ()
				self:setupElementClipCounter( 3 )
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer0:setAlpha( 1 )
				self.clipFinished( MenuTitleContainer0, {} )
				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.clipFinished( LocalWarning, {} )
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 134, 480 )
				self.selectionList:setAlpha( 1 )
				self.clipFinished( selectionList, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 5 )
				local MenuTitleContainer0Frame2 = function ( MenuTitleContainer0, event )
					local MenuTitleContainer0Frame3 = function ( MenuTitleContainer0, event )
						if not event.interrupted then
							MenuTitleContainer0:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
						end
						MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer0:setTopBottom( true, false, 201.35, 347.35 )
						MenuTitleContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer0, event )
						else
							MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainer0Frame3( MenuTitleContainer0, event )
						return 
					else
						MenuTitleContainer0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
						MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", MenuTitleContainer0Frame3 )
					end
				end
				
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 201.35, 347.35 )
				self.MenuTitleContainer0:setAlpha( 0 )
				MenuTitleContainer0Frame2( MenuTitleContainer0, {} )
				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.clipFinished( LocalWarning, {} )
				local FEFeatured0Frame2 = function ( FEFeatured0, event )
					if not event.interrupted then
						FEFeatured0:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					FEFeatured0:setLeftRight( true, false, 19, 461 )
					FEFeatured0:setTopBottom( true, false, 65, 203 )
					if event.interrupted then
						self.clipFinished( FEFeatured0, event )
					else
						FEFeatured0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEFeatured0:completeAnimation()
				self.FEFeatured0:setLeftRight( true, false, 19, 461 )
				self.FEFeatured0:setTopBottom( true, false, 116, 254 )
				FEFeatured0Frame2( FEFeatured0, {} )
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
					selectionList:setTopBottom( true, false, 332, 678 )
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
			end,
			ListUp = function ()
				self:setupElementClipCounter( 3 )
				local MenuTitleContainer0Frame2 = function ( MenuTitleContainer0, event )
					local MenuTitleContainer0Frame3 = function ( MenuTitleContainer0, event )
						if not event.interrupted then
							MenuTitleContainer0:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
						MenuTitleContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer0, event )
						else
							MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainer0Frame3( MenuTitleContainer0, event )
						return 
					else
						MenuTitleContainer0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", MenuTitleContainer0Frame3 )
					end
				end
				
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 201.35, 347.35 )
				self.MenuTitleContainer0:setAlpha( 1 )
				MenuTitleContainer0Frame2( MenuTitleContainer0, {} )
				local FEFeatured0Frame2 = function ( FEFeatured0, event )
					if not event.interrupted then
						FEFeatured0:beginAnimation( "keyframe", 239, true, true, CoD.TweenType.Linear )
					end
					FEFeatured0:setLeftRight( true, false, 19, 461 )
					FEFeatured0:setTopBottom( true, false, -15, 123 )
					if event.interrupted then
						self.clipFinished( FEFeatured0, event )
					else
						FEFeatured0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FEFeatured0:completeAnimation()
				self.FEFeatured0:setLeftRight( true, false, 19, 461 )
				self.FEFeatured0:setTopBottom( true, false, 65, 203 )
				FEFeatured0Frame2( FEFeatured0, {} )
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
				self.selectionList:setTopBottom( true, false, 332, 678 )
				selectionListFrame2( selectionList, {} )
			end
		},
		ListUp = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer0:setAlpha( 1 )
				self.clipFinished( MenuTitleContainer0, {} )
				LocalWarning:completeAnimation()
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )
				FEFeatured0:completeAnimation()
				self.FEFeatured0:setAlpha( 1 )
				self.clipFinished( FEFeatured0, {} )
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 134, 480 )
				self.clipFinished( selectionList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local MenuTitleContainer0Frame2 = function ( MenuTitleContainer0, event )
					local MenuTitleContainer0Frame3 = function ( MenuTitleContainer0, event )
						if not event.interrupted then
							MenuTitleContainer0:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer0:setTopBottom( true, false, 201.35, 347.35 )
						MenuTitleContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer0, event )
						else
							MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainer0Frame3( MenuTitleContainer0, event )
						return 
					else
						MenuTitleContainer0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", MenuTitleContainer0Frame3 )
					end
				end
				
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer0:setAlpha( 1 )
				MenuTitleContainer0Frame2( MenuTitleContainer0, {} )
				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )
				local FEFeatured0Frame2 = function ( FEFeatured0, event )
					local FEFeatured0Frame3 = function ( FEFeatured0, event )
						if not event.interrupted then
							FEFeatured0:beginAnimation( "keyframe", 350, false, true, CoD.TweenType.Linear )
						end
						FEFeatured0:setLeftRight( true, false, 19, 461 )
						FEFeatured0:setTopBottom( true, false, 65, 203 )
						if event.interrupted then
							self.clipFinished( FEFeatured0, event )
						else
							FEFeatured0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeatured0Frame3( FEFeatured0, event )
						return 
					else
						FEFeatured0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame3 )
					end
				end
				
				FEFeatured0:completeAnimation()
				self.FEFeatured0:setLeftRight( true, false, 19, 461 )
				self.FEFeatured0:setTopBottom( true, false, -33, 105 )
				FEFeatured0Frame2( FEFeatured0, {} )
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
				local MenuTitleContainer0Frame2 = function ( MenuTitleContainer0, event )
					local MenuTitleContainer0Frame3 = function ( MenuTitleContainer0, event )
						if not event.interrupted then
							MenuTitleContainer0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						end
						MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
						MenuTitleContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer0, event )
						else
							MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainer0Frame3( MenuTitleContainer0, event )
						return 
					else
						MenuTitleContainer0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", MenuTitleContainer0Frame3 )
					end
				end
				
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer0:setAlpha( 0 )
				MenuTitleContainer0Frame2( MenuTitleContainer0, {} )
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
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer0:setAlpha( 1 )
				self.clipFinished( MenuTitleContainer0, {} )
				LocalWarning:completeAnimation()
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )
				FEFeatured0:completeAnimation()
				self.FEFeatured0:setAlpha( 1 )
				self.clipFinished( FEFeatured0, {} )
				selectionList:completeAnimation()
				self.selectionList:setLeftRight( true, false, 37.39, 647.39 )
				self.selectionList:setTopBottom( true, false, 134, 480 )
				self.clipFinished( selectionList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 4 )
				local MenuTitleContainer0Frame2 = function ( MenuTitleContainer0, event )
					local MenuTitleContainer0Frame3 = function ( MenuTitleContainer0, event )
						if not event.interrupted then
							MenuTitleContainer0:beginAnimation( "keyframe", 539, true, true, CoD.TweenType.Linear )
						end
						MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer0:setTopBottom( true, false, 201.35, 347.35 )
						MenuTitleContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer0, event )
						else
							MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainer0Frame3( MenuTitleContainer0, event )
						return 
					else
						MenuTitleContainer0:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
						MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", MenuTitleContainer0Frame3 )
					end
				end
				
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer0:setAlpha( 1 )
				MenuTitleContainer0Frame2( MenuTitleContainer0, {} )
				LocalWarning:completeAnimation()
				self.LocalWarning:setLeftRight( true, false, 123.53, 623.53 )
				self.LocalWarning:setTopBottom( true, false, 62, 82 )
				self.LocalWarning:setAlpha( 0 )
				self.clipFinished( LocalWarning, {} )
				local FEFeatured0Frame2 = function ( FEFeatured0, event )
					local FEFeatured0Frame3 = function ( FEFeatured0, event )
						if not event.interrupted then
							FEFeatured0:beginAnimation( "keyframe", 350, false, true, CoD.TweenType.Linear )
						end
						FEFeatured0:setLeftRight( true, false, 19, 461 )
						FEFeatured0:setTopBottom( true, false, 65, 203 )
						if event.interrupted then
							self.clipFinished( FEFeatured0, event )
						else
							FEFeatured0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFeatured0Frame3( FEFeatured0, event )
						return 
					else
						FEFeatured0:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
						FEFeatured0:registerEventHandler( "transition_complete_keyframe", FEFeatured0Frame3 )
					end
				end
				
				FEFeatured0:completeAnimation()
				self.FEFeatured0:setLeftRight( true, false, 19, 461 )
				self.FEFeatured0:setTopBottom( true, false, -33, 105 )
				FEFeatured0Frame2( FEFeatured0, {} )
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
				local MenuTitleContainer0Frame2 = function ( MenuTitleContainer0, event )
					local MenuTitleContainer0Frame3 = function ( MenuTitleContainer0, event )
						if not event.interrupted then
							MenuTitleContainer0:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Bounce )
						end
						MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
						MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
						MenuTitleContainer0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( MenuTitleContainer0, event )
						else
							MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MenuTitleContainer0Frame3( MenuTitleContainer0, event )
						return 
					else
						MenuTitleContainer0:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						MenuTitleContainer0:registerEventHandler( "transition_complete_keyframe", MenuTitleContainer0Frame3 )
					end
				end
				
				MenuTitleContainer0:completeAnimation()
				self.MenuTitleContainer0:setLeftRight( true, false, -75, 445 )
				self.MenuTitleContainer0:setTopBottom( true, false, 24, 170 )
				self.MenuTitleContainer0:setAlpha( 0 )
				MenuTitleContainer0Frame2( MenuTitleContainer0, {} )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.selectionList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.MenuTitleContainer0:close()
		self.LocalWarning:close()
		self.HostStateString0:close()
		self.FEFeatured0:close()
		self.selectionList:close()
		CoD.LeftContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

