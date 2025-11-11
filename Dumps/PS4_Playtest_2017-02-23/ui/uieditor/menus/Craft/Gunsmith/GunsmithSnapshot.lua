require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithAttachmentListContainer" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithBO3Logo" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSelfIdentity" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithSnapshotControls" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithStatsAndWeaponLevel" )
require( "ui.uieditor.widgets.Craft.Gunsmith.GunsmithVariantNameHeader" )
require( "ui.uieditor.widgets.Gunsmith.FEMenuLargeGraphics" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	self:setModel( variantModel )
	self.disableLeaderChangePopupShutdown = true
	local model = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" )
	if model then
		Engine.SetModelValue( model, 1 )
	end
end

LUI.createMenu.GunsmithSnapshot = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "GunsmithSnapshot" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "GunsmithSnapshot.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FEMenuLargeGraphics = CoD.FEMenuLargeGraphics.new( self, controller )
	FEMenuLargeGraphics:setLeftRight( 0, 0, 1837, 1891 )
	FEMenuLargeGraphics:setTopBottom( 0, 0, 49, 977 )
	FEMenuLargeGraphics:setYRot( 180 )
	self:addElement( FEMenuLargeGraphics )
	self.FEMenuLargeGraphics = FEMenuLargeGraphics
	
	local FEMenuLargeGraphics0 = CoD.FEMenuLargeGraphics.new( self, controller )
	FEMenuLargeGraphics0:setLeftRight( 0, 0, 42, 96 )
	FEMenuLargeGraphics0:setTopBottom( 0, 0, 49, 977 )
	self:addElement( FEMenuLargeGraphics0 )
	self.FEMenuLargeGraphics0 = FEMenuLargeGraphics0
	
	local snapshotControls = CoD.GunsmithSnapshotControls.new( self, controller )
	snapshotControls:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 0 )
			end
		}
	} )
	snapshotControls:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" ), function ( model )
		self:updateElementState( snapshotControls, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.ShowControls"
		} )
	end )
	snapshotControls:setLeftRight( 0, 1, 0, 0 )
	snapshotControls:setTopBottom( 1, 1, -1080, 0 )
	snapshotControls:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( snapshotControls )
	self.snapshotControls = snapshotControls
	
	local bo3logo = CoD.GunsmithBO3Logo.new( self, controller )
	bo3logo:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.BO3Logo", 0 )
			end
		}
	} )
	bo3logo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.BO3Logo" ), function ( model )
		self:updateElementState( bo3logo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.BO3Logo"
		} )
	end )
	bo3logo:setLeftRight( 0, 0, 1509, 1879 )
	bo3logo:setTopBottom( 0, 0, 832, 992 )
	bo3logo:setScale( 0.8 )
	self:addElement( bo3logo )
	self.bo3logo = bo3logo
	
	local selfIdentity = CoD.GunsmithSelfIdentity.new( self, controller )
	selfIdentity:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.PlayerID", 0 )
			end
		}
	} )
	selfIdentity:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.PlayerID" ), function ( model )
		self:updateElementState( selfIdentity, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.PlayerID"
		} )
	end )
	selfIdentity:setLeftRight( 0, 0, 96, 618 )
	selfIdentity:setTopBottom( 0, 0, 854, 954 )
	self:addElement( selfIdentity )
	self.selfIdentity = selfIdentity
	
	local attachmentList = CoD.GunsmithAttachmentListContainer.new( self, controller )
	attachmentList:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.AttachmentIcons", 0 )
			end
		}
	} )
	attachmentList:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.AttachmentIcons" ), function ( model )
		self:updateElementState( attachmentList, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.AttachmentIcons"
		} )
	end )
	attachmentList:setLeftRight( 0, 0, 87, 565 )
	attachmentList:setTopBottom( 0, 0, 116, 173 )
	attachmentList:subscribeToGlobalModel( controller, "GunsmithSelectedVariantAttachmentIconList", nil, function ( model )
		attachmentList:setModel( model, controller )
	end )
	attachmentList:subscribeToGlobalModel( controller, "GunsmithSelectedVariantAttachmentIconList", "listDataSource", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			attachmentList.attachmentList:setDataSource( modelValue )
		end
	end )
	self:addElement( attachmentList )
	self.attachmentList = attachmentList
	
	local variantNameHeader = CoD.GunsmithVariantNameHeader.new( self, controller )
	variantNameHeader:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.WeaponName", 0 )
			end
		}
	} )
	variantNameHeader:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.WeaponName" ), function ( model )
		self:updateElementState( variantNameHeader, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.WeaponName"
		} )
	end )
	variantNameHeader:setLeftRight( 0, 0, 96, 722 )
	variantNameHeader:setTopBottom( 0, 0, 53, 127 )
	variantNameHeader:linkToElementModel( self, nil, false, function ( model )
		variantNameHeader:setModel( model, controller )
	end )
	self:addElement( variantNameHeader )
	self.variantNameHeader = variantNameHeader
	
	local statsAndWeaponLevel = CoD.GunsmithStatsAndWeaponLevel.new( self, controller )
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
		self:updateElementState( statsAndWeaponLevel, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.Stats"
		} )
	end )
	statsAndWeaponLevel:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.WeaponLevel" ), function ( model )
		self:updateElementState( statsAndWeaponLevel, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.WeaponLevel"
		} )
	end )
	statsAndWeaponLevel:setLeftRight( 1, 1, -944.5, -95.5 )
	statsAndWeaponLevel:setTopBottom( 0, 0, 54, 268 )
	statsAndWeaponLevel:linkToElementModel( self, nil, false, function ( model )
		statsAndWeaponLevel:setModel( model, controller )
	end )
	self:addElement( statsAndWeaponLevel )
	self.statsAndWeaponLevel = statsAndWeaponLevel
	
	local XCamMouseControl = CoD.XCamMouseControl.new( self, controller )
	XCamMouseControl:setLeftRight( 0, 1, 150, -150 )
	XCamMouseControl:setTopBottom( 0, 1, 335, -297 )
	self:addElement( XCamMouseControl )
	self.XCamMouseControl = XCamMouseControl
	
	local Pixel2001 = LUI.UIImage.new()
	Pixel2001:setLeftRight( 0, 0, 42, 96 )
	Pixel2001:setTopBottom( 0, 0, 54, 60 )
	Pixel2001:setYRot( -180 )
	Pixel2001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2001 )
	self.Pixel2001 = Pixel2001
	
	snapshotControls.navigation = {
		left = selfIdentity,
		up = attachmentList,
		down = selfIdentity
	}
	selfIdentity.navigation = {
		up = snapshotControls,
		right = snapshotControls
	}
	attachmentList.navigation = {
		right = snapshotControls,
		down = snapshotControls
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.ShowControls"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.SessionMode"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.Stats" ), function ( model )
		local element = self
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "GunsmithSnapshot.Stats"
		}
		CoD.Menu.UpdateButtonShownState( element, self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE )
	end )
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, nil, function ( element, menu, controller, model )
		Gunsmith_SnapshotToggleControlsUI( menu, element, controller )
		PlaySoundAlias( "uin_paint_decal_nav" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE, "MENU_GUNSMITH_SNAPSHOT_TOGGLE_UI", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		if IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 1 ) and IsGlobalModelValueEqualToEnum( element, controller, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_MULTIPLAYER ) and IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.Stats", 1 ) then
			Gunsmith_SnapshotToggleStatsFilter( menu, element, controller )
			return true
		elseif IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 1 ) and IsGlobalModelValueEqualToEnum( element, controller, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_CAMPAIGN ) and IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.Stats", 1 ) then
			Gunsmith_SnapshotToggleStatsFilter( menu, element, controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 1 ) and IsGlobalModelValueEqualToEnum( element, controller, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_MULTIPLAYER ) and IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.Stats", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_GUNSMITH_STATS_FILTER_MULTIPLAYER", nil )
			return true
		elseif IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.ShowControls", 1 ) and IsGlobalModelValueEqualToEnum( element, controller, "GunsmithSnapshot.SessionMode", Enum.eModes.MODE_CAMPAIGN ) and IsGlobalModelValueEqualTo( element, controller, "GunsmithSnapshot.Stats", 1 ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_GUNSMITH_STATS_FILTER_CAMPAIGN", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "PLATFORM_EMBLEM_ROTATE_LAYER", nil )
		return true
	end, false )
	snapshotControls:setModel( self.buttonModel, controller )
	snapshotControls.id = "snapshotControls"
	selfIdentity.id = "selfIdentity"
	attachmentList.id = "attachmentList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.snapshotControls:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEMenuLargeGraphics:close()
		self.FEMenuLargeGraphics0:close()
		self.snapshotControls:close()
		self.bo3logo:close()
		self.selfIdentity:close()
		self.attachmentList:close()
		self.variantNameHeader:close()
		self.statsAndWeaponLevel:close()
		self.XCamMouseControl:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "GunsmithSnapshot.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

