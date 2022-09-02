-- 7b54d8fb1490892de9d1d4961e0cf016
-- This hash is used for caching, delete to decompile the file again

CoD.ScoreboardPingValue = InheritFrom( LUI.UIElement )
CoD.ScoreboardPingValue.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardPingValue )
	self.id = "ScoreboardPingValue"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 38 )
	
	local pvBackground = LUI.UIImage.new()
	pvBackground:setLeftRight( true, true, 0, 0 )
	pvBackground:setTopBottom( true, true, 0, 0 )
	pvBackground:setRGB( 0.35, 0.3, 0.3 )
	pvBackground:setAlpha( 0.5 )
	self:addElement( pvBackground )
	self.pvBackground = pvBackground
	
	local PingValue = LUI.UIText.new()
	PingValue:setLeftRight( true, true, 4, 0 )
	PingValue:setTopBottom( false, false, -12.5, 12.5 )
	PingValue:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PingValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PingValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PingValue )
	self.PingValue = PingValue
	
	self.PingValue:linkToElementModel( self, "clientInfo", true, function ( model )
		local clientInfo = Engine.GetModelValue( model )
		if clientInfo then
			PingValue:setText( clientInfo )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PingValue:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

