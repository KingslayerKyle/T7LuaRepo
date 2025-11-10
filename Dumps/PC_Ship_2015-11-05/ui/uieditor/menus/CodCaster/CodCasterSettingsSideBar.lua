require( "ui.uieditor.widgets.TabbedWidgets.basicTabList" )
require( "ui.uieditor.widgets.CodCaster.CodCasterTabWidget" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disableBlur = true
	f1_arg0.disableDarkenElement = true
	f1_arg0.animateInFromOffset = 396
end

LUI.hudMenuType.CodCasterSettingsSideBar = "hud"
LUI.createMenu.CodCasterSettingsSideBar = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CodCasterSettingsSideBar" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CodCasterSettingsSideBar.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( false, true, -493, 22 )
	black:setTopBottom( true, false, 0, 720 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.95 )
	self:addElement( black )
	self.black = black
	
	local texture = LUI.UIImage.new()
	texture:setLeftRight( false, true, -493, 22 )
	texture:setTopBottom( true, false, 50, 721.05 )
	texture:setAlpha( 0.75 )
	texture:setImage( RegisterImage( "uie_t7_codcaster_texturebacking" ) )
	self:addElement( texture )
	self.texture = texture
	
	local titlebacking = LUI.UIImage.new()
	titlebacking:setLeftRight( false, true, -493, 22 )
	titlebacking:setTopBottom( true, false, -8, 64.05 )
	titlebacking:setImage( RegisterImage( "uie_t7_codcaster_quicksetting" ) )
	self:addElement( titlebacking )
	self.titlebacking = titlebacking
	
	local TabFrame = LUI.UIFrame.new( self, controller, 0, 0, false )
	TabFrame:setLeftRight( false, true, -488, -50 )
	TabFrame:setTopBottom( true, false, 70.05, 711.05 )
	self:addElement( TabFrame )
	self.TabFrame = TabFrame
	
	local FETabIdle = LUI.UIImage.new()
	FETabIdle:setLeftRight( false, true, -493, 22 )
	FETabIdle:setTopBottom( true, false, 30, 65.05 )
	FETabIdle:setAlpha( 0.25 )
	FETabIdle:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FETabIdle:setShaderVector( 0, 0.02, 0.23, 0, 0 )
	FETabIdle:setupNineSliceShader( 8, 8 )
	self:addElement( FETabIdle )
	self.FETabIdle = FETabIdle
	
	local SideBarTabs = CoD.basicTabList.new( self, controller )
	SideBarTabs:setLeftRight( false, true, -691.5, -30.5 )
	SideBarTabs:setTopBottom( true, false, 29.02, 65.05 )
	SideBarTabs:setScale( 0.9 )
	SideBarTabs.grid:setDataSource( "CodCasterSideBarTabs" )
	SideBarTabs.grid:setWidgetType( CoD.CodCasterTabWidget )
	SideBarTabs.grid:setHorizontalCount( 4 )
	SideBarTabs.grid:setSpacing( 1 )
	self:addElement( SideBarTabs )
	self.SideBarTabs = SideBarTabs
	
	TabFrame:linkToElementModel( SideBarTabs.grid, "tabWidget", true, function ( model )
		local tabWidget = Engine.GetModelValue( model )
		if tabWidget then
			TabFrame:changeFrameWidget( tabWidget )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RTRIG, "S", function ( element, menu, controller, model )
		if not IsRepeatButtonPress( model ) then
			ToggleControllerModelValueNumber( controller, "CodCaster.showSettingsSideBar" )
			SaveShoutcasterSettings( self, element, controller )
			GoBack( self, controller )
			SetLuiKeyCatcher( false )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RTRIG, "" )
		if not IsRepeatButtonPress( nil ) then
			return false
		else
			return false
		end
	end, false )
	TabFrame.id = "TabFrame"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SideBarTabs:close()
		element.TabFrame:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCasterSettingsSideBar.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

