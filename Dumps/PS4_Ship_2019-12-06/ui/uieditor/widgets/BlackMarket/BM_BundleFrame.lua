require( "ui.uieditor.widgets.BlackMarket.BM_Bribe_title" )
require( "ui.uieditor.widgets.BlackMarket.BM_Bribe_Expires" )

CoD.BM_BundleFrame = InheritFrom( LUI.UIElement )
CoD.BM_BundleFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_BundleFrame )
	self.id = "BM_BundleFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 467 )
	self:setTopBottom( true, false, 0, 161 )
	self.anyChildUsesUpdateState = true
	
	local BundleFrame = LUI.UIImage.new()
	BundleFrame:setLeftRight( true, false, -3, 469 )
	BundleFrame:setTopBottom( true, false, -3.05, 164.95 )
	BundleFrame:setImage( RegisterImage( "uie_t7_blackmarket_bundle_bg" ) )
	self:addElement( BundleFrame )
	self.BundleFrame = BundleFrame
	
	local BundleBigBoxFrame = LUI.UIImage.new()
	BundleBigBoxFrame:setLeftRight( true, false, -3, 469 )
	BundleBigBoxFrame:setTopBottom( true, false, -3.05, 164.95 )
	BundleBigBoxFrame:setImage( RegisterImage( "uie_t7_blackmarket_bundle_gold_bg" ) )
	self:addElement( BundleBigBoxFrame )
	self.BundleBigBoxFrame = BundleBigBoxFrame
	
	local Wires = LUI.UIImage.new()
	Wires:setLeftRight( true, false, 24.8, 454 )
	Wires:setTopBottom( true, false, 21.5, 141.28 )
	Wires:setAlpha( 0 )
	Wires:setImage( RegisterImage( "uie_t7_blackmarket_genericpromo_wires" ) )
	self:addElement( Wires )
	self.Wires = Wires
	
	local BMBribetitle = CoD.BM_Bribe_title.new( menu, controller )
	BMBribetitle:setLeftRight( true, false, 7.85, 131.66 )
	BMBribetitle:setTopBottom( true, false, 8.02, 62.19 )
	BMBribetitle.title:setRGB( 1, 1, 1 )
	BMBribetitle.title:setText( LocalizeToUpperString( "MPUI_BM_BUNDLE" ) )
	BMBribetitle:mergeStateConditions( {
		{
			stateName = "GoldFrame",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "GoldFrame" )
			end
		}
	} )
	self:addElement( BMBribetitle )
	self.BMBribetitle = BMBribetitle
	
	local ExpiresWidget = CoD.BM_Bribe_Expires.new( menu, controller )
	ExpiresWidget:setLeftRight( false, true, -125.38, -16 )
	ExpiresWidget:setTopBottom( true, false, 106.17, 162 )
	ExpiresWidget.Text:setText( Engine.Localize( "MPUI_BM_PROMO_EXPIRES" ) )
	self:addElement( ExpiresWidget )
	self.ExpiresWidget = ExpiresWidget
	
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
				self:setupElementClipCounter( 6 )
				BundleFrame:completeAnimation()
				self.BundleFrame:setAlpha( 1 )
				self.clipFinished( BundleFrame, {} )
				BundleBigBoxFrame:completeAnimation()
				self.BundleBigBoxFrame:setAlpha( 0 )
				self.clipFinished( BundleBigBoxFrame, {} )
				Wires:completeAnimation()
				self.Wires:setAlpha( 0 )
				self.clipFinished( Wires, {} )
				BMBribetitle:completeAnimation()
				self.BMBribetitle:setAlpha( 1 )
				self.clipFinished( BMBribetitle, {} )
				ExpiresWidget:completeAnimation()
				self.ExpiresWidget:setAlpha( 1 )
				self.clipFinished( ExpiresWidget, {} )
				BribeChip:completeAnimation()
				self.BribeChip:setAlpha( 0 )
				self.clipFinished( BribeChip, {} )
			end
		},
		GoldFrame = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BundleFrame:completeAnimation()
				self.BundleFrame:setAlpha( 0 )
				self.clipFinished( BundleFrame, {} )
				BundleBigBoxFrame:completeAnimation()
				self.BundleBigBoxFrame:setAlpha( 1 )
				self.clipFinished( BundleBigBoxFrame, {} )
				Wires:completeAnimation()
				self.Wires:setAlpha( 0 )
				self.clipFinished( Wires, {} )
				BMBribetitle:completeAnimation()
				self.BMBribetitle:setAlpha( 1 )
				self.clipFinished( BMBribetitle, {} )
				ExpiresWidget:completeAnimation()
				self.ExpiresWidget:setAlpha( 1 )
				self.clipFinished( ExpiresWidget, {} )
				BribeChip:completeAnimation()
				self.BribeChip:setAlpha( 0 )
				self.clipFinished( BribeChip, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMBribetitle:close()
		element.ExpiresWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

