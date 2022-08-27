-- 12fd6a590c079ddbb490ec62a783628c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_Bribe_Expires" )
require( "ui.uieditor.widgets.BlackMarket.BM_Bribe_title" )

CoD.BM_BribeFrame = InheritFrom( LUI.UIElement )
CoD.BM_BribeFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_BribeFrame )
	self.id = "BM_BribeFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 467 )
	self:setTopBottom( true, false, 0, 161 )
	self.anyChildUsesUpdateState = true
	
	local BribeFrame = LUI.UIImage.new()
	BribeFrame:setLeftRight( true, false, -3, 469 )
	BribeFrame:setTopBottom( true, false, -3.05, 164.95 )
	BribeFrame:setImage( RegisterImage( "uie_t7_blackmarket_bribe_bg" ) )
	self:addElement( BribeFrame )
	self.BribeFrame = BribeFrame
	
	local Wires = LUI.UIImage.new()
	Wires:setLeftRight( true, false, 22.8, 454 )
	Wires:setTopBottom( true, false, 21.5, 141.28 )
	Wires:setImage( RegisterImage( "uie_t7_blackmarket_bribe_wires" ) )
	self:addElement( Wires )
	self.Wires = Wires
	
	local ExpiresWidget = CoD.BM_Bribe_Expires.new( menu, controller )
	ExpiresWidget:setLeftRight( false, true, -125.38, -16 )
	ExpiresWidget:setTopBottom( true, false, 106.17, 162 )
	ExpiresWidget.Text:setText( Engine.Localize( "MPUI_BM_PROMO_EXPIRES" ) )
	self:addElement( ExpiresWidget )
	self.ExpiresWidget = ExpiresWidget
	
	local BMBribetitle = CoD.BM_Bribe_title.new( menu, controller )
	BMBribetitle:setLeftRight( true, false, 4.85, 128.66 )
	BMBribetitle:setTopBottom( true, false, 5.02, 59.19 )
	BMBribetitle.title:setText( LocalizeToUpperString( "MPUI_BM_BRIBE" ) )
	self:addElement( BMBribetitle )
	self.BMBribetitle = BMBribetitle
	
	local BundleBigBoxFrame = LUI.UIImage.new()
	BundleBigBoxFrame:setLeftRight( true, false, -3, 469 )
	BundleBigBoxFrame:setTopBottom( true, false, -3.05, 164.95 )
	BundleBigBoxFrame:setAlpha( 0 )
	BundleBigBoxFrame:setImage( RegisterImage( "uie_t7_blackmarket_bundle_gold_bg" ) )
	self:addElement( BundleBigBoxFrame )
	self.BundleBigBoxFrame = BundleBigBoxFrame
	
	local BribeChip = LUI.UIImage.new()
	BribeChip:setLeftRight( true, false, 27.57, 138.57 )
	BribeChip:setTopBottom( true, false, 27.37, 138.37 )
	BribeChip:setAlpha( 0 )
	BribeChip:setImage( RegisterImage( "uie_t7_blackmarket_bribe_chip" ) )
	self:addElement( BribeChip )
	self.BribeChip = BribeChip
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ExpiresWidget:close()
		element.BMBribetitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

