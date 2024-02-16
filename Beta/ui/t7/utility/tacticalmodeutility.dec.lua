CoD.TacticalModeUtility = {}
CoD.TacticalModeUtility.CreateTacticalModeWidgets = function ( HUD, controller )
	if not CoD.TacticalModeWidget then
		DebugPrint( "Cannot create TacticalModeWidget since it hasn't been included" )
		return 
	end
	local worldIndicatorModel = DataSources.WorldSpaceIndicators.getModel( controller )
	if worldIndicatorModel then
		local tacticalModeWidgetModels = {
			{
				name = "distance",
				defaultValue = 0
			},
			{
				name = "isShooting",
				defaultValue = false
			},
			{
				name = "isShootingPlayer",
				defaultValue = false
			},
			{
				name = "isManeuvering",
				defaultValue = false
			},
			{
				name = "isSuppressed",
				defaultValue = false
			},
			{
				name = "health",
				defaultValue = 0
			},
			{
				name = "archetypeImage",
				defaultValue = ""
			},
			{
				name = "alpha",
				defaultValue = 0
			},
			{
				name = "showDamage",
				defaultValue = true
			}
		}
		local createAnother = true
		local index = 0
		while createAnother do
			local newWidgetModel = Engine.CreateModel( worldIndicatorModel, "tacticalMode" .. index )
			for _, models in ipairs( tacticalModeWidgetModels ) do
				LUI.CreateModelAndInitialize( newWidgetModel, models.name, REG11.defaultValue )
			end
			local newTacticalWidget = CoD.TacticalModeWidget.new( HUD, controller )
			newTacticalWidget:setModel( newWidgetModel )
			createAnother = newTacticalWidget:setupTacticalWidget( index, controller )
			HUD.fullscreenContainer:addElement( newTacticalWidget )
			index = index + 1
		end
	end
end

CoD.TacticalModeUtility.CreateShooterSpottedWidgets = function ( HUD, controller )
	if not CoD.ClampedShooterWidget then
		DebugPrint( "Cannot create ClampedShooterWidget since it hasn't been included" )
		return 
	end
	local worldIndicatorModel = DataSources.WorldSpaceIndicators.getModel( controller )
	if worldIndicatorModel then
		local clampedShooterWidgetModels = {
			{
				name = "archetypeImage",
				defaultValue = ""
			},
			{
				name = "alpha",
				defaultValue = 0
			},
			{
				name = "arrowRotation",
				defaultValue = 0
			},
			{
				name = "shootingAtPlayer",
				defaultValue = false
			}
		}
		local createAnother = true
		local index = 0
		while createAnother do
			local newWidgetModel = Engine.CreateModel( worldIndicatorModel, "clampedShooter" .. index )
			for _, models in ipairs( clampedShooterWidgetModels ) do
				LUI.CreateModelAndInitialize( newWidgetModel, models.name, REG11.defaultValue )
			end
			local shooterWidget = CoD.ClampedShooterWidget.new( HUD, controller )
			shooterWidget:setModel( newWidgetModel )
			createAnother = shooterWidget:setupClampedShooterWidget( index, controller )
			HUD.fullscreenContainer:addElement( shooterWidget )
			index = index + 1
		end
	end
end

