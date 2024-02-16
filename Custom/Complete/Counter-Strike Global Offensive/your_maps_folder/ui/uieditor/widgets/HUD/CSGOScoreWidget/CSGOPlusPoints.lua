CoD.CSGOPlusPoints = InheritFrom( LUI.UIElement )
CoD.CSGOPlusPoints.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CSGOPlusPoints )
	self.id = "CSGOPlusPoints"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )
	
	self.Label1 = LUI.UIText.new()
	self.Label1:setLeftRight( true, false, 10, 80 )
	self.Label1:setTopBottom( true, false, 10, 35 )
	self.Label1:setText( Engine.Localize( "+50" ) )
	self.Label1:setTTF( "fonts/stratum2bold.ttf" )
	self.Label1:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( self.Label1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 0.9, 0.9, 0.9 )
				self.clipFinished( self.Label1, {} )
			end,
			NegativeScore = function ()
				self:setupElementClipCounter( 1 )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 1, 0.22, 0.22 )
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
