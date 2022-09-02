-- 88b98751de442dfa269c4d20fbd3f0f3
-- This hash is used for caching, delete to decompile the file again

CoD.Theater_FocusBar = InheritFrom( LUI.UIElement )
CoD.Theater_FocusBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Theater_FocusBar )
	self.id = "Theater_FocusBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 8 )
	
	local FEFocusBarSolid = LUI.UIImage.new()
	FEFocusBarSolid:setLeftRight( true, true, 0, 0 )
	FEFocusBarSolid:setTopBottom( true, true, 1, -2 )
	FEFocusBarSolid:setRGB( 0, 0, 0 )
	FEFocusBarSolid:setAlpha( 0.7 )
	FEFocusBarSolid:setImage( RegisterImage( "uie_t7_menu_frontend_barfocussolidfull" ) )
	FEFocusBarSolid:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	FEFocusBarSolid:setShaderVector( 0, 0.05, 0.4, 0, 0 )
	FEFocusBarSolid:setupNineSliceShader( 2, 2 )
	self:addElement( FEFocusBarSolid )
	self.FEFocusBarSolid = FEFocusBarSolid
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -8, 8 )
	Glow2:setTopBottom( true, false, -1.1, 9.1 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local FEFocusBarAdd = LUI.UIImage.new()
	FEFocusBarAdd:setLeftRight( true, true, 0, 0 )
	FEFocusBarAdd:setTopBottom( true, true, 1, -2 )
	FEFocusBarAdd:setRGB( 1, 0.9, 0.8 )
	FEFocusBarAdd:setAlpha( 0.99 )
	FEFocusBarAdd:setImage( RegisterImage( "uie_t7_menu_frontend_barfocusfull" ) )
	FEFocusBarAdd:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FEFocusBarAdd:setShaderVector( 0, 0.05, 0.4, 0, 0 )
	FEFocusBarAdd:setupNineSliceShader( 2, 2 )
	self:addElement( FEFocusBarAdd )
	self.FEFocusBarAdd = FEFocusBarAdd
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

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

