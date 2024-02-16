require( "ui.uieditor.widgets.HUD.T6AmmoWidget.T6AmmoEquipmentListItem" )

DataSources.T6AmmoEquipmentLethals = DataSourceHelpers.ListSetup( "T6AmmoEquipmentLethals", function ( controller, element )
	local primaryOffhand = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhand" ) )
	local primaryOffhandCount = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ) )

	if primaryOffhand == "uie_t7_zm_hud_inv_icnlthl" then
		primaryOffhand = "grenadeicon"
	end

	local lethals = {}

	if primaryOffhand ~= nil and primaryOffhandCount ~= nil then
		for index = 1, primaryOffhandCount do
			table.insert( lethals, {
				models = {
					image = primaryOffhand,
					alpha = 0.5
				}
			} )
		end

		if next( lethals ) ~= nil then
			lethals[1]["models"].alpha = 1
		end
	end

	return lethals
end, true )

DataSources.T6AmmoEquipmentTacticals = DataSourceHelpers.ListSetup( "T6AmmoEquipmentTacticals", function ( controller, element )
	local secondaryOffhand = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ) )
	local secondaryOffhandCount = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ) )

	if secondaryOffhand == "hud_cymbal_monkey_bo3" then
		secondaryOffhand = "hud_cymbal_monkey"
	end

	local tacticals = {}

	if secondaryOffhand ~= nil and secondaryOffhandCount ~= nil then
		for index = 1, secondaryOffhandCount do
			table.insert( tacticals, {
				models = {
					image = secondaryOffhand,
					alpha = 0.5
				}
			} )
		end

		if next( tacticals ) ~= nil then
			tacticals[1]["models"].alpha = 1
		end
	end

	return tacticals
end, true )

CoD.T6AmmoEquipment = InheritFrom( LUI.UIElement )
CoD.T6AmmoEquipment.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6AmmoEquipment )
	self.id = "T6AmmoEquipment"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.LethalImage = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	self.LethalImage:makeFocusable()
	self.LethalImage:setLeftRight( false, true, 0, 0 )
	self.LethalImage:setTopBottom( false, true, 0, 0 )
	self.LethalImage:setWidgetType( CoD.T6AmmoEquipmentListItem )
	self.LethalImage:setHorizontalCount( 4 )
	self.LethalImage:setDataSource( "T6AmmoEquipmentLethals" )
	self.LethalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhand" ), function ( model )
		self.LethalImage:updateDataSource()
	end )
	self.LethalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		self.LethalImage:updateDataSource()
	end )
	self:addElement( self.LethalImage )

	self.TacticalImage = LUI.UIList.new( menu, controller, 0, 0, nil, false, false, 0, 0, false, false )
	self.TacticalImage:makeFocusable()
	self.TacticalImage:setLeftRight( false, true, 0, -108.5 )
	self.TacticalImage:setTopBottom( false, true, 0, 0 )
	self.TacticalImage:setWidgetType( CoD.T6AmmoEquipmentListItem )
	self.TacticalImage:setHorizontalCount( 4 )
	self.TacticalImage:setDataSource( "T6AmmoEquipmentTacticals" )
	self.TacticalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhand" ), function ( model )
		self.TacticalImage:updateDataSource()
	end )
	self.TacticalImage:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		self.TacticalImage:updateDataSource()
	end )
	self:addElement( self.TacticalImage )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LethalImage:close()
		element.TacticalImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
