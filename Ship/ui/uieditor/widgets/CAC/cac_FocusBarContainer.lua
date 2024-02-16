-- 2902436305f883716598773309615930
-- This hash is used for caching, delete to decompile the file again

CoD.cac_FocusBarContainer = InheritFrom( LUI.UIElement )
CoD.cac_FocusBarContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.cac_FocusBarContainer )
	self.id = "cac_FocusBarContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 8 )
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( true, true, 0, 0 )
	FEFocusBarSolid:setTopBottom( false, false, -4, 4 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0.04, 0.5, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 4, 4 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -21, 21 )
	Glow2:setTopBottom( true, false, 0, 8 )
	Glow2:setAlpha( 0.69 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytargetbw_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local FEFocusBarSolidFrame2 = function ( FEFocusBarSolid, event )
					local FEFocusBarSolidFrame3 = function ( FEFocusBarSolid, event )
						if not event.interrupted then
							FEFocusBarSolid:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						end
						FEFocusBarSolid:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( FEFocusBarSolid, event )
						else
							FEFocusBarSolid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFocusBarSolidFrame3( FEFocusBarSolid, event )
						return 
					else
						FEFocusBarSolid:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						FEFocusBarSolid:setAlpha( 0.53 )
						FEFocusBarSolid:registerEventHandler( "transition_complete_keyframe", FEFocusBarSolidFrame3 )
					end
				end
				
				FEFocusBarSolid:completeAnimation()
				self.FEFocusBarSolid:setAlpha( 0.7 )
				FEFocusBarSolidFrame2( FEFocusBarSolid, {} )
				local Glow2Frame2 = function ( Glow2, event )
					local Glow2Frame3 = function ( Glow2, event )
						if not event.interrupted then
							Glow2:beginAnimation( "keyframe", 319, false, false, CoD.TweenType.Linear )
						end
						Glow2:setAlpha( 0.69 )
						if event.interrupted then
							self.clipFinished( Glow2, event )
						else
							Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Glow2Frame3( Glow2, event )
						return 
					else
						Glow2:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						Glow2:setAlpha( 0.84 )
						Glow2:registerEventHandler( "transition_complete_keyframe", Glow2Frame3 )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0.69 )
				Glow2Frame2( Glow2, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
