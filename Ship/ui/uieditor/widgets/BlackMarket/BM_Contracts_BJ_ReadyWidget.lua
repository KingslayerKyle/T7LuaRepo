-- 515a7706cef9ca71bc73fcec60d7e3c6
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_BJ_ReadyWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_BJ_ReadyWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_BJ_ReadyWidget )
	self.id = "BM_Contracts_BJ_ReadyWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 226 )
	self:setTopBottom( true, false, 0, 24 )
	
	local ActivatedBar = LUI.UIImage.new()
	ActivatedBar:setLeftRight( true, true, 0, 0 )
	ActivatedBar:setTopBottom( true, true, 0, 0 )
	ActivatedBar:setRGB( 0, 0, 0 )
	ActivatedBar:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_bar" ) )
	ActivatedBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	ActivatedBar:setShaderVector( 0, 0.15, 0.5, 0, 0 )
	ActivatedBar:setupNineSliceShader( 35, 12 )
	self:addElement( ActivatedBar )
	self.ActivatedBar = ActivatedBar
	
	local Activated = LUI.UITightText.new()
	Activated:setLeftRight( true, false, 29.5, 165.5 )
	Activated:setTopBottom( true, false, 3.5, 20.5 )
	Activated:setRGB( 0.95, 0.55, 0.15 )
	Activated:setText( LocalizeToUpperString( "MPUI_BM_CONTRACT_BLACKJACK_READY_DESC" ) )
	Activated:setTTF( "fonts/default.ttf" )
	Activated:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	Activated:setShaderVector( 0, 0.06, 0, 0, 0 )
	Activated:setShaderVector( 1, 0.03, 0, 0, 0 )
	Activated:setShaderVector( 2, 1, 0, 0, 0 )
	Activated:setLetterSpacing( 1 )

	LUI.OverrideFunction_CallOriginalFirst( Activated, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 15 )
	end )
	self:addElement( Activated )
	self.Activated = Activated
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ActivatedBar:completeAnimation()
				self.ActivatedBar:setAlpha( 1 )
				self.clipFinished( ActivatedBar, {} )

				Activated:completeAnimation()
				self.Activated:setAlpha( 1 )
				self.clipFinished( Activated, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				ActivatedBar:completeAnimation()
				self.ActivatedBar:setAlpha( 0 )
				self.clipFinished( ActivatedBar, {} )

				Activated:completeAnimation()
				self.Activated:setAlpha( 0 )
				self.clipFinished( Activated, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsStorageValueEqualTo( controller, "stats_mp", "blackjack_contract_count", 0 )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
