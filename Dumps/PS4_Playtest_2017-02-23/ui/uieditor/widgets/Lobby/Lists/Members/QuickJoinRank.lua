CoD.QuickJoinRank = InheritFrom( LUI.UIElement )
CoD.QuickJoinRank.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.QuickJoinRank )
	self.id = "QuickJoinRank"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 75 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( 0, 1, 41, -3 )
	rankIcon:setTopBottom( 0, 1, 3, -3 )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = LUI.UIText.new()
	rankText:setLeftRight( 0, 1, -2, -34 )
	rankText:setTopBottom( 0, 1, 3, -3 )
	rankText:setRGB( 0.74, 0.78, 0.79 )
	rankText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankText:setText( modelValue )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	self.resetProperties = function ()
		rankText:completeAnimation()
		rankText:setLeftRight( 0, 1, -2, -34 )
		rankText:setTopBottom( 0, 1, 3, -3 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				rankText:completeAnimation()
				self.rankText:setLeftRight( 0, 1, -2, -34 )
				self.rankText:setTopBottom( 0, 1, 2.5, -3.5 )
				self.clipFinished( rankText, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.rankIcon:close()
		self.rankText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

