-- c62e6658367547e696cf3fc953be3b8c
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 132 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Nat = LUI.UIText.new()
	Nat:setLeftRight( false, false, -58, 66 )
	Nat:setTopBottom( false, false, -7, 7 )
	Nat:setScale( LanguageOverrideNumber( "japanese", 0.8, 1 ) )
	Nat:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Nat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Nat:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Nat:subscribeToGlobalModel( controller, "LobbyRoot", "lobbyNatType", function ( model )
		local lobbyNatType = Engine.GetModelValue( model )
		if lobbyNatType then
			Nat:setText( LocalizeWithNatType( lobbyNatType ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalFirst( Nat, "setText", function ( element, controller )
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

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "Hidden" ) then
			OverrideWidgetWidth( self, "0" )
		else
			RestoreWidgetWidth( self )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Nat:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
