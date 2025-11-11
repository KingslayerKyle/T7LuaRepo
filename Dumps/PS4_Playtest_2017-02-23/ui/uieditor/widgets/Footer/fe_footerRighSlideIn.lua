require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

CoD.fe_footerRighSlideIn = InheritFrom( LUI.UIElement )
CoD.fe_footerRighSlideIn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_footerRighSlideIn )
	self.id = "fe_footerRighSlideIn"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 649 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( 1, 1, -446, 202 )
	buttons:setTopBottom( 1, 1, -48, 0 )
	self:addElement( buttons )
	self.buttons = buttons
	
	self:mergeStateConditions( {
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.buttons:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

