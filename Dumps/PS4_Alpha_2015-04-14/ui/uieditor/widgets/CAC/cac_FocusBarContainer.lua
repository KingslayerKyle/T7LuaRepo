require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarSolid" )

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
	
	local FEFocusBarSolid0 = CoD.FE_FocusBarSolid.new( menu, controller )
	FEFocusBarSolid0:setLeftRight( true, true, 0, 0 )
	FEFocusBarSolid0:setTopBottom( false, false, -4, 4 )
	FEFocusBarSolid0:setRGB( 1, 1, 1 )
	FEFocusBarSolid0:setAlpha( 0.7 )
	self:addElement( FEFocusBarSolid0 )
	self.FEFocusBarSolid0 = FEFocusBarSolid0
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -31, 37 )
	Glow2:setTopBottom( true, false, -3.21, 11.21 )
	Glow2:setRGB( 1, 1, 1 )
	Glow2:setAlpha( 0.69 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local FEFocusBarSolid0Frame2 = function ( FEFocusBarSolid0, event )
					local FEFocusBarSolid0Frame3 = function ( FEFocusBarSolid0, event )
						if not event.interrupted then
							FEFocusBarSolid0:beginAnimation( "keyframe", 560, false, false, CoD.TweenType.Linear )
						end
						FEFocusBarSolid0:setAlpha( 0.7 )
						if event.interrupted then
							self.clipFinished( FEFocusBarSolid0, event )
						else
							FEFocusBarSolid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FEFocusBarSolid0Frame3( FEFocusBarSolid0, event )
						return 
					else
						FEFocusBarSolid0:beginAnimation( "keyframe", 379, false, false, CoD.TweenType.Linear )
						FEFocusBarSolid0:setAlpha( 0.53 )
						FEFocusBarSolid0:registerEventHandler( "transition_complete_keyframe", FEFocusBarSolid0Frame3 )
					end
				end
				
				FEFocusBarSolid0:completeAnimation()
				self.FEFocusBarSolid0:setAlpha( 0.7 )
				FEFocusBarSolid0Frame2( FEFocusBarSolid0, {} )
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
	self.close = function ( self )
		self.FEFocusBarSolid0:close()
		CoD.cac_FocusBarContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

