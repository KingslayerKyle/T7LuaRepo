CoD.WaypointDistanceIndicatorContainer = InheritFrom( LUI.UIElement )
CoD.WaypointDistanceIndicatorContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WaypointDistanceIndicatorContainer )
	self.id = "WaypointDistanceIndicatorContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 21 )
	
	local DistanceIndicator = LUI.UIText.new()
	DistanceIndicator:setLeftRight( true, true, 0, 0 )
	DistanceIndicator:setTopBottom( false, false, -9, 9 )
	DistanceIndicator:setAlpha( 0 )
	DistanceIndicator:setText( Engine.Localize( "MENU_NEW" ) )
	DistanceIndicator:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	DistanceIndicator:setLetterSpacing( 0.5 )
	DistanceIndicator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DistanceIndicator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DistanceIndicator )
	self.DistanceIndicator = DistanceIndicator
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DistanceIndicator:completeAnimation()
				self.DistanceIndicator:setLeftRight( true, true, 0, 0 )
				self.DistanceIndicator:setTopBottom( false, false, -60, -39 )
				self.clipFinished( DistanceIndicator, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

