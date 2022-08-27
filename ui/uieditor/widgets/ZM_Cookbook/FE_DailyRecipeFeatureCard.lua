-- 8f8f0e6a7a5ad18ea3a9fc0ace2190f5
-- This hash is used for caching, delete to decompile the file again

CoD.FE_DailyRecipeFeatureCard = InheritFrom( LUI.UIElement )
CoD.FE_DailyRecipeFeatureCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_DailyRecipeFeatureCard )
	self.id = "FE_DailyRecipeFeatureCard"
	self.soundSet = "Special_widgets"
	self:setLeftRight( true, false, 0, 306 )
	self:setTopBottom( true, false, 0, 87 )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	self:addElement( bg )
	self.bg = bg
	
	local shadowRight = LUI.UIImage.new()
	shadowRight:setLeftRight( false, false, 17.46, 79.29 )
	shadowRight:setTopBottom( false, false, -24.76, 54.51 )
	shadowRight:setScale( 1.1 )
	shadowRight:setImage( RegisterImage( "uie_t7_zm_cookbook_gg_shadow" ) )
	self:addElement( shadowRight )
	self.shadowRight = shadowRight
	
	local shadowLeft = LUI.UIImage.new()
	shadowLeft:setLeftRight( false, false, -78.04, -16.21 )
	shadowLeft:setTopBottom( false, false, -24.76, 54.51 )
	shadowLeft:setScale( 1.1 )
	shadowLeft:setImage( RegisterImage( "uie_t7_zm_cookbook_gg_shadow" ) )
	self:addElement( shadowLeft )
	self.shadowLeft = shadowLeft
	
	local bgbImageRight = LUI.UIImage.new()
	bgbImageRight:setLeftRight( true, false, 172.63, 230.13 )
	bgbImageRight:setTopBottom( true, false, 14, 71.5 )
	self:addElement( bgbImageRight )
	self.bgbImageRight = bgbImageRight
	
	local bgbImageLeft = LUI.UIImage.new()
	bgbImageLeft:setLeftRight( true, false, 76.63, 134.13 )
	bgbImageLeft:setTopBottom( true, false, 14, 71.5 )
	self:addElement( bgbImageLeft )
	self.bgbImageLeft = bgbImageLeft
	
	local shadowMiddle = LUI.UIImage.new()
	shadowMiddle:setLeftRight( false, false, -32, 32 )
	shadowMiddle:setTopBottom( false, false, -29.5, 52.54 )
	shadowMiddle:setScale( 1.2 )
	shadowMiddle:setImage( RegisterImage( "uie_t7_zm_cookbook_gg_shadow" ) )
	self:addElement( shadowMiddle )
	self.shadowMiddle = shadowMiddle
	
	local bgbImageMiddle = LUI.UIImage.new()
	bgbImageMiddle:setLeftRight( true, false, 119.75, 186.25 )
	bgbImageMiddle:setTopBottom( true, false, 5, 71.5 )
	self:addElement( bgbImageMiddle )
	self.bgbImageMiddle = bgbImageMiddle
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, true, 0, 0 )
	TitleBg:setTopBottom( true, false, 66.5, 87.4 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 5.88, 205.88 )
	Title:setTopBottom( true, false, 66.5, 86.5 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setLetterSpacing( 0.5 )
	self:addElement( Title )
	self.Title = Title
	
	self.bg:linkToElementModel( self, "background", true, function ( model )
		local background = Engine.GetModelValue( model )
		if background then
			bg:setImage( RegisterImage( background ) )
		end
	end )
	self.bgbImageRight:linkToElementModel( self, "recipeResultIndex3", true, function ( model )
		local recipeResultIndex3 = Engine.GetModelValue( model )
		if recipeResultIndex3 then
			bgbImageRight:setImage( RegisterImage( GetItemImageFromIndex( recipeResultIndex3 ) ) )
		end
	end )
	self.bgbImageLeft:linkToElementModel( self, "recipeResultIndex1", true, function ( model )
		local recipeResultIndex1 = Engine.GetModelValue( model )
		if recipeResultIndex1 then
			bgbImageLeft:setImage( RegisterImage( GetItemImageFromIndex( recipeResultIndex1 ) ) )
		end
	end )
	self.bgbImageMiddle:linkToElementModel( self, "recipeResultIndex2", true, function ( model )
		local recipeResultIndex2 = Engine.GetModelValue( model )
		if recipeResultIndex2 then
			bgbImageMiddle:setImage( RegisterImage( GetItemImageFromIndex( recipeResultIndex2 ) ) )
		end
	end )
	self.Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( title ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				bgbImageLeft:completeAnimation()
				self.bgbImageLeft:setAlpha( 1 )
				self.clipFinished( bgbImageLeft, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.bg:close()
		element.bgbImageRight:close()
		element.bgbImageLeft:close()
		element.bgbImageMiddle:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

