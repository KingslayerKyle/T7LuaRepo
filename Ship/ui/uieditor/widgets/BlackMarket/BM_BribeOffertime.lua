-- fe2d34917975883b5e523f8972474de0
-- This hash is used for caching, delete to decompile the file again

CoD.BM_BribeOffertime = InheritFrom( LUI.UIElement )
CoD.BM_BribeOffertime.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_BribeOffertime )
	self.id = "BM_BribeOffertime"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 352 )
	self:setTopBottom( true, false, 0, 20 )
	
	local BribeOfferTime = LUI.UIText.new()
	BribeOfferTime:setLeftRight( true, false, 0, 352 )
	BribeOfferTime:setTopBottom( false, true, -20, 0 )
	BribeOfferTime:setRGB( 0.3, 0.87, 1 )
	BribeOfferTime:setText( Engine.Localize( "MPUI_BM_BRIBE_END_TIME" ) )
	BribeOfferTime:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BribeOfferTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BribeOfferTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	self:addElement( BribeOfferTime )
	self.BribeOfferTime = BribeOfferTime
	
	local BribeBuyFast = LUI.UIText.new()
	BribeBuyFast:setLeftRight( true, false, 0, 352 )
	BribeBuyFast:setTopBottom( false, true, -20, 0 )
	BribeBuyFast:setRGB( 0.3, 0.87, 1 )
	BribeBuyFast:setAlpha( 0 )
	BribeBuyFast:setText( Engine.Localize( "MPUI_BM_BRIBE_BUY_FAST" ) )
	BribeBuyFast:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	BribeBuyFast:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BribeBuyFast:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	self:addElement( BribeBuyFast )
	self.BribeBuyFast = BribeBuyFast
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				BribeOfferTime:completeAnimation()
				self.BribeOfferTime:setAlpha( 1 )
				self.clipFinished( BribeOfferTime, {} )

				BribeBuyFast:completeAnimation()
				self.BribeBuyFast:setAlpha( 0 )
				self.clipFinished( BribeBuyFast, {} )
			end
		},
		Expired = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				BribeOfferTime:completeAnimation()
				self.BribeOfferTime:setAlpha( 0 )
				self.clipFinished( BribeOfferTime, {} )

				BribeBuyFast:completeAnimation()
				self.BribeBuyFast:setAlpha( 1 )
				self.clipFinished( BribeBuyFast, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Expired",
			condition = function ( menu, element, event )
				return not IsBribeActive( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "autoevents.cycled" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "autoevents.cycled"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
