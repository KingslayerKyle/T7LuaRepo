require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Barracks.CombatRecordMedalButton" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget_SM" )

local PostLoadFunc = function ( self, controller )
	self:linkToElementModel( self.FETabBar.Tabs.grid, nil, false, function ( model )
		self:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end )
end

LUI.createMenu.CombatRecordMedals = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CombatRecordMedals" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "ChooseDecal"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMedals.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	StartMenuBackground0:setLeftRight( 0, 1, 0, 0 )
	StartMenuBackground0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setAlpha( 0.9 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local NoMedalsText = LUI.UIText.new()
	NoMedalsText:setLeftRight( 0.5, 0.5, -600, 600 )
	NoMedalsText:setTopBottom( 0.5, 0.5, -18, 58 )
	NoMedalsText:setAlpha( 0 )
	NoMedalsText:setText( Engine.Localize( "MENU_NO_MEDALS_EARNED" ) )
	NoMedalsText:setTTF( "fonts/default.ttf" )
	NoMedalsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoMedalsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoMedalsText )
	self.NoMedalsText = NoMedalsText
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( self, controller )
	StartMenuframenoBG0:setLeftRight( 0, 0, 101, 655 )
	StartMenuframenoBG0:setTopBottom( 0, 0, 224, 928 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( 0, 0, 378, 384 )
	featlineleft000:setTopBottom( 0, 0, 403, 973 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( 0, 0, 29, 107 )
	FEMenuLeftGraphics0:setTopBottom( 0, 0, 129, 1055 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( 0, 1, 0, 0 )
	MenuFrame:setTopBottom( 0, 1, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FETabBar = CoD.FE_TabBar.new( self, controller )
	FETabBar:setLeftRight( 0, 0, 0, 3746 )
	FETabBar:setTopBottom( 0, 0, 126, 188 )
	FETabBar.Tabs.grid:setWidgetType( CoD.paintshopTabWidget_SM )
	FETabBar.Tabs.grid:setHorizontalCount( 8 )
	FETabBar.Tabs.grid:setDataSource( "CombatRecordMPMedalTabs" )
	FETabBar:registerEventHandler( "list_active_changed", function ( element, event )
		local retVal = nil
		CombatRecordMedalsTabChanged( self, element, controller )
		return retVal
	end )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	local MedalBacking = LUI.UIImage.new()
	MedalBacking:setLeftRight( 0, 0, 184, 568 )
	MedalBacking:setTopBottom( 0, 0, 274, 658 )
	MedalBacking:setupUIStreamedImage( 0 )
	self:addElement( MedalBacking )
	self.MedalBacking = MedalBacking
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( 0, 0, 184, 568 )
	MedalImage:setTopBottom( 0, 0, 274, 658 )
	MedalImage:setupUIStreamedImage( 0 )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local TimesEarnedHeader = LUI.UITightText.new()
	TimesEarnedHeader:setLeftRight( 0, 0, 116, 500 )
	TimesEarnedHeader:setTopBottom( 0, 0, 838, 871 )
	TimesEarnedHeader:setText( Engine.Localize( "MENU_TIMES_EARNED" ) )
	TimesEarnedHeader:setTTF( "fonts/default.ttf" )
	self:addElement( TimesEarnedHeader )
	self.TimesEarnedHeader = TimesEarnedHeader
	
	local TimesEarned = LUI.UITightText.new()
	TimesEarned:setLeftRight( 0, 0, 116, 500 )
	TimesEarned:setTopBottom( 0, 0, 865, 925 )
	TimesEarned:setRGB( 1, 0.8, 0.4 )
	TimesEarned:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( TimesEarned )
	self.TimesEarned = TimesEarned
	
	local MedalsGrid = LUI.UIList.new( self, controller, 12, 0, nil, false, false, 0, 0, false, false )
	MedalsGrid:makeFocusable()
	MedalsGrid:setLeftRight( 0, 0, 669, 1813 )
	MedalsGrid:setTopBottom( 0, 0, 226, 925 )
	MedalsGrid:setWidgetType( CoD.CombatRecordMedalButton )
	MedalsGrid:setHorizontalCount( 4 )
	MedalsGrid:setVerticalCount( 3 )
	MedalsGrid:setSpacing( 12 )
	MedalsGrid:setVerticalCounter( CoD.verticalCounter )
	MedalsGrid:setDataSource( "CombatRecordMPMedals" )
	self:addElement( MedalsGrid )
	self.MedalsGrid = MedalsGrid
	
	local EmblemName = CoD.WeaponNameWidget.new( self, controller )
	EmblemName:setLeftRight( 0, 0, 116, 594 )
	EmblemName:setTopBottom( 0, 0, 701.5, 752.5 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( 0, 0, 118, 595 )
	EmblemSubtitle:setTopBottom( 0, 0, 759, 789 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	MedalBacking:linkToElementModel( MedalsGrid, "backingLarge", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalBacking:setImage( RegisterImage( modelValue ) )
		end
	end )
	MedalImage:linkToElementModel( MedalsGrid, "iconLarge", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MedalImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	TimesEarned:linkToElementModel( MedalsGrid, "timesEarned", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TimesEarned:setText( Engine.Localize( modelValue ) )
		end
	end )
	EmblemName:linkToElementModel( MedalsGrid, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	EmblemSubtitle:linkToElementModel( MedalsGrid, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemSubtitle:setText( Engine.Localize( AppendString( "_DESC", modelValue ) ) )
		end
	end )
	MenuFrame.navigation = {
		right = MedalsGrid,
		down = MedalsGrid
	}
	MedalsGrid.navigation = {
		left = MenuFrame,
		up = MenuFrame
	}
	self.resetProperties = function ()
		EmblemSubtitle:completeAnimation()
		EmblemName:completeAnimation()
		MedalsGrid:completeAnimation()
		TimesEarned:completeAnimation()
		TimesEarnedHeader:completeAnimation()
		MedalImage:completeAnimation()
		MedalBacking:completeAnimation()
		featlineleft000:completeAnimation()
		StartMenuframenoBG0:completeAnimation()
		NoMedalsText:completeAnimation()
		EmblemSubtitle:setAlpha( 1 )
		EmblemName:setAlpha( 1 )
		MedalsGrid:setAlpha( 1 )
		TimesEarned:setAlpha( 1 )
		TimesEarnedHeader:setAlpha( 1 )
		MedalImage:setAlpha( 1 )
		MedalBacking:setAlpha( 1 )
		featlineleft000:setAlpha( 1 )
		StartMenuframenoBG0:setAlpha( 1 )
		NoMedalsText:setLeftRight( 0.5, 0.5, -600, 600 )
		NoMedalsText:setTopBottom( 0.5, 0.5, -18, 58 )
		NoMedalsText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoMedals = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				NoMedalsText:completeAnimation()
				self.NoMedalsText:setLeftRight( 0.5, 0.5, -599.5, 599.5 )
				self.NoMedalsText:setTopBottom( 0.5, 0.5, -23.5, 23.5 )
				self.NoMedalsText:setAlpha( 1 )
				self.clipFinished( NoMedalsText, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 0 )
				self.clipFinished( StartMenuframenoBG0, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
				MedalBacking:completeAnimation()
				self.MedalBacking:setAlpha( 0 )
				self.clipFinished( MedalBacking, {} )
				MedalImage:completeAnimation()
				self.MedalImage:setAlpha( 0 )
				self.clipFinished( MedalImage, {} )
				TimesEarnedHeader:completeAnimation()
				self.TimesEarnedHeader:setAlpha( 0 )
				self.clipFinished( TimesEarnedHeader, {} )
				TimesEarned:completeAnimation()
				self.TimesEarned:setAlpha( 0 )
				self.clipFinished( TimesEarned, {} )
				MedalsGrid:completeAnimation()
				self.MedalsGrid:setAlpha( 0 )
				self.clipFinished( MedalsGrid, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setAlpha( 0 )
				self.clipFinished( EmblemName, {} )
				EmblemSubtitle:completeAnimation()
				self.EmblemSubtitle:setAlpha( 0 )
				self.clipFinished( EmblemSubtitle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoMedals",
			condition = function ( menu, element, event )
				return not ListElementHasElements( self, "MedalsGrid" )
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	MenuFrame.id = "MenuFrame"
	MedalsGrid.id = "MedalsGrid"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.MedalsGrid:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuBackground0:close()
		self.StartMenuframenoBG0:close()
		self.FEMenuLeftGraphics0:close()
		self.MenuFrame:close()
		self.FETabBar:close()
		self.MedalsGrid:close()
		self.EmblemName:close()
		self.MedalBacking:close()
		self.MedalImage:close()
		self.TimesEarned:close()
		self.EmblemSubtitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordMedals.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

