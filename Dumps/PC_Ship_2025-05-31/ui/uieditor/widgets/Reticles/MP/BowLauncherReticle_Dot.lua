CoD.BowLauncherReticle_Dot = InheritFrom( LUI.UIElement )
CoD.BowLauncherReticle_Dot.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BowLauncherReticle_Dot )
	self.id = "BowLauncherReticle_Dot"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 6 )
	self:setTopBottom( true, false, 0, 6 )
	
	local CenterDot = LUI.UIImage.new()
	CenterDot:setLeftRight( true, true, 0, 0 )
	CenterDot:setTopBottom( true, true, 0, 0 )
	CenterDot:setImage( RegisterImage( "uie_bowlauncher_center_dot" ) )
	self:addElement( CenterDot )
	self.CenterDot = CenterDot
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CenterDot:completeAnimation()
				self.CenterDot:setLeftRight( true, true, 0.5, -0.5 )
				self.CenterDot:setTopBottom( true, true, 0.5, -0.5 )
				self.clipFinished( CenterDot, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				CenterDot:completeAnimation()
				self.CenterDot:setLeftRight( true, true, 0, 0 )
				self.CenterDot:setTopBottom( true, true, 0, 0 )
				self.clipFinished( CenterDot, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.currentShotCharge", 0.9 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.currentShotCharge" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.currentShotCharge"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

