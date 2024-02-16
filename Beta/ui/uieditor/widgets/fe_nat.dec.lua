CoD.fe_NAT = InheritFrom( LUI.UIElement )
CoD.fe_NAT.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_NAT )
	self.id = "fe_NAT"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 115 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Nat = LUI.UIText.new()
	Nat:setLeftRight( false, false, -57, 57.5 )
	Nat:setTopBottom( false, false, -4, 10 )
	Nat:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Nat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Nat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Nat:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyNatType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Nat:setText( LocalizeWithNatType( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( Nat, "setText", function ( element, text )
		ScaleWidgetToLabelRightAligned( self, element, 0 )
	end )
	self:addElement( Nat )
	self.Nat = Nat
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Nat:completeAnimation()
				self.Nat:setAlpha( 1 )
				self.clipFinished( Nat, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Nat:completeAnimation()
				self.Nat:setAlpha( 0 )
				self.clipFinished( Nat, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsLAN()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Hidden" ) then
			OverrideWidgetWidth( self, "0" )
		else
			RestoreWidgetWidth( self )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Nat:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

