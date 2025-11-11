CoD.FileshareSpinner = InheritFrom( LUI.UIElement )
CoD.FileshareSpinner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.FileshareSpinner )
	self.id = "FileshareSpinner"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 96 )
	self:setTopBottom( 0, 0, 0, 96 )
	
	local SpinnerFlipbook = LUI.UIImage.new()
	SpinnerFlipbook:setLeftRight( 0, 0, -11, 106 )
	SpinnerFlipbook:setTopBottom( 0, 0, -11, 106 )
	SpinnerFlipbook:setRGB( 1, 0.63, 0 )
	SpinnerFlipbook:setImage( RegisterImage( "t7_menu_loadingspinner_flipbook" ) )
	SpinnerFlipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	SpinnerFlipbook:setShaderVector( 0, 28, 0, 0, 0 )
	SpinnerFlipbook:setShaderVector( 1, 22, 0, 0, 0 )
	self:addElement( SpinnerFlipbook )
	self.SpinnerFlipbook = SpinnerFlipbook
	
	self.resetProperties = function ()
		SpinnerFlipbook:completeAnimation()
		SpinnerFlipbook:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				SpinnerFlipbook:completeAnimation()
				self.SpinnerFlipbook:setAlpha( 0 )
				self.clipFinished( SpinnerFlipbook, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not FileshareIsReady( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.ready" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.ready"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

