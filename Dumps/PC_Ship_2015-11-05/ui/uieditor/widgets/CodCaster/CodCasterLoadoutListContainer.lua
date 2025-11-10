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
		menu:AddButtonCallbackFunction( f7_arg0, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
			element = self
			if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
				f0_local2( self, controller )
			end
		end, AlwaysFalse, false )
		menu:AddButtonCallbackFunction( f7_arg0, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
			element = self
			if not menu.m_disableNavigation and menu:AcceptGamePadButtonInputFromModelCallback( controller ) then
				f0_local3( self, controller )
			end
		end, AlwaysFalse, false )
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

local f0_local5 = function ( f10_arg0 )
	f10_arg0:updateDataSource()
	local f10_local0 = f10_arg0:getParent()
	if f10_local0 then
		local f10_local1, f10_local2, f10_local3, f10_local4 = f10_arg0:getLocalLeftRight()
		if f10_local0:hasClip( "Active" ) then
			f10_local0:setWidth( f10_local4 - f10_local3 )
		else
			f10_local0.savedWidth = f10_local4 - f10_local3
		end
	end
	local f10_local1 = f10_arg0:getParent()
	if f10_local1 then
		f10_local1 = f10_local1:getParent()
	end
	if f10_local1 and f10_local1.activeWidget and not f0_local1( f10_local1.activeWidget ) then
		f0_local3( f10_local1, controller )
		if not f0_local1( f10_local1.activeWidget ) then
			f0_local2( f10_local1, controller )
		end
	end
end

local f0_local6 = function ( f11_arg0, f11_arg1 )
	local f11_local0 = Engine.GetModel( Engine.GetModelForController( f11_arg0 ), "playerAbilities.playerGadget3.imageAvailable" )
	if f11_local0 ~= nil and f11_arg1.hasSpecialistSubscription ~= true then
		f11_arg1:subscribeToModel( f11_local0, function ()
			f0_local5( f11_arg1 )
		end, false )
	end
	local f11_local1 = {
		{
			models = {
				image = Engine.GetModelValue( f11_local0 )
			}
		}
	}
	f11_arg1.hasSpecialistSubscription = true
	local f11_local2 = CoD.SafeGetModelValue( Engine.GetModelForController( f11_arg0 ), "playerAbilities.playerGadget3.name" )
	f11_arg1.hintStrings = {
		f11_local2 and Engine.Localize( f11_local2 )
	}
	f0_local0( f11_arg1 )
	return f11_local1
end

local f0_local7 = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = {}
	local f13_local1 = Engine.GetModel( Engine.GetModelForController( f13_arg0 ), f13_arg2 .. ".item" )
	local f13_local2 = f13_local1 and Engine.GetModelValue( f13_local1 )
	local f13_local3 = function ( f14_arg0, f14_arg1 )
		if f14_arg1 and string.len( f14_arg1 ) > 3 then
			local f14_local0 = {}
			f14_arg0.hintStrings = Engine.Localize( CoD.CACUtility.GetNameForStatsTableImage( string.sub( f14_arg1, 1, -4 ) ) )
			f14_local0 = nil
			for f14_local1 = 0, 2, 1 do
				local f14_local4 = Engine.GetModel( Engine.GetModelForController( f13_arg0 ), f13_arg2 .. ".attachment" .. f14_local1 )
				local f14_local5 = f14_local4 and Engine.GetModelValue( f14_local4 )
				if f14_local5 and f14_local5 ~= "" then
					if f14_local0 == nil then
						f14_local0 = Engine.Localize( f14_local5 )
					else
						f14_local0 = f14_local0 .. " + " .. Engine.Localize( f14_local5 )
					end
				end
			end
			if f14_local0 then
				table.insert( f14_arg0.hintStrings, Engine.Localize( f14_local0 ) )
			end
		end
		f0_local0( f14_arg0 )
	end
	
	if f13_local1 and not f13_arg1.hasSubscription then
		f13_arg1:subscribeToModel( f13_local1, function ( model )
			f0_local5( f13_arg1 )
			f13_local3( f13_arg1, Engine.GetModelValue( model ) )
		end, false )
		for f13_local4 = 0, 2, 1 do
			local f13_local7 = Engine.GetModel( Engine.GetModelForController( f13_arg0 ), f13_arg2 .. ".attachment" .. f13_local4 )
			if f13_local7 then
				f13_arg1:subscribeToModel( f13_local7, function ( model )
					f13_local3( f13_arg1, Engine.GetModelValue( f13_local1 ) )
				end, false )
			end
		end
		f13_arg1.hasSubscription = true
	end
	if f13_local2 and f13_local2 ~= "" then
		table.insert( f13_local0, {
			models = {
				image = f13_local2
			}
		} )
	end
	f13_local3( f13_arg1, f13_local2 )
	return f13_local0
end

local f0_local8 = function ( f17_arg0, f17_arg1 )
	return f0_local7( f17_arg0, f17_arg1, "primaryWeapon" )
end

local f0_local9 = function ( f18_arg0, f18_arg1 )
	return f0_local7( f18_arg0, f18_arg1, "secondaryWeapon" )
end

