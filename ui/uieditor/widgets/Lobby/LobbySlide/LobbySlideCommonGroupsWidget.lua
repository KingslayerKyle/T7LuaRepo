-- 9c50672e06eaee2496e4a978ac8107da
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLineSingle" )
require( "ui.uieditor.widgets.Lobby.LobbySlide.LobbySlideCommonGroupsListWidget" )

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "groups.searchGroupsInProgress", true )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.CommonGroupsList:linkToElementModel( f2_arg0, "xuid", true, function ()
		f2_arg0.CommonGroupsList:updateDataSource()
	end )
	local f2_local0 = LUI.UITimer.newElementTimer( 3000, false, function ()
		local f4_local0 = f2_arg0.CommonGroupsList
		if f4_local0 then
			local f4_local1 = false
			local f4_local2 = 0
			local f4_local3 = f4_local0:getDataSource()
			if f4_local3 then
				f4_local2 = f4_local3.getCount( f4_local0 )
			end
			if (not IsMainModeInvalid() or f4_local2 <= 8) and (IsMainModeInvalid() or f4_local2 <= 2) then
				f4_local1 = false
			else
				f4_local1 = true
			end
			if not f4_local1 then
				return 
			elseif f4_local0.activeWidget and not f4_local0.resetToFirst then
				local f4_local4 = GetListItem( f2_arg0, f4_local0.activeWidget )
				f4_local4:navigateItemDown()
			else
				f4_local0.resetToFirst = false
				f4_local0:getFirstSelectableItem( true )
			end
		end
	end, f2_arg0 )
	f2_arg0.scrollTimer = f2_local0
	f2_arg0:addElement( f2_local0 )
end

CoD.LobbySlideCommonGroupsWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideCommonGroupsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideCommonGroupsWidget )
	self.id = "LobbySlideCommonGroupsWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 119 )
	self.anyChildUsesUpdateState = true
	
	local FEListHeaderGlow0 = CoD.FE_ListHeaderGlow.new( menu, controller )
	FEListHeaderGlow0:setLeftRight( true, false, 0, 321 )
	FEListHeaderGlow0:setTopBottom( true, false, 0, 21 )
	FEListHeaderGlow0:setAlpha( 0.14 )
	self:addElement( FEListHeaderGlow0 )
	self.FEListHeaderGlow0 = FEListHeaderGlow0
	
	local pixelU = LUI.UIImage.new()
	pixelU:setLeftRight( false, true, -7, 29 )
	pixelU:setTopBottom( true, false, -0.75, 2.75 )
	pixelU:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU )
	self.pixelU = pixelU
	
	local pixelU0 = LUI.UIImage.new()
	pixelU0:setLeftRight( true, false, -29, 7 )
	pixelU0:setTopBottom( true, false, -1.75, 1.75 )
	pixelU0:setZRot( 180 )
	pixelU0:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelU0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelU0 )
	self.pixelU0 = pixelU0
	
	local FETitleLineSingle0 = CoD.FE_TitleLineSingle.new( menu, controller )
	FETitleLineSingle0:setLeftRight( true, false, 0, 323.99 )
	FETitleLineSingle0:setTopBottom( true, false, -2, 2 )
	self:addElement( FETitleLineSingle0 )
	self.FETitleLineSingle0 = FETitleLineSingle0
	
	local CommonGroupsText = LUI.UIText.new()
	CommonGroupsText:setLeftRight( true, false, 2, 202 )
	CommonGroupsText:setTopBottom( true, false, 1, 19 )
	CommonGroupsText:setText( Engine.Localize( "GROUPS_COMMON_GROUPS" ) )
	CommonGroupsText:setTTF( "fonts/default.ttf" )
	CommonGroupsText:setLetterSpacing( 0.3 )
	CommonGroupsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CommonGroupsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CommonGroupsText )
	self.CommonGroupsText = CommonGroupsText
	
	local Spinner = LUI.UIImage.new()
	Spinner:setLeftRight( true, false, 131.5, 179.5 )
	Spinner:setTopBottom( true, false, 2.75, 50.75 )
	Spinner:setupSpinner()
	self:addElement( Spinner )
	self.Spinner = Spinner
	
	local CommonGroupsList = LUI.GridLayout.new( menu, controller, false, 0, 0, -2, 200, nil, nil, true, true, 0, 0, false, true )
	CommonGroupsList:setLeftRight( true, false, 7, 314 )
	CommonGroupsList:setTopBottom( true, false, 22.5, 168.5 )
	CommonGroupsList:setWidgetType( CoD.LobbySlideCommonGroupsListWidget )
	CommonGroupsList:setVerticalCount( 8 )
	CommonGroupsList:setSpacing( -2 )
	CommonGroupsList:setDataSource( "LobbyCommonGroupsList" )
	self:addElement( CommonGroupsList )
	self.CommonGroupsList = CommonGroupsList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListHeaderGlow0, {} )

				pixelU:completeAnimation()
				self.pixelU:setAlpha( 0 )
				self.clipFinished( pixelU, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 0 )
				self.clipFinished( pixelU0, {} )

				FETitleLineSingle0:completeAnimation()
				self.FETitleLineSingle0:setAlpha( 0 )
				self.clipFinished( FETitleLineSingle0, {} )

				CommonGroupsText:completeAnimation()
				self.CommonGroupsText:setAlpha( 0 )
				self.clipFinished( CommonGroupsText, {} )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )

				CommonGroupsList:completeAnimation()
				self.CommonGroupsList:setAlpha( 0 )
				self.clipFinished( CommonGroupsList, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0.14 )
				self.clipFinished( FEListHeaderGlow0, {} )

				pixelU:completeAnimation()
				self.pixelU:setAlpha( 1 )
				self.clipFinished( pixelU, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 1 )
				self.clipFinished( pixelU0, {} )

				FETitleLineSingle0:completeAnimation()
				self.FETitleLineSingle0:setAlpha( 1 )
				self.clipFinished( FETitleLineSingle0, {} )

				CommonGroupsText:completeAnimation()
				self.CommonGroupsText:setAlpha( 1 )
				self.clipFinished( CommonGroupsText, {} )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 0 )
				self.clipFinished( Spinner, {} )

				CommonGroupsList:completeAnimation()
				self.CommonGroupsList:setAlpha( 1 )
				self.clipFinished( CommonGroupsList, {} )
			end
		},
		Loading = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				FEListHeaderGlow0:completeAnimation()
				self.FEListHeaderGlow0:setAlpha( 0 )
				self.clipFinished( FEListHeaderGlow0, {} )

				pixelU:completeAnimation()
				self.pixelU:setAlpha( 0 )
				self.clipFinished( pixelU, {} )

				pixelU0:completeAnimation()
				self.pixelU0:setAlpha( 0 )
				self.clipFinished( pixelU0, {} )

				FETitleLineSingle0:completeAnimation()
				self.FETitleLineSingle0:setAlpha( 0 )
				self.clipFinished( FETitleLineSingle0, {} )

				CommonGroupsText:completeAnimation()
				self.CommonGroupsText:setAlpha( 0 )
				self.clipFinished( CommonGroupsText, {} )

				Spinner:completeAnimation()
				self.Spinner:setAlpha( 1 )
				self.clipFinished( Spinner, {} )

				CommonGroupsList:completeAnimation()
				self.CommonGroupsList:setAlpha( 0 )
				self.clipFinished( CommonGroupsList, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f9_local0
				if not SearchGroupResultsLoading( element, controller ) then
					f9_local0 = IsSelfModelValueTrue( element, controller, "quickjoinListMember" )
					if f9_local0 then
						if not IsSelfModelValueNil( element, controller, "xuid" ) then
							f9_local0 = ListElementHasElements( self, "CommonGroupsList" )
						else
							f9_local0 = false
						end
					end
				else
					f9_local0 = false
				end
				return f9_local0
			end
		},
		{
			stateName = "Loading",
			condition = function ( menu, element, event )
				return SearchGroupResultsLoading( element, controller ) and IsSelfModelValueTrue( element, controller, "quickJoinListMember" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "groups.searchGroupsInProgress" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "groups.searchGroupsInProgress"
		} )
	end )
	self:linkToElementModel( self, "quickjoinListMember", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "quickjoinListMember"
		} )
	end )
	self:linkToElementModel( self, "xuid", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "xuid"
		} )
	end )
	self:linkToElementModel( self, "quickJoinListMember", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "quickJoinListMember"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEListHeaderGlow0:close()
		element.FETitleLineSingle0:close()
		element.CommonGroupsList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
