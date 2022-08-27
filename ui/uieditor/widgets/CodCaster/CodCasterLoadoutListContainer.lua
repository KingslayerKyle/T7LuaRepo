-- 984018134d4e2df2733106434fb7d7f4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterLoadoutItem" )

local f0_local0 = function ( f1_arg0 )
	local f1_local0 = f1_arg0 and f1_arg0.hintStrings
	local f1_local1 = f1_arg0 and f1_arg0:getParent()
	if f1_local0 and #f1_local0 > 0 and f1_local1.CodCasterLoadoutItemHintText then
		f1_local1.CodCasterLoadoutItemHintText.text.hintStringIndex = 1
		f1_local1.CodCasterLoadoutItemHintText.text:setText( f1_local0[1] )
		if #f1_local0 == 1 then
			f1_local1.CodCasterLoadoutItemHintText:registerEventHandler( "clip_over", nil )
			f1_local1.CodCasterLoadoutItemHintText:playClip( "HintSingle" )
		else
			f1_local1.CodCasterLoadoutItemHintText:playClip( "HintMulti" )
			f1_local1.CodCasterLoadoutItemHintText:registerEventHandler( "clip_over", function ( element, event )
				if element.text.hintStringIndex == #f1_local0 then
					element.text.hintStringIndex = 1
				else
					element.text.hintStringIndex = element.text.hintStringIndex + 1
				end
				f1_local1.CodCasterLoadoutItemHintText.text:setText( f1_local0[element.text.hintStringIndex] )
				f1_local1.CodCasterLoadoutItemHintText:playClip( "HintMulti" )
			end )
		end
	end
end

local f0_local1 = function ( f3_arg0 )
	if f3_arg0 and f3_arg0:hasClip( "Active" ) then
		local f3_local0, f3_local1, f3_local2, f3_local3 = f3_arg0:getLocalLeftRight()
		return f3_local2 < f3_local3
	else
		return false
	end
end

local f0_local2 = function ( f4_arg0, f4_arg1 )
	if f4_arg0.activeWidget == nil then
		return 
	end
	local f4_local0 = f4_arg0.activeWidget
	f4_arg0.activeWidget = f4_arg0.activeWidget:getPreviousSibling()
	while f4_arg0.activeWidget ~= nil and not f0_local1( f4_arg0.activeWidget ) do
		f4_arg0.activeWidget = f4_arg0.activeWidget:getPreviousSibling()
	end
	if f4_arg0.activeWidget ~= nil and f0_local1( f4_arg0.activeWidget ) then
		f4_arg0.activeWidget:processEvent( {
			name = "gain_active",
			controller = f4_arg1
		} )
		f0_local0( f4_arg0.activeWidget.CodCasterLoadoutSubGrid )
	end
	if f4_local0 ~= nil and (f4_arg0.activeWidget == nil or f0_local1( f4_arg0.activeWidget )) then
		f4_local0:processEvent( {
			name = "lose_active",
			controller = f4_arg1
		} )
	end
end

local f0_local3 = function ( f5_arg0, f5_arg1 )
	local f5_local0 = f5_arg0.activeWidget
	if f5_arg0.activeWidget == nil then
		f5_arg0.activeWidget = f5_arg0.SpecialistWeaponOrAbility
		goto basicblock_4:
	else
		f5_arg0.activeWidget = f5_arg0.activeWidget:getNextSibling()
		while f5_arg0.activeWidget ~= nil and not f0_local1( f5_arg0.activeWidget ) do
			f5_arg0.activeWidget = f5_arg0.activeWidget:getNextSibling()
		end
		if f5_arg0.activeWidget ~= nil and f0_local1( f5_arg0.activeWidget ) then
			f5_arg0.activeWidget:processEvent( {
				name = "gain_active",
				controller = f5_arg1
			} )
			f0_local0( f5_arg0.activeWidget.CodCasterLoadoutSubGrid )
			if f5_local0 ~= nil then
				f5_local0:processEvent( {
					name = "lose_active",
					controller = f5_arg1
				} )
			end
		else
			f5_arg0.activeWidget = f5_local0
		end
	end
end

