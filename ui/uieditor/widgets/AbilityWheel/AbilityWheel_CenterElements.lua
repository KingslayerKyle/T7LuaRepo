-- 2f5426dbe3f23472a0ae6b5b16e22b78
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_CenterElements = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_CenterElements.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_CenterElements )
	self.id = "AbilityWheel_CenterElements"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 216 )
	self:setTopBottom( true, false, 0, 216 )
	
	local Grad = LUI.UIImage.new()
	Grad:setLeftRight( false, false, -108, 108 )
	Grad:setTopBottom( false, false, -108, 108 )
	Grad:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_gradcenter" ) )
	self:addElement( Grad )
	self.Grad = Grad
	
	local TopGrid0 = LUI.UIImage.new()
	TopGrid0:setLeftRight( false, false, -16, 16 )
	TopGrid0:setTopBottom( false, false, 88, 100 )
	TopGrid0:setAlpha( RandomAddPercent( -10, 0.4 ) )
	TopGrid0:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_centertopgrid" ) )
	TopGrid0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TopGrid0 )
	self.TopGrid0 = TopGrid0
	
	local TitleBar = LUI.UIImage.new()
	TitleBar:setLeftRight( false, false, -76, 76 )
	TitleBar:setTopBottom( false, false, -15, -7 )
	TitleBar:setAlpha( RandomAddPercent( -10, 0.2 ) )
	TitleBar:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_centertitlebar" ) )
	TitleBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TitleBar )
	self.TitleBar = TitleBar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				Grad:completeAnimation()
				self.Grad:setAlpha( 1 )
				self.clipFinished( Grad, {} )
				local TopGrid0Frame2 = function ( TopGrid0, event )
					local TopGrid0Frame3 = function ( TopGrid0, event )
						local TopGrid0Frame4 = function ( TopGrid0, event )
							if not event.interrupted then
								TopGrid0:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
							end
							TopGrid0:setAlpha( RandomAddPercent( -10, 0.69 ) )
							if event.interrupted then
								self.clipFinished( TopGrid0, event )
							else
								TopGrid0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							TopGrid0Frame4( TopGrid0, event )
							return 
						else
							TopGrid0:beginAnimation( "keyframe", 30, false, false, CoD.TweenType.Linear )
							TopGrid0:setAlpha( RandomAddPercent( -10, 0.7 ) )
							TopGrid0:registerEventHandler( "transition_complete_keyframe", TopGrid0Frame4 )
						end
					end
					
					if event.interrupted then
						TopGrid0Frame3( TopGrid0, event )
						return 
					else
						TopGrid0:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						TopGrid0:setAlpha( RandomAddPercent( -10, 0.69 ) )
						TopGrid0:registerEventHandler( "transition_complete_keyframe", TopGrid0Frame3 )
					end
				end
				
				TopGrid0:completeAnimation()
				self.TopGrid0:setAlpha( RandomAddPercent( -10, 0.7 ) )
				TopGrid0Frame2( TopGrid0, {} )
				local TitleBarFrame2 = function ( TitleBar, event )
					if not event.interrupted then
						TitleBar:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					TitleBar:setAlpha( RandomAddPercent( -10, 0.2 ) )
					if event.interrupted then
						self.clipFinished( TitleBar, event )
					else
						TitleBar:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TitleBar:completeAnimation()
				self.TitleBar:setAlpha( RandomAddPercent( -10, 0.2 ) )
				TitleBarFrame2( TitleBar, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

