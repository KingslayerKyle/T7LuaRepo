CoD.BubbleGumBuffUtility = {}
CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule = "gamedata/tables/zm/zm_gobblegumrecipescheduleutc.csv"
CoD.BubbleGumBuffUtility.GobbleGumRecipeList = "gamedata/tables/zm/zm_gobblegumrecipes.csv"
CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleStartTime = Engine.StringIntegerSubtraction( Engine.TableLookup( controller, CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule, 0, 0, 1 ), "86400" )
CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleEndOffset = tonumber( Engine.StringIntegerSubtraction( Engine.TableLookup( controller, CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule, 0, Engine.GetTableRowCount( CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule ) - 1, 1 ), CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleStartTime ) )
CoD.BubbleGumBuffUtility.FreeDistillOffset = 1000
CoD.BubbleGumBuffUtility.PaidDistillOffset = 2000
CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID = 0
CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID = 1
CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_SKU_ID = 99064
CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_SKU_ID = 99065
CoD.BubbleGumBuffUtility.URM_FIRST_TIME_SKU_ID = 99075
DataSources.GobbleGumRecipeInfo = {
	getModel = function ( f1_arg0 )
		return CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f1_arg0 )
	end
}
CoD.BubbleGumBuffUtility.ReloadCookbookSchedule = function ()
	CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleStartTime = Engine.StringIntegerSubtraction( Engine.TableLookup( nil, CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule, 0, 0, 1 ), "86400" )
	CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleEndOffset = tonumber( Engine.StringIntegerSubtraction( Engine.TableLookup( nil, CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule, 0, Engine.GetTableRowCount( CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule ) - 1, 1 ), CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleStartTime ) )
end

CoD.BubbleGumBuffUtility.GetCurrentGobbleGumRecipeIndices = function ( f3_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f3_arg0 ), "scheduleIndex" ) )
	if not modelValue then
		modelValue = Engine.GetCurrentGobbleGumRecipeScheduleIndex( f3_arg0 )
	end
	local f3_local1 = {}
	local f3_local2 = 2
	if modelValue then
		local f3_local3 = 0
		local f3_local4 = Engine.TableLookup( f3_arg0, CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule, 0, modelValue, f3_local2 + f3_local3 )
		while f3_local4 and f3_local4 ~= "" do
			table.insert( f3_local1, tonumber( f3_local4 ) )
			f3_local3 = f3_local3 + 1
			f3_local4 = Engine.TableLookup( f3_arg0, CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule, 0, modelValue, f3_local2 + f3_local3 )
		end
	end
	return f3_local1
end

CoD.BubbleGumBuffUtility.GetGobbleGumRecipes = function ( f4_arg0 )
	local f4_local0 = {}
	local f4_local1 = CoD.BubbleGumBuffUtility.GetCurrentGobbleGumRecipeIndices( f4_arg0 )
	if #f4_local1 > 0 then
		for f4_local5, f4_local6 in pairs( f4_local1 ) do
			table.insert( f4_local0, CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex( f4_arg0, f4_local6 ) )
		end
	end
	return f4_local0
end

CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel = function ( f5_arg0 )
	local f5_local0 = Engine.GetModel( Engine.GetModelForController( f5_arg0 ), "GobbleGumRecipeInfo" )
	if not f5_local0 then
		f5_local0 = Engine.CreateModel( Engine.GetModelForController( f5_arg0 ), "GobbleGumRecipeInfo" )
		Engine.CreateModel( f5_local0, "scheduleIndex" )
		Engine.CreateModel( f5_local0, "remainingTime" )
		Engine.CreateModel( f5_local0, "update" )
		Engine.CreateModel( f5_local0, "haveAllIngredients" )
		Engine.SetModelValue( Engine.CreateModel( f5_local0, "recipeDistillCost" ), CoD.BubbleGumBuffUtility.GetRecipeDistillCost() )
	end
	return f5_local0
end

