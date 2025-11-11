CoD.LoadingScreenVSCirclePnlIntl = InheritFrom( LUI.UIElement )
CoD.LoadingScreenVSCirclePnlIntl.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenVSCirclePnlIntl )
	self.id = "LoadingScreenVSCirclePnlIntl"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 135 )
	self:setTopBottom( 0, 0, 0, 135 )
	
	local VSCircle = LUI.UIImage.new()
	VSCircle:setLeftRight( 0, 0, 0, 135 )
	VSCircle:setTopBottom( 0, 0, 0, 135 )
	VSCircle:setRGB( 0, 0, 0 )
	VSCircle:setImage( RegisterImage( "uie_t7_hud_loadingscreen_factioncircle" ) )
	self:addElement( VSCircle )
	self.VSCircle = VSCircle
	
	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

