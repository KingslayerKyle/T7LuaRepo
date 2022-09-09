-- 9656880e28bde68bee28b8a2aebf6a0e
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 25 )
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, true, 27, -2 )
	rankIcon:setTopBottom( true, true, 2, -2 )
	rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local _rankIcon = Engine.GetModelValue( model )
		if _rankIcon then
			rankIcon:setImage( RegisterImage( _rankIcon ) )
		end
	end )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local rankText = LUI.UIText.new()
	rankText:setLeftRight( true, true, -1, -23 )
	rankText:setTopBottom( true, true, 2, -2 )
	rankText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	rankText:setLetterSpacing( 0 )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	rankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText:setRGB( SetToParagonColorIfPrestigeMasterByRankForMode( 188, 198, 201, "mp", rank ) )
		end
	end )
	rankText:linkToElementModel( self, "rank", true, function ( model )
		local rank = Engine.GetModelValue( model )
		if rank then
			rankText:setText( rank )
		end
	end )
	self:addElement( rankText )
	self.rankText = rankText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				rankIcon:completeAnimation()
				self.rankIcon:setLeftRight( true, true, 27, -2 )
				self.rankIcon:setTopBottom( true, true, 2, -2 )
				self.rankIcon:setAlpha( 1 )
				self.clipFinished( rankIcon, {} )

				rankText:completeAnimation()
				self.rankText:setLeftRight( true, true, -1, -23 )
				self.rankText:setTopBottom( true, true, 2, -2 )
				self.rankText:setAlpha( 1 )
				self.clipFinished( rankText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.rankIcon:close()
		element.rankText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
