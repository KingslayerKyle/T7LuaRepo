require( "ui.uieditor.widgets.Reticles.MP.BowLauncherReticle_Internal" )

local PreLoadFunc = function ( self, controller )
	self:setupReticle( controller )
end

CoD.BowLauncherReticle = InheritFrom( LUI.UIElement )
CoD.BowLauncherReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BowLauncherReticle )
	self.id = "BowLauncherReticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local internal = CoD.BowLauncherReticle_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	internal:setRGB( 0.93, 0.99, 1 )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setRGB( 0.93, 0.99, 1 )
				self.clipFinished( internal, {} )
			end,
			Drawing = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setRGB( 1, 0, 0 )
				self.clipFinished( internal, {} )
			end
		},
		OverEnemy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setRGB( 1, 0, 0 )
				self.clipFinished( internal, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "OverEnemy",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "currentWeapon.weaponOverEnemy" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.weaponOverEnemy" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.weaponOverEnemy"
		} )
	end )
	self.close = function ( self )
		self.internal:close()
		CoD.BowLauncherReticle.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

