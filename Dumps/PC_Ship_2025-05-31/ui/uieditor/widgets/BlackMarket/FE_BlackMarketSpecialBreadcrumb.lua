require( "ui.uieditor.widgets.BlackMarket.BM_Bread_linker" )

CoD.FE_BlackMarketSpecialBreadcrumb = InheritFrom( LUI.UIElement )
CoD.FE_BlackMarketSpecialBreadcrumb.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_BlackMarketSpecialBreadcrumb )
	self.id = "FE_BlackMarketSpecialBreadcrumb"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local BMBreadlinker = CoD.BM_Bread_linker.new( menu, controller )
	BMBreadlinker:setLeftRight( true, false, -29, 55 )
	BMBreadlinker:setTopBottom( true, false, 6, 78 )
	self:addElement( BMBreadlinker )
	self.BMBreadlinker = BMBreadlinker
	
	local Glow = LUI.UIImage.new()
	Glow:setLeftRight( true, false, 4, 88 )
	Glow:setTopBottom( true, false, -1, 83 )
	Glow:setAlpha( 0 )
	Glow:setScale( 2.09 )
	Glow:setImage( RegisterImage( "uie_t7_menu_frontend_blackmarket_breadcrumb_glow" ) )
	self:addElement( Glow )
	self.Glow = Glow
	
	local Bread = LUI.UIImage.new()
	Bread:setLeftRight( true, false, -1, 95 )
	Bread:setTopBottom( true, false, -12, 84 )
	Bread:setImage( RegisterImage( "uie_t7_menu_frontend_blackmarket_breadcrumb" ) )
	self:addElement( Bread )
	self.Bread = Bread
	
	local BreadGlint = LUI.UIImage.new()
	BreadGlint:setLeftRight( true, false, 22, 70 )
	BreadGlint:setTopBottom( true, false, 17, 65 )
	BreadGlint:setRGB( 1, 0.83, 0.41 )
	BreadGlint:setAlpha( 0.01 )
	BreadGlint:setImage( RegisterImage( "uie_t7_menu_frontend_blackmarket_breadcrumb-02" ) )
	BreadGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
	BreadGlint:setShaderVector( 0, 1, 0, 0, 0 )
	self:addElement( BreadGlint )
	self.BreadGlint = BreadGlint
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							local f5_local0 = function ( f6_arg0, f6_arg1 )
								if not f6_arg1.interrupted then
									f6_arg0:beginAnimation( "keyframe", 810, false, false, CoD.TweenType.Linear )
								end
								f6_arg0:setAlpha( 0 )
								f6_arg0:setScale( 2.2 )
								if f6_arg1.interrupted then
									self.clipFinished( f6_arg0, f6_arg1 )
								else
									f6_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if f5_arg1.interrupted then
								f5_local0( f5_arg0, f5_arg1 )
								return 
							else
								f5_arg0:beginAnimation( "keyframe", 429, false, false, CoD.TweenType.Linear )
								f5_arg0:setAlpha( 0 )
								f5_arg0:setScale( 1.74 )
								f5_arg0:registerEventHandler( "transition_complete_keyframe", f5_local0 )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 110, false, false, CoD.TweenType.Linear )
							f4_arg0:setScale( 1.5 )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						f3_arg0:setAlpha( 1 )
						f3_arg0:setScale( 1.23 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				Glow:beginAnimation( "keyframe", 2200, false, false, CoD.TweenType.Linear )
				Glow:setAlpha( 0 )
				Glow:setScale( 0.9 )
				Glow:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				local BreadFrame2 = function ( Bread, event )
					if not event.interrupted then
						Bread:beginAnimation( "keyframe", 5000, false, false, CoD.TweenType.Linear )
					end
					Bread:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Bread, event )
					else
						Bread:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Bread:completeAnimation()
				self.Bread:setAlpha( 1 )
				BreadFrame2( Bread, {} )
				local BreadGlintFrame2 = function ( BreadGlint, event )
					local BreadGlintFrame3 = function ( BreadGlint, event )
						local BreadGlintFrame4 = function ( BreadGlint, event )
							if not event.interrupted then
								BreadGlint:beginAnimation( "keyframe", 1059, false, false, CoD.TweenType.Linear )
							end
							BreadGlint:setAlpha( 0 )
							BreadGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
							BreadGlint:setShaderVector( 0, 1, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( BreadGlint, event )
							else
								BreadGlint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							BreadGlintFrame4( BreadGlint, event )
							return 
						else
							BreadGlint:beginAnimation( "keyframe", 820, false, false, CoD.TweenType.Linear )
							BreadGlint:setShaderVector( 0, 1, 0, 0, 0 )
							BreadGlint:registerEventHandler( "transition_complete_keyframe", BreadGlintFrame4 )
						end
					end
					
					if event.interrupted then
						BreadGlintFrame3( BreadGlint, event )
						return 
					else
						BreadGlint:beginAnimation( "keyframe", 1620, false, false, CoD.TweenType.Linear )
						BreadGlint:registerEventHandler( "transition_complete_keyframe", BreadGlintFrame3 )
					end
				end
				
				BreadGlint:completeAnimation()
				self.BreadGlint:setAlpha( 1 )
				self.BreadGlint:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint_reveal" ) )
				self.BreadGlint:setShaderVector( 0, 0, 0, 0, 0 )
				BreadGlintFrame2( BreadGlint, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMBreadlinker:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

