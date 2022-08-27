-- 74aa0a62e36a182d72d1182bde433e9e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.MP_ScoreStreakWidget.ScrStk_CombatEfficiencyScrollFX" )

CoD.ScrStk_MeterKaratInner = InheritFrom( LUI.UIElement )
CoD.ScrStk_MeterKaratInner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScrStk_MeterKaratInner )
	self.id = "ScrStk_MeterKaratInner"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 12 )
	self:setTopBottom( true, false, 0, 27 )
	self.anyChildUsesUpdateState = true
	
	local ScrStkCombatEfficiencyScrollFX000 = CoD.ScrStk_CombatEfficiencyScrollFX.new( menu, controller )
	ScrStkCombatEfficiencyScrollFX000:setLeftRight( false, false, -6, 6 )
	ScrStkCombatEfficiencyScrollFX000:setTopBottom( true, true, 2.5, -17.5 )
	ScrStkCombatEfficiencyScrollFX000:setXRot( 180 )
	ScrStkCombatEfficiencyScrollFX000:setZRot( 90 )
	self:addElement( ScrStkCombatEfficiencyScrollFX000 )
	self.ScrStkCombatEfficiencyScrollFX000 = ScrStkCombatEfficiencyScrollFX000
	
	local ScrStkCombatEfficiencyScrollFX0000 = CoD.ScrStk_CombatEfficiencyScrollFX.new( menu, controller )
	ScrStkCombatEfficiencyScrollFX0000:setLeftRight( false, false, -6, 6 )
	ScrStkCombatEfficiencyScrollFX0000:setTopBottom( true, true, 15.5, -4.5 )
	ScrStkCombatEfficiencyScrollFX0000:setZRot( 90 )
	self:addElement( ScrStkCombatEfficiencyScrollFX0000 )
	self.ScrStkCombatEfficiencyScrollFX0000 = ScrStkCombatEfficiencyScrollFX0000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			CombatEfficiency = function ()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		CombatEfficiency = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CombatEfficiency",
			condition = function ( menu, element, event )
				return HasPerk( controller, "specialty_combat_efficiency" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "playerAbilities.playerGadget3.isInUse" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "playerAbilities.playerGadget3.isInUse"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScrStkCombatEfficiencyScrollFX000:close()
		element.ScrStkCombatEfficiencyScrollFX0000:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

