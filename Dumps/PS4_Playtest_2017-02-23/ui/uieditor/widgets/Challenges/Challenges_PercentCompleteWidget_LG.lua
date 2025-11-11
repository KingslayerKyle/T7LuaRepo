CoD.Challenges_PercentCompleteWidget_LG = InheritFrom( LUI.UIElement )
CoD.Challenges_PercentCompleteWidget_LG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_PercentCompleteWidget_LG )
	self.id = "Challenges_PercentCompleteWidget_LG"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 240 )
	self:setTopBottom( 0, 0, 0, 240 )
	
	local AllCompleteIcon = LUI.UIImage.new()
	AllCompleteIcon:setLeftRight( 0, 1, -24, 24 )
	AllCompleteIcon:setTopBottom( 0, 1, -24, 24 )
	AllCompleteIcon:setAlpha( 0 )
	AllCompleteIcon:setImage( RegisterImage( "uie_t7_menu_challenges_complete_icon" ) )
	self:addElement( AllCompleteIcon )
	self.AllCompleteIcon = AllCompleteIcon
	
	local BackgroundRing = LUI.UIImage.new()
	BackgroundRing:setLeftRight( 0, 1, -24, 24 )
	BackgroundRing:setTopBottom( 0, 1, -24, 24 )
	BackgroundRing:setRGB( 0.36, 0.36, 0.36 )
	BackgroundRing:setAlpha( 0.35 )
	BackgroundRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringback" ) )
	self:addElement( BackgroundRing )
	self.BackgroundRing = BackgroundRing
	
	local CrossLines = LUI.UIImage.new()
	CrossLines:setLeftRight( 0.5, 0.5, -144, 144 )
	CrossLines:setTopBottom( 0.5, 0.5, -144, 144 )
	CrossLines:setRGB( 0.36, 0.36, 0.36 )
	CrossLines:setAlpha( 0.35 )
	CrossLines:setImage( RegisterImage( "uie_t7_menu_challenges_crosslines" ) )
	self:addElement( CrossLines )
	self.CrossLines = CrossLines
	
	local percentCompleteCircle = LUI.UIImage.new()
	percentCompleteCircle:setLeftRight( 0, 1, -24, 24 )
	percentCompleteCircle:setTopBottom( 0, 1, -24, 24 )
	percentCompleteCircle:setRGB( 0.95, 0.91, 0.11 )
	percentCompleteCircle:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthin" ) )
	percentCompleteCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 1, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 2, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 3, 0, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( percentCompleteCircle )
	self.percentCompleteCircle = percentCompleteCircle
	
	local percentText = LUI.UIText.new()
	percentText:setLeftRight( 0.5, 0.5, -120, 118 )
	percentText:setTopBottom( 0.5, 0.5, -37.5, 37.5 )
	percentText:setAlpha( 0.8 )
	percentText:setText( Engine.Localize( "50%" ) )
	percentText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( percentText, "setText", function ( element, text )
		if IsPercentTextAt100Percent( text ) then
			SetState( self, "Complete" )
		elseif not IsPercentTextAt100Percent( text ) then
			SetState( self, "DefaultState" )
		end
	end )
	self:addElement( percentText )
	self.percentText = percentText
	
	self.resetProperties = function ()
		percentCompleteCircle:completeAnimation()
		percentText:completeAnimation()
		BackgroundRing:completeAnimation()
		CrossLines:completeAnimation()
		AllCompleteIcon:completeAnimation()
		percentCompleteCircle:setAlpha( 1 )
		percentText:setAlpha( 0.8 )
		BackgroundRing:setAlpha( 0.35 )
		CrossLines:setAlpha( 0.35 )
		AllCompleteIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Complete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 1 )
				self.clipFinished( AllCompleteIcon, {} )
				BackgroundRing:completeAnimation()
				self.BackgroundRing:setAlpha( 0 )
				self.clipFinished( BackgroundRing, {} )
				CrossLines:completeAnimation()
				self.CrossLines:setAlpha( 0 )
				self.clipFinished( CrossLines, {} )
				percentCompleteCircle:completeAnimation()
				self.percentCompleteCircle:setAlpha( 0 )
				self.clipFinished( percentCompleteCircle, {} )
				percentText:completeAnimation()
				self.percentText:setAlpha( 0 )
				self.clipFinished( percentText, {} )
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

