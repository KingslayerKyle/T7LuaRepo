CoD.H1PlusPoints = InheritFrom( LUI.UIElement )
CoD.H1PlusPoints.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.H1PlusPoints )
	self.id = "H1PlusPoints"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 40 )
	
	self.Label1 = LUI.UIText.new()
	self.Label1:setLeftRight( true, false, 0, 100 )
	self.Label1:setTopBottom( true, false, 0, 40 )
	self.Label1:setText( Engine.Localize( "+50" ) )
	self.Label1:setTTF( "fonts/defaultbold.otf" )
	self.Label1:setScale( 0.5 )
	self.Label1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.Label1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 0.94, 0.72, 0.07 )
				self.clipFinished( self.Label1, {} )
			end,
			NegativeScore = function ()
				self:setupElementClipCounter( 1 )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 0.94, 0.21, 0.27 )
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
