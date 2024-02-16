-- ff23f79815acdff205af088b7a0b155f
-- This hash is used for caching, delete to decompile the file again

CoD.TacticalModeUtility = {}
CoD.TacticalModeUtility.CreateTacticalModeWidgets = function ( f1_arg0, f1_arg1 )
	if not CoD.TacticalModeWidget then
		DebugPrint( "Cannot create TacticalModeWidget since it hasn't been included" )
		return 
	end
	local f1_local0 = DataSources.WorldSpaceIndicators.getModel( f1_arg1 )
	if f1_local0 then
		local f1_local1 = {
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
		local f1_local2 = true
		local f1_local3 = 0
		while f1_local2 do
			local f1_local4 = Engine.CreateModel( f1_local0, "tacticalMode" .. f1_local3 )
			for f1_local8, f1_local9 in ipairs( f1_local1 ) do
				LUI.CreateModelAndInitialize( f1_local4, f1_local9.name, f1_local9.defaultValue )
			end
			f1_local5 = CoD.TacticalModeWidget.new( f1_arg0, f1_arg1 )
			f1_local5:setModel( f1_local4 )
			f1_local2 = f1_local5:setupTacticalWidget( f1_local3, f1_arg1 )
			f1_arg0.fullscreenContainer:addElement( f1_local5 )
			f1_local3 = f1_local3 + 1
		end
	end
end

CoD.TacticalModeUtility.CreateShooterSpottedWidgets = function ( f2_arg0, f2_arg1 )
	if not CoD.ClampedShooterWidget then
		DebugPrint( "Cannot create ClampedShooterWidget since it hasn't been included" )
		return 
	end
	local f2_local0 = DataSources.WorldSpaceIndicators.getModel( f2_arg1 )
	if f2_local0 then
		local f2_local1 = {
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
		local f2_local2 = true
		local f2_local3 = 0
		while f2_local2 do
			local f2_local4 = Engine.CreateModel( f2_local0, "clampedShooter" .. f2_local3 )
			for f2_local8, f2_local9 in ipairs( f2_local1 ) do
				LUI.CreateModelAndInitialize( f2_local4, f2_local9.name, f2_local9.defaultValue )
			end
			f2_local5 = CoD.ClampedShooterWidget.new( f2_arg0, f2_arg1 )
			f2_local5:setModel( f2_local4 )
			f2_local2 = f2_local5:setupClampedShooterWidget( f2_local3, f2_arg1 )
			f2_arg0.fullscreenContainer:addElement( f2_local5 )
			f2_local3 = f2_local3 + 1
		end
	end
end

