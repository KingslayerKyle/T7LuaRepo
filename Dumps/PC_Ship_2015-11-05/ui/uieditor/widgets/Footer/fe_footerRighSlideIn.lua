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
	self:setLeftRight( true, false, 0, 433 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	buttons:setLeftRight( false, true, -297, 135 )
	buttons:setTopBottom( false, true, -32, 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.buttons:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

