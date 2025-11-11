require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenVSCirclePnlIntl" )

CoD.LoadingScreenVSCirclePnl = InheritFrom( LUI.UIElement )
CoD.LoadingScreenVSCirclePnl.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenVSCirclePnl )
	self.id = "LoadingScreenVSCirclePnl"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 135 )
	self:setTopBottom( 0, 0, 0, 135 )
	self.anyChildUsesUpdateState = true
	
	local LoadingScreenVSCirclePnlIntl = CoD.LoadingScreenVSCirclePnlIntl.new( menu, controller )
	LoadingScreenVSCirclePnlIntl:setLeftRight( 0, 0, 0, 135 )
	LoadingScreenVSCirclePnlIntl:setTopBottom( 0, 0, 0, 135 )
	self:addElement( LoadingScreenVSCirclePnlIntl )
	self.LoadingScreenVSCirclePnlIntl = LoadingScreenVSCirclePnlIntl
	
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingScreenVSCirclePnlIntl:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

