-- 00104ac4a3d11b6fe3136b57e888e03e
-- This hash is used for caching, delete to decompile the file again

CoD.AAR_Contracts_PercentCompleteWidget = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_PercentCompleteWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_PercentCompleteWidget )
	self.id = "AAR_Contracts_PercentCompleteWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 124 )
	
	local BackgroundRing = LUI.UIImage.new()
	BackgroundRing:setLeftRight( true, true, 0, 0 )
	BackgroundRing:setTopBottom( true, true, 0, 0 )
	BackgroundRing:setRGB( 0.36, 0.36, 0.36 )
	BackgroundRing:setAlpha( 0.35 )
	BackgroundRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringback" ) )
	self:addElement( BackgroundRing )
	self.BackgroundRing = BackgroundRing
	
	local percentCompleteCircle = LUI.UIImage.new()
	percentCompleteCircle:setLeftRight( true, true, 0, 0 )
	percentCompleteCircle:setTopBottom( true, true, 0, 0 )
	percentCompleteCircle:setRGB( 0.95, 0.91, 0.11 )
	percentCompleteCircle:setAlpha( 0.9 )
	percentCompleteCircle:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthin" ) )
	percentCompleteCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 1, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 2, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( percentCompleteCircle )
	self.percentCompleteCircle = percentCompleteCircle
	
	local percentText = LUI.UIText.new()
	percentText:setLeftRight( true, true, 0, 0 )
	percentText:setTopBottom( false, false, -11, 11 )
	percentText:setAlpha( 0.8 )
	percentText:setText( Engine.Localize( "50%" ) )
	percentText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( percentText )
	self.percentText = percentText
	
	local CrossLines = LUI.UIImage.new()
	CrossLines:setLeftRight( false, false, -35, 35 )
	CrossLines:setTopBottom( false, false, -35, 35 )
	CrossLines:setRGB( 0.36, 0.36, 0.36 )
	CrossLines:setAlpha( 0.35 )
	CrossLines:setImage( RegisterImage( "uie_t7_menu_challenges_crosslines" ) )
	self:addElement( CrossLines )
	self.CrossLines = CrossLines
	
	local percentCompleteCircle0 = LUI.UIImage.new()
	percentCompleteCircle0:setLeftRight( true, true, 0, 0 )
	percentCompleteCircle0:setTopBottom( true, true, 0, 0 )
	percentCompleteCircle0:setRGB( 0.95, 0.91, 0.11 )
	percentCompleteCircle0:setAlpha( 0 )
	percentCompleteCircle0:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthin" ) )
	self:addElement( percentCompleteCircle0 )
	self.percentCompleteCircle0 = percentCompleteCircle0
	
	local star = LUI.UIImage.new()
	star:setLeftRight( true, true, 39, -39 )
	star:setTopBottom( true, true, 43, -35 )
	star:setAlpha( 0 )
	star:setImage( RegisterImage( "uie_t7_menu_aar_yellowstar" ) )
	self:addElement( star )
	self.star = star
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BackgroundRing:completeAnimation()
				self.BackgroundRing:setAlpha( 0.35 )
				self.clipFinished( BackgroundRing, {} )

				percentCompleteCircle:completeAnimation()
				self.percentCompleteCircle:setAlpha( 1 )
				self.clipFinished( percentCompleteCircle, {} )

				percentText:completeAnimation()
				self.percentText:setAlpha( 1 )
				self.clipFinished( percentText, {} )

				CrossLines:completeAnimation()
				self.CrossLines:setRGB( 0.36, 0.36, 0.36 )
				self.CrossLines:setAlpha( 0.35 )
				self.clipFinished( CrossLines, {} )

				star:completeAnimation()
				self.star:setAlpha( 0 )
				self.clipFinished( star, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				BackgroundRing:completeAnimation()
				self.BackgroundRing:setAlpha( 0.35 )
				self.clipFinished( BackgroundRing, {} )

				percentCompleteCircle:completeAnimation()
				self.percentCompleteCircle:setAlpha( 0 )
				self.clipFinished( percentCompleteCircle, {} )

				percentText:completeAnimation()
				self.percentText:setAlpha( 0 )
				self.clipFinished( percentText, {} )

				CrossLines:completeAnimation()
				self.CrossLines:setAlpha( 0.35 )
				self.clipFinished( CrossLines, {} )

				percentCompleteCircle0:completeAnimation()
				self.percentCompleteCircle0:setAlpha( 1 )
				self.percentCompleteCircle0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( percentCompleteCircle0, {} )

				star:completeAnimation()
				self.star:setAlpha( 1 )
				self.clipFinished( star, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Complete" )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

