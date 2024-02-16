-- 05f057822b4d5c28e1c1a585056f4256
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.MP.BowLauncherReticle_Shader" )
require( "ui.uieditor.widgets.Reticles.MP.BowLauncherReticle_L1" )
require( "ui.uieditor.widgets.Reticles.MP.BowLauncherReticle_L2" )
require( "ui.uieditor.widgets.Reticles.MP.BowLauncherReticle_L3" )
require( "ui.uieditor.widgets.Reticles.MP.BowLauncherReticle_L4" )
require( "ui.uieditor.widgets.Reticles.MP.BowLauncherReticle_Dot" )

CoD.BowLauncherReticle_Internal = InheritFrom( LUI.UIElement )
CoD.BowLauncherReticle_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BowLauncherReticle_Internal )
	self.id = "BowLauncherReticle_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 100 )
	self.anyChildUsesUpdateState = true
	
	local reticle = CoD.BowLauncherReticle_Shader.new( menu, controller )
	reticle:setLeftRight( false, false, -50, 50 )
	reticle:setTopBottom( false, false, -50, 50 )
	reticle.shader:setShaderVector( 0, 1.5, 10, 0, 0 )
	reticle.shader:setShaderVector( 1, 100, 100, 0, 0 )
	reticle.shader:setShaderVector( 2, 0.04, 0.03, 0.01, 0 )
	reticle.shader:setShaderVector( 3, 2, 30, 80, 0 )
	self:addElement( reticle )
	self.reticle = reticle
	
	local BowLauncherReticleL1 = CoD.BowLauncherReticle_L1.new( menu, controller )
	BowLauncherReticleL1:setLeftRight( false, false, -6, 6 )
	BowLauncherReticleL1:setTopBottom( false, false, 5, 11 )
	BowLauncherReticleL1:mergeStateConditions( {
		{
			stateName = "Drawn",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.currentShotCharge", 1 )
			end
		}
	} )
	BowLauncherReticleL1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.currentShotCharge" ), function ( model )
		menu:updateElementState( BowLauncherReticleL1, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.currentShotCharge"
		} )
	end )
	self:addElement( BowLauncherReticleL1 )
	self.BowLauncherReticleL1 = BowLauncherReticleL1
	
	local BowLauncherReticleL2 = CoD.BowLauncherReticle_L2.new( menu, controller )
	BowLauncherReticleL2:setLeftRight( false, false, -6, 6 )
	BowLauncherReticleL2:setTopBottom( false, false, 13, 19 )
	BowLauncherReticleL2:mergeStateConditions( {
		{
			stateName = "Drawn",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.currentShotCharge", 0.65 )
			end
		}
	} )
	BowLauncherReticleL2:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.currentShotCharge" ), function ( model )
		menu:updateElementState( BowLauncherReticleL2, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.currentShotCharge"
		} )
	end )
	self:addElement( BowLauncherReticleL2 )
	self.BowLauncherReticleL2 = BowLauncherReticleL2
	
	local BowLauncherReticleL3 = CoD.BowLauncherReticle_L3.new( menu, controller )
	BowLauncherReticleL3:setLeftRight( false, false, -6, 6 )
	BowLauncherReticleL3:setTopBottom( false, false, 21, 27 )
	BowLauncherReticleL3:mergeStateConditions( {
		{
			stateName = "Drawn",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.currentShotCharge", 0.4 )
			end
		}
	} )
	BowLauncherReticleL3:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.currentShotCharge" ), function ( model )
		menu:updateElementState( BowLauncherReticleL3, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.currentShotCharge"
		} )
	end )
	self:addElement( BowLauncherReticleL3 )
	self.BowLauncherReticleL3 = BowLauncherReticleL3
	
	local BowLauncherReticleL4 = CoD.BowLauncherReticle_L4.new( menu, controller )
	BowLauncherReticleL4:setLeftRight( false, false, -6, 6 )
	BowLauncherReticleL4:setTopBottom( false, false, 29, 35 )
	BowLauncherReticleL4:mergeStateConditions( {
		{
			stateName = "Drawn",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThanOrEqualTo( controller, "currentWeapon.currentShotCharge", 0.2 )
			end
		}
	} )
	BowLauncherReticleL4:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.currentShotCharge" ), function ( model )
		menu:updateElementState( BowLauncherReticleL4, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.currentShotCharge"
		} )
	end )
	self:addElement( BowLauncherReticleL4 )
	self.BowLauncherReticleL4 = BowLauncherReticleL4
	
	local BowLauncherReticleDot = CoD.BowLauncherReticle_Dot.new( menu, controller )
	BowLauncherReticleDot:setLeftRight( false, false, -2, 2 )
	BowLauncherReticleDot:setTopBottom( false, false, -2, 2 )
	self:addElement( BowLauncherReticleDot )
	self.BowLauncherReticleDot = BowLauncherReticleDot
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				local reticleFrame2 = function ( reticle, event )
					local reticleFrame3 = function ( reticle, event )
						local reticleFrame4 = function ( reticle, event )
							if not event.interrupted then
								reticle:beginAnimation( "keyframe", 140, true, false, CoD.TweenType.Back )
								reticle.shader:beginAnimation( "subkeyframe", 140, true, false, CoD.TweenType.Back )
							end
							reticle:setLeftRight( false, false, -50, 50 )
							reticle:setTopBottom( false, false, -50, 50 )
							reticle:setAlpha( 1 )
							reticle.shader:setShaderVector( 3, 0, 30, 80, 0 )
							if event.interrupted then
								self.clipFinished( reticle, event )
							else
								reticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							reticleFrame4( reticle, event )
							return 
						else
							reticle:beginAnimation( "keyframe", 139, false, false, CoD.TweenType.Linear )
							reticle:setLeftRight( false, false, -90, 90 )
							reticle:registerEventHandler( "transition_complete_keyframe", reticleFrame4 )
						end
					end
					
					if event.interrupted then
						reticleFrame3( reticle, event )
						return 
					else
						reticle:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
						reticle:setLeftRight( false, false, -63.33, 63.33 )
						reticle:setAlpha( 1 )
						reticle:registerEventHandler( "transition_complete_keyframe", reticleFrame3 )
					end
				end
				
				reticle:completeAnimation()

				reticle.shader:completeAnimation()
				self.reticle:setLeftRight( false, false, -50, 50 )
				self.reticle:setTopBottom( false, false, -50, 50 )
				self.reticle:setAlpha( 0 )
				self.reticle.shader:setShaderVector( 3, 0, 30, 80, 0 )
				reticleFrame2( reticle, {} )
				local BowLauncherReticleL1Frame2 = function ( BowLauncherReticleL1, event )
					local BowLauncherReticleL1Frame3 = function ( BowLauncherReticleL1, event )
						if not event.interrupted then
							BowLauncherReticleL1:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
						end
						BowLauncherReticleL1:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( BowLauncherReticleL1, event )
						else
							BowLauncherReticleL1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BowLauncherReticleL1Frame3( BowLauncherReticleL1, event )
						return 
					else
						BowLauncherReticleL1:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
						BowLauncherReticleL1:registerEventHandler( "transition_complete_keyframe", BowLauncherReticleL1Frame3 )
					end
				end
				
				BowLauncherReticleL1:completeAnimation()
				self.BowLauncherReticleL1:setAlpha( 0 )
				BowLauncherReticleL1Frame2( BowLauncherReticleL1, {} )
				local f10_local2 = function ( f16_arg0, f16_arg1 )
					if not f16_arg1.interrupted then
						f16_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					f16_arg0:setAlpha( 1 )
					if f16_arg1.interrupted then
						self.clipFinished( f16_arg0, f16_arg1 )
					else
						f16_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BowLauncherReticleL2:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Linear )
				BowLauncherReticleL2:setAlpha( 0 )
				BowLauncherReticleL2:registerEventHandler( "transition_complete_keyframe", f10_local2 )
				local f10_local3 = function ( f17_arg0, f17_arg1 )
					if not f17_arg1.interrupted then
						f17_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					f17_arg0:setAlpha( 1 )
					if f17_arg1.interrupted then
						self.clipFinished( f17_arg0, f17_arg1 )
					else
						f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BowLauncherReticleL3:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				BowLauncherReticleL3:setAlpha( 0 )
				BowLauncherReticleL3:registerEventHandler( "transition_complete_keyframe", f10_local3 )
				local f10_local4 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
					end
					f18_arg0:setAlpha( 1 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BowLauncherReticleL4:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				BowLauncherReticleL4:setAlpha( 0 )
				BowLauncherReticleL4:registerEventHandler( "transition_complete_keyframe", f10_local4 )
				local f10_local5 = function ( f19_arg0, f19_arg1 )
					if not f19_arg1.interrupted then
						f19_arg0:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
					end
					f19_arg0:setAlpha( 1 )
					if f19_arg1.interrupted then
						self.clipFinished( f19_arg0, f19_arg1 )
					else
						f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BowLauncherReticleDot:beginAnimation( "keyframe", 39, false, false, CoD.TweenType.Linear )
				BowLauncherReticleDot:setAlpha( 0 )
				BowLauncherReticleDot:registerEventHandler( "transition_complete_keyframe", f10_local5 )
			end,
			Drawing = function ()
				self:setupElementClipCounter( 1 )

				local reticleFrame2 = function ( reticle, event )
					if not event.interrupted then
						reticle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						reticle.shader:beginAnimation( "subkeyframe", 300, false, false, CoD.TweenType.Linear )
					end
					reticle:setAlpha( 1 )
					reticle.shader:setShaderVector( 3, 1, 30, 80, 0 )
					if event.interrupted then
						self.clipFinished( reticle, event )
					else
						reticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				reticle:completeAnimation()

				reticle.shader:completeAnimation()
				self.reticle:setAlpha( 1 )
				self.reticle.shader:setShaderVector( 3, 0, 30, 80, 0 )
				reticleFrame2( reticle, {} )
			end
		},
		Drawing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				reticle:completeAnimation()

				reticle.shader:completeAnimation()
				self.reticle:setAlpha( 0.4 )
				self.reticle.shader:setShaderVector( 3, 1, 30, 80, 0 )
				self.clipFinished( reticle, {} )
			end,
			StartupComplete = function ()
				self:setupElementClipCounter( 1 )

				reticle:completeAnimation()

				reticle.shader:completeAnimation()
				self.reticle:setAlpha( 1 )
				self.reticle.shader:setShaderVector( 3, 0, 30, 80, 0 )
				self.clipFinished( reticle, {} )
			end
		},
		StartupComplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				reticle:completeAnimation()

				reticle.shader:completeAnimation()
				self.reticle:setAlpha( 1 )
				self.reticle.shader:setShaderVector( 3, 0, 30, 80, 0 )
				self.clipFinished( reticle, {} )

				BowLauncherReticleL1:completeAnimation()
				self.BowLauncherReticleL1:setAlpha( 1 )
				self.clipFinished( BowLauncherReticleL1, {} )

				BowLauncherReticleL2:completeAnimation()
				self.BowLauncherReticleL2:setAlpha( 1 )
				self.clipFinished( BowLauncherReticleL2, {} )

				BowLauncherReticleL3:completeAnimation()
				self.BowLauncherReticleL3:setAlpha( 1 )
				self.clipFinished( BowLauncherReticleL3, {} )

				BowLauncherReticleL4:completeAnimation()
				self.BowLauncherReticleL4:setAlpha( 1 )
				self.clipFinished( BowLauncherReticleL4, {} )

				BowLauncherReticleDot:completeAnimation()
				self.BowLauncherReticleDot:setAlpha( 1 )
				self.clipFinished( BowLauncherReticleDot, {} )
			end,
			Drawing = function ()
				self:setupElementClipCounter( 1 )

				local reticleFrame2 = function ( reticle, event )
					if not event.interrupted then
						reticle:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						reticle.shader:beginAnimation( "subkeyframe", 300, false, false, CoD.TweenType.Linear )
					end
					reticle:setAlpha( 0.4 )
					reticle.shader:setShaderVector( 3, 1, 30, 80, 0 )
					if event.interrupted then
						self.clipFinished( reticle, event )
					else
						reticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				reticle:completeAnimation()

				reticle.shader:completeAnimation()
				self.reticle:setAlpha( 1 )
				self.reticle.shader:setShaderVector( 3, 0, 30, 80, 0 )
				reticleFrame2( reticle, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Drawing",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "currentWeapon.currentShotCharge", 0 )
			end
		},
		{
			stateName = "StartupComplete",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "startupComplete" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.currentShotCharge" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "currentWeapon.currentShotCharge"
		} )
	end )

	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		SetProperty( self, "startupComplete", true )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.reticle:close()
		element.BowLauncherReticleL1:close()
		element.BowLauncherReticleL2:close()
		element.BowLauncherReticleL3:close()
		element.BowLauncherReticleL4:close()
		element.BowLauncherReticleDot:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
