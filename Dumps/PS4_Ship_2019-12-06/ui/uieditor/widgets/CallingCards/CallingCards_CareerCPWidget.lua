CoD.CallingCards_CareerCPWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_CareerCPWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_CareerCPWidget )
	self.id = "CallingCards_CareerCPWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_careercp_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local GlowOrangeOver = LUI.UIImage.new()
	GlowOrangeOver:setLeftRight( true, false, 153.89, 396.11 )
	GlowOrangeOver:setTopBottom( true, false, -152.99, 97.74 )
	GlowOrangeOver:setRGB( 1, 0.94, 0.42 )
	GlowOrangeOver:setAlpha( 0 )
	GlowOrangeOver:setZRot( -84 )
	GlowOrangeOver:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	GlowOrangeOver:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( GlowOrangeOver )
	self.GlowOrangeOver = GlowOrangeOver
	
	local clouds1 = LUI.UIImage.new()
	clouds1:setLeftRight( true, false, 0, 480 )
	clouds1:setTopBottom( true, false, 0.38, 120 )
	clouds1:setImage( RegisterImage( "uie_t7_callingcard_careercp_clouds" ) )
	clouds1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	clouds1:setShaderVector( 0, 1, 1, 0, 0 )
	clouds1:setShaderVector( 1, -0.04, 0, 0, 0 )
	self:addElement( clouds1 )
	self.clouds1 = clouds1
	
	local cloud2 = LUI.UIImage.new()
	cloud2:setLeftRight( true, false, 0, 480 )
	cloud2:setTopBottom( true, false, 0.38, 120 )
	cloud2:setImage( RegisterImage( "uie_t7_callingcard_careercp_clouds2" ) )
	cloud2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	cloud2:setShaderVector( 0, 1, 1, 0, 0 )
	cloud2:setShaderVector( 1, -0.02, 0, 0, 0 )
	self:addElement( cloud2 )
	self.cloud2 = cloud2
	
	local cloud3 = LUI.UIImage.new()
	cloud3:setLeftRight( true, false, 0, 480 )
	cloud3:setTopBottom( true, false, 0.38, 120.38 )
	cloud3:setImage( RegisterImage( "uie_t7_callingcard_careercp_clouds3" ) )
	cloud3:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	cloud3:setShaderVector( 0, 1, 1, 0, 0 )
	cloud3:setShaderVector( 1, -0.03, 0, 0, 0 )
	self:addElement( cloud3 )
	self.cloud3 = cloud3
	
	local sword = LUI.UIImage.new()
	sword:setLeftRight( true, false, 302, 350 )
	sword:setTopBottom( true, false, 0, 120 )
	sword:setImage( RegisterImage( "uie_t7_callingcard_careercp_sword" ) )
	self:addElement( sword )
	self.sword = sword
	
	local swordtail = LUI.UIImage.new()
	swordtail:setLeftRight( true, false, 329, 375 )
	swordtail:setTopBottom( true, false, 0.38, 52.13 )
	swordtail:setImage( RegisterImage( "uie_t7_callingcard_careercp_swordtail" ) )
	swordtail:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	swordtail:setShaderVector( 0, 2, 0, 0, 0 )
	swordtail:setShaderVector( 1, 3.91, 0, 0, 0 )
	self:addElement( swordtail )
	self.swordtail = swordtail
	
	local leafs = LUI.UIImage.new()
	leafs:setLeftRight( true, false, 85, 457 )
	leafs:setTopBottom( true, false, 0.38, 120.38 )
	leafs:setImage( RegisterImage( "uie_t7_callingcard_careercp_leafs" ) )
	leafs:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	leafs:setShaderVector( 0, 1, 1, 0, 0 )
	leafs:setShaderVector( 1, 0, -0.38, 0, 0 )
	self:addElement( leafs )
	self.leafs = leafs
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local GlowOrangeOverFrame2 = function ( GlowOrangeOver, event )
					local GlowOrangeOverFrame3 = function ( GlowOrangeOver, event )
						if not event.interrupted then
							GlowOrangeOver:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						end
						GlowOrangeOver:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( GlowOrangeOver, event )
						else
							GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						GlowOrangeOverFrame3( GlowOrangeOver, event )
						return 
					else
						GlowOrangeOver:beginAnimation( "keyframe", 1500, false, false, CoD.TweenType.Linear )
						GlowOrangeOver:setAlpha( 0.44 )
						GlowOrangeOver:registerEventHandler( "transition_complete_keyframe", GlowOrangeOverFrame3 )
					end
				end
				
				GlowOrangeOver:completeAnimation()
				self.GlowOrangeOver:setAlpha( 0 )
				GlowOrangeOverFrame2( GlowOrangeOver, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

