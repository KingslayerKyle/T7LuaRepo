require( "ui.uieditor.widgets.ZMPromotional.ZM_Promo_50percentInternal" )

CoD.ZM_Promo_50percentoff = InheritFrom( LUI.UIElement )
CoD.ZM_Promo_50percentoff.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZM_Promo_50percentoff )
	self.id = "ZM_Promo_50percentoff"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 357 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local ZMPromo50percentInternal = CoD.ZM_Promo_50percentInternal.new( menu, controller )
	ZMPromo50percentInternal:setLeftRight( false, false, -178.5, 178.5 )
	ZMPromo50percentInternal:setTopBottom( true, false, 0, 35 )
	ZMPromo50percentInternal.MarketingShadow:setText( DvarLocalizedIntoString( "loot_ld_discount", "ZMUI_PERCENT_OFF" ) )
	ZMPromo50percentInternal.Marketing:setText( DvarLocalizedIntoString( "loot_ld_discount", "ZMUI_PERCENT_OFF" ) )
	self:addElement( ZMPromo50percentInternal )
	self.ZMPromo50percentInternal = ZMPromo50percentInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromo50percentInternal:completeAnimation()
				self.ZMPromo50percentInternal:setAlpha( 0 )
				self.clipFinished( ZMPromo50percentInternal, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ZMPromo50percentInternal:completeAnimation()
				self.ZMPromo50percentInternal:setAlpha( 1 )
				self.clipFinished( ZMPromo50percentInternal, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZMPromo50percentInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

