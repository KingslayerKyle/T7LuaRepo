require( "ui.uieditor.widgets.Lobby.Common.FE_TalkerWidgetBase" )

CoD.FE_TalkersWidget = InheritFrom( LUI.UIElement )
CoD.FE_TalkersWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TalkersWidget )
	self.id = "FE_TalkersWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 586 )
	self.anyChildUsesUpdateState = true
	
	local Talkers = LUI.UIList.new( menu, controller, 8, 0, nil, false, false, 0, 0, false, false )
	Talkers:makeFocusable()
	Talkers:setLeftRight( 0, 0, 0, 285 )
	Talkers:setTopBottom( 0, 0, 0, 586 )
	Talkers:setWidgetType( CoD.FE_TalkerWidgetBase )
	Talkers:setVerticalCount( 18 )
	Talkers:setSpacing( 8 )
	Talkers:setDataSource( "FrontendVoip" )
	self:addElement( Talkers )
	self.Talkers = Talkers
	
	self.resetProperties = function ()
		Talkers:completeAnimation()
		Talkers:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Talkers:completeAnimation()
				self.Talkers:setAlpha( 0 )
				self.clipFinished( Talkers, {} )
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
				return PregameActive()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.state" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.state"
		} )
	end )
	Talkers.id = "Talkers"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Talkers:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

