-- 41113f4fe4e28b704ab23fdceaae3762
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargeShot_OuterReticle" )

CoD.ChargerShot_4corner_Bracket = InheritFrom( LUI.UIElement )
CoD.ChargerShot_4corner_Bracket.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChargerShot_4corner_Bracket )
	self.id = "ChargerShot_4corner_Bracket"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 414 )
	self:setTopBottom( true, false, 0, 401 )
	
	local ChargeShotOuterReticle0 = CoD.ChargeShot_OuterReticle.new( menu, controller )
	ChargeShotOuterReticle0:setLeftRight( true, true, 247, -0.12 )
	ChargeShotOuterReticle0:setTopBottom( true, true, 0.17, -233.94 )
	self:addElement( ChargeShotOuterReticle0 )
	self.ChargeShotOuterReticle0 = ChargeShotOuterReticle0
	
	local ChargeShotOuterReticle1 = CoD.ChargeShot_OuterReticle.new( menu, controller )
	ChargeShotOuterReticle1:setLeftRight( true, true, 0.12, -247 )
	ChargeShotOuterReticle1:setTopBottom( true, true, 0.17, -233.94 )
	ChargeShotOuterReticle1:setYRot( 180 )
	self:addElement( ChargeShotOuterReticle1 )
	self.ChargeShotOuterReticle1 = ChargeShotOuterReticle1
	
	local ChargeShotOuterReticle2 = CoD.ChargeShot_OuterReticle.new( menu, controller )
	ChargeShotOuterReticle2:setLeftRight( true, true, 0.12, -247 )
	ChargeShotOuterReticle2:setTopBottom( true, true, 233.94, -0.17 )
	ChargeShotOuterReticle2:setZRot( -180 )
	self:addElement( ChargeShotOuterReticle2 )
	self.ChargeShotOuterReticle2 = ChargeShotOuterReticle2
	
	local ChargeShotOuterReticle3 = CoD.ChargeShot_OuterReticle.new( menu, controller )
	ChargeShotOuterReticle3:setLeftRight( true, true, 247, -0.12 )
	ChargeShotOuterReticle3:setTopBottom( true, true, 233.94, -0.17 )
	ChargeShotOuterReticle3:setYRot( 180 )
	ChargeShotOuterReticle3:setZRot( -180 )
	self:addElement( ChargeShotOuterReticle3 )
	self.ChargeShotOuterReticle3 = ChargeShotOuterReticle3
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				ChargeShotOuterReticle0:completeAnimation()
				self.ChargeShotOuterReticle0:setAlpha( 1 )
				self.clipFinished( ChargeShotOuterReticle0, {} )

				ChargeShotOuterReticle1:completeAnimation()
				self.ChargeShotOuterReticle1:setAlpha( 1 )
				self.clipFinished( ChargeShotOuterReticle1, {} )

				ChargeShotOuterReticle3:completeAnimation()
				self.ChargeShotOuterReticle3:setAlpha( 1 )
				self.clipFinished( ChargeShotOuterReticle3, {} )
			end,
			Fire = function ()
				self:setupElementClipCounter( 4 )

				local ChargeShotOuterReticle0Frame2 = function ( ChargeShotOuterReticle0, event )
					if not event.interrupted then
						ChargeShotOuterReticle0:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					ChargeShotOuterReticle0:setLeftRight( false, false, 26.2, 147.71 )
					ChargeShotOuterReticle0:setTopBottom( false, false, -141.5, -19.98 )
					ChargeShotOuterReticle0:setScale( 1 )
					if event.interrupted then
						self.clipFinished( ChargeShotOuterReticle0, event )
					else
						ChargeShotOuterReticle0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChargeShotOuterReticle0:completeAnimation()
				self.ChargeShotOuterReticle0:setLeftRight( false, false, 26.2, 147.71 )
				self.ChargeShotOuterReticle0:setTopBottom( false, false, -141.5, -19.98 )
				self.ChargeShotOuterReticle0:setScale( 1 )
				ChargeShotOuterReticle0Frame2( ChargeShotOuterReticle0, {} )
				ChargeShotOuterReticle1:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				ChargeShotOuterReticle1:setLeftRight( false, false, -148.29, -26.77 )
				ChargeShotOuterReticle1:setTopBottom( false, false, -141.5, -19.98 )
				ChargeShotOuterReticle1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				ChargeShotOuterReticle2:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				ChargeShotOuterReticle2:setLeftRight( false, false, -148.29, -26.77 )
				ChargeShotOuterReticle2:setTopBottom( false, false, 24.22, 145.74 )
				ChargeShotOuterReticle2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local f3_local1 = function ( f5_arg0, f5_arg1 )
					if not f5_arg1.interrupted then
						f5_arg0:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
					end
					f5_arg0:setLeftRight( false, false, 26.2, 147.71 )
					f5_arg0:setTopBottom( false, false, 24.22, 145.74 )
					f5_arg0:setXRot( 0 )
					if f5_arg1.interrupted then
						self.clipFinished( f5_arg0, f5_arg1 )
					else
						f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChargeShotOuterReticle3:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				ChargeShotOuterReticle3:setLeftRight( false, false, 26.2, 147.71 )
				ChargeShotOuterReticle3:setTopBottom( false, false, 24.22, 145.74 )
				ChargeShotOuterReticle3:setXRot( 0 )
				ChargeShotOuterReticle3:registerEventHandler( "transition_complete_keyframe", f3_local1 )
			end,
			Cancel = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChargeShotOuterReticle0:close()
		element.ChargeShotOuterReticle1:close()
		element.ChargeShotOuterReticle2:close()
		element.ChargeShotOuterReticle3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

