-- 1c8f76b9d84179dcdf59363460c9ebfb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.AAR.ContractsTab.AAR_Contracts_Pip" )

CoD.AAR_Contracts_PercentCompleteWidgetWithPips = InheritFrom( LUI.UIElement )
CoD.AAR_Contracts_PercentCompleteWidgetWithPips.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AAR_Contracts_PercentCompleteWidgetWithPips )
	self.id = "AAR_Contracts_PercentCompleteWidgetWithPips"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
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
	
	local AllCompleteRing = LUI.UIImage.new()
	AllCompleteRing:setLeftRight( true, true, 0, 0 )
	AllCompleteRing:setTopBottom( true, true, 0, 0 )
	AllCompleteRing:setRGB( 0.95, 0.91, 0.11 )
	AllCompleteRing:setAlpha( 0 )
	AllCompleteRing:setImage( RegisterImage( "uie_t7_menu_aar_whiteringthin" ) )
	self:addElement( AllCompleteRing )
	self.AllCompleteRing = AllCompleteRing
	
	local AllCompleteIcon = LUI.UIImage.new()
	AllCompleteIcon:setLeftRight( true, true, 22, -22 )
	AllCompleteIcon:setTopBottom( true, true, 26, -18 )
	AllCompleteIcon:setAlpha( 0 )
	AllCompleteIcon:setImage( RegisterImage( "uie_t7_menu_aar_yellowstar" ) )
	self:addElement( AllCompleteIcon )
	self.AllCompleteIcon = AllCompleteIcon
	
	local RewardPip1 = CoD.AAR_Contracts_Pip.new( menu, controller )
	RewardPip1:setLeftRight( false, true, -12, 4 )
	RewardPip1:setTopBottom( false, false, -8, 8 )
	RewardPip1:mergeStateConditions( {
		{
			stateName = "AllComplete",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsThermometerUnlockIndexGreaterThanorEqualTo( 1 )
			end
		}
	} )
	self:addElement( RewardPip1 )
	self.RewardPip1 = RewardPip1
	
	local RewardPip2 = CoD.AAR_Contracts_Pip.new( menu, controller )
	RewardPip2:setLeftRight( false, false, -8, 8 )
	RewardPip2:setTopBottom( false, true, -12, 4 )
	RewardPip2:mergeStateConditions( {
		{
			stateName = "AllComplete",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsThermometerUnlockIndexGreaterThanorEqualTo( 2 )
			end
		}
	} )
	self:addElement( RewardPip2 )
	self.RewardPip2 = RewardPip2
	
	local RewardPip3 = CoD.AAR_Contracts_Pip.new( menu, controller )
	RewardPip3:setLeftRight( true, false, -4, 12 )
	RewardPip3:setTopBottom( false, false, -8, 8 )
	RewardPip3:mergeStateConditions( {
		{
			stateName = "AllComplete",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsThermometerUnlockIndexGreaterThanorEqualTo( 3 )
			end
		}
	} )
	self:addElement( RewardPip3 )
	self.RewardPip3 = RewardPip3
	
	local RewardPip4 = CoD.AAR_Contracts_Pip.new( menu, controller )
	RewardPip4:setLeftRight( false, false, -8, 8 )
	RewardPip4:setTopBottom( true, false, -4, 12 )
	RewardPip4:mergeStateConditions( {
		{
			stateName = "AllComplete",
			condition = function ( menu, element, event )
				return IsThermometerProgressEqualTo( 1 )
			end
		},
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				return IsThermometerUnlockIndexGreaterThanorEqualTo( 4 )
			end
		}
	} )
	self:addElement( RewardPip4 )
	self.RewardPip4 = RewardPip4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

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
				self.CrossLines:setAlpha( 0.35 )
				self.clipFinished( CrossLines, {} )

				AllCompleteRing:completeAnimation()
				self.AllCompleteRing:setAlpha( 0 )
				self.clipFinished( AllCompleteRing, {} )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 0 )
				self.clipFinished( AllCompleteIcon, {} )

				RewardPip1:completeAnimation()
				self.RewardPip1:setAlpha( 0 )
				self.clipFinished( RewardPip1, {} )

				RewardPip2:completeAnimation()
				self.RewardPip2:setAlpha( 0 )
				self.clipFinished( RewardPip2, {} )

				RewardPip3:completeAnimation()
				self.RewardPip3:setAlpha( 0 )
				self.clipFinished( RewardPip3, {} )

				RewardPip4:completeAnimation()
				self.RewardPip4:setAlpha( 0 )
				self.clipFinished( RewardPip4, {} )
			end
		},
		TwoPips = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

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
				self.CrossLines:setAlpha( 0.35 )
				self.clipFinished( CrossLines, {} )

				AllCompleteRing:completeAnimation()
				self.AllCompleteRing:setAlpha( 0 )
				self.clipFinished( AllCompleteRing, {} )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 0 )
				self.clipFinished( AllCompleteIcon, {} )

				RewardPip1:completeAnimation()
				self.RewardPip1:setLeftRight( false, false, -8, 8 )
				self.RewardPip1:setTopBottom( false, true, -12, 4 )
				self.RewardPip1:setAlpha( 1 )
				self.clipFinished( RewardPip1, {} )

				RewardPip2:completeAnimation()
				self.RewardPip2:setLeftRight( false, false, -8, 8 )
				self.RewardPip2:setTopBottom( true, false, -4, 12 )
				self.RewardPip2:setAlpha( 1 )
				self.clipFinished( RewardPip2, {} )

				RewardPip3:completeAnimation()
				self.RewardPip3:setAlpha( 0 )
				self.clipFinished( RewardPip3, {} )

				RewardPip4:completeAnimation()
				self.RewardPip4:setAlpha( 0 )
				self.clipFinished( RewardPip4, {} )
			end
		},
		ThreePips = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

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
				self.CrossLines:setAlpha( 0.35 )
				self.clipFinished( CrossLines, {} )

				AllCompleteRing:completeAnimation()
				self.AllCompleteRing:setAlpha( 0 )
				self.clipFinished( AllCompleteRing, {} )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 0 )
				self.clipFinished( AllCompleteIcon, {} )

				RewardPip1:completeAnimation()
				self.RewardPip1:setLeftRight( false, true, -18, -2 )
				self.RewardPip1:setTopBottom( false, true, -33, -17 )
				self.RewardPip1:setAlpha( 1 )
				self.clipFinished( RewardPip1, {} )

				RewardPip2:completeAnimation()
				self.RewardPip2:setLeftRight( true, false, 2, 18 )
				self.RewardPip2:setTopBottom( false, true, -33, -17 )
				self.RewardPip2:setAlpha( 1 )
				self.clipFinished( RewardPip2, {} )

				RewardPip3:completeAnimation()
				self.RewardPip3:setLeftRight( false, false, -8, 8 )
				self.RewardPip3:setTopBottom( true, false, -4, 12 )
				self.RewardPip3:setAlpha( 1 )
				self.clipFinished( RewardPip3, {} )

				RewardPip4:completeAnimation()
				self.RewardPip4:setAlpha( 0 )
				self.clipFinished( RewardPip4, {} )
			end
		},
		FourPips = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

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
				self.CrossLines:setAlpha( 0.35 )
				self.clipFinished( CrossLines, {} )

				AllCompleteRing:completeAnimation()
				self.AllCompleteRing:setAlpha( 0 )
				self.clipFinished( AllCompleteRing, {} )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 0 )
				self.clipFinished( AllCompleteIcon, {} )

				RewardPip1:completeAnimation()
				self.RewardPip1:setLeftRight( false, true, -12, 4 )
				self.RewardPip1:setTopBottom( false, false, -8, 8 )
				self.RewardPip1:setAlpha( 1 )
				self.clipFinished( RewardPip1, {} )

				RewardPip2:completeAnimation()
				self.RewardPip2:setLeftRight( false, false, -8, 8 )
				self.RewardPip2:setTopBottom( false, true, -12, 4 )
				self.RewardPip2:setAlpha( 1 )
				self.clipFinished( RewardPip2, {} )

				RewardPip3:completeAnimation()
				self.RewardPip3:setLeftRight( true, false, -4, 12 )
				self.RewardPip3:setTopBottom( false, false, -8, 8 )
				self.RewardPip3:setAlpha( 1 )
				self.clipFinished( RewardPip3, {} )

				RewardPip4:completeAnimation()
				self.RewardPip4:setLeftRight( false, false, -8, 8 )
				self.RewardPip4:setTopBottom( true, false, -4, 12 )
				self.RewardPip4:setAlpha( 1 )
				self.clipFinished( RewardPip4, {} )
			end
		},
		CompleteZeroPips = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

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

				AllCompleteRing:completeAnimation()
				self.AllCompleteRing:setAlpha( 1 )
				self.clipFinished( AllCompleteRing, {} )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 1 )
				self.clipFinished( AllCompleteIcon, {} )

				RewardPip1:completeAnimation()
				self.RewardPip1:setAlpha( 0 )
				self.clipFinished( RewardPip1, {} )

				RewardPip2:completeAnimation()
				self.RewardPip2:setAlpha( 0 )
				self.clipFinished( RewardPip2, {} )

				RewardPip3:completeAnimation()
				self.RewardPip3:setAlpha( 0 )
				self.clipFinished( RewardPip3, {} )

				RewardPip4:completeAnimation()
				self.RewardPip4:setAlpha( 0 )
				self.clipFinished( RewardPip4, {} )
			end
		},
		CompleteTwoPips = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

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

				AllCompleteRing:completeAnimation()
				self.AllCompleteRing:setAlpha( 1 )
				self.clipFinished( AllCompleteRing, {} )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 1 )
				self.clipFinished( AllCompleteIcon, {} )

				RewardPip1:completeAnimation()
				self.RewardPip1:setLeftRight( false, false, -8, 8 )
				self.RewardPip1:setTopBottom( false, true, -12, 4 )
				self.RewardPip1:setAlpha( 1 )
				self.clipFinished( RewardPip1, {} )

				RewardPip2:completeAnimation()
				self.RewardPip2:setLeftRight( false, false, -8, 8 )
				self.RewardPip2:setTopBottom( true, false, -4, 12 )
				self.RewardPip2:setAlpha( 1 )
				self.clipFinished( RewardPip2, {} )

				RewardPip3:completeAnimation()
				self.RewardPip3:setAlpha( 0 )
				self.clipFinished( RewardPip3, {} )

				RewardPip4:completeAnimation()
				self.RewardPip4:setLeftRight( false, false, -8, 8 )
				self.RewardPip4:setTopBottom( true, false, 3, 19 )
				self.RewardPip4:setAlpha( 0 )
				self.clipFinished( RewardPip4, {} )
			end
		},
		CompleteThreePips = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

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

				AllCompleteRing:completeAnimation()
				self.AllCompleteRing:setAlpha( 1 )
				self.clipFinished( AllCompleteRing, {} )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 1 )
				self.clipFinished( AllCompleteIcon, {} )

				RewardPip1:completeAnimation()
				self.RewardPip1:setLeftRight( false, true, -17, -1 )
				self.RewardPip1:setTopBottom( false, true, -32, -16 )
				self.RewardPip1:setAlpha( 1 )
				self.clipFinished( RewardPip1, {} )

				RewardPip2:completeAnimation()
				self.RewardPip2:setLeftRight( true, false, 1, 17 )
				self.RewardPip2:setTopBottom( false, true, -32, -16 )
				self.RewardPip2:setAlpha( 1 )
				self.clipFinished( RewardPip2, {} )

				RewardPip3:completeAnimation()
				self.RewardPip3:setLeftRight( false, false, -8, 8 )
				self.RewardPip3:setTopBottom( true, false, -4, 12 )
				self.RewardPip3:setAlpha( 1 )
				self.clipFinished( RewardPip3, {} )

				RewardPip4:completeAnimation()
				self.RewardPip4:setAlpha( 0 )
				self.clipFinished( RewardPip4, {} )
			end
		},
		CompleteFourPips = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )

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

				AllCompleteRing:completeAnimation()
				self.AllCompleteRing:setAlpha( 1 )
				self.clipFinished( AllCompleteRing, {} )

				AllCompleteIcon:completeAnimation()
				self.AllCompleteIcon:setAlpha( 1 )
				self.clipFinished( AllCompleteIcon, {} )

				RewardPip1:completeAnimation()
				self.RewardPip1:setLeftRight( false, true, -12, 4 )
				self.RewardPip1:setTopBottom( false, false, -8, 8 )
				self.RewardPip1:setAlpha( 1 )
				self.clipFinished( RewardPip1, {} )

				RewardPip2:completeAnimation()
				self.RewardPip2:setLeftRight( false, false, -8, 8 )
				self.RewardPip2:setTopBottom( false, true, -12, 4 )
				self.RewardPip2:setAlpha( 1 )
				self.clipFinished( RewardPip2, {} )

				RewardPip3:completeAnimation()
				self.RewardPip3:setLeftRight( true, false, -4, 12 )
				self.RewardPip3:setTopBottom( false, false, -8, 8 )
				self.RewardPip3:setAlpha( 1 )
				self.clipFinished( RewardPip3, {} )

				RewardPip4:completeAnimation()
				self.RewardPip4:setLeftRight( false, false, -8, 8 )
				self.RewardPip4:setTopBottom( true, false, -4, 12 )
				self.RewardPip4:setAlpha( 1 )
				self.clipFinished( RewardPip4, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "TwoPips",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "ThreePips",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "FourPips",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "CompleteZeroPips",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Complete" )
			end
		},
		{
			stateName = "CompleteTwoPips",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Complete" )
			end
		},
		{
			stateName = "CompleteThreePips",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Complete" )
			end
		},
		{
			stateName = "CompleteFourPips",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "Complete" )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RewardPip1:close()
		element.RewardPip2:close()
		element.RewardPip3:close()
		element.RewardPip4:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
