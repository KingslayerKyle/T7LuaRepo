-- 4caab42c2aa5a4a1fe5a17a41d5996e9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.BlackCell.CenterReticle" )
require( "ui.uieditor.widgets.HUD.BlackCell.HorizontalCompassBlackCell" )
require( "ui.uieditor.widgets.Reticles.BlackCell.TeamMateLockOn" )
require( "ui.uieditor.widgets.Reticles.BlackCell.Timer" )
require( "ui.uieditor.widgets.Reticles.BlackCell.Target" )

CoD.BlackCellInternal = InheritFrom( LUI.UIElement )
CoD.BlackCellInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BlackCellInternal )
	self.id = "BlackCellInternal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local OverlayBG = LUI.UIImage.new()
	OverlayBG:setLeftRight( false, false, -640, 640 )
	OverlayBG:setTopBottom( false, false, -360, 360 )
	OverlayBG:setImage( RegisterImage( "uie_t7_hud_blackcell_720overlaybg" ) )
	self:addElement( OverlayBG )
	self.OverlayBG = OverlayBG
	
	local CenterReticle = CoD.CenterReticle.new( menu, controller )
	CenterReticle:setLeftRight( false, false, -546.5, 546.5 )
	CenterReticle:setTopBottom( false, false, -247.5, 247.5 )
	CenterReticle:setScale( 0.66 )
	CenterReticle:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsModelValueEnumBitSet( controller, "currentWeapon.lockedOnEnemy", Enum.RocketLauncherTargetStatesFlags.ROCKET_LAUNCHER_TARGET_LOCKED )
			end
		}
	} )
	CenterReticle:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.lockedOnEnemy" ), function ( model )
		menu:updateElementState( CenterReticle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.lockedOnEnemy"
		} )
	end )
	self:addElement( CenterReticle )
	self.CenterReticle = CenterReticle
	
	local HorizontalCompassBlackCell = CoD.HorizontalCompassBlackCell.new( menu, controller )
	HorizontalCompassBlackCell:setLeftRight( false, false, -223.58, 227.27 )
	HorizontalCompassBlackCell:setTopBottom( true, false, 85.5, 160.5 )
	self:addElement( HorizontalCompassBlackCell )
	self.HorizontalCompassBlackCell = HorizontalCompassBlackCell
	
	local TeamMateLockOn = CoD.TeamMateLockOn.new( menu, controller )
	TeamMateLockOn:setLeftRight( true, false, 212.03, 347.6 )
	TeamMateLockOn:setTopBottom( false, false, -52, 50.88 )
	self:addElement( TeamMateLockOn )
	self.TeamMateLockOn = TeamMateLockOn
	
	local Timer = CoD.Timer.new( menu, controller )
	Timer:setLeftRight( false, true, -322, -225.4 )
	Timer:setTopBottom( false, false, -41.25, -1 )
	Timer:setScale( 0.9 )
	self:addElement( Timer )
	self.Timer = Timer
	
	local Target = CoD.Target.new( menu, controller )
	Target:setLeftRight( false, true, -325, -237 )
	Target:setTopBottom( false, false, 11.88, 51.88 )
	Target:setScale( 0.9 )
	self:addElement( Target )
	self.Target = Target
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CenterReticle:close()
		element.HorizontalCompassBlackCell:close()
		element.TeamMateLockOn:close()
		element.Timer:close()
		element.Target:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

