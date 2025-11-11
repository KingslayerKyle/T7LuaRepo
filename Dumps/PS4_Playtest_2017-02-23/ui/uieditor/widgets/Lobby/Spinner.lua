require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoadingWidget" )

CoD.Spinner = InheritFrom( LUI.UIElement )
CoD.Spinner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Spinner )
	self.id = "Spinner"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local lblMessage = LUI.UIText.new()
	lblMessage:setLeftRight( 1, 1, -251, -133 )
	lblMessage:setTopBottom( 1, 1, -104, -66 )
	lblMessage:setTTF( "fonts/default.ttf" )
	lblMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lblMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lblMessage:subscribeToGlobalModel( controller, "SpinnerMessage", "spinnerMessage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lblMessage:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( lblMessage )
	self.lblMessage = lblMessage
	
	local AnimationLoadingWidget0 = CoD.AnimationLoadingWidget.new( menu, controller )
	AnimationLoadingWidget0:setLeftRight( 0, 0, 1638, 1854 )
	AnimationLoadingWidget0:setTopBottom( 0, 0, 810, 1026 )
	AnimationLoadingWidget0:setScale( 0.65 )
	self:addElement( AnimationLoadingWidget0 )
	self.AnimationLoadingWidget0 = AnimationLoadingWidget0
	
	self.resetProperties = function ()
		AnimationLoadingWidget0:completeAnimation()
		AnimationLoadingWidget0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				AnimationLoadingWidget0:completeAnimation()
				self.AnimationLoadingWidget0:setAlpha( 0 )
				self.clipFinished( AnimationLoadingWidget0, {} )
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
				return IsGlobalModelValueTrue( element, controller, "lobbyRoot.spinnerActive" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.spinnerActive"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsSelfInState( self, "Visible" ) then
			CoD.LobbyUtility.SetSpinnerActive( true )
		else
			CoD.LobbyUtility.SetSpinnerActive( false )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.AnimationLoadingWidget0:close()
		self.lblMessage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = self
	PlayClipOnElement( self, {
		elementName = "AnimationLoadingWidget0",
		clipName = "DefaultClip"
	}, controller )
	return self
end