local f0_local10 = function ( f19_arg0, f19_arg1 )
	local f19_local0 = {}
	local f19_local1 = {}
	local f19_local2 = Engine.GetModel( Engine.GetModelForController( f19_arg0 ), "currentPrimaryOffhand.primaryOffhandRef" )
	local f19_local3 = Engine.GetModel( Engine.GetModelForController( f19_arg0 ), "currentSecondaryOffhand.secondaryOffhandRef" )
	f19_local1 = f19_local2
	f19_arg1.hintStrings = {}
	for f19_local2 = 1, #f19_local1, 1 do
		if f19_local1[f19_local2] ~= nil then
			local f19_local5 = Engine.GetModelValue( f19_local1[f19_local2] )
			local f19_local6 = f19_local5 and CoD.CACUtility.GetIdForItemRef( f19_local5 )
			if f19_local6 ~= nil and f19_local6 ~= "null_offhand_primary" and f19_local6 ~= "null_offhand_secondary" then
				table.insert( f19_local0, {
					models = {
						image = CoD.CACUtility.GetImageForItemRef( f19_local5 )
					}
				} )
				table.insert( f19_arg1.hintStrings, Engine.Localize( CoD.CACUtility.GetNameForItemRef( f19_local5 ) ) )
			end
			if not f19_arg1.hasEquipmentSubscriptions then
				f19_arg1:subscribeToModel( f19_local1[f19_local2], function ()
					f0_local5( f19_arg1 )
				end, false )
			end
		end
	end
	f0_local0( f19_arg1 )
	f19_arg1.hasEquipmentSubscriptions = true
	return f19_local0
end

local f0_local11 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = {}
	f21_arg1.hintStrings = {}
	local f21_local1 = Engine.GetModel( Engine.GetModelForController( f21_arg0 ), "perks" )
	if f21_local1 then
		for f21_local2 = 0, CoD.CACUtility.maxPerkCategories - 1, 1 do
			local f21_local5 = Engine.GetModelValue( Engine.GetModel( f21_local1, "perk" .. f21_local2 .. "_count" ) ) or 0
			for f21_local6 = 0, CoD.CACUtility.maxPerksInEachCategory - 1, 1 do
				local f21_local9 = Engine.GetModel( f21_local1, "perk" .. f21_local2 .. "_" .. f21_local6 )
				local f21_local10 = Engine.GetModel( f21_local9, "image" )
				local f21_local11 = Engine.GetModel( f21_local9, "name" )
				if f21_local6 < f21_local5 then
					table.insert( f21_local0, {
						models = {
							image = Engine.GetModelValue( f21_local10 )
						}
					} )
					table.insert( f21_arg1.hintStrings, Engine.GetModelValue( f21_local11 ) )
				end
			end
		end
		if f21_arg1.hasPerkSubscriptions ~= true then
			f21_arg1:subscribeToModel( Engine.GetModel( f21_local1, "anyPerkChanged" ), function ()
				f0_local5( f21_arg1 )
			end, false )
			f21_arg1.hasPerkSubscriptions = true
		else
			f0_local0( f21_arg1 )
			return f21_local0
		end
	end
	f0_local0( f21_arg1 )
	return f21_local0
end

local f0_local12 = function ( f23_arg0, f23_arg1 )
	local f23_local0 = {}
	f23_arg1.hintStrings = {}
	local f23_local1 = Engine.GetModel( Engine.GetModelForController( f23_arg0 ), "bonuscards" )
	if f23_local1 then
		for f23_local2 = 0, 2, 1 do
			local f23_local5 = Engine.GetModel( f23_local1, "card" .. f23_local2 )
			if f23_local5 ~= nil and f23_arg1.hasBonusCardSubscriptions ~= true then
				f23_arg1:subscribeToModel( f23_local5, function ()
					f0_local5( f23_arg1 )
				end, false )
			end
			local f23_local6 = f23_local5 and Engine.GetModelValue( f23_local5 )
			if f23_local6 and f23_local6 ~= 0 then
				table.insert( f23_local0, {
					models = {
						image = CoD.CACUtility.GetImageForItemRef( f23_local6 )
					}
				} )
				table.insert( f23_arg1.hintStrings, Engine.Localize( CoD.CACUtility.GetNameForItemRef( f23_local6 ) ) )
			end
			f23_arg1.hasBonusCardSubscriptions = true
		end
	end
	f0_local0( f23_arg1 )
	return f23_local0
end

DataSources.CodCasterLoadoutAbilityOrWeapon = DataSourceHelpers.ListSetup( "CodCasterLoadoutAbilityOrWeapon", f0_local6, true )
DataSources.CodCasterLoadoutPrimary = DataSourceHelpers.ListSetup( "CodCasterLoadoutPrimary", f0_local8, true )
DataSources.CodCasterLoadoutSecondary = DataSourceHelpers.ListSetup( "CodCasterLoadoutSecondary", f0_local9, true )
DataSources.CodCasterLoadoutEquipment = DataSourceHelpers.ListSetup( "CodCasterLoadoutEquipment", f0_local10, true )
DataSources.CodCasterLoadoutPerks = DataSourceHelpers.ListSetup( "CodCasterLoadoutPerks", f0_local11, true )
DataSources.CodCasterLoadoutWildcards = DataSourceHelpers.ListSetup( "CodCasterLoadoutWildcards", f0_local12, true )
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
	
	local Perks = CoD.CodCasterLoadoutItem.new( menu, controller )
	Perks:setLeftRight( true, false, 581, 701 )
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
	Wildcards:setLeftRight( true, false, 701, 821 )
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
		element.Perks:close()
		element.Wildcards:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

