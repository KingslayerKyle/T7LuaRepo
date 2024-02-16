CoD.IW7PlusPoints = InheritFrom( LUI.UIElement )
CoD.IW7PlusPoints.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7PlusPoints )
	self.id = "IW7PlusPoints"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 85 )
	self:setTopBottom( true, false, 0, 66 )

	self.Label1BG = LUI.UIImage.new()
	self.Label1BG:setLeftRight( true, false, 50, 100 )
	self.Label1BG:setTopBottom( true, false, 0, 25 )
	self.Label1BG:setImage( RegisterImage( "fxt_ui_square" ) )
	self.Label1BG:setRGB( 0, 0, 0 )
	self.Label1BG:setAlpha( 0.5 )
	self:addElement( self.Label1BG )
	
	self.Label1 = LUI.UIText.new()
	self.Label1:setLeftRight( true, false, 50, 100 )
	self.Label1:setTopBottom( true, false, 0, 25 )
	self.Label1:setText( Engine.Localize( "+50" ) )
	self.Label1:setTTF( "fonts/blender_pro_medium.ttf" )
	self.Label1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( self.Label1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.Label1BG:completeAnimation()
				self.Label1BG:setRGB( 0, 0, 0 )
				self.clipFinished( self.Label1BG, {} )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 1, 1, 1 )
				self.clipFinished( self.Label1, {} )
			end,
			NegativeScore = function ()
				self:setupElementClipCounter( 2 )

				self.Label1BG:completeAnimation()
				self.Label1BG:setRGB( 1, 0.22, 0.22 )
				self.clipFinished( self.Label1BG, {} )

				self.Label1:completeAnimation()
				self.Label1:setRGB( 1, 1, 1 )
				self.clipFinished( self.Label1, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Label1BG:close()
		element.Label1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
