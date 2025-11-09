require( "ui.uieditor.widgets.CAC.MenuChooseClass.CybercoreWidget" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.TacticalRigWidget" )

CoD.CyberComString = {
	"MENU_CONTROL",
	"MENU_MARTIAL",
	"MENU_CHAOS",
	"MENU_DEMO"
}
local cybercoreStringTable = {
	cybercom_repulsorarmor = "MENU_CYBERCOM_RIG_REPULSORARMOR",
	cybercom_proximitydeterrent = "MENU_CYBERCOM_RIG_PROXIMITYDETERRENT",
	cybercom_emergencyreserve = "MENU_CYBERCOM_RIG_EMERGENCYRESERVE",
	cybercom_sensorybuffer = "MENU_CYBERCOM_RIG_SENSORYBUFFER",
	cybercom_playermovement = "MENU_CYBERCOM_RIG_PLAYERMOVEMENT",
	cybercom_copycat = "MENU_CYBERCOM_RIG_COPYCAT",
	cybercom_multicore = "MENU_CYBERCOM_RIG_MULTICORE"
}
local LoadCybercoreLoadout = function ( self, controller )
	local table = "gamedata/weapons/cp/cp_cybercoreLoadout.csv"
	local CLASS_NUM_INDEX = 0
	local CYBERCORE_TYPE_INDEX = 1
	local RIG1_INDEX = 2
	local RIG1_UPGRADED_INDEX = 3
	local RIG2_INDEX = 4
	local RIG2_UPGRADED_INDEX = 5
	local UpdateUpgradeValue = function ( upgradeValue )
		if upgradeValue == 1 then
			return "Upgraded"
		else
			return ""
		end
	end
	
	local classCount = Engine.TableLookup( controller, table, 0, "class_count", 1 )
	for i = 0, classCount - 1, 1 do
		local index = i + 1
		local coreType = Engine.TableLookup( controller, table, CLASS_NUM_INDEX, i, CYBERCORE_TYPE_INDEX )
		local rig1Ref = Engine.TableLookup( controller, table, CLASS_NUM_INDEX, i, RIG1_INDEX )
		local rig1Upgraded = tonumber( Engine.TableLookup( controller, table, CLASS_NUM_INDEX, i, RIG1_UPGRADED_INDEX ) )
		local rig2Ref = Engine.TableLookup( controller, table, CLASS_NUM_INDEX, i, RIG2_INDEX )
		local rig2Upgraded = tonumber( Engine.TableLookup( controller, table, CLASS_NUM_INDEX, i, RIG2_UPGRADED_INDEX ) )
		self.cybercoreLoadoutTable[index] = {}
		if coreType ~= "" then
			self.cybercoreLoadoutTable[index].coreType = Engine.Localize( CoD.CyberComStrings[coreType + 1] )
			self.cybercoreLoadoutTable[index].rig1 = Engine.Localize( cybercoreStringTable[rig1Ref] )
			self.cybercoreLoadoutTable[index].rig1Upgraded = UpdateUpgradeValue( rig1Upgraded )
			self.cybercoreLoadoutTable[index].rig2 = Engine.Localize( cybercoreStringTable[rig2Ref] )
			self.cybercoreLoadoutTable[index].rig2Upgraded = UpdateUpgradeValue( rig2Upgraded )
		end
	end
end

local PreLoadFunc = function ( self, controller )
	if CoD.isCampaign == false then
		return 
	elseif not self.cybercoreLoadoutTable then
		self.cybercoreLoadoutTable = {}
		LoadCybercoreLoadout( self, controller )
		local cybercomLoadoutModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CybercomLoadout" )
		Engine.SetModelValue( Engine.CreateModel( cybercomLoadoutModel, "abilityType" ), "" )
		Engine.SetModelValue( Engine.CreateModel( cybercomLoadoutModel, "rig1" ), "" )
		Engine.SetModelValue( Engine.CreateModel( cybercomLoadoutModel, "rig1_upgraded" ), "" )
		Engine.SetModelValue( Engine.CreateModel( cybercomLoadoutModel, "rig2" ), "" )
		Engine.SetModelValue( Engine.CreateModel( cybercomLoadoutModel, "rig2_upgraded" ), "" )
		self:setModel( cybercomLoadoutModel )
	end
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isCampaign == false then
		return 
	else
		self:registerEventHandler( "update_class", function ( self, event )
			local classModel = CoD.perController[controller].classModel
			if classModel then
				local classNum = Engine.GetModelValue( Engine.GetModel( classModel, "classNum" ) )
				local index = classNum + 1
				Engine.SetModelValue( self:getModel( controller, "abilityType" ), self.cybercoreLoadoutTable[index].coreType )
				Engine.SetModelValue( self:getModel( controller, "rig1" ), self.cybercoreLoadoutTable[index].rig1 )
				Engine.SetModelValue( self:getModel( controller, "rig1_upgraded" ), self.cybercoreLoadoutTable[index].rig1Upgraded )
				Engine.SetModelValue( self:getModel( controller, "rig2" ), self.cybercoreLoadoutTable[index].rig2 )
				Engine.SetModelValue( self:getModel( controller, "rig2_upgraded" ), self.cybercoreLoadoutTable[index].rig2Upgraded )
			end
		end )
	end
end

CoD.CybercomWidget = InheritFrom( LUI.UIElement )
CoD.CybercomWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercomWidget )
	self.id = "CybercomWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 207 )
	self:setTopBottom( true, false, 0, 145 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local cybercoreTypeName = LUI.UIText.new()
	cybercoreTypeName:setLeftRight( true, false, 5, 145 )
	cybercoreTypeName:setTopBottom( true, false, 37, 53 )
	cybercoreTypeName:setRGB( 0.86, 0.89, 0.75 )
	cybercoreTypeName:setAlpha( 0 )
	cybercoreTypeName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	cybercoreTypeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	cybercoreTypeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	cybercoreTypeName:linkToElementModel( self, "abilityType", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			cybercoreTypeName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( cybercoreTypeName )
	self.cybercoreTypeName = cybercoreTypeName
	
	local rig1Name = LUI.UIText.new()
	rig1Name:setLeftRight( true, false, 154, 294 )
	rig1Name:setTopBottom( true, false, 37, 53 )
	rig1Name:setRGB( 0.86, 0.89, 0.75 )
	rig1Name:setAlpha( 0 )
	rig1Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig1Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig1Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rig1Name:linkToElementModel( self, "rig1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rig1Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rig1Name )
	self.rig1Name = rig1Name
	
	local rig2Name = LUI.UIText.new()
	rig2Name:setLeftRight( true, false, 301, 441 )
	rig2Name:setTopBottom( true, false, 37, 53 )
	rig2Name:setRGB( 0.86, 0.89, 0.75 )
	rig2Name:setAlpha( 0 )
	rig2Name:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig2Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig2Name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rig2Name:linkToElementModel( self, "rig2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rig2Name:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rig2Name )
	self.rig2Name = rig2Name
	
	local rig1Upgraded = LUI.UIText.new()
	rig1Upgraded:setLeftRight( true, false, 154, 294 )
	rig1Upgraded:setTopBottom( true, false, 66, 82 )
	rig1Upgraded:setRGB( 0.75, 0.37, 0.29 )
	rig1Upgraded:setAlpha( 0 )
	rig1Upgraded:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig1Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig1Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rig1Upgraded:linkToElementModel( self, "rig1_upgraded", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rig1Upgraded:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rig1Upgraded )
	self.rig1Upgraded = rig1Upgraded
	
	local rig2Upgraded = LUI.UIText.new()
	rig2Upgraded:setLeftRight( true, false, 301, 441 )
	rig2Upgraded:setTopBottom( true, false, 66, 82 )
	rig2Upgraded:setRGB( 0.75, 0.37, 0.29 )
	rig2Upgraded:setAlpha( 0 )
	rig2Upgraded:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	rig2Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	rig2Upgraded:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rig2Upgraded:linkToElementModel( self, "rig2_upgraded", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rig2Upgraded:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( rig2Upgraded )
	self.rig2Upgraded = rig2Upgraded
	
	local weaponAttachmentSpacer = LUI.UIImage.new()
	weaponAttachmentSpacer:setLeftRight( false, false, 27, 43 )
	weaponAttachmentSpacer:setTopBottom( true, true, 0, 0 )
	weaponAttachmentSpacer:setRGB( 0.8, 0.24, 0.24 )
	weaponAttachmentSpacer:setAlpha( 0 )
	weaponAttachmentSpacer:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( weaponAttachmentSpacer )
	self.weaponAttachmentSpacer = weaponAttachmentSpacer
	
	local Cybercore = CoD.CybercoreWidget.new( menu, controller )
	Cybercore:setLeftRight( true, false, 0, 129 )
	Cybercore:setTopBottom( true, false, 0, 145 )
	Cybercore:setRGB( 1, 1, 1 )
	Cybercore:linkToElementModel( self, nil, false, function ( model )
		Cybercore:setModel( model, controller )
	end )
	self:addElement( Cybercore )
	self.Cybercore = Cybercore
	
	local TacticalRig = CoD.TacticalRigWidget.new( menu, controller )
	TacticalRig:setLeftRight( true, false, 145, 207 )
	TacticalRig:setTopBottom( true, false, 0, 145 )
	TacticalRig:setRGB( 1, 1, 1 )
	TacticalRig:linkToElementModel( self, nil, false, function ( model )
		TacticalRig:setModel( model, controller )
	end )
	self:addElement( TacticalRig )
	self.TacticalRig = TacticalRig
	
	Cybercore.navigation = {
		right = TacticalRig
	}
	TacticalRig.navigation = {
		left = Cybercore
	}
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	Cybercore.id = "Cybercore"
	TacticalRig.id = "TacticalRig"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Cybercore:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.Cybercore:close()
		self.TacticalRig:close()
		self.cybercoreTypeName:close()
		self.rig1Name:close()
		self.rig2Name:close()
		self.rig1Upgraded:close()
		self.rig2Upgraded:close()
		CoD.CybercomWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

