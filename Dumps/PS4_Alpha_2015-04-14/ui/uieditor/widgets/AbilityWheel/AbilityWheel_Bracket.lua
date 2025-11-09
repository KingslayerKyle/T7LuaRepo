CoD.AbilityWheel_Bracket = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_Bracket.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_Bracket )
	self.id = "AbilityWheel_Bracket"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 188 )
	self:setTopBottom( true, false, 0, 52 )
	
	local Bracket0 = LUI.UIImage.new()
	Bracket0:setLeftRight( false, false, -94, 94 )
	Bracket0:setTopBottom( false, false, -26, 26 )
	Bracket0:setRGB( 1, 1, 1 )
	Bracket0:setAlpha( RandomAddPercent( 1, -10 ) )
	Bracket0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconbracket" ) )
	Bracket0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Bracket0 )
	self.Bracket0 = Bracket0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local Bracket0Frame2 = function ( Bracket0, event )
					if not event.interrupted then
						Bracket0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					Bracket0:setRGB( 1, 1, 1 )
					Bracket0:setAlpha( RandomAddPercent( 1, -10 ) )
					if event.interrupted then
						self.clipFinished( Bracket0, event )
					else
						Bracket0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Bracket0:completeAnimation()
				self.Bracket0:setRGB( 1, 1, 1 )
				self.Bracket0:setAlpha( RandomAddPercent( 1, -10 ) )
				Bracket0Frame2( Bracket0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

