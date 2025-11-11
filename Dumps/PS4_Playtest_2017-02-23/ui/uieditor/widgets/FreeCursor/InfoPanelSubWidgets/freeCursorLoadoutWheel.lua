CoD.freeCursorLoadoutWheel = InheritFrom( LUI.UIElement )
CoD.freeCursorLoadoutWheel.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorLoadoutWheel )
	self.id = "freeCursorLoadoutWheel"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1023 )
	self:setTopBottom( 0, 0, 0, 614 )
	
	local mainBackingTop = LUI.UIImage.new()
	mainBackingTop:setLeftRight( 0, 0.4, 0, 0 )
	mainBackingTop:setTopBottom( 0.22, 0.5, 0, 0 )
	mainBackingTop:setImage( RegisterImage( "uie_menu_loadout_main_backing_top" ) )
	self:addElement( mainBackingTop )
	self.mainBackingTop = mainBackingTop
	
	local mainBackingBottom = LUI.UIImage.new()
	mainBackingBottom:setLeftRight( 0, 0.4, 0, 0 )
	mainBackingBottom:setTopBottom( 0.5, 0.77, 0, 0 )
	mainBackingBottom:setImage( RegisterImage( "uie_menu_loadout_main_backing_bottom" ) )
	self:addElement( mainBackingBottom )
	self.mainBackingBottom = mainBackingBottom
	
	local mainBackingRight = LUI.UIImage.new()
	mainBackingRight:setLeftRight( 0.53, 0.93, 0, 0 )
	mainBackingRight:setTopBottom( 0.37, 0.63, 0, 0 )
	mainBackingRight:setImage( RegisterImage( "uie_menu_loadout_main_backing_bottom" ) )
	self:addElement( mainBackingRight )
	self.mainBackingRight = mainBackingRight
	
	local primary = LUI.UIImage.new()
	primary:setLeftRight( 0.04, 0.36, 0, 0 )
	primary:setTopBottom( 0.25, 0.47, 0, 0 )
	primary:linkToElementModel( self, "loadout", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			primary:setImage( RegisterImage( GetLoadoutSlotIcon( controller, "primary", modelValue ) ) )
		end
	end )
	self:addElement( primary )
	self.primary = primary
	
	local secondary = LUI.UIImage.new()
	secondary:setLeftRight( 0.04, 0.36, 0, 0 )
	secondary:setTopBottom( 0.52, 0.75, 0, 0 )
	secondary:linkToElementModel( self, "loadout", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			secondary:setImage( RegisterImage( GetLoadoutSlotIcon( controller, "secondary", modelValue ) ) )
		end
	end )
	self:addElement( secondary )
	self.secondary = secondary
	
	local primarygrenade = LUI.UIImage.new()
	primarygrenade:setLeftRight( 0.65, 0.79, 0, 0 )
	primarygrenade:setTopBottom( 0.38, 0.62, 0, 0 )
	primarygrenade:linkToElementModel( self, "loadout", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			primarygrenade:setImage( RegisterImage( GetLoadoutSlotIcon( controller, "primarygrenade", modelValue ) ) )
		end
	end )
	self:addElement( primarygrenade )
	self.primarygrenade = primarygrenade
	
	local startingLoadout = LUI.UIText.new()
	startingLoadout:setLeftRight( 0.05, 0.49, -32, -32 )
	startingLoadout:setTopBottom( 0.09, 0.22, 0, 0 )
	startingLoadout:setAlpha( 0.8 )
	startingLoadout:setText( Engine.Localize( "MENU_STARTING_LOADOUT_CAPS" ) )
	startingLoadout:setTTF( "fonts/default.ttf" )
	startingLoadout:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	startingLoadout:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( startingLoadout )
	self.startingLoadout = startingLoadout
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Hidden" )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.primary:close()
		self.secondary:close()
		self.primarygrenade:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	local element = nil
	element = primary
	SetElementProperty( element, "slot", "primary" )
	CoD.FreeCursorUtility.RegisterFlyoutAdvanced( menu, element, controller, "selectedItem", "possibleItemsList", "DefaultState", "FlyOut_Left" )
	element = secondary
	SetElementProperty( element, "slot", "primary" )
	CoD.FreeCursorUtility.RegisterFlyoutAdvanced( menu, element, controller, "selectedItem", "possibleItemsList", "DefaultState", "FlyOut_Left" )
	CoD.FreeCursorUtility.RegisterFlyoutAdvanced( menu, primarygrenade, controller, "selectedItem", "possibleItemsList", "DefaultState", "FlyOut_Right" )
	return self
end

