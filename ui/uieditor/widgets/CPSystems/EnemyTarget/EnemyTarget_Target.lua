-- 88bab7e83a7e2d75234dc52f1e3e63cc
-- This hash is used for caching, delete to decompile the file again

CoD.EnemyTarget_Target = InheritFrom( LUI.UIElement )
CoD.EnemyTarget_Target.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.EnemyTarget_Target )
	self.id = "EnemyTarget_Target"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 136 )
	self:setTopBottom( true, false, 0, 112 )
	
	local Target0 = LUI.UIImage.new()
	Target0:setLeftRight( false, false, -68, 68 )
	Target0:setTopBottom( false, false, -56, 56 )
	Target0:setAlpha( RandomAddPercent( -40, 1 ) )
	Target0:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_target" ) )
	Target0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Target0 )
	self.Target0 = Target0
	
	local Target00 = LUI.UIImage.new()
	Target00:setLeftRight( false, false, -68, 68 )
	Target00:setTopBottom( false, false, -56, 56 )
	Target00:setAlpha( 0.39 )
	Target00:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_target" ) )
	Target00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Target00 )
	self.Target00 = Target00
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local Target0Frame2 = function ( Target0, event )
					if not event.interrupted then
						Target0:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Target0:setAlpha( RandomAddPercent( -40, 0.99 ) )
					if event.interrupted then
						self.clipFinished( Target0, event )
					else
						Target0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Target0:completeAnimation()
				self.Target0:setAlpha( RandomAddPercent( -40, 1 ) )
				Target0Frame2( Target0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
