-- a980a07a3f0d42db619145bc49e13c35
-- This hash is used for caching, delete to decompile the file again

CoD.Cookbook_Indicator_Triangle = InheritFrom( LUI.UIElement )
CoD.Cookbook_Indicator_Triangle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_Indicator_Triangle )
	self.id = "Cookbook_Indicator_Triangle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local IndicatorTriangle = LUI.UIImage.new()
	IndicatorTriangle:setLeftRight( true, false, 0, 24 )
	IndicatorTriangle:setTopBottom( true, false, 0, 24 )
	IndicatorTriangle:setImage( RegisterImage( "uie_t7_zm_cookbook_indicator_triangle" ) )
	self:addElement( IndicatorTriangle )
	self.IndicatorTriangle = IndicatorTriangle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				IndicatorTriangle:completeAnimation()
				self.IndicatorTriangle:setAlpha( 0 )
				self.clipFinished( IndicatorTriangle, {} )
			end
		},
		Red = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				IndicatorTriangle:completeAnimation()
				self.IndicatorTriangle:setRGB( 1, 0.04, 0 )
				self.clipFinished( IndicatorTriangle, {} )
			end
		},
		Green = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				IndicatorTriangle:completeAnimation()
				self.IndicatorTriangle:setRGB( 0.16, 0.92, 0.15 )
				self.clipFinished( IndicatorTriangle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Red",
			condition = function ( menu, element, event )
				return not HasGobbleGumCookbookIngredients( controller )
			end
		},
		{
			stateName = "Green",
			condition = function ( menu, element, event )
				return HasGobbleGumCookbookIngredients( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "GobbleGumRecipeInfo.haveAllIngredients" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "GobbleGumRecipeInfo.haveAllIngredients"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

