-- 788bbe446350e92e7168848ef9f88b79
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_PercentCompleteWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_PercentCompleteWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_PercentCompleteWidget )
	self.id = "BM_Contracts_PercentCompleteWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 144 )
	self:setTopBottom( true, false, 0, 144 )
	
	local AllCompleteIcon = LUI.UIImage.new()
	AllCompleteIcon:setLeftRight( true, true, 0, 0 )
	AllCompleteIcon:setTopBottom( true, true, 0, 0 )
	AllCompleteIcon:setAlpha( 0 )
	AllCompleteIcon:setImage( RegisterImage( "uie_t7_blackmarket_contract_complete" ) )
	self:addElement( AllCompleteIcon )
	self.AllCompleteIcon = AllCompleteIcon
	
	local BackgroundRing = LUI.UIImage.new()
	BackgroundRing:setLeftRight( true, true, 0, 0 )
	BackgroundRing:setTopBottom( true, true, 0, 0 )
	BackgroundRing:setImage( RegisterImage( "uie_t7_blackmarket_contract_inprogressbacker" ) )
	self:addElement( BackgroundRing )
	self.BackgroundRing = BackgroundRing
	
	local percentCompleteCircle = LUI.UIImage.new()
	percentCompleteCircle:setLeftRight( true, true, -1, -1 )
	percentCompleteCircle:setTopBottom( true, true, 0, 0 )
	percentCompleteCircle:setImage( RegisterImage( "uie_t7_blackmarket_contract_inprogress" ) )
	percentCompleteCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	percentCompleteCircle:setShaderVector( 0, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 1, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 2, 0.5, 0, 0, 0 )
	percentCompleteCircle:setShaderVector( 3, 0.05, 0.05, 0, 0 )
	self:addElement( percentCompleteCircle )
	self.percentCompleteCircle = percentCompleteCircle
	
	local percentText = LUI.UIText.new()
	percentText:setLeftRight( true, true, 0, 0 )
	percentText:setTopBottom( false, false, -11, 11 )
	percentText:setRGB( 0.6, 1, 0.93 )
	percentText:setScale( 0.9 )
	percentText:setText( Engine.Localize( "50%" ) )
	percentText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	percentText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	percentText:setShaderVector( 0, 0.04, 0, 0, 0 )
	percentText:setShaderVector( 1, 0.02, 0, 0, 0 )
	percentText:setShaderVector( 2, 1, 0, 0, 0 )
	percentText:setLetterSpacing( 0.5 )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	percentText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( percentText )
	self.percentText = percentText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

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
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

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

