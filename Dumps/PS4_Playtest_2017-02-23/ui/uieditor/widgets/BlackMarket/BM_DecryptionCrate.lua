require( "ui.uieditor.widgets.BlackMarket.fx_Ember" )
require( "ui.uieditor.widgets.BlackMarket.fx_Ember2" )
require( "ui.uieditor.widgets.BlackMarket.fx_glow" )
require( "ui.uieditor.widgets.BlackMarket.smokewidget" )

CoD.BM_DecryptionCrate = InheritFrom( LUI.UIElement )
CoD.BM_DecryptionCrate.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_DecryptionCrate )
	self.id = "BM_DecryptionCrate"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 118 )
	self:setTopBottom( 0, 0, 0, 118 )
	self.anyChildUsesUpdateState = true
	
	local glow00 = LUI.UIImage.new()
	glow00:setLeftRight( 0.5, 0.5, -101, 104 )
	glow00:setTopBottom( 0, 0, -42, 162 )
	glow00:setRGB( 0.22, 0.93, 0.93 )
	glow00:setAlpha( 0 )
	glow00:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow00 )
	self.glow00 = glow00
	
	local smokewidget = CoD.smokewidget.new( menu, controller )
	smokewidget:setLeftRight( 0, 0, -66, 188 )
	smokewidget:setTopBottom( 0, 0, -120, 148 )
	smokewidget:setAlpha( 0 )
	smokewidget:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( smokewidget )
	self.smokewidget = smokewidget
	
	local fxEmber2 = CoD.fx_Ember2.new( menu, controller )
	fxEmber2:setLeftRight( 0, 0, -47, 169 )
	fxEmber2:setTopBottom( 0, 0, -97, 173 )
	fxEmber2:setAlpha( 0 )
	fxEmber2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber2 )
	self.fxEmber2 = fxEmber2
	
	local fxEmber = CoD.fx_Ember.new( menu, controller )
	fxEmber:setLeftRight( 0, 0, -53, 174 )
	fxEmber:setTopBottom( 0, 0, -79, 205 )
	fxEmber:setAlpha( 0 )
	fxEmber:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( fxEmber )
	self.fxEmber = fxEmber
	
	local RareOn = LUI.UIImage.new()
	RareOn:setLeftRight( 0.5, 0.5, -101, 104 )
	RareOn:setTopBottom( 0, 0, -43, 161 )
	RareOn:setAlpha( 0 )
	RareOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_rare_focus" ) )
	self:addElement( RareOn )
	self.RareOn = RareOn
	
	local CommonOn = LUI.UIImage.new()
	CommonOn:setLeftRight( 0.5, 0.5, -101, 104 )
	CommonOn:setTopBottom( 0, 0, -43, 161 )
	CommonOn:setAlpha( 0 )
	CommonOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_common_focus" ) )
	self:addElement( CommonOn )
	self.CommonOn = CommonOn
	
	local fxglow = CoD.fx_glow.new( menu, controller )
	fxglow:setLeftRight( 0, 0, -42, 163 )
	fxglow:setTopBottom( 0, 0, -43, 161 )
	fxglow:setAlpha( 0 )
	self:addElement( fxglow )
	self.fxglow = fxglow
	
	local glow0 = LUI.UIImage.new()
	glow0:setLeftRight( 0.5, 0.5, -101, 104 )
	glow0:setTopBottom( 0, 0, -42, 162 )
	glow0:setAlpha( 0 )
	glow0:setImage( RegisterImage( "uie_t7_blackmarket_crate_whiteglow" ) )
	self:addElement( glow0 )
	self.glow0 = glow0
	
	local BribeOn = LUI.UIImage.new()
	BribeOn:setLeftRight( 0.5, 0.5, -121, 121 )
	BribeOn:setTopBottom( 0, 0, -60, 181 )
	BribeOn:setAlpha( 0 )
	BribeOn:setScale( 1.6 )
	BribeOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_bribe_chip" ) )
	self:addElement( BribeOn )
	self.BribeOn = BribeOn
	
	local glowBribe = LUI.UIImage.new()
	glowBribe:setLeftRight( 0.5, 0.5, -121, 121 )
	glowBribe:setTopBottom( 0, 0, -61, 181 )
	glowBribe:setAlpha( 0 )
	glowBribe:setScale( 1.6 )
	glowBribe:setImage( RegisterImage( "uie_t7_blackmarket_crate_bribe_chip_hover" ) )
	self:addElement( glowBribe )
	self.glowBribe = glowBribe
	
	local BundleOn = LUI.UIImage.new()
	BundleOn:setLeftRight( 0.5, 0.5, -124, 126 )
	BundleOn:setTopBottom( 0, 0, -69, 186 )
	BundleOn:setAlpha( 0 )
	BundleOn:setImage( RegisterImage( "uie_t7_blackmarket_crate_bundle" ) )
	self:addElement( BundleOn )
	self.BundleOn = BundleOn
	
	local glowBundle = LUI.UIImage.new()
	glowBundle:setLeftRight( 0.5, 0.5, -124, 126 )
	glowBundle:setTopBottom( 0, 0, -69, 186 )
	glowBundle:setAlpha( 0 )
	glowBundle:setImage( RegisterImage( "uie_t7_blackmarket_crate_bundle_glow" ) )
	self:addElement( glowBundle )
	self.glowBundle = glowBundle
	
	local BundleCount = LUI.UIText.new()
	BundleCount:setLeftRight( 0, 0, -90, 210 )
	BundleCount:setTopBottom( 0, 0, -12, 63 )
	BundleCount:setAlpha( 0 )
	BundleCount:setText( Engine.Localize( "5" ) )
	BundleCount:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	BundleCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BundleCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BundleCount )
	self.BundleCount = BundleCount
	
	self.resetProperties = function ()
		CommonOn:completeAnimation()
		smokewidget:completeAnimation()
		fxEmber:completeAnimation()
		fxEmber2:completeAnimation()
		glow0:completeAnimation()
		glow00:completeAnimation()
		RareOn:completeAnimation()
		BribeOn:completeAnimation()
		glowBribe:completeAnimation()
		BundleOn:completeAnimation()
		BundleCount:completeAnimation()
		glowBundle:completeAnimation()
		CommonOn:setAlpha( 0 )
		smokewidget:setRGB( 1, 1, 1 )
		smokewidget:setAlpha( 0 )
		fxEmber:setRGB( 1, 1, 1 )
		fxEmber:setAlpha( 0 )
		fxEmber2:setRGB( 1, 1, 1 )
		fxEmber2:setAlpha( 0 )
		glow0:setRGB( 1, 1, 1 )
		glow0:setAlpha( 0 )
		glow00:setRGB( 0.22, 0.93, 0.93 )
		glow00:setAlpha( 0 )
		RareOn:setAlpha( 0 )
		BribeOn:setLeftRight( 0.5, 0.5, -121, 121 )
		BribeOn:setTopBottom( 0, 0, -60, 181 )
		BribeOn:setAlpha( 0 )
		glowBribe:setAlpha( 0 )
		BundleOn:setAlpha( 0 )
		BundleCount:setAlpha( 0 )
		glowBundle:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {},
		Common = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 1 )
				self.clipFinished( CommonOn, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local glow00Frame2 = function ( glow00, event )
					local glow00Frame3 = function ( glow00, event )
						if not event.interrupted then
							glow00:beginAnimation( "keyframe", 779, false, false, CoD.TweenType.Linear )
						end
						glow00:setRGB( 1, 1, 1 )
						glow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow00, event )
						else
							glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow00Frame3( glow00, event )
						return 
					else
						glow00:beginAnimation( "keyframe", 759, false, false, CoD.TweenType.Linear )
						glow00:setAlpha( 1 )
						glow00:registerEventHandler( "transition_complete_keyframe", glow00Frame3 )
					end
				end
				
				glow00:completeAnimation()
				self.glow00:setRGB( 1, 1, 1 )
				self.glow00:setAlpha( 0 )
				glow00Frame2( glow00, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setAlpha( 1 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setAlpha( 1 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setAlpha( 1 )
				self.clipFinished( fxEmber, {} )
				CommonOn:completeAnimation()
				self.CommonOn:setAlpha( 1 )
				self.clipFinished( CommonOn, {} )
				local glow0Frame2 = function ( glow0, event )
					local glow0Frame3 = function ( glow0, event )
						if not event.interrupted then
							glow0:beginAnimation( "keyframe", 779, true, true, CoD.TweenType.Linear )
						end
						glow0:setAlpha( 0.1 )
						if event.interrupted then
							self.clipFinished( glow0, event )
						else
							glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow0Frame3( glow0, event )
						return 
					else
						glow0:beginAnimation( "keyframe", 759, true, true, CoD.TweenType.Linear )
						glow0:setAlpha( 1 )
						glow0:registerEventHandler( "transition_complete_keyframe", glow0Frame3 )
					end
				end
				
				glow0:completeAnimation()
				self.glow0:setAlpha( 0 )
				glow0Frame2( glow0, {} )
				self.nextClip = "Focus"
			end
		},
		Rare = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 1 )
				self.clipFinished( RareOn, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				local glow00Frame2 = function ( glow00, event )
					local glow00Frame3 = function ( glow00, event )
						if not event.interrupted then
							glow00:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
						end
						glow00:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow00, event )
						else
							glow00:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow00Frame3( glow00, event )
						return 
					else
						glow00:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						glow00:setAlpha( 1 )
						glow00:registerEventHandler( "transition_complete_keyframe", glow00Frame3 )
					end
				end
				
				glow00:completeAnimation()
				self.glow00:setAlpha( 0 )
				glow00Frame2( glow00, {} )
				smokewidget:completeAnimation()
				self.smokewidget:setRGB( 0.22, 0.93, 0.93 )
				self.smokewidget:setAlpha( 1 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setRGB( 0.22, 0.93, 0.93 )
				self.fxEmber:setAlpha( 1 )
				self.clipFinished( fxEmber, {} )
				RareOn:completeAnimation()
				self.RareOn:setAlpha( 1 )
				self.clipFinished( RareOn, {} )
				local glow0Frame2 = function ( glow0, event )
					local glow0Frame3 = function ( glow0, event )
						if not event.interrupted then
							glow0:beginAnimation( "keyframe", 809, true, true, CoD.TweenType.Linear )
						end
						glow0:setRGB( 0.22, 0.93, 0.93 )
						glow0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glow0, event )
						else
							glow0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glow0Frame3( glow0, event )
						return 
					else
						glow0:beginAnimation( "keyframe", 740, true, true, CoD.TweenType.Linear )
						glow0:setAlpha( 1 )
						glow0:registerEventHandler( "transition_complete_keyframe", glow0Frame3 )
					end
				end
				
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.glow0:setAlpha( 0 )
				glow0Frame2( glow0, {} )
				self.nextClip = "Focus"
			end
		},
		Bribe = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BribeOn:completeAnimation()
				self.BribeOn:setLeftRight( 0.5, 0.5, -120.5, 120.5 )
				self.BribeOn:setTopBottom( 0, 0, -60, 181 )
				self.BribeOn:setAlpha( 1 )
				self.clipFinished( BribeOn, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				smokewidget:completeAnimation()
				self.smokewidget:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( fxEmber, {} )
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( glow0, {} )
				BribeOn:completeAnimation()
				self.BribeOn:setAlpha( 1 )
				self.clipFinished( BribeOn, {} )
				local glowBribeFrame2 = function ( glowBribe, event )
					local glowBribeFrame3 = function ( glowBribe, event )
						if not event.interrupted then
							glowBribe:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
						end
						glowBribe:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glowBribe, event )
						else
							glowBribe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowBribeFrame3( glowBribe, event )
						return 
					else
						glowBribe:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						glowBribe:setAlpha( 1 )
						glowBribe:registerEventHandler( "transition_complete_keyframe", glowBribeFrame3 )
					end
				end
				
				glowBribe:completeAnimation()
				self.glowBribe:setAlpha( 0 )
				glowBribeFrame2( glowBribe, {} )
				self.nextClip = "Focus"
			end
		},
		Bundle = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BribeOn:completeAnimation()
				self.BribeOn:setLeftRight( 0.5, 0.5, -120.5, 120.5 )
				self.BribeOn:setTopBottom( 0, 0, -60, 181 )
				self.clipFinished( BribeOn, {} )
				BundleOn:completeAnimation()
				self.BundleOn:setAlpha( 1 )
				self.clipFinished( BundleOn, {} )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 1 )
				self.clipFinished( BundleCount, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 7 )
				smokewidget:completeAnimation()
				self.smokewidget:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( smokewidget, {} )
				fxEmber2:completeAnimation()
				self.fxEmber2:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( fxEmber2, {} )
				fxEmber:completeAnimation()
				self.fxEmber:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( fxEmber, {} )
				glow0:completeAnimation()
				self.glow0:setRGB( 0.22, 0.93, 0.93 )
				self.clipFinished( glow0, {} )
				BundleOn:completeAnimation()
				self.BundleOn:setAlpha( 1 )
				self.clipFinished( BundleOn, {} )
				local glowBundleFrame2 = function ( glowBundle, event )
					local glowBundleFrame3 = function ( glowBundle, event )
						if not event.interrupted then
							glowBundle:beginAnimation( "keyframe", 809, false, false, CoD.TweenType.Linear )
						end
						glowBundle:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( glowBundle, event )
						else
							glowBundle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowBundleFrame3( glowBundle, event )
						return 
					else
						glowBundle:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						glowBundle:setAlpha( 1 )
						glowBundle:registerEventHandler( "transition_complete_keyframe", glowBundleFrame3 )
					end
				end
				
				glowBundle:completeAnimation()
				self.glowBundle:setAlpha( 0 )
				glowBundleFrame2( glowBundle, {} )
				BundleCount:completeAnimation()
				self.BundleCount:setAlpha( 1 )
				self.clipFinished( BundleCount, {} )
				self.nextClip = "Focus"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Common",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyEnumValue( controller, "supplyDropType", Enum.LootCrateType.LOOT_CRATE_TYPE_COMMON )
			end
		},
		{
			stateName = "Rare",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyEnumValue( controller, "supplyDropType", Enum.LootCrateType.LOOT_CRATE_TYPE_RARE )
			end
		},
		{
			stateName = "Bribe",
			condition = function ( menu, element, event )
				return IsPerControllerTablePropertyEnumValue( controller, "supplyDropType", Enum.LootCrateType.LOOT_CRATE_TYPE_BRIBE )
			end
		},
		{
			stateName = "Bundle",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.smokewidget:close()
		self.fxEmber2:close()
		self.fxEmber:close()
		self.fxglow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

