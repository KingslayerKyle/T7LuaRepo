CoD.TacticalModeDistanceWidget = InheritFrom( LUI.UIElement )
CoD.TacticalModeDistanceWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TacticalModeDistanceWidget )
	self.id = "TacticalModeDistanceWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 32 )
	
	local distanceText = LUI.UIText.new()
	distanceText:setLeftRight( true, true, 0, 0 )
	distanceText:setTopBottom( false, false, -11, 15 )
	distanceText:setAlpha( 0.9 )
	distanceText:setTTF( "fonts/escom.ttf" )
	distanceText:setLetterSpacing( 2 )
	distanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	distanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	distanceText:linkToElementModel( self, "distance", true, function ( model )
		local distance = Engine.GetModelValue( model )
		if distance then
			distanceText:setText( LocalizeIntoString( "CPUI_X_METERS", distance ) )
		end
	end )
	self:addElement( distanceText )
	self.distanceText = distanceText
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.distanceText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

