-- 2314410b9fb18c2dcf40a352f60493f2
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.core_AmmoWidget.AmmoWidgetMP_EquipGlow" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_EquipTacFactory" )
require( "ui.uieditor.widgets.HUD.ZM_AmmoWidget.ZmAmmo_EquipEmpty" )

CoD.ZmAmmo_EquipContainerFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_EquipContainerFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_EquipContainerFactory )
	self.id = "ZmAmmo_EquipContainerFactory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 51 )
	self.anyChildUsesUpdateState = true
	
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
	
	local LethalGlowTop = CoD.AmmoWidgetMP_EquipGlow.new( menu, controller )
	LethalGlowTop:setLeftRight( true, false, 30.85, 65.65 )
	LethalGlowTop:setTopBottom( true, false, 1, 49.15 )
	LethalGlowTop:setAlpha( 0.97 )
	LethalGlowTop.Image0:setRGB( 0, 0.35, 0.58 )
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
	
	local TacticalGlowTop = CoD.AmmoWidgetMP_EquipGlow.new( menu, controller )
	TacticalGlowTop:setLeftRight( true, false, 6.65, 41.44 )
	TacticalGlowTop:setTopBottom( true, false, 2, 50.15 )
	TacticalGlowTop:setAlpha( 0.97 )
	TacticalGlowTop.Image0:setRGB( 0, 0.35, 0.58 )
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
	
	local TacticalRing = LUI.UIImage.new()
	TacticalRing:setLeftRight( true, false, 4.65, 40.65 )
	TacticalRing:setTopBottom( true, false, 7.07, 43.07 )
	TacticalRing:setRGB( 0.19, 0.99, 0.96 )
	TacticalRing:setAlpha( 0 )
	TacticalRing:setImage( RegisterImage( "uie_t7_zm_hud_ammo_elminvcrc" ) )
	TacticalRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TacticalRing )
	self.TacticalRing = TacticalRing
	
	local LethalRing = LUI.UIImage.new()
	LethalRing:setLeftRight( true, false, 27.65, 63.65 )
	LethalRing:setTopBottom( true, false, 7.07, 43.07 )
	LethalRing:setRGB( 0.19, 0.99, 0.96 )
	LethalRing:setAlpha( 0 )
	LethalRing:setImage( RegisterImage( "uie_t7_zm_hud_ammo_elminvcrc" ) )
	LethalRing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LethalRing )
	self.LethalRing = LethalRing
	
	local TacticalItem = CoD.ZmAmmo_EquipTacFactory.new( menu, controller )
	TacticalItem:setLeftRight( true, false, 7.15, 44.15 )
	TacticalItem:setTopBottom( true, false, 4.07, 36.07 )
	TacticalItem:setRGB( 1, 0.99, 0.93 )
	TacticalItem:setAlpha( 0.79 )
	TacticalItem:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	TacticalItem:setShaderVector( 0, 0.2, 1, 0, 0 )
	TacticalItem:setShaderVector( 1, 0, 0, 0, 0 )
	TacticalItem:setShaderVector( 2, 0, 0, 0, 0 )
	TacticalItem:setShaderVector( 3, 0, 0, 0, 0 )
	TacticalItem:setShaderVector( 4, 0, 0, 0, 0 )
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
	
	local LethalItem = CoD.ZmAmmo_EquipTacFactory.new( menu, controller )
	LethalItem:setLeftRight( true, false, 37.15, 74.15 )
	LethalItem:setTopBottom( true, false, 3.82, 35.82 )
	LethalItem:setRGB( 1, 0.99, 0.93 )
	LethalItem:setAlpha( 0.79 )
	LethalItem:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration" ) )
	LethalItem:setShaderVector( 0, 0.2, 1, 0, 0 )
	LethalItem:setShaderVector( 1, 0, 0, 0, 0 )
	LethalItem:setShaderVector( 2, 0, 0, 0, 0 )
	LethalItem:setShaderVector( 3, 0, 0, 0, 0 )
	LethalItem:setShaderVector( 4, 0, 0, 0, 0 )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		OffsetLeft = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				LethalGlow:completeAnimation()
				self.LethalGlow:setLeftRight( true, false, 14.84, 62.99 )
				self.LethalGlow:setTopBottom( true, false, 4.07, 52.22 )
				self.clipFinished( LethalGlow, {} )
				TacticalGlow:completeAnimation()
				self.TacticalGlow:setLeftRight( true, false, -8, 40.15 )
				self.TacticalGlow:setTopBottom( true, false, 2, 50.15 )
				self.clipFinished( TacticalGlow, {} )
				LethalGlowTop:completeAnimation()
				self.LethalGlowTop:setLeftRight( true, false, 20.85, 55.65 )
				self.LethalGlowTop:setTopBottom( true, false, 1, 49.15 )
				self.clipFinished( LethalGlowTop, {} )
				TacticalGlowTop:completeAnimation()
				self.TacticalGlowTop:setLeftRight( true, false, -3.35, 31.44 )
				self.TacticalGlowTop:setTopBottom( true, false, 2, 50.15 )
				self.clipFinished( TacticalGlowTop, {} )
				TacticalRing:completeAnimation()
				self.TacticalRing:setLeftRight( true, false, 4.65, 40.65 )
				self.TacticalRing:setTopBottom( true, false, 0.07, 36.07 )
				self.clipFinished( TacticalRing, {} )
				LethalRing:completeAnimation()
				self.LethalRing:setLeftRight( true, false, 27.65, 63.65 )
				self.LethalRing:setTopBottom( true, false, 0.07, 36.07 )
				self.clipFinished( LethalRing, {} )
				TacticalItem:completeAnimation()
				self.TacticalItem:setLeftRight( true, false, -2.85, 34.15 )
				self.TacticalItem:setTopBottom( true, false, 4.07, 36.07 )
				self.clipFinished( TacticalItem, {} )
				LethalItem:completeAnimation()
				self.LethalItem:setLeftRight( true, false, 27.15, 64.15 )
				self.LethalItem:setTopBottom( true, false, 3.82, 35.82 )
				self.clipFinished( LethalItem, {} )
				TacticalEmpty:completeAnimation()
				self.TacticalEmpty:setLeftRight( true, false, 9.05, 35.05 )
				self.TacticalEmpty:setTopBottom( true, false, 5.07, 31.07 )
				self.clipFinished( TacticalEmpty, {} )
				LethalEmpty:completeAnimation()
				self.LethalEmpty:setLeftRight( true, false, 33.05, 59.05 )
				self.LethalEmpty:setTopBottom( true, false, 5.07, 31.07 )
				self.clipFinished( LethalEmpty, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LethalGlow:close()
		element.TacticalGlow:close()
		element.LethalGlowTop:close()
		element.TacticalGlowTop:close()
		element.TacticalItem:close()
		element.LethalItem:close()
		element.TacticalEmpty:close()
		element.LethalEmpty:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