CoD.BubbleGumBuffUtility.GetGobbleGumRecipeForIndex = function ( f6_arg0, f6_arg1 )
	local f6_local0 = 1
	local f6_local1 = {}
	local f6_local2 = Engine.TableFindRows( CoD.BubbleGumBuffUtility.GobbleGumRecipeList, 0, f6_arg1 )
	f6_local2 = f6_local2[1]
	local f6_local3 = Engine.TableGetColumnValueForRow( CoD.BubbleGumBuffUtility.GobbleGumRecipeList, f6_local2, f6_local0 )
	if f6_local3 and f6_local3 ~= "" then
		local f6_local4 = CoD.BubbleGumBuffUtility.GetBubbleGumBuffInfoForRef( f6_arg0, f6_local3 )
		f6_local4.count = tonumber( Engine.TableGetColumnValueForRow( CoD.BubbleGumBuffUtility.GobbleGumRecipeList, f6_local2, f6_local0 + 1 ) )
		f6_local1.result = f6_local4
		f6_local1.haveAllIngredients = true
		f6_local1.recipeIndex = f6_arg1
		f6_local1.ingredients = {}
		local f6_local5 = 3
		local f6_local6 = {
			have = 0,
			required = 0
		}
		local f6_local7 = Engine.TableGetColumnValueForRow( CoD.BubbleGumBuffUtility.GobbleGumRecipeList, f6_local2, f6_local5 )
		while f6_local7 and f6_local7 ~= "" and not LUI.startswith( f6_local7, "#" ) do
			local f6_local8 = CoD.BubbleGumBuffUtility.GetBubbleGumBuffInfoForRef( f6_arg0, f6_local7 )
			local f6_local9 = Engine.GetUnlockableInfoModelByIndex( f6_local8.itemIndex, "Unlockables." .. f6_local8.itemIndex, Enum.eModes.MODE_ZOMBIES )
			local f6_local10 = GetConsumableCountFromIndex( f6_arg0, f6_local8.itemIndex )
			f6_local8.count = tonumber( Engine.TableGetColumnValueForRow( CoD.BubbleGumBuffUtility.GobbleGumRecipeList, f6_local2, f6_local5 + 1 ) )
			f6_local8.percentComplete = math.min( f6_local8.count, f6_local10 ) / f6_local8.count
			f6_local6.have = f6_local6.have + math.min( f6_local8.count, f6_local10 )
			f6_local6.required = f6_local6.required + f6_local8.count
			f6_local8.fractionText = Engine.Localize( "MPUI_X_SLASH_Y", math.min( f6_local8.count, f6_local10 ), f6_local8.count )
			local f6_local11 = f6_local1.haveAllIngredients
			if f6_local11 then
				f6_local11 = f6_local8.count <= f6_local10
			end
			f6_local1.haveAllIngredients = f6_local11
			table.insert( f6_local1.ingredients, f6_local8 )
			f6_local5 = f6_local5 + 2
			f6_local7 = Engine.TableGetColumnValueForRow( CoD.BubbleGumBuffUtility.GobbleGumRecipeList, f6_local2, f6_local5 )
		end
		f6_local4.percentComplete = f6_local6.have / f6_local6.required
	end
	return f6_local1
end

CoD.BubbleGumBuffUtility.GetBubbleGumBuffInfoForIndex = function ( f7_arg0, f7_arg1 )
	local f7_local0 = Engine.GetUnlockableInfoModelByIndex( f7_arg1, "Unlockables." .. f7_arg1, Enum.eModes.MODE_ZOMBIES )
	local f7_local1 = {}
	if f7_local0 then
		f7_local1.itemIndex = f7_arg1
	end
	return f7_local1
end

CoD.BubbleGumBuffUtility.GetBubbleGumBuffInfoForRef = function ( f8_arg0, f8_arg1 )
	return CoD.BubbleGumBuffUtility.GetBubbleGumBuffInfoForIndex( f8_arg0, Engine.GetItemIndexFromReference( f8_arg1 ) )
end

