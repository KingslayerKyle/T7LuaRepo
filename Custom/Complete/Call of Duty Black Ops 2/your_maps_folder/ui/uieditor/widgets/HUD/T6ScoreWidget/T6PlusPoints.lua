CoD.T6PlusPoints = InheritFrom( LUI.UIElement )
CoD.T6PlusPoints.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T6PlusPoints )
	self.id = "T6PlusPoints"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	self.Label1 = LUI.UIText.new()
	self.Label1:setLeftRight( false, true, 0, -172.5 )
	self.Label1:setTopBottom( false, true, -147.5, -120 )
	self.Label1:setText( Engine.Localize( "+50" ) )
	self.Label1:setTTF( "fonts/bigFont.ttf" )
	self.Label1:setRGB( 0.9, 0.9, 0 )
	self.Label1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	self:addElement( self.Label1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 0.9, 0.9, 0 )
				self.clipFinished( self.Label1, {} )
			end,
			NegativeScore = function ()
				self:setupElementClipCounter( 1 )

				self.Label1:completeAnimation()
				self.Label1:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
				self.clipFinished( self.Label1, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Label1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
