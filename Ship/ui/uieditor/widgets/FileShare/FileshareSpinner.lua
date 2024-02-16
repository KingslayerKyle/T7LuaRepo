-- 21754d80bbe93257d72113c5f2ba707f
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local SpinnerFlipbook = LUI.UIImage.new()
	SpinnerFlipbook:setLeftRight( true, false, -7, 71 )
	SpinnerFlipbook:setTopBottom( true, false, -7, 71 )
	SpinnerFlipbook:setRGB( 1, 0.63, 0 )
	SpinnerFlipbook:setImage( RegisterImage( "uie_t7_menu_loadingspinner_flipbook" ) )
	SpinnerFlipbook:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	SpinnerFlipbook:setShaderVector( 0, 28, 0, 0, 0 )
	SpinnerFlipbook:setShaderVector( 1, 22, 0, 0, 0 )
	self:addElement( SpinnerFlipbook )
	self.SpinnerFlipbook = SpinnerFlipbook
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				SpinnerFlipbook:completeAnimation()
				self.SpinnerFlipbook:setAlpha( 0 )
				self.clipFinished( SpinnerFlipbook, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				SpinnerFlipbook:completeAnimation()
				self.SpinnerFlipbook:setAlpha( 1 )
				self.clipFinished( SpinnerFlipbook, {} )
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
