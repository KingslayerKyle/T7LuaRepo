local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "ballGametype.passOption" )
end

CoD.uplinkReticle = InheritFrom( LUI.UIElement )
CoD.uplinkReticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.uplinkReticle )
	self.id = "uplinkReticle"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 130 )
	self:setTopBottom( true, false, 0, 130 )
	
	local reticleNew = LUI.UIImage.new()
	reticleNew:setLeftRight( false, false, -65.18, 65.18 )
	reticleNew:setTopBottom( false, false, -65.18, 65.18 )
	reticleNew:setAlpha( 0.9 )
	reticleNew:setScale( 0.7 )
	reticleNew:setImage( RegisterImage( "uie_reticle_uplink" ) )
	self:addElement( reticleNew )
	self.reticleNew = reticleNew
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				reticleNew:completeAnimation()
				self.reticleNew:setRGB( 1, 1, 1 )
				self.clipFinished( reticleNew, {} )
			end
		},
		PassTarget = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				reticleNew:completeAnimation()
				self.reticleNew:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
				self.clipFinished( reticleNew, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PassTarget",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "ballGametype.passOption", 1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ballGametype.passOption" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ballGametype.passOption"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

