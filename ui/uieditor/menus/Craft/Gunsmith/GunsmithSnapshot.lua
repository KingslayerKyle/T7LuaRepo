-- 09e8c466b0f703a3c2d29746d25a2d16
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Gunsmith.FEMenuLargeGraphics" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSnapshotControls" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithBO3Logo" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSelfIdentity" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentListContainer" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantNameHeader" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatsAndWeaponLevel" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].gunsmithVariantModel )
	self.disableLeaderChangePopupShutdown = true
	local f1_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" )
	if f1_local0 then
		Engine.SetModelValue( f1_local0, 1 )
	end
end

LUI.createMenu.GunsmithSnapshot = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithSnapshot" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithSnapshot.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FEMenuLargeGraphics = CoD.FEMenuLargeGraphics.new( f2_local1, controller )
	FEMenuLargeGraphics:setLeftRight( true, false, 1225, 1261 )
	FEMenuLargeGraphics:setTopBottom( true, false, 32.66, 651 )
	FEMenuLargeGraphics:setYRot( 180 )
	self:addElement( FEMenuLargeGraphics )
	self.FEMenuLargeGraphics = FEMenuLargeGraphics
	
	local FEMenuLargeGraphics0 = CoD.FEMenuLargeGraphics.new( f2_local1, controller )
	FEMenuLargeGraphics0:setLeftRight( true, false, 28, 64 )
	FEMenuLargeGraphics0:setTopBottom( true, false, 32.66, 651 )
	self:addElement( FEMenuLargeGraphics0 )
	self.FEMenuLargeGraphics0 = FEMenuLargeGraphics0
	
	local snapshotControls = CoD.GunsmithSnapshotControls.new( f2_local1, controller )
	snapshotControls:setLeftRight( true, true, 0, 0 )
	snapshotControls:setTopBottom( false, true, -720, 0 )
	snapshotControls:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	snapshotControls:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 0 )
			end
		}
	} )
	snapshotControls:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" ), function ( model )
		f2_local1:updateElementState( snapshotControls, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.ShowControls"
		} )
	end )
	self:addElement( snapshotControls )
	self.snapshotControls = snapshotControls
	
	local bo3logo = CoD.GunsmithBO3Logo.new( f2_local1, controller )
	bo3logo:setLeftRight( true, false, 1006, 1253 )
	bo3logo:setTopBottom( true, false, 554.6, 661 )
	bo3logo:setScale( 0.8 )
	bo3logo:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.BO3Logo", 0 )
			end
		}
	} )
	bo3logo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.BO3Logo" ), function ( model )
		f2_local1:updateElementState( bo3logo, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.BO3Logo"
		} )
	end )
	self:addElement( bo3logo )
	self.bo3logo = bo3logo
	
	local selfIdentity = CoD.GunsmithSelfIdentity.new( f2_local1, controller )
	selfIdentity:setLeftRight( true, false, 64, 412 )
	selfIdentity:setTopBottom( true, false, 569, 636 )
	selfIdentity:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.PlayerID", 0 )
			end
		}
	} )
	selfIdentity:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.PlayerID" ), function ( model )
		f2_local1:updateElementState( selfIdentity, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.PlayerID"
		} )
	end )
	self:addElement( selfIdentity )
	self.selfIdentity = selfIdentity
	
	local attachmentList = CoD.GunsmithAttachmentListContainer.new( f2_local1, controller )
	attachmentList:setLeftRight( true, false, 58, 377 )
	attachmentList:setTopBottom( true, false, 77.66, 115.66 )
	attachmentList:subscribeToGlobalModel( controller, "GunsmithSelectedVariantAttachmentIconList", nil, function ( model )
		attachmentList:setModel( model, controller )
	end )
	attachmentList:subscribeToGlobalModel( controller, "GunsmithSelectedVariantAttachmentIconList", "listDataSource", function ( model )
		local listDataSource = Engine.GetModelValue( model )
		if listDataSource then
			attachmentList.attachmentList:setDataSource( listDataSource )
		end
	end )
	attachmentList:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.AttachmentIcons", 0 )
			end
		}
	} )
	attachmentList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.AttachmentIcons" ), function ( model )
		f2_local1:updateElementState( attachmentList, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.AttachmentIcons"
		} )
	end )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local variantNameHeader = CoD.GunsmithVariantNameHeader.new( f2_local1, controller )
	variantNameHeader:setLeftRight( true, false, 64, 481 )
	variantNameHeader:setTopBottom( true, false, 35.66, 84.66 )
	variantNameHeader:linkToElementModel( self, nil, false, function ( model )
		variantNameHeader:setModel( model, controller )
	end )
	variantNameHeader:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.WeaponName", 0 )
			end
		}
	} )
	variantNameHeader:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.WeaponName" ), function ( model )
		f2_local1:updateElementState( variantNameHeader, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.WeaponName"
		} )
	end )
	self:addElement( variantNameHeader )
	self.variantNameHeader = variantNameHeader
	
	local statsAndWeaponLevel = CoD.GunsmithStatsAndWeaponLevel.new( f2_local1, controller )
	statsAndWeaponLevel:setLeftRight( false, true, -630, -64 )
	statsAndWeaponLevel:setTopBottom( true, false, 36, 179 )
	statsAndWeaponLevel:linkToElementModel( self, nil, false, function ( model )
		statsAndWeaponLevel:setModel( model, controller )
	end )
	statsAndWeaponLevel:mergeStateConditions( {
		{
			stateName = "StatsAndWeaponLevelHide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.Stats", 0 ) and IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.WeaponLevel", 0 )
			end
		},
		{
			stateName = "StatsHide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.Stats", 0 )
			end
		},
		{
			stateName = "WeaponLevelHide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.WeaponLevel", 0 )
			end
		}
	} )
	statsAndWeaponLevel:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.Stats" ), function ( model )
		f2_local1:updateElementState( statsAndWeaponLevel, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.Stats"
		} )
	end )
	statsAndWeaponLevel:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.WeaponLevel" ), function ( model )
		f2_local1:updateElementState( statsAndWeaponLevel, {
			name = "model_validation",
			menu = f2_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.WeaponLevel"
		} )
	end )
	self:addElement( statsAndWeaponLevel )
	self.statsAndWeaponLevel = statsAndWeaponLevel
	
	local XCamMouseControl = CoD.XCamMouseControl.new( f2_local1, controller )
	XCamMouseControl:setLeftRight( true, true, 100, -100 )
	XCamMouseControl:setTopBottom( true, true, 223, -198 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( true, false, 28, 64 )
	Pixel2001:setTopBottom( true, false, 36, 40 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	snapshotControls.navigation = {
		left = attachmentList,
		up = attachmentList
	}
	attachmentList.navigation = {
		right = snapshotControls,
		down = snapshotControls
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" ), function ( model )
		local f23_local0 = self
		local f23_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.ShowControls"
		}
		CoD.Menu.UpdateButtonShownState( f23_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" ), function ( model )
		local f24_local0 = self
		local f24_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.SessionMode"
		}
		CoD.Menu.UpdateButtonShownState( f24_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.Stats" ), function ( model )
		local f25_local0 = self
		local f25_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.Stats"
		}
		CoD.Menu.UpdateButtonShownState( f25_local0, f2_local1, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( f2_local1, self, controller )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f26_local0 = nil
		if not CanShowWeaponStatsForCampaign( self, controller ) then
			SetGlobalModelValueArg( "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_MULTIPLAYER )
		end
		if not f26_local0 then
			f26_local0 = element:dispatchEventToChildren( event )
		end
		return f26_local0
	end )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
		GoBack( self, f27_arg2 )
		return true
	end, function ( f28_arg0, f28_arg1, f28_arg2 )
		CoD.Menu.SetButtonLabel( f28_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "T", function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
		Gunsmith_SnapshotToggleControlsUI( f29_arg1, f29_arg0, f29_arg2 )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( f30_arg0, f30_arg1, f30_arg2 )
		CoD.Menu.SetButtonLabel( f30_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_GUNSMITH_SNAPSHOT_TOGGLE_UI" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "F", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
		if IsGlobalModelValueEqualTo( f31_arg0, f31_arg2, "GunsmithSnapshot.ShowControls", 1 ) and IsGlobalModelValueEqualToEnum( f31_arg0, f31_arg2, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_MULTIPLAYER ) and IsGlobalModelValueEqualTo( f31_arg0, f31_arg2, "GunsmithSnapshot.Stats", 1 ) and CanShowWeaponStatsForCampaign( self, f31_arg2 ) then
			Gunsmith_SnapshotToggleStatsFilter( f31_arg1, f31_arg0, f31_arg2 )
			return true
		elseif IsGlobalModelValueEqualTo( f31_arg0, f31_arg2, "GunsmithSnapshot.ShowControls", 1 ) and IsGlobalModelValueEqualToEnum( f31_arg0, f31_arg2, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_CAMPAIGN ) and IsGlobalModelValueEqualTo( f31_arg0, f31_arg2, "GunsmithSnapshot.Stats", 1 ) then
			Gunsmith_SnapshotToggleStatsFilter( f31_arg1, f31_arg0, f31_arg2 )
			return true
		else
			
		end
	end, function ( f32_arg0, f32_arg1, f32_arg2 )
		if IsGlobalModelValueEqualTo( f32_arg0, f32_arg2, "GunsmithSnapshot.ShowControls", 1 ) and IsGlobalModelValueEqualToEnum( f32_arg0, f32_arg2, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_MULTIPLAYER ) and IsGlobalModelValueEqualTo( f32_arg0, f32_arg2, "GunsmithSnapshot.Stats", 1 ) and CanShowWeaponStatsForCampaign( self, f32_arg2 ) then
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_GUNSMITH_STATS_FILTER_MULTIPLAYER" )
			return true
		elseif IsGlobalModelValueEqualTo( f32_arg0, f32_arg2, "GunsmithSnapshot.ShowControls", 1 ) and IsGlobalModelValueEqualToEnum( f32_arg0, f32_arg2, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_CAMPAIGN ) and IsGlobalModelValueEqualTo( f32_arg0, f32_arg2, "GunsmithSnapshot.Stats", 1 ) then
			CoD.Menu.SetButtonLabel( f32_arg1, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_GUNSMITH_STATS_FILTER_CAMPAIGN" )
			return true
		else
			return false
		end
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		return true
	end, function ( f34_arg0, f34_arg1, f34_arg2 )
		CoD.Menu.SetButtonLabel( f34_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	f2_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
		return true
	end, function ( f36_arg0, f36_arg1, f36_arg2 )
		CoD.Menu.SetButtonLabel( f36_arg1, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER" )
		return true
	end, false )
	snapshotControls:setModel( self.buttonModel, controller )
	snapshotControls.id = "snapshotControls"
	attachmentList.id = "attachmentList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.snapshotControls:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMenuLargeGraphics:close()
		element.FEMenuLargeGraphics0:close()
		element.snapshotControls:close()
		element.bo3logo:close()
		element.selfIdentity:close()
		element.attachmentList:close()
		element.variantNameHeader:close()
		element.statsAndWeaponLevel:close()
		element.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithSnapshot.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