local PostLoadFunc = function ( self, controller, menu )
	menu.PostCodCasterLoad = function ( f7_arg0 )
		menu:AddButtonCallbackFunction( f7_arg0, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
			f8_arg0 = self
			if not f8_arg1.m_disableNavigation and f8_arg1:AcceptGamePadButtonInputFromModelCallback( f8_arg2 ) then
				f0_local2( self, f8_arg2 )
			end
		end, AlwaysFalse, false )
		menu:AddButtonCallbackFunction( f7_arg0, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
			f9_arg0 = self
			if not f9_arg1.m_disableNavigation and f9_arg1:AcceptGamePadButtonInputFromModelCallback( f9_arg2 ) then
				f0_local3( self, f9_arg2 )
			end
		end, AlwaysFalse, false )
		menu:AddButtonCallbackFunction( f7_arg0, controller, Enum.LUIButton.LUI_KEY_NONE, "LEFTARROW", function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
			f10_arg0 = self
			if not f10_arg1.m_disableNavigation then
				f0_local2( self, f10_arg2 )
			end
		end, nil, false, true )
		menu:AddButtonCallbackFunction( f7_arg0, controller, Enum.LUIButton.LUI_KEY_NONE, "RIGHTARROW", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
			f11_arg0 = self
			if not f11_arg1.m_disableNavigation then
				f0_local3( self, f11_arg2 )
			end
		end, nil, false, true )
	end
	
	self.m_ownerController = controller
	f0_local3( self, controller )
	local f6_local0 = self:getFirstChild()
	while f6_local0 do
		if f6_local0.CodCasterLoadoutSubGrid then
			local f6_local1 = f6_local0.CodCasterLoadoutSubGrid:getParent()
			if f6_local1 then
				local f6_local2, f6_local3, f6_local4, f6_local5 = f6_local0.CodCasterLoadoutSubGrid:getLocalLeftRight()
				if f6_local1:hasClip( "Active" ) then
					f6_local1:setWidth( f6_local5 - f6_local4 )
				else
					f6_local1.savedWidth = f6_local5 - f6_local4
				end
			end
		end
		f6_local0 = f6_local0:getNextSibling()
	end
end

local f0_local5 = function ( f12_arg0, f12_arg1 )
	f12_arg1:updateDataSource()
	local f12_local0 = f12_arg1:getParent()
	if f12_local0 then
		local f12_local1, f12_local2, f12_local3, f12_local4 = f12_arg1:getLocalLeftRight()
		if f12_local0:hasClip( "Active" ) then
			f12_local0:setWidth( f12_local4 - f12_local3 )
		else
			f12_local0.savedWidth = f12_local4 - f12_local3
		end
	end
	local f12_local1 = f12_arg1:getParent()
	if f12_local1 then
		f12_local1 = f12_local1:getParent()
	end
	if f12_local1 and f12_local1.activeWidget and not f0_local1( f12_local1.activeWidget ) then
		f0_local3( f12_local1, f12_arg0 )
		if not f0_local1( f12_local1.activeWidget ) then
			f0_local2( f12_local1, f12_arg0 )
		end
	end
end

local f0_local6 = function ( f13_arg0, f13_arg1 )
	local f13_local0 = Engine.GetModel( Engine.GetModelForController( f13_arg0 ), "playerAbilities.playerGadget3.imageAvailable" )
	if f13_local0 ~= nil and f13_arg1.hasSpecialistSubscription ~= true then
		f13_arg1:subscribeToModel( f13_local0, function ()
			f0_local5( f13_arg0, f13_arg1 )
		end, false )
	end
	local f13_local1 = {
		{
			models = {
				image = Engine.GetModelValue( f13_local0 )
			}
		}
	}
	f13_arg1.hasSpecialistSubscription = true
	local f13_local2 = CoD.SafeGetModelValue( Engine.GetModelForController( f13_arg0 ), "playerAbilities.playerGadget3.name" )
	f13_arg1.hintStrings = {
		f13_local2 and Engine.Localize( f13_local2 )
	}
	f0_local0( f13_arg1 )
	return f13_local1
end

