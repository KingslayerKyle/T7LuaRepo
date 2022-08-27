-- dd6da6edc0f944143e9e251b967da771
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_BracketBlur = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_BracketBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_BracketBlur )
	self.id = "AbilityWheel_BracketBlur"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 819 )
	self:setTopBottom( true, false, 0, 613 )
	
	local B1 = LUI.UIImage.new()
	B1:setLeftRight( false, false, -174.25, 174.35 )
	B1:setTopBottom( false, false, -306.33, -207.67 )
	B1:setAlpha( RandomAddPercent( -10, 0.99 ) )
	B1:setZoom( 257 )
	B1:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_bracketblur" ) )
	B1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( B1 )
	self.B1 = B1
	
	local B4 = LUI.UIImage.new()
	B4:setLeftRight( false, false, -174.25, 174.35 )
	B4:setTopBottom( false, false, 207.67, 306.33 )
	B4:setAlpha( RandomAddPercent( -10, 0.99 ) )
	B4:setXRot( -180 )
	B4:setZoom( 257 )
	B4:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_bracketblur" ) )
	B4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( B4 )
	self.B4 = B4
	
	local B2 = LUI.UIImage.new()
	B2:setLeftRight( false, false, 61.05, 409.65 )
	B2:setTopBottom( false, false, -173, -74.34 )
	B2:setAlpha( RandomAddPercent( -10, 0.99 ) )
	B2:setZRot( -60 )
	B2:setZoom( 257 )
	B2:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_bracketblur" ) )
	B2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( B2 )
	self.B2 = B2
	
	local B3 = LUI.UIImage.new()
	B3:setLeftRight( false, false, 61.05, 409.65 )
	B3:setTopBottom( false, false, 78.01, 176.67 )
	B3:setAlpha( RandomAddPercent( -10, 0.99 ) )
	B3:setZRot( -120 )
	B3:setZoom( 257 )
	B3:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_bracketblur" ) )
	B3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( B3 )
	self.B3 = B3
	
	local B6 = LUI.UIImage.new()
	B6:setLeftRight( false, false, -409.65, -61.05 )
	B6:setTopBottom( false, false, -173, -74.34 )
	B6:setAlpha( RandomAddPercent( -10, 0.99 ) )
	B6:setYRot( 180 )
	B6:setZRot( -60 )
	B6:setZoom( 257 )
	B6:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_bracketblur" ) )
	B6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( B6 )
	self.B6 = B6
	
	local B5 = LUI.UIImage.new()
	B5:setLeftRight( false, false, -409.65, -61.05 )
	B5:setTopBottom( false, false, 78.01, 176.67 )
	B5:setAlpha( RandomAddPercent( -10, 0.99 ) )
	B5:setYRot( -180 )
	B5:setZRot( -120 )
	B5:setZoom( 257 )
	B5:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_bracketblur" ) )
	B5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( B5 )
	self.B5 = B5
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				local B1Frame2 = function ( B1, event )
					if not event.interrupted then
						B1:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					B1:setAlpha( RandomAddPercent( -10, 0.99 ) )
					if event.interrupted then
						self.clipFinished( B1, event )
					else
						B1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				B1:completeAnimation()
				self.B1:setAlpha( RandomAddPercent( -10, 1 ) )
				B1Frame2( B1, {} )
				local B4Frame2 = function ( B4, event )
					if not event.interrupted then
						B4:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					B4:setAlpha( RandomAddPercent( -10, 0.99 ) )
					if event.interrupted then
						self.clipFinished( B4, event )
					else
						B4:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				B4:completeAnimation()
				self.B4:setAlpha( RandomAddPercent( -10, 1 ) )
				B4Frame2( B4, {} )
				local B2Frame2 = function ( B2, event )
					if not event.interrupted then
						B2:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					B2:setAlpha( RandomAddPercent( -10, 0.99 ) )
					if event.interrupted then
						self.clipFinished( B2, event )
					else
						B2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				B2:completeAnimation()
				self.B2:setAlpha( RandomAddPercent( -10, 1 ) )
				B2Frame2( B2, {} )
				local B3Frame2 = function ( B3, event )
					if not event.interrupted then
						B3:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					B3:setAlpha( RandomAddPercent( -10, 0.99 ) )
					if event.interrupted then
						self.clipFinished( B3, event )
					else
						B3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				B3:completeAnimation()
				self.B3:setAlpha( RandomAddPercent( -10, 1 ) )
				B3Frame2( B3, {} )
				local B6Frame2 = function ( B6, event )
					if not event.interrupted then
						B6:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					B6:setAlpha( RandomAddPercent( -10, 0.99 ) )
					if event.interrupted then
						self.clipFinished( B6, event )
					else
						B6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				B6:completeAnimation()
				self.B6:setAlpha( RandomAddPercent( -10, 1 ) )
				B6Frame2( B6, {} )
				local B5Frame2 = function ( B5, event )
					if not event.interrupted then
						B5:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
					end
					B5:setAlpha( RandomAddPercent( -10, 0.99 ) )
					if event.interrupted then
						self.clipFinished( B5, event )
					else
						B5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				B5:completeAnimation()
				self.B5:setAlpha( RandomAddPercent( -10, 1 ) )
				B5Frame2( B5, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

