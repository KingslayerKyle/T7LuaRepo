-- 1576082f9f9668e86906a84a034f6f97
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BlackMarket.NextKeyProgress" )
require( "ui.uieditor.widgets.BlackMarket.DoubleLoot_small" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtility.SetupUIModels( controller )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	CoD.BlackMarketUtility.DoAARCryptoKeyAnimation( f2_arg0.NextKeyProgress, f2_arg1 )
	f2_arg0:subscribeToModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" ), "closeAAR" ), function ( model )
		f2_arg0:close()
	end, false )
end

LUI.createMenu.MPAAR = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MPAAR" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MPAAR.buttonPrompts" )
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( false, false, -640, 640 )
	CategoryListPanel:setTopBottom( false, false, -276, -237 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local TabFrame = LUI.UIFrame.new( f4_local1, controller, 0, 0, false )
	TabFrame:setLeftRight( true, false, 0, 1280 )
	TabFrame:setTopBottom( true, false, 125, 651 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( false, false, -647, 647 )
	TitleBacking:setTopBottom( false, false, -360, -237 )
	TitleBacking:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local tabBar = CoD.FE_TabBar.new( f4_local1, controller )
	tabBar:setLeftRight( true, false, 0, 2496 )
	tabBar:setTopBottom( true, false, 84, 125 )
	tabBar.Tabs.grid:setDataSource( "AARTabs" )
	self:addElement( tabBar )
	self.tabBar = tabBar
	
	local MenuFrame = CoD.GenericMenuFrame.new( f4_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local NextKeyProgress = CoD.NextKeyProgress.new( f4_local1, controller )
	NextKeyProgress:setLeftRight( false, true, -406, -64 )
	NextKeyProgress:setTopBottom( true, false, 29, 79 )
	self:addElement( NextKeyProgress )
	self.NextKeyProgress = NextKeyProgress
	
	local DoubleLootsmall = CoD.DoubleLoot_small.new( f4_local1, controller )
	DoubleLootsmall:setLeftRight( true, false, 800, 860 )
	DoubleLootsmall:setTopBottom( true, false, 25.5, 85.5 )
	self:addElement( DoubleLootsmall )
	self.DoubleLootsmall = DoubleLootsmall
	
	TabFrame:linkToElementModel( tabBar.Tabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NextKeyProgress:completeAnimation()
				self.NextKeyProgress:setAlpha( 1 )
				self.clipFinished( NextKeyProgress, {} )
			end
		},
		Offline = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NextKeyProgress:completeAnimation()
				self.NextKeyProgress:setAlpha( 0 )
				self.clipFinished( NextKeyProgress, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Offline",
			condition = function ( menu, element, event )
				return not IsModelValueEqualToEitherValue( controller, "aarType", "public", "league" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "aarType" ), function ( model )
		f4_local1:updateElementState( self, {
			name = "model_validation",
			menu = f4_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "aarType"
		} )
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		GoBackAndShowMatchSurveyIfNecessary( f10_arg1, f10_arg2 )
		return true
	end, function ( f11_arg0, f11_arg1, f11_arg2 )
		CoD.Menu.SetButtonLabel( f11_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		GoBackAndShowMatchSurveyIfNecessary( f12_arg1, f12_arg2 )
		return true
	end, function ( f13_arg0, f13_arg1, f13_arg2 )
		CoD.Menu.SetButtonLabel( f13_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, "TAB", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		GoBackAndShowMatchSurveyIfNecessary( f14_arg1, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_BACK, "" )
		return false
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "B", function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if not IsRecentGameBookmarked( f16_arg2 ) then
			FileshareBookmarkRecentGame( f16_arg2 )
			UpdateAllMenuButtonPrompts( f16_arg1, f16_arg2 )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		if not IsRecentGameBookmarked( f17_arg2 ) then
			CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_BOOKMARK_GAME" )
			return true
		else
			return false
		end
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LTRIG, "U", function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
		if IsStarterPack( f18_arg2 ) then
			StarterParckPurchase( self, f18_arg2, f18_arg1 )
			return true
		else
			
		end
	end, function ( f19_arg0, f19_arg1, f19_arg2 )
		if IsStarterPack( f19_arg2 ) then
			CoD.Menu.SetButtonLabel( f19_arg1, Enum.LUIButton.LUI_KEY_LTRIG, "PLATFORM_STARTER_PACK_UPGRADE_TITLE" )
			return true
		else
			return false
		end
	end, false )
	TabFrame.id = "TabFrame"
	MenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f4_local1
	} )
	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.tabBar:close()
		element.MenuFrame:close()
		element.NextKeyProgress:close()
		element.DoubleLootsmall:close()
		element.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MPAAR.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