local f0_local7 = function ( f15_arg0, f15_arg1, f15_arg2 )
	local f15_local0 = {}
	local f15_local1 = Engine.GetModel( Engine.GetModelForController( f15_arg0 ), f15_arg2 .. ".item" )
	local f15_local2 = f15_local1 and Engine.GetModelValue( f15_local1 )
	local f15_local3 = function ( f16_arg0, f16_arg1 )
		if f16_arg1 and string.len( f16_arg1 ) > 3 then
			local f16_local0 = {}
			f16_arg0.hintStrings = Engine.Localize( CoD.CACUtility.GetNameForStatsTableImage( string.sub( f16_arg1, 1, -4 ) ) )
			f16_local0 = nil
			local f16_local1 = 2
			if CoD.IsShoutcaster( f15_arg0 ) then
				f16_local1 = 5
			end
			for f16_local2 = 0, f16_local1, 1 do
				local f16_local5 = Engine.GetModel( Engine.GetModelForController( f15_arg0 ), f15_arg2 .. ".attachment" .. f16_local2 )
				local f16_local6 = f16_local5 and Engine.GetModelValue( f16_local5 )
				if f16_local6 and f16_local6 ~= "" then
					if f16_local0 == nil then
						f16_local0 = Engine.Localize( f16_local6 )
					else
						f16_local0 = f16_local0 .. " + " .. Engine.Localize( f16_local6 )
					end
				end
			end
			if f16_local0 then
				table.insert( f16_arg0.hintStrings, Engine.Localize( f16_local0 ) )
			end
		end
		f0_local0( f16_arg0 )
	end
	
	if f15_local1 and not f15_arg1.hasSubscription then
		f15_arg1:subscribeToModel( f15_local1, function ( model )
			f0_local5( f15_arg0, f15_arg1 )
			f15_local3( f15_arg1, Engine.GetModelValue( model ) )
		end, false )
		local f15_local4 = 2
		if CoD.IsShoutcaster( f15_arg0 ) then
			f15_local4 = 5
		end
		for f15_local5 = 0, f15_local4, 1 do
			local f15_local8 = Engine.GetModel( Engine.GetModelForController( f15_arg0 ), f15_arg2 .. ".attachment" .. f15_local5 )
			if f15_local8 then
				f15_arg1:subscribeToModel( f15_local8, function ( model )
					f15_local3( f15_arg1, Engine.GetModelValue( f15_local1 ) )
				end, false )
			end
		end
		f15_arg1.hasSubscription = true
	end
	if f15_local2 and f15_local2 ~= "" then
		table.insert( f15_local0, {
			models = {
				image = f15_local2
			}
		} )
	end
	f15_local3( f15_arg1, f15_local2 )
	return f15_local0
end

local f0_local8 = function ( f19_arg0, f19_arg1 )
	return f0_local7( f19_arg0, f19_arg1, "primaryWeapon" )
end

local f0_local9 = function ( f20_arg0, f20_arg1 )
	return f0_local7( f20_arg0, f20_arg1, "secondaryWeapon" )
end

local f0_local10 = function ( f21_arg0, f21_arg1, f21_arg2 )
	local f21_local0 = {}
	f21_arg1.hintStrings = {}
	local f21_local1 = Engine.GetModel( Engine.GetModelForController( f21_arg0 ), f21_arg2 )
	if f21_local1 ~= nil then
		local f21_local2 = Engine.GetModelValue( f21_local1 )
		local f21_local3 = f21_local2 and CoD.CACUtility.GetIdForItemRef( f21_local2 )
		if f21_local3 ~= nil and f21_local3 ~= "null_offhand_primary" and f21_local3 ~= "null_offhand_secondary" then
			table.insert( f21_local0, {
				models = {
					image = CoD.CACUtility.GetImageForItemRef( f21_local2 )
				}
			} )
			table.insert( f21_arg1.hintStrings, Engine.Localize( CoD.CACUtility.GetNameForItemRef( f21_local2 ) ) )
		end
		if not f21_arg1.hasEquipmentSubscriptions then
			f21_arg1:subscribeToModel( f21_local1, function ()
				f0_local5( f21_arg0, f21_arg1 )
			end, false )
		end
	end
	f21_arg1.hasEquipmentSubscriptions = true
	return f21_local0
end

local f0_local11 = function ( f23_arg0, f23_arg1 )
	return f0_local10( f23_arg0, f23_arg1, "currentPrimaryOffhand.primaryOffhandRef" )
end

local f0_local12 = function ( f24_arg0, f24_arg1 )
	return f0_local10( f24_arg0, f24_arg1, "currentSecondaryOffhand.secondaryOffhandRef" )
end

