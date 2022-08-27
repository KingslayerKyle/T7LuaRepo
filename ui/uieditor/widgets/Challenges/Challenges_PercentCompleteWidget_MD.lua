-- 4e058bb91810a0e8b4627b61c54adaf4
-- This hash is used for caching, delete to decompile the file again

CoD.Challenges_PercentCompleteWidget_MD = InheritFrom( LUI.UIElement )
CoD.Challenges_PercentCompleteWidget_MD.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_PercentCompleteWidget_MD )
	self.id = "Challenges_PercentCompleteWidget_MD"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 70 )
	
	local AllCompleteIcon = LUI.UIImage.new()
	AllCompleteIcon:setLeftRight( true, true, -7, 7 )
	AllCompleteIcon:setTopBottom( true, true, -7, 7 )
	AllCompleteIcon:setAlpha( 0 )
	AllCompleteIcon:setImage( RegisterImage( "uie_t7_menu_challenges_complete_icon" ) )
	self:addElement( AllCompleteIcon )
	self.AllCompleteIcon = AllCompleteIcon
	
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
	percentText:setLeftRight( true, true, 5, -5 )
	percentText:setTopBottom( false, false, -10, 12 )
	percentText:setAlpha( 0.8 )
	percentText:setText( Engine.Localize( "50%" ) )
	percentText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( percentText, "setText", function ( element, controller )
		if IsPercentTextAt100Percent( controller ) then
			SetState( self, "Complete" )
		elseif not IsPercentTextAt100Percent( controller ) then
			SetState( self, "DefaultState" )
		end
	end )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 0 )
				self.clipFinished( AllCompleteIcon, {} )
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
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 1 )
				self.clipFinished( AllCompleteIcon, {} )
				BackgroundRing:completeAnimation()
				self.BackgroundRing:setAlpha( 0 )
				self.clipFinished( BackgroundRing, {} )
				percentCompleteCircle:completeAnimation()
				self.percentCompleteCircle:setAlpha( 0 )
				self.clipFinished( percentCompleteCircle, {} )
				percentText:completeAnimation()
				self.percentText:setAlpha( 0 )
				self.clipFinished( percentText, {} )
				CrossLines:completeAnimation()
				self.CrossLines:setAlpha( 0 )
				self.clipFinished( CrossLines, {} )
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