CoD.BubbleGumBuffUtility.FREE_DISTILL = "free"
CoD.BubbleGumBuffUtility.X3_DISTILL = "x3"
CoD.BubbleGumBuffUtility.X6_DISTILL = "x6"
CoD.BubbleGumBuffUtility.X9_DISTILL = "x9"
CoD.BubbleGumBuffUtility.IsDebuggingEnabled = function ()
	return Engine.DvarBool( nil, "cookbookDebug" ) == true
end

CoD.BubbleGumBuffUtility.UseTestData = function ()
	return Engine.DvarBool( nil, "cookbookUseTestData" ) == true
end

if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
	CoD.BubbleGumBuffUtility.Debug = {}
	CoD.BubbleGumBuffUtility.Debug.DistillList = {
		[CoD.BubbleGumBuffUtility.FREE_DISTILL] = {
			uses = 0,
			cooldown = Engine.GetServerUTCTimeStr()
		},
		[CoD.BubbleGumBuffUtility.X3_DISTILL] = {
			uses = 0,
			cooldown = Engine.GetServerUTCTimeStr()
		},
		[CoD.BubbleGumBuffUtility.X6_DISTILL] = {
			uses = 0,
			cooldown = Engine.GetServerUTCTimeStr()
		},
		[CoD.BubbleGumBuffUtility.X9_DISTILL] = {
			uses = 0,
			cooldown = Engine.GetServerUTCTimeStr()
		}
	}
	CoD.BubbleGumBuffUtility.Debug.RefillDistill = function ( f11_arg0, f11_arg1 )
		if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
			CoD.BubbleGumBuffUtility.Debug.DistillList[f11_arg1].uses = CoD.BubbleGumBuffUtility.Debug.DistillList[f11_arg1].uses + 30
			CoD.BubbleGumBuffUtility.Debug.DistillList[f11_arg1].cooldown = Engine.StringIntegerAddition( Engine.GetServerUTCTimeStr(), "60" )
			return true
		else
			return false
		end
	end
	
	CoD.BubbleGumBuffUtility.Debug.DISTILL_LIST = {
		CoD.BubbleGumBuffUtility.FREE_DISTILL,
		CoD.BubbleGumBuffUtility.X3_DISTILL,
		CoD.BubbleGumBuffUtility.X6_DISTILL,
		CoD.BubbleGumBuffUtility.X9_DISTILL
	}
end
CoD.BubbleGumBuffUtility.GetRemainingUsesForDistill = function ( f12_arg0, f12_arg1 )
	if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
		return CoD.BubbleGumBuffUtility.Debug.DistillList[f12_arg1].uses
	else
		local f12_local0 = DataSources.GobbleGumDistills.getModel( f12_arg0 )
		if f12_local0 then
			if f12_arg1 == CoD.BubbleGumBuffUtility.FREE_DISTILL then
				return Engine.GetModelValue( Engine.GetModel( f12_local0, "freeDistills" ) )
			else
				return Engine.GetModelValue( Engine.GetModel( f12_local0, "paidDistills" ) )
			end
		else
			return 0
		end
	end
end

CoD.BubbleGumBuffUtility.GetDistillCooldown = function ( f13_arg0, f13_arg1 )
	if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
		local f13_local0
		if f13_arg1 == CoD.BubbleGumBuffUtility.FREE_DISTILL then
			f13_local0 = math.max( 0, tonumber( Engine.StringIntegerSubtraction( CoD.BubbleGumBuffUtility.Debug.DistillList[f13_arg1].cooldown, Engine.GetServerUTCTimeStr() ) ) )
			if not f13_local0 then
			
			else
				return f13_local0
			end
		end
		f13_local0 = 0
	else
		local f13_local0 = 0
		if f13_arg1 == CoD.BubbleGumBuffUtility.FREE_DISTILL then
			local f13_local1 = Engine.GetInventoryItem( f13_arg0, Engine.DvarInt( nil, "loot_distill_" .. f13_arg1 .. "_consumable_id" ) )
			if f13_local1 then
				f13_local0 = tonumber( Engine.StringIntegerSubtraction( f13_local1.expireTimeStr, Engine.GetServerUTCTimeStr() ) )
			end
		end
		return f13_local0
	end
