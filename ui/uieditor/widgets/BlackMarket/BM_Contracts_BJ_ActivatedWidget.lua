-- f80e008305beb9d1d2c52f861d8addde
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_Contracts_BJ_Text_Widget" )

CoD.BM_Contracts_BJ_ActivatedWidget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_BJ_ActivatedWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_BJ_ActivatedWidget )
	self.id = "BM_Contracts_BJ_ActivatedWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 264 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local ActivatedBar = LUI.UIImage.new()
	ActivatedBar:setLeftRight( true, true, 0, 0 )
	ActivatedBar:setTopBottom( true, true, 0, 0 )
	ActivatedBar:setRGB( 0, 0, 0 )
	ActivatedBar:setImage( RegisterImage( "uie_t7_blackmarket_contracts_blackjack_bar" ) )
	ActivatedBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	ActivatedBar:setShaderVector( 0, 0.13, 0.5, 0, 0 )
	ActivatedBar:setupNineSliceShader( 35, 12 )
	self:addElement( ActivatedBar )
	self.ActivatedBar = ActivatedBar
	
	local BMContractsBJTextWidget = CoD.BM_Contracts_BJ_Text_Widget.new( menu, controller )
	BMContractsBJTextWidget:setLeftRight( true, false, 26.5, 237.5 )
	BMContractsBJTextWidget:setTopBottom( true, false, 3.5, 20.5 )
	BMContractsBJTextWidget.Activated:setText( Engine.Localize( "MENU_ACTIVATED_CAPS" ) )
	BMContractsBJTextWidget.TimeRemaining0:setText( Engine.Localize( "MPUI_BM_CONTRACTS_TIME_REMAINING" ) )
	self:addElement( BMContractsBJTextWidget )
	self.BMContractsBJTextWidget = BMContractsBJTextWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Activated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Activated",
			condition = function ( menu, element, event )
				return IsBlackjackContractActive( controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMContractsBJTextWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

