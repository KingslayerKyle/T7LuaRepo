CoD.S2PlusPoints = InheritFrom( LUI.UIElement )
CoD.S2PlusPoints.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.S2PlusPoints )
	self.id = "S2PlusPoints"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	
	self.Label2 = LUI.UIText.new()
	self.Label2:setLeftRight( true, false, 13, 89 )
	self.Label2:setTopBottom( true, false, 9, 56 )
	self.Label2:setText( Engine.Localize( "+50" ) )
	self.Label2:setTTF( "fonts/dinnextslabpro-regular.ttf" )
	self.Label2:setRGB( 0.88, 0.77, 0.49 )
	self:addElement( self.Label2 )
	
	self.Label1 = LUI.UIText.new()
	self.Label1:setLeftRight( true, false, 13, 89 )
	self.Label1:setTopBottom( true, false, 9, 56 )
	self.Label1:setText( Engine.Localize( "+50" ) )
	self.Label1:setTTF( "fonts/dinnextslabpro-regular.ttf" )
	self.Label1:setRGB( 0.88, 0.77, 0.49 )
	self:addElement( self.Label1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.Label2:completeAnimation()
				self.Label2:setRGB( 0.88, 0.77, 0.49 )
				self.clipFinished( self.Label2, {} )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 0.88, 0.77, 0.49 )
				self.clipFinished( self.Label1, {} )
			end,
			NegativeScore = function ()
				self:setupElementClipCounter( 2 )

				self.Label2:completeAnimation()
				self.Label2:setRGB( 1, 0.22, 0.22 )
				self.clipFinished( self.Label2, {} )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 1, 0.22, 0.22 )
				self.clipFinished( self.Label1, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Label2:close()
		element.Label1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
