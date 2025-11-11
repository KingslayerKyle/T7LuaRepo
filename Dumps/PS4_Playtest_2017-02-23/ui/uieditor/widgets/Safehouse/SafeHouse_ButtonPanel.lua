CoD.SafeHouse_ButtonPanel = InheritFrom( LUI.UIElement )
CoD.SafeHouse_ButtonPanel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SafeHouse_ButtonPanel )
	self.id = "SafeHouse_ButtonPanel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 42 )
	
	local SafeHousePanel = LUI.UIImage.new()
	SafeHousePanel:setLeftRight( 0, 1, 0, 0 )
	SafeHousePanel:setTopBottom( 0, 1, 0, 0 )
	SafeHousePanel:setRGB( 0, 0, 0 )
	SafeHousePanel:setAlpha( 0.75 )
	self:addElement( SafeHousePanel )
	self.SafeHousePanel = SafeHousePanel
	
	self:mergeStateConditions( {
		{
			stateName = "Transparent",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "hideWorldForStreamer", 1 )
			end
		},
		{
			stateName = "Safehouse",
			condition = function ( menu, element, event )
				return IsCPAndInSafehouse()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "hideWorldForStreamer" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hideWorldForStreamer"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

