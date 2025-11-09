require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrameIdentity" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TabBar" )
require( "ui.uieditor.widgets.TabbedWidgets.paintshopTabWidget_SM" )
require( "ui.uieditor.widgets.Barracks.CombatRecordMedalButton" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:linkToElementModel( f1_arg0.FETabBar.Tabs.grid, nil, false, function ( model )
		f1_arg0:processEvent( {
			name = "update_state",
			controller = f1_arg1
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordMedals.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( self, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	StartMenuBackground0:mergeStateConditions( {
		{
			stateName = "InGame",
			condition = function ( menu, element, event )
				return IsInGame()
			end
		}
	} )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setAlpha( 0.9 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local NoMedalsText = LUI.UIText.new()
	NoMedalsText:setLeftRight( false, false, -400, 400 )
	NoMedalsText:setTopBottom( false, false, -12.5, 38.5 )
	NoMedalsText:setAlpha( 0 )
	NoMedalsText:setText( Engine.Localize( "MENU_NO_MEDALS_EARNED" ) )
	NoMedalsText:setTTF( "fonts/default.ttf" )
	NoMedalsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	NoMedalsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( NoMedalsText )
	self.NoMedalsText = NoMedalsText
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( self, controller )
	StartMenuframenoBG0:setLeftRight( true, false, 67.5, 436.5 )
	StartMenuframenoBG0:setTopBottom( true, false, 149, 618.5 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( true, false, 252, 256 )
	featlineleft000:setTopBottom( true, false, 268.5, 648.5 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local FEMenuLeftGraphics0 = CoD.FE_Menu_LeftGraphics.new( self, controller )
	FEMenuLeftGraphics0:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics0:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics0 )
	self.FEMenuLeftGraphics0 = FEMenuLeftGraphics0
	
	local MenuFrame = CoD.GenericMenuFrameIdentity.new( self, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_BARRACKS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local FETabBar = CoD.FE_TabBar.new( self, controller )
	FETabBar:setLeftRight( true, false, 0, 2497 )
	FETabBar:setTopBottom( true, false, 84, 125 )
	FETabBar.Tabs.grid:setWidgetType( CoD.paintshopTabWidget_SM )
	FETabBar.Tabs.grid:setHorizontalCount( 8 )
	FETabBar.Tabs.grid:setDataSource( "CombatRecordMPMedalTabs" )
	FETabBar:registerEventHandler( "list_active_changed", function ( element, event )
		local f5_local0 = nil
		CombatRecordMedalsTabChanged( self, element, controller )
		return f5_local0
	end )
	self:addElement( FETabBar )
	self.FETabBar = FETabBar
	
	local MedalBacking = LUI.UIImage.new()
	MedalBacking:setLeftRight( true, false, 122.5, 378.5 )
	MedalBacking:setTopBottom( true, false, 182.5, 438.5 )
	MedalBacking:setupUIStreamedImage( 0 )
	self:addElement( MedalBacking )
	self.MedalBacking = MedalBacking
	
	local MedalImage = LUI.UIImage.new()
	MedalImage:setLeftRight( true, false, 122.5, 378.5 )
	MedalImage:setTopBottom( true, false, 182.5, 438.5 )
	MedalImage:setupUIStreamedImage( 0 )
	self:addElement( MedalImage )
	self.MedalImage = MedalImage
	
	local TimesEarnedHeader = LUI.UITightText.new()
	TimesEarnedHeader:setLeftRight( true, false, 77.5, 333.5 )
	TimesEarnedHeader:setTopBottom( true, false, 558.63, 580.63 )
	TimesEarnedHeader:setText( Engine.Localize( "MENU_TIMES_EARNED" ) )
	TimesEarnedHeader:setTTF( "fonts/default.ttf" )
	self:addElement( TimesEarnedHeader )
	self.TimesEarnedHeader = TimesEarnedHeader
	
	local TimesEarned = LUI.UITightText.new()
	TimesEarned:setLeftRight( true, false, 77, 333 )
	TimesEarned:setTopBottom( true, false, 576.63, 616.63 )
	TimesEarned:setRGB( 1, 0.8, 0.4 )
	TimesEarned:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( TimesEarned )
	self.TimesEarned = TimesEarned
	
	local MedalsGrid = LUI.UIList.new( self, controller, 8, 0, nil, false, false, 0, 0, false, false )
	MedalsGrid:makeFocusable()
	MedalsGrid:setLeftRight( true, false, 445.5, 1209.5 )
	MedalsGrid:setTopBottom( true, false, 151, 617 )
	MedalsGrid:setWidgetType( CoD.CombatRecordMedalButton )
	MedalsGrid:setHorizontalCount( 4 )
	MedalsGrid:setVerticalCount( 3 )
	MedalsGrid:setSpacing( 8 )
	MedalsGrid:setVerticalCounter( CoD.verticalCounter )
	MedalsGrid:setDataSource( "CombatRecordMPMedals" )
	self:addElement( MedalsGrid )
	self.MedalsGrid = MedalsGrid
	
	local EmblemName = CoD.WeaponNameWidget.new( self, controller )
	EmblemName:setLeftRight( true, false, 77.5, 396 )
	EmblemName:setTopBottom( true, false, 467.69, 501.69 )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( true, false, 78.5, 396.5 )
	EmblemSubtitle:setTopBottom( true, false, 505.69, 525.69 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	MedalBacking:linkToElementModel( MedalsGrid, "backingLarge", true, function ( model )
		local backingLarge = Engine.GetModelValue( model )
		if backingLarge then
			MedalBacking:setImage( RegisterImage( backingLarge ) )
		end
	end )
	MedalImage:linkToElementModel( MedalsGrid, "iconLarge", true, function ( model )
		local iconLarge = Engine.GetModelValue( model )
		if iconLarge then
			MedalImage:setImage( RegisterImage( iconLarge ) )
		end
	end )
	TimesEarned:linkToElementModel( MedalsGrid, "timesEarned", true, function ( model )
		local timesEarned = Engine.GetModelValue( model )
		if timesEarned then
			TimesEarned:setText( Engine.Localize( timesEarned ) )
		end
	end )
	EmblemName:linkToElementModel( MedalsGrid, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			EmblemName.weaponNameLabel:setText( Engine.Localize( name ) )
		end
	end )
	EmblemSubtitle:linkToElementModel( MedalsGrid, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			EmblemSubtitle:setText( Engine.Localize( AppendString( "_DESC", name ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				NoMedalsText:completeAnimation()
				self.NoMedalsText:setAlpha( 0 )
				self.clipFinished( NoMedalsText, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 1 )
				self.clipFinished( featlineleft000, {} )
				MedalBacking:completeAnimation()
				self.MedalBacking:setAlpha( 1 )
				self.clipFinished( MedalBacking, {} )
				MedalImage:completeAnimation()
				self.MedalImage:setAlpha( 1 )
				self.clipFinished( MedalImage, {} )
				TimesEarnedHeader:completeAnimation()
				self.TimesEarnedHeader:setAlpha( 1 )
				self.clipFinished( TimesEarnedHeader, {} )
				TimesEarned:completeAnimation()
				self.TimesEarned:setAlpha( 1 )
				self.clipFinished( TimesEarned, {} )
				MedalsGrid:completeAnimation()
				self.MedalsGrid:setAlpha( 1 )
				self.clipFinished( MedalsGrid, {} )
				EmblemName:completeAnimation()
				self.EmblemName:setAlpha( 1 )
				self.clipFinished( EmblemName, {} )
				EmblemSubtitle:completeAnimation()
				self.EmblemSubtitle:setAlpha( 1 )
				self.clipFinished( EmblemSubtitle, {} )
			end
		},
		NoMedals = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				NoMedalsText:completeAnimation()
				self.NoMedalsText:setLeftRight( false, false, -399.83, 399.83 )
				self.NoMedalsText:setTopBottom( false, false, -15.61, 15.61 )
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
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f14_local0 = nil
		CombatRecordUpdateSelfIdentityWidget( self, controller )
		if not f14_local0 then
			f14_local0 = self:dispatchEventToChildren( event )
		end
		return f14_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.StartMenuframenoBG0:close()
		element.FEMenuLeftGraphics0:close()
		element.MenuFrame:close()
		element.FETabBar:close()
		element.MedalsGrid:close()
		element.EmblemName:close()
		element.MedalBacking:close()
		element.MedalImage:close()
		element.TimesEarned:close()
		element.EmblemSubtitle:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordMedals.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