local f0_local13 = function ( f25_arg0, f25_arg1 )
	local f25_local0 = {}
	f25_arg1.hintStrings = {}
	local f25_local1 = Engine.GetModel( Engine.GetModelForController( f25_arg0 ), "perks" )
	if f25_local1 then
		for f25_local2 = 0, CoD.CACUtility.maxPerkCategories - 1, 1 do
			local f25_local5 = Engine.GetModelValue( Engine.GetModel( f25_local1, "perk" .. f25_local2 .. "_count" ) ) or 0
			for f25_local6 = 0, CoD.CACUtility.maxPerksInEachCategory - 1, 1 do
				local f25_local9 = Engine.GetModel( f25_local1, "perk" .. f25_local2 .. "_" .. f25_local6 )
				local f25_local10 = Engine.GetModel( f25_local9, "image" )
				local f25_local11 = Engine.GetModel( f25_local9, "name" )
				if f25_local6 < f25_local5 then
					table.insert( f25_local0, {
						models = {
							image = Engine.GetModelValue( f25_local10 )
						}
					} )
					table.insert( f25_arg1.hintStrings, Engine.GetModelValue( f25_local11 ) )
				end
			end
		end
		if f25_arg1.hasPerkSubscriptions ~= true then
			f25_arg1:subscribeToModel( Engine.GetModel( f25_local1, "anyPerkChanged" ), function ()
				f0_local5( f25_arg0, f25_arg1 )
			end, false )
			f25_arg1.hasPerkSubscriptions = true
		else
			f0_local0( f25_arg1 )
			return f25_local0
		end
	end
	f0_local0( f25_arg1 )
	return f25_local0
end

local f0_local14 = function ( f27_arg0, f27_arg1 )
	local f27_local0 = {}
	f27_arg1.hintStrings = {}
	local f27_local1 = Engine.GetModel( Engine.GetModelForController( f27_arg0 ), "bonuscards" )
	if f27_local1 then
		for f27_local2 = 0, 2, 1 do
			local f27_local5 = Engine.GetModel( f27_local1, "card" .. f27_local2 )
			if f27_local5 ~= nil and f27_arg1.hasBonusCardSubscriptions ~= true then
				f27_arg1:subscribeToModel( f27_local5, function ()
					f0_local5( f27_arg0, f27_arg1 )
				end, false )
			end
			local f27_local6 = f27_local5 and Engine.GetModelValue( f27_local5 )
			if f27_local6 and f27_local6 ~= 0 then
				table.insert( f27_local0, {
					models = {
						image = CoD.CACUtility.GetImageForItemRef( f27_local6 )
					}
				} )
				table.insert( f27_arg1.hintStrings, Engine.Localize( CoD.CACUtility.GetNameForItemRef( f27_local6 ) ) )
			end
			f27_arg1.hasBonusCardSubscriptions = true
		end
	end
	f0_local0( f27_arg1 )
	return f27_local0
end

