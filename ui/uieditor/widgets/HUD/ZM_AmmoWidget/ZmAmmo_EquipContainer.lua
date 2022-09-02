-- 8d8d42d878f4e42ec3b174992a6d4a76
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_EquipGlow" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_EquipTac" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_EquipEmpty" )

local PostLoadFunc = function ( self, controller, menu )
	CoD.AmmoWidgetUtility.InitTacticalEmptyPulse( self, self.TacticalEmpty, controller, CoD.ZmAmmo_EquipEmpty, menu )
	CoD.AmmoWidgetUtility.InitLethalEmptyPulse( self, self.LethalEmpty, controller, CoD.ZmAmmo_EquipEmpty, menu )
end

CoD.ZmAmmo_EquipContainer = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_EquipContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_EquipContainer )
	self.id = "ZmAmmo_EquipContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local TacticalRing = LUI.UIImage.new()
	TacticalRing:setLeftRight( true, false, 4.65, 40.65 )
	TacticalRing:setTopBottom( true, false, 7.07, 43.07 )
	TacticalRing:setRGB( 1, 0.54, 0 )
	TacticalRing:setAlpha( 0.77 )
	TacticalRing:setImage( RegisterImage( "uie_t7_zm_hud_ammo_elminvcrc" ) )
	TacticalRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TacticalRing )
	self.TacticalRing = TacticalRing
	
	local LethalRing = LUI.UIImage.new()
	LethalRing:setLeftRight( true, false, 27.65, 63.65 )
	LethalRing:setTopBottom( true, false, 7.07, 43.07 )
	LethalRing:setRGB( 1, 0.54, 0 )
	LethalRing:setAlpha( 0.59 )
	LethalRing:setImage( RegisterImage( "uie_t7_zm_hud_ammo_elminvcrc" ) )
	LethalRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LethalRing )
	self.LethalRing = LethalRing
	
	local LethalGlow = CoD.AmmoWidgetMP_EquipGlow.new( menu, controller )
	LethalGlow:setLeftRight( true, false, 24.84, 72.99 )
	LethalGlow:setTopBottom( true, false, 4.07, 52.22 )
	LethalGlow:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "currentPrimaryOffhand.primaryOffhandCount", 0 )
			end
		}
	} )
	LethalGlow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		menu:updateElementState( LethalGlow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentPrimaryOffhand.primaryOffhandCount"
		} )
	end )
	self:addElement( LethalGlow )
	self.LethalGlow = LethalGlow
	
	local TacticalGlow = CoD.AmmoWidgetMP_EquipGlow.new( menu, controller )
	TacticalGlow:setLeftRight( true, false, 2, 50.15 )
	TacticalGlow:setTopBottom( true, false, 2, 50.15 )
	TacticalGlow:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "currentSecondaryOffhand.secondaryOffhandCount", 0 )
			end
		}
	} )
	TacticalGlow:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		menu:updateElementState( TacticalGlow, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentSecondaryOffhand.secondaryOffhandCount"
		} )
	end )
	self:addElement( TacticalGlow )
	self.TacticalGlow = TacticalGlow
	
	local TacticalItem = CoD.ZmAmmo_EquipTac.new( menu, controller )
	TacticalItem:setLeftRight( true, false, 13.15, 50.15 )
	TacticalItem:setTopBottom( true, false, 4.07, 36.07 )
	TacticalItem:setRGB( 1, 0.99, 0.93 )
	TacticalItem:setAlpha( 0.79 )
	TacticalItem:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical0:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical1b:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical1:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical2b:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical2:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical3b:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:subscribeToGlobalModel( controller, "CurrentSecondaryOffhand", "secondaryOffhand", function ( model )
		local secondaryOffhand = Engine.GetModelValue( model )
		if secondaryOffhand then
			TacticalItem.Tactical3:setImage( RegisterImage( secondaryOffhand ) )
		end
	end )
	TacticalItem:mergeStateConditions( {
		{
			stateName = "Single",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentSecondaryOffhand.secondaryOffhandCount", 1 )
			end
		},
		{
			stateName = "Double",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentSecondaryOffhand.secondaryOffhandCount", 2 )
			end
		},
		{
			stateName = "Triple",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentSecondaryOffhand.secondaryOffhandCount", 3 )
			end
		},
		{
			stateName = "Quad",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentSecondaryOffhand.secondaryOffhandCount", 4 )
			end
		}
	} )
	TacticalItem:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		menu:updateElementState( TacticalItem, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentSecondaryOffhand.secondaryOffhandCount"
		} )
	end )
	self:addElement( TacticalItem )
	self.TacticalItem = TacticalItem
	
	local LethalItem = CoD.ZmAmmo_EquipTac.new( menu, controller )
	LethalItem:setLeftRight( true, false, 37.15, 74.15 )
	LethalItem:setTopBottom( true, false, 3.82, 35.82 )
	LethalItem:setRGB( 1, 0.99, 0.93 )
	LethalItem:setAlpha( 0.79 )
	LethalItem:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Tactical0:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Tactical1b:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Tactical1:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Tactical2b:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Tactical2:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Tactical3b:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:subscribeToGlobalModel( controller, "CurrentPrimaryOffhand", "primaryOffhand", function ( model )
		local primaryOffhand = Engine.GetModelValue( model )
		if primaryOffhand then
			LethalItem.Tactical3:setImage( RegisterImage( primaryOffhand ) )
		end
	end )
	LethalItem:mergeStateConditions( {
		{
			stateName = "Single",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentPrimaryOffhand.primaryOffhandCount", 1 )
			end
		},
		{
			stateName = "Double",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentPrimaryOffhand.primaryOffhandCount", 2 )
			end
		},
		{
			stateName = "Triple",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "currentPrimaryOffhand.primaryOffhandCount", 3 )
			end
		},
		{
			stateName = "Quad",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentPrimaryOffhand.primaryOffhandCount", 4 )
			end
		}
	} )
	LethalItem:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		menu:updateElementState( LethalItem, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentPrimaryOffhand.primaryOffhandCount"
		} )
	end )
	self:addElement( LethalItem )
	self.LethalItem = LethalItem
	
	local TacticalGlowTop = CoD.AmmoWidgetMP_EquipGlow.new( menu, controller )
	TacticalGlowTop:setLeftRight( true, false, 6.65, 41.44 )
	TacticalGlowTop:setTopBottom( true, false, 2, 50.15 )
	TacticalGlowTop:setAlpha( 0.97 )
	TacticalGlowTop.Image0:setRGB( 1, 0.36, 0 )
	TacticalGlowTop.Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	TacticalGlowTop:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "currentSecondaryOffhand.secondaryOffhandCount", 0 )
			end
		}
	} )
	TacticalGlowTop:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentSecondaryOffhand.secondaryOffhandCount" ), function ( model )
		menu:updateElementState( TacticalGlowTop, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentSecondaryOffhand.secondaryOffhandCount"
		} )
	end )
	self:addElement( TacticalGlowTop )
	self.TacticalGlowTop = TacticalGlowTop
	
	local LethalGlowTop = CoD.AmmoWidgetMP_EquipGlow.new( menu, controller )
	LethalGlowTop:setLeftRight( true, false, 30.85, 65.65 )
	LethalGlowTop:setTopBottom( true, false, 1, 49.15 )
	LethalGlowTop:setAlpha( 0.97 )
	LethalGlowTop.Image0:setRGB( 1, 0.36, 0 )
	LethalGlowTop.Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	LethalGlowTop:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "currentPrimaryOffhand.primaryOffhandCount", 0 )
			end
		}
	} )
	LethalGlowTop:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentPrimaryOffhand.primaryOffhandCount" ), function ( model )
		menu:updateElementState( LethalGlowTop, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentPrimaryOffhand.primaryOffhandCount"
		} )
	end )
	self:addElement( LethalGlowTop )
	self.LethalGlowTop = LethalGlowTop
	
	local TacticalEmpty = CoD.ZmAmmo_EquipEmpty.new( menu, controller )
	TacticalEmpty:setLeftRight( true, false, 9.05, 35.05 )
	TacticalEmpty:setTopBottom( true, false, 12.07, 38.07 )
	self:addElement( TacticalEmpty )
	self.TacticalEmpty = TacticalEmpty
	
	local LethalEmpty = CoD.ZmAmmo_EquipEmpty.new( menu, controller )
	LethalEmpty:setLeftRight( true, false, 33.05, 59.05 )
	LethalEmpty:setTopBottom( true, false, 12.07, 38.07 )
	self:addElement( LethalEmpty )
	self.LethalEmpty = LethalEmpty
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LethalGlow:close()
		element.TacticalGlow:close()
		element.TacticalItem:close()
		element.LethalItem:close()
		element.TacticalGlowTop:close()
		element.LethalGlowTop:close()
		element.TacticalEmpty:close()
		element.LethalEmpty:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

