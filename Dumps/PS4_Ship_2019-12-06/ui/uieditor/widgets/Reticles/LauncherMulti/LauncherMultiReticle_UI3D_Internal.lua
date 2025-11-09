require( "ui.uieditor.widgets.Reticles.BlackCell.Target" )
require( "ui.uieditor.widgets.Reticles.BlackCell.Timer" )
require( "ui.uieditor.widgets.Reticles.BlackCell.TeamMateLockOn" )

CoD.LauncherMultiReticle_UI3D_Internal = InheritFrom( LUI.UIElement )
CoD.LauncherMultiReticle_UI3D_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LauncherMultiReticle_UI3D_Internal )
	self.id = "LauncherMultiReticle_UI3D_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 512 )
	self.anyChildUsesUpdateState = true
	
	local reticle = LUI.UIImage.new()
	reticle:setLeftRight( true, false, 0, 512 )
	reticle:setTopBottom( true, false, 1.37, 513.37 )
	reticle:setRGB( 0.64, 1, 0.81 )
	reticle:setImage( RegisterImage( "uie_mtl_wpn_t7_launch_multi_glass_red" ) )
	self:addElement( reticle )
	self.reticle = reticle
	
	local Target = CoD.Target.new( menu, controller )
	Target:setLeftRight( true, false, 382, 500 )
	Target:setTopBottom( true, false, 257.37, 317.37 )
	Target:setRGB( 0.64, 1, 0.81 )
	Target:setAlpha( 0 )
	Target:setScale( 0.8 )
	self:addElement( Target )
	self.Target = Target
	
	local Timer = CoD.Timer.new( menu, controller )
	Timer:setLeftRight( true, false, 383, 510.6 )
	Timer:setTopBottom( true, false, 198.56, 256.37 )
	Timer:setRGB( 0.64, 1, 0.81 )
	Timer:setAlpha( 0 )
	Timer:setScale( 0.8 )
	self:addElement( Timer )
	self.Timer = Timer
	
	local TeamMateLockOn = CoD.TeamMateLockOn.new( menu, controller )
	TeamMateLockOn:setLeftRight( true, false, 3, 138.58 )
	TeamMateLockOn:setTopBottom( true, false, 204.56, 307.44 )
	TeamMateLockOn:setScale( 0.9 )
	self:addElement( TeamMateLockOn )
	self.TeamMateLockOn = TeamMateLockOn
	
	local reticlelock = LUI.UIImage.new()
	reticlelock:setLeftRight( true, false, 0, 512 )
	reticlelock:setTopBottom( true, false, 1.37, 513.37 )
	reticlelock:setRGB( 1, 0, 0 )
	reticlelock:setAlpha( 0 )
	reticlelock:setImage( RegisterImage( "uie_mtl_wpn_t7_launch_multi_glass" ) )
	self:addElement( reticlelock )
	self.reticlelock = reticlelock
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				reticle:completeAnimation()
				self.reticle:setRGB( 0.64, 1, 0.81 )
				self.reticle:setAlpha( 1 )
				self.clipFinished( reticle, {} )
				Target:completeAnimation()
				self.Target:setRGB( 0.64, 1, 0.81 )
				self.Target:setAlpha( 0 )
				self.clipFinished( Target, {} )
				Timer:completeAnimation()
				self.Timer:setRGB( 0.64, 1, 0.81 )
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )
				TeamMateLockOn:completeAnimation()
				self.TeamMateLockOn:setRGB( 1, 1, 1 )
				self.clipFinished( TeamMateLockOn, {} )
				reticlelock:completeAnimation()
				self.reticlelock:setAlpha( 0 )
				self.clipFinished( reticlelock, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				reticle:completeAnimation()
				self.reticle:setRGB( 1, 0, 0 )
				self.reticle:setAlpha( 0 )
				self.reticle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( reticle, {} )
				Target:completeAnimation()
				self.Target:setRGB( 1, 0, 0 )
				self.Target:setAlpha( 0 )
				self.clipFinished( Target, {} )
				Timer:completeAnimation()
				self.Timer:setRGB( 1, 0, 0 )
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )
				reticlelock:completeAnimation()
				self.reticlelock:setRGB( 1, 0, 0 )
				self.reticlelock:setAlpha( 1 )
				self.clipFinished( reticlelock, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Target:close()
		element.Timer:close()
		element.TeamMateLockOn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