DataSources.CodCasterLoadoutAbilityOrWeapon = DataSourceHelpers.ListSetup( "CodCasterLoadoutAbilityOrWeapon", f0_local6, true )
DataSources.CodCasterLoadoutPrimary = DataSourceHelpers.ListSetup( "CodCasterLoadoutPrimary", f0_local8, true )
DataSources.CodCasterLoadoutSecondary = DataSourceHelpers.ListSetup( "CodCasterLoadoutSecondary", f0_local9, true )
DataSources.CodCasterLoadoutEquipment = DataSourceHelpers.ListSetup( "CodCasterLoadoutEquipment", f0_local11, true )
DataSources.CodCasterLoadoutEquipmentSecondary = DataSourceHelpers.ListSetup( "CodCasterLoadoutEquipmentSecondary", f0_local12, true )
DataSources.CodCasterLoadoutPerks = DataSourceHelpers.ListSetup( "CodCasterLoadoutPerks", f0_local13, true )
DataSources.CodCasterLoadoutWildcards = DataSourceHelpers.ListSetup( "CodCasterLoadoutWildcards", f0_local14, true )
CoD.CodCasterLoadoutListContainer = InheritFrom( LUI.UIElement )
CoD.CodCasterLoadoutListContainer.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CodCasterLoadoutListContainer )
	self.id = "CodCasterLoadoutListContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 721 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local spacer0 = LUI.UIImage.new()
	spacer0:setLeftRight( true, false, 0, 100 )
	spacer0:setTopBottom( true, true, 20, 20 )
	spacer0:setRGB( 0, 0, 0 )
	spacer0:setAlpha( 0 )
	self:addElement( spacer0 )
	self.spacer0 = spacer0
	
	local spacer = LUI.UIImage.new()
	spacer:setLeftRight( true, false, 100, 101 )
	spacer:setTopBottom( true, false, 20, 92 )
	spacer:setRGB( 0, 0, 0 )
	self:addElement( spacer )
	self.spacer = spacer
	
	local SpecialistWeaponOrAbility = CoD.CodCasterLoadoutItem.new( menu, controller )
	SpecialistWeaponOrAbility:setLeftRight( true, false, 101, 221 )
	SpecialistWeaponOrAbility:setTopBottom( true, false, 20, 92 )
	SpecialistWeaponOrAbility.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutAbilityOrWeapon" )
	SpecialistWeaponOrAbility:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_specialist_weapon", 1 )
			end
		}
	} )
	SpecialistWeaponOrAbility:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( SpecialistWeaponOrAbility, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( SpecialistWeaponOrAbility )
	self.SpecialistWeaponOrAbility = SpecialistWeaponOrAbility
	
	local PrimaryWeapon = CoD.CodCasterLoadoutItem.new( menu, controller )
	PrimaryWeapon:setLeftRight( true, false, 221, 341 )
	PrimaryWeapon:setTopBottom( true, false, 20, 92 )
	PrimaryWeapon.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutPrimary" )
	PrimaryWeapon:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_primary", 1 )
			end
		}
	} )
	PrimaryWeapon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( PrimaryWeapon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( PrimaryWeapon )
	self.PrimaryWeapon = PrimaryWeapon
	
	local SecondaryWeapon = CoD.CodCasterLoadoutItem.new( menu, controller )
	SecondaryWeapon:setLeftRight( true, false, 341, 461 )
	SecondaryWeapon:setTopBottom( true, false, 20, 92 )
	SecondaryWeapon.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutSecondary" )
	SecondaryWeapon:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_secondary", 1 )
			end
		}
	} )
	SecondaryWeapon:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( SecondaryWeapon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( SecondaryWeapon )
	self.SecondaryWeapon = SecondaryWeapon
	
	local Equipment = CoD.CodCasterLoadoutItem.new( menu, controller )
	Equipment:setLeftRight( true, false, 461, 581 )
	Equipment:setTopBottom( true, false, 20, 92 )
	Equipment.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutEquipment" )
	Equipment:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_equipment", 1 )
			end
		}
	} )
	Equipment:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( Equipment, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( Equipment )
	self.Equipment = Equipment
	
	local Equipment2 = CoD.CodCasterLoadoutItem.new( menu, controller )
	Equipment2:setLeftRight( true, false, 581, 701 )
	Equipment2:setTopBottom( true, false, 20, 92 )
	Equipment2.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutEquipmentSecondary" )
	Equipment2:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_equipment", 1 )
			end
		}
	} )
	Equipment2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( Equipment2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( Equipment2 )
	self.Equipment2 = Equipment2
	
	local Perks = CoD.CodCasterLoadoutItem.new( menu, controller )
	Perks:setLeftRight( true, false, 701, 821 )
	Perks:setTopBottom( true, false, 20, 92 )
	Perks.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutPerks" )
	Perks:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_perks", 1 ) and HasPerksInAnySlot( controller )
			end
		}
	} )
	Perks:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( Perks, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	Perks:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.platformUpdate" ), function ( model )
		menu:updateElementState( Perks, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.platformUpdate"
		} )
	end )
	Perks:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk0_count" ), function ( model )
		menu:updateElementState( Perks, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk0_count"
		} )
	end )
	Perks:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk1_count" ), function ( model )
		menu:updateElementState( Perks, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk1_count"
		} )
	end )
	Perks:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "perks.perk2_count" ), function ( model )
		menu:updateElementState( Perks, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "perks.perk2_count"
		} )
	end )
	self:addElement( Perks )
	self.Perks = Perks
	
	local Wildcards = CoD.CodCasterLoadoutItem.new( menu, controller )
	Wildcards:setLeftRight( true, false, 821, 941 )
	Wildcards:setTopBottom( true, false, 20, 92 )
	Wildcards.CodCasterLoadoutSubGrid:setDataSource( "CodCasterLoadoutWildcards" )
	Wildcards:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsCodCasterProfileValueEqualTo( controller, "shoutcaster_lo_wildcard", 1 )
			end
		}
	} )
	Wildcards:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CodCaster.profileSettingsUpdated" ), function ( model )
		menu:updateElementState( Wildcards, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CodCaster.profileSettingsUpdated"
		} )
	end )
	self:addElement( Wildcards )
	self.Wildcards = Wildcards
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SpecialistWeaponOrAbility:close()
		element.PrimaryWeapon:close()
		element.SecondaryWeapon:close()
		element.Equipment:close()
		element.Equipment2:close()
		element.Perks:close()
		element.Wildcards:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