end

CoD.BubbleGumBuffUtility.GetTotalRemainingDistills = function ( f14_arg0 )
	if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
		local f14_local0 = 0
		for f14_local4, f14_local5 in pairs( CoD.BubbleGumBuffUtility.Debug.DistillList ) do
			f14_local0 = f14_local0 + f14_local5.uses
		end
		return f14_local0
	else
		local f14_local0 = DataSources.GobbleGumDistills.getModel( f14_arg0 )
		if f14_local0 then
			return Engine.GetModelValue( Engine.GetModel( f14_local0, "totalDistills" ) )
		else
			return -1
		end
	end
end

CoD.BubbleGumBuffUtility.GetRecipeDistillCost = function ()
	return Dvar.loot_recipe_distill_cost:exists() and Dvar.loot_recipe_distill_cost:get() or 10
end

CoD.BubbleGumBuffUtility.SpendDistill = function ( f16_arg0 )
	if CoD.BubbleGumBuffUtility.IsDebuggingEnabled() then
		for f16_local3, f16_local4 in ipairs( CoD.BubbleGumBuffUtility.Debug.DISTILL_LIST ) do
			if CoD.BubbleGumBuffUtility.Debug.DistillList[f16_local4].uses > 0 then
				CoD.BubbleGumBuffUtility.Debug.DistillList[f16_local4].uses = CoD.BubbleGumBuffUtility.Debug.DistillList[f16_local4].uses - CoD.BubbleGumBuffUtility.GetRecipeDistillCost()
				break
			end
		end
		return 
	else
		
	end
end

CoD.BubbleGumBuffUtility.ScheduleTimerTick = function ( f17_arg0 )
	local f17_local0 = Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f17_arg0 ), "scheduleIndex" )
	local f17_local1 = Engine.GetModel( CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f17_arg0 ), "remainingTime" )
	local f17_local2 = Engine.GetModelValue( f17_local0 )
	if not f17_local2 then
		f17_local2 = Engine.GetCurrentGobbleGumRecipeScheduleIndex( f17_arg0 )
		Engine.SetModelValue( f17_local0, f17_local2 )
	end
	local f17_local3 = Engine.TableLookupGetColumnValueForRow( CoD.BubbleGumBuffUtility.GobbleGumRecipeSchedule, f17_local2, 1 )
	local f17_local4 = Engine.GetServerUTCTimeStr()
	if Dvar.live_enableDailyChallengesDebugTimestamp:get() then
		f17_local4 = Engine.StringIntegerAddition( Engine.StringIntegerAddition( Engine.StringIntegerAddition( f17_local4, tostring( Dvar.live_debugDailyChallengesMinute:get() * 60 ) ), tostring( Dvar.live_debugDailyChallengesHour:get() * 3600 ) ), Engine.StringIntegerMultiplication( tostring( Dvar.live_debugDailyChallengesDay:get() ), "86400" ) )
	end
	if tonumber( f17_local4 ) > tonumber( CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleStartTime ) then
		f17_local4 = tostring( tonumber( Engine.StringIntegerSubtraction( f17_local4, CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleStartTime ) ) % CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleEndOffset )
		f17_local3 = Engine.StringIntegerSubtraction( f17_local3, CoD.BubbleGumBuffUtility.GobbleGumRecipeScheduleStartTime )
	end
	local f17_local5 = Engine.StringIntegerSubtraction( f17_local3, f17_local4 )
	if tonumber( f17_local5 ) <= 0 or f17_local2 > 0 and tonumber( f17_local4 ) <= 86400 then
		if Engine.IsLootReady( f17_arg0 ) then
			Engine.SetModelValue( f17_local0, Engine.GetCurrentGobbleGumRecipeScheduleIndex( f17_arg0 ) )
		end
		f17_local5 = "0"
	end
	Engine.SetModelValue( f17_local1, f17_local5 )
end

