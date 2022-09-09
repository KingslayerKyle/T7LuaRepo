-- 0e68158f76623c179946a0bc2bbf19b5
-- This hash is used for caching, delete to decompile the file again

local f0_local0 = function ( f1_arg0 )
	f1_arg0:setState( "TakingDamage" )
end

local f0_local1 = function ( f2_arg0 )
	f2_arg0:setState( "DefaultState" )
end

local f0_local2 = function ( f3_arg0 )
	f3_arg0:setState( "Healing" )
end

local f0_local3 = function ( f4_arg0 )
	f4_arg0:setState( "DefaultState" )
end

local PostLoadFunc = function ( f5_arg0 )
	f5_arg0.takingDamageFunction = f0_local0
	f5_arg0.endTakingDamageFunction = f0_local1
	f5_arg0.healingFunction = f0_local2
	f5_arg0.endHealingFunction = f0_local3
end

CoD.baseHealthDamageIconWidget = InheritFrom( LUI.UIElement )
CoD.baseHealthDamageIconWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.baseHealthDamageIconWidget )
	self.id = "baseHealthDamageIconWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local damageIcon = LUI.UIImage.new()
	damageIcon:setLeftRight( true, true, 0, 0 )
	damageIcon:setTopBottom( true, true, 0, 0 )
	damageIcon:setAlpha( 0 )
	damageIcon:setImage( RegisterImage( "uie_t7_hud_beacon_damage" ) )
	self:addElement( damageIcon )
	self.damageIcon = damageIcon
	
	local healingIcon = LUI.UIImage.new()
	healingIcon:setLeftRight( true, true, -3, 3 )
	healingIcon:setTopBottom( true, true, -3, 3 )
	healingIcon:setImage( RegisterImage( "uie_t7_hud_beacon_repair_buddy" ) )
	self:addElement( healingIcon )
	self.healingIcon = healingIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				damageIcon:completeAnimation()
				self.damageIcon:setLeftRight( true, true, 0, 0 )
				self.damageIcon:setTopBottom( true, true, 0, 0 )
				self.damageIcon:setAlpha( 0 )
				self.clipFinished( damageIcon, {} )

				healingIcon:completeAnimation()
				self.healingIcon:setLeftRight( true, true, 0, 0 )
				self.healingIcon:setTopBottom( true, true, 0, 0 )
				self.healingIcon:setAlpha( 0 )
				self.clipFinished( healingIcon, {} )
			end
		},
		TakingDamage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local damageIconFrame2 = function ( damageIcon, event )
					local damageIconFrame3 = function ( damageIcon, event )
						if not event.interrupted then
							damageIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						damageIcon:setLeftRight( true, true, 0, 0 )
						damageIcon:setTopBottom( true, true, 0, 0 )
						damageIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( damageIcon, event )
						else
							damageIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						damageIconFrame3( damageIcon, event )
						return 
					else
						damageIcon:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						damageIcon:setLeftRight( true, true, -3, 3 )
						damageIcon:setTopBottom( true, true, -3, 3 )
						damageIcon:registerEventHandler( "transition_complete_keyframe", damageIconFrame3 )
					end
				end
				
				damageIcon:completeAnimation()
				self.damageIcon:setLeftRight( true, true, 0, 0 )
				self.damageIcon:setTopBottom( true, true, 0, 0 )
				self.damageIcon:setAlpha( 1 )
				damageIconFrame2( damageIcon, {} )

				healingIcon:completeAnimation()
				self.healingIcon:setAlpha( 0 )
				self.clipFinished( healingIcon, {} )

				self.nextClip = "DefaultClip"
			end
		},
		Healing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				damageIcon:completeAnimation()
				self.damageIcon:setAlpha( 0 )
				self.clipFinished( damageIcon, {} )
				local healingIconFrame2 = function ( healingIcon, event )
					local healingIconFrame3 = function ( healingIcon, event )
						if not event.interrupted then
							healingIcon:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						healingIcon:setLeftRight( true, true, 0, 0 )
						healingIcon:setTopBottom( true, true, 0, 0 )
						healingIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( healingIcon, event )
						else
							healingIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						healingIconFrame3( healingIcon, event )
						return 
					else
						healingIcon:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						healingIcon:setLeftRight( true, true, -3, 3 )
						healingIcon:setTopBottom( true, true, -3, 3 )
						healingIcon:registerEventHandler( "transition_complete_keyframe", healingIconFrame3 )
					end
				end
				
				healingIcon:completeAnimation()
				self.healingIcon:setLeftRight( true, true, 0, 0 )
				self.healingIcon:setTopBottom( true, true, 0, 0 )
				self.healingIcon:setAlpha( 1 )
				healingIconFrame2( healingIcon, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
