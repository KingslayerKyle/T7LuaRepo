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
	distanceText:setRGB( 1, 1, 1 )
	distanceText:setAlpha( 0.9 )
	distanceText:setTTF( "fonts/Entovo.ttf" )
	distanceText:setLetterSpacing( 2 )
	distanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	distanceText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	distanceText:linkToElementModel( self, "distance", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			distanceText:setText( Engine.Localize( LocalizeIntoString( modelValue, "CPUI_X_METERS" ) ) )
		end
	end )
	self:addElement( distanceText )
	self.distanceText = distanceText
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -3, 5 )
	Image0:setTopBottom( true, false, 0, 8 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0.6 )
	Image0:setZoom( 2 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_pluselement" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -4, 4 )
	Image1:setTopBottom( true, false, 0, 8 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setAlpha( 0.6 )
	Image1:setZoom( 2 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_pluselement" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, -3, 5 )
	Image2:setTopBottom( false, true, -8, 0 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setAlpha( 0.6 )
	Image2:setZoom( 2 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_pluselement" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -4, 4 )
	Image3:setTopBottom( false, true, -8, 0 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setAlpha( 0.6 )
	Image3:setZoom( 2 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_pluselement" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self.close = function ( self )
		self.distanceText:close()
		CoD.TacticalModeDistanceWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

