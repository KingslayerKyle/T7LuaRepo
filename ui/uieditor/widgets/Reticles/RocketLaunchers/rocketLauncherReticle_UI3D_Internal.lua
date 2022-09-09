-- 83c8b3c25c40dd591e16c78ddfe4b34c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.BlackCell.Target" )
require( "ui.uieditor.widgets.Reticles.BlackCell.Timer" )
require( "ui.uieditor.widgets.Reticles.BlackCell.TeamMateLockOn" )

CoD.rocketLauncherReticle_UI3D_Internal = InheritFrom( LUI.UIElement )
CoD.rocketLauncherReticle_UI3D_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.rocketLauncherReticle_UI3D_Internal )
	self.id = "rocketLauncherReticle_UI3D_Internal"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 512 )
	self:setTopBottom( true, false, 0, 512 )
	self.anyChildUsesUpdateState = true
	
	local GreenBacking = LUI.UIImage.new()
	GreenBacking:setLeftRight( true, false, 0, 506 )
	GreenBacking:setTopBottom( true, false, 67.18, 444.82 )
	GreenBacking:setRGB( 0.64, 1, 0.81 )
	GreenBacking:setAlpha( 0.45 )
	GreenBacking:setImage( RegisterImage( "uie_t7_hud_launcher_mainreticlebacking" ) )
	self:addElement( GreenBacking )
	self.GreenBacking = GreenBacking
	
	local reticle = LUI.UIImage.new()
	reticle:setLeftRight( true, false, 8, 508 )
	reticle:setTopBottom( true, false, 60.18, 432.82 )
	reticle:setRGB( 0.64, 1, 0.81 )
	reticle:setImage( RegisterImage( "uie_t7_hud_launcher_mainreticle" ) )
	self:addElement( reticle )
	self.reticle = reticle
	
	local Target = CoD.Target.new( menu, controller )
	Target:setLeftRight( true, false, 382, 500 )
	Target:setTopBottom( true, false, 257.37, 317.37 )
	Target:setRGB( 0.64, 1, 0.81 )
	Target:setScale( 0.8 )
	self:addElement( Target )
	self.Target = Target
	
	local Timer = CoD.Timer.new( menu, controller )
	Timer:setLeftRight( true, false, 383, 510.6 )
	Timer:setTopBottom( true, false, 198.56, 256.37 )
	Timer:setRGB( 0.64, 1, 0.81 )
	Timer:setScale( 0.8 )
	self:addElement( Timer )
	self.Timer = Timer
	
	local TeamMateLockOn = CoD.TeamMateLockOn.new( menu, controller )
	TeamMateLockOn:setLeftRight( true, false, 3, 138.58 )
	TeamMateLockOn:setTopBottom( true, false, 204.56, 307.44 )
	TeamMateLockOn:setScale( 0.9 )
	self:addElement( TeamMateLockOn )
	self.TeamMateLockOn = TeamMateLockOn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				GreenBacking:completeAnimation()
				self.GreenBacking:setRGB( 0.64, 1, 0.81 )
				self.clipFinished( GreenBacking, {} )

				reticle:completeAnimation()
				self.reticle:setRGB( 0.64, 1, 0.81 )
				self.clipFinished( reticle, {} )

				Target:completeAnimation()
				self.Target:setRGB( 0.64, 1, 0.81 )
				self.clipFinished( Target, {} )

				Timer:completeAnimation()
				self.Timer:setRGB( 0.64, 1, 0.81 )
				self.clipFinished( Timer, {} )

				TeamMateLockOn:completeAnimation()
				self.TeamMateLockOn:setRGB( 1, 1, 1 )
				self.clipFinished( TeamMateLockOn, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				GreenBacking:completeAnimation()
				self.GreenBacking:setRGB( 1, 0, 0 )
				self.clipFinished( GreenBacking, {} )

				reticle:completeAnimation()
				self.reticle:setRGB( 1, 0, 0 )
				self.reticle:setAlpha( 1 )
				self.reticle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( reticle, {} )

				Target:completeAnimation()
				self.Target:setRGB( 1, 0, 0 )
				self.clipFinished( Target, {} )

				Timer:completeAnimation()
				self.Timer:setRGB( 1, 0, 0 )
				self.clipFinished( Timer, {} )
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
