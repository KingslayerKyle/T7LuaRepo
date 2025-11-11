require( "ui.uieditor.widgets.Barracks.CombatRecordAccoladeMissionSelectPip" )
require( "ui.uieditor.widgets.BumperButtonWithKeyMouse" )

local PreLoadFunc = function ( self, controller )
	local combatRecordAccoladeModel = Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordAccolades" )
	local mapNameModel = Engine.GetModel( combatRecordAccoladeModel, "mapName" )
	local mapUniqueIdModel = Engine.GetModel( combatRecordAccoladeModel, "unique_id" )
	Engine.SetModelValue( mapNameModel, "CPUI_CP_MI_ETH_PROLOGUE" )
	Engine.SetModelValue( mapUniqueIdModel, 200 )
end

local PostLoadFunc = function ( self, controller )
	local combatRecordAccoladeModel = Engine.GetModel( Engine.GetModelForController( controller ), "CombatRecordAccolades" )
	local mapUniqueIdModel = Engine.GetModel( combatRecordAccoladeModel, "unique_id" )
	self.missionName:subscribeToModel( mapUniqueIdModel, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			local mapData = CoD.BaseUtility.GetMapDataFromMapID( modelValue )
			self.missionName:setText( Engine.Localize( mapData.mapNameCaps ) )
			local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
			Engine.SetModelValue( nextMapNameModel, mapData.rootMapName )
		end
	end )
end

CoD.CombatRecordAccoladeMissionSelector = InheritFrom( LUI.UIElement )
CoD.CombatRecordAccoladeMissionSelector.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CombatRecordAccoladeMissionSelector )
	self.id = "CombatRecordAccoladeMissionSelector"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 67 )
	self.anyChildUsesUpdateState = true
	
	local LBBumperButtonWithKeyMouse = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	LBBumperButtonWithKeyMouse:setLeftRight( 0, 0, 0, 68 )
	LBBumperButtonWithKeyMouse:setTopBottom( 0, 0, 5.5, 50.5 )
	LBBumperButtonWithKeyMouse:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LBBumperButtonWithKeyMouse.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LBBumperButtonWithKeyMouse )
	self.LBBumperButtonWithKeyMouse = LBBumperButtonWithKeyMouse
	
	local RBBumperButtonWithKeyMouse = CoD.BumperButtonWithKeyMouse.new( menu, controller )
	RBBumperButtonWithKeyMouse:setLeftRight( 1, 1, -68, 0 )
	RBBumperButtonWithKeyMouse:setTopBottom( 0, 0, 5.5, 50.5 )
	RBBumperButtonWithKeyMouse.KeyMouseImage:setImage( RegisterImage( "uie_bumperright" ) )
	RBBumperButtonWithKeyMouse:subscribeToGlobalModel( controller, "Controller", "right_shoulder_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RBBumperButtonWithKeyMouse.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( RBBumperButtonWithKeyMouse )
	self.RBBumperButtonWithKeyMouse = RBBumperButtonWithKeyMouse
	
	local missionName = LUI.UIText.new()
	missionName:setLeftRight( 0, 0, 67, 352 )
	missionName:setTopBottom( 0, 0, 7, 45 )
	missionName:setText( Engine.Localize( "CPUI_CP_MI_ETH_PROLOGUE" ) )
	missionName:setTTF( "fonts/default.ttf" )
	missionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	missionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( missionName )
	self.missionName = missionName
	
	local pipList = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	pipList:setLeftRight( 0.5, 0.5, -97, 97 )
	pipList:setTopBottom( 0, 0, 54, 66 )
	pipList:setWidgetType( CoD.CombatRecordAccoladeMissionSelectPip )
	pipList:setHorizontalCount( 14 )
	pipList:setDataSource( "CPMapsList" )
	self:addElement( pipList )
	self.pipList = pipList
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LBBumperButtonWithKeyMouse:close()
		self.RBBumperButtonWithKeyMouse:close()
		self.pipList:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

