-- 0cc924c6902c74f895fbdfcd11d54637
-- This hash is used for caching, delete to decompile the file again

CoD.FE_ExperimentPromoFeatureCard = InheritFrom( LUI.UIElement )
CoD.FE_ExperimentPromoFeatureCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.FE_ExperimentPromoFeatureCard )
	self.id = "FE_ExperimentPromoFeatureCard"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 306 )
	self:setTopBottom( true, false, 0, 87 )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:linkToElementModel( self, "background", true, function ( model )
		local background = Engine.GetModelValue( model )
		if background then
			backing:setImage( RegisterImage( GetExperimentPromoFeatureCardImageByGroup( background ) ) )
		end
	end )
	self:addElement( backing )
	self.backing = backing
	
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
	Title:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( GetExperimentPromoFeatureCardTitleByGroup( title ) ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				backing:completeAnimation()
				self.backing:setAlpha( 1 )
				self.clipFinished( backing, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )

				backing:completeAnimation()
				self.backing:setAlpha( 1 )
				self.clipFinished( backing, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.backing:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
