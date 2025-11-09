CoD.PrematchVignette = InheritFrom( LUI.UIElement )
CoD.PrematchVignette.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PrematchVignette )
	self.id = "PrematchVignette"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local vignette = LUI.UIImage.new()
	vignette:setLeftRight( true, true, 0, 0 )
	vignette:setTopBottom( true, true, 0, 0 )
	vignette:setRGB( 0, 0, 0 )
	vignette:setImage( RegisterImage( "uie_hud_t7_countdown_vignette" ) )
	vignette:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	vignette:registerEventHandler( "hud_boot", function ( element, event )
		local retVal = nil
		if IsInPrematchPeriod() then
			
		else
			
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( vignette )
	self.vignette = vignette
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

