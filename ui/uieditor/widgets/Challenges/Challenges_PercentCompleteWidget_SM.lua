-- a02c961bebc8f1fda8dd29df9812010b
-- This hash is used for caching, delete to decompile the file again

CoD.Challenges_PercentCompleteWidget_SM = InheritFrom( LUI.UIElement )
CoD.Challenges_PercentCompleteWidget_SM.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Challenges_PercentCompleteWidget_SM )
	self.id = "Challenges_PercentCompleteWidget_SM"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 45 )
	self:setTopBottom( true, false, 0, 45 )
	
	local AllCompleteIcon = LUI.UIImage.new()
	AllCompleteIcon:setLeftRight( true, true, -4.5, 4.5 )
	AllCompleteIcon:setTopBottom( true, true, -4.5, 4.5 )
	AllCompleteIcon:setAlpha( 0 )
	AllCompleteIcon:setImage( RegisterImage( "uie_t7_menu_challenges_complete_icon" ) )
	self:addElement( AllCompleteIcon )
	self.AllCompleteIcon = AllCompleteIcon
	
	local percentCompleteBackground = LUI.UIImage.new()
	percentCompleteBackground:setLeftRight( true, true, 0, 0 )
	percentCompleteBackground:setTopBottom( true, true, 0, 0 )
	percentCompleteBackground:setRGB( 0.36, 0.36, 0.36 )
	percentCompleteBackground:setAlpha( 0.35 )
	percentCompleteBackground:setImage( RegisterImage( "uie_t7_menu_aar_whiteringback" ) )
	self:addElement( percentCompleteBackground )
	self.percentCompleteBackground = percentCompleteBackground
	
	local CrossLines = LUI.UIImage.new()
	CrossLines:setLeftRight( false, false, -22.5, 22.5 )
	CrossLines:setTopBottom( false, false, -22.5, 22.5 )
	CrossLines:setRGB( 0.36, 0.36, 0.36 )
	CrossLines:setAlpha( 0.35 )
	CrossLines:setImage( RegisterImage( "uie_t7_menu_challenges_crosslines" ) )
	self:addElement( CrossLines )
	self.CrossLines = CrossLines
	
	local percentCompleteCircle = LUI.UIImage.new()
	percentCompleteCircle:setLeftRight( true, true, 0, 0 )
	percentCompleteCircle:setTopBottom( true, true, 0, 0 )
	percentCompleteCircle:setRGB( 0.95, 0.91, 0.11 )
	percentCompleteCircle:setAlpha( 0.9 )
	percentCompleteCircle:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthin_md" ) )
	percentCompleteCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 1, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 2, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( percentCompleteCircle )
	self.percentCompleteCircle = percentCompleteCircle
	
	local percentText = LUI.UIText.new()
	percentText:setLeftRight( false, false, -18, 18 )
	percentText:setTopBottom( false, false, -7.5, 9.5 )
	percentText:setAlpha( 0.8 )
	percentText:setText( Engine.Localize( "50%" ) )
	percentText:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 0 )
				self.clipFinished( AllCompleteIcon, {} )

				percentCompleteBackground:completeAnimation()
				self.percentCompleteBackground:setAlpha( 0.35 )
				self.clipFinished( percentCompleteBackground, {} )

				CrossLines:completeAnimation()
				self.CrossLines:setRGB( 0.36, 0.36, 0.36 )
				self.CrossLines:setAlpha( 0.35 )
				self.clipFinished( CrossLines, {} )

				percentCompleteCircle:completeAnimation()
				self.percentCompleteCircle:setAlpha( 1 )
				self.clipFinished( percentCompleteCircle, {} )

				percentText:completeAnimation()
				self.percentText:setAlpha( 0.8 )
				self.clipFinished( percentText, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 1 )
				self.clipFinished( AllCompleteIcon, {} )

				percentCompleteBackground:completeAnimation()
				self.percentCompleteBackground:setAlpha( 0 )
				self.clipFinished( percentCompleteBackground, {} )

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

