require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.BlackMarket.DoubleLoot_small" )
require( "ui.uieditor.widgets.BlackMarket.NextKeyProgress" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtility.SetupUIModels( controller )
end

local PostLoadFunc = function ( self, controller )
	CoD.BlackMarketUtility.DoAARCryptoKeyAnimation( self.NextKeyProgress, controller )
	local pregameRoot = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame" )
	local pregameCloseAARModel = Engine.CreateModel( pregameRoot, "closeAAR" )
	self:subscribeToModel( pregameCloseAARModel, function ( model )
		self:close()
	end, false )
end

LUI.createMenu.MPAAR = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "MPAAR" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MPAAR.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local CategoryListPanel = LUI.UIImage.new()
	CategoryListPanel:setLeftRight( 0.5, 0.5, -960, 960 )
	CategoryListPanel:setTopBottom( 0.5, 0.5, -414, -356 )
	CategoryListPanel:setRGB( 0, 0, 0 )
	self:addElement( CategoryListPanel )
	self.CategoryListPanel = CategoryListPanel
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	TabFrame:setLeftRight( 0, 0, 0, 1920 )
	TabFrame:setTopBottom( 0, 0, 187, 976 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local TitleBacking = LUI.UIImage.new()
	TitleBacking:setLeftRight( 0.5, 0.5, -970.5, 970.5 )
	TitleBacking:setTopBottom( 0.5, 0.5, -540, -356 )
	TitleBacking:setRGB( 0, 0, 0 )
	self:addElement( TitleBacking )
	self.TitleBacking = TitleBacking
	
	local tabBar = CoD.FE_TabBar.new( self, controller )
	tabBar:setLeftRight( 0, 0, 0, 3744 )
	tabBar:setTopBottom( 0, 0, 126, 188 )
	tabBar.Tabs.grid:setDataSource( "AARTabs" )
	self:addElement( tabBar )
	self.tabBar = tabBar
	
	local MenuFrame = CoD.GenericMenuFrame.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MPUI_AAR_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local NextKeyProgress = CoD.NextKeyProgress.new( self, controller )
	NextKeyProgress:setLeftRight( 1, 1, -609, -96 )
	NextKeyProgress:setTopBottom( 0, 0, 43.5, 118.5 )
	self:addElement( NextKeyProgress )
	self.NextKeyProgress = NextKeyProgress
	
	local DoubleLootsmall = CoD.DoubleLoot_small.new( self, controller )
	DoubleLootsmall:setLeftRight( 0, 0, 1200, 1290 )
	DoubleLootsmall:setTopBottom( 0, 0, 38, 128 )
	self:addElement( DoubleLootsmall )
	self.DoubleLootsmall = DoubleLootsmall
	
	TabFrame:linkToElementModel( tabBar.Tabs.grid, "tabWidget", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TabFrame:changeFrameWidget( modelValue )
		end
	end )
	self.resetProperties = function ()
		NextKeyProgress:completeAnimation()
		NextKeyProgress:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Offline = {
			DefaultClip = function ()
				self.resetProperties()
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
		self:updateElementState( self, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "aarType"
		} )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBackAndShowMatchSurveyIfNecessary( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		GoBackAndShowMatchSurveyIfNecessary( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_BACK, nil, function ( element, menu, controller, model )
		GoBackAndShowMatchSurveyIfNecessary( menu, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_BACK, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		if not IsRecentGameBookmarked( controller ) then
			FileshareBookmarkRecentGame( controller )
			UpdateAllMenuButtonPrompts( menu, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsRecentGameBookmarked( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_BOOKMARK_GAME", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.TabFrame:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.tabBar:close()
		self.MenuFrame:close()
		self.NextKeyProgress:close()
		self.DoubleLootsmall:close()
		self.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "MPAAR.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

