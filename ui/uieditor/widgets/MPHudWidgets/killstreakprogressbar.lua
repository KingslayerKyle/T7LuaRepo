-- f7924304d027e19ac86885520ea884f3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.KillstreakProgressBarFill" )

function SetProgressBarStencilTopBottom( f1_arg0, f1_arg1 )
	local f1_local0 = 12
	f1_arg0:setTopBottom( false, true, -((114 - f1_local0) * f1_arg1 - f1_local0) - 24, 0 )
end

function AnimateProgressBar( f2_arg0, f2_arg1 )
	if not f2_arg0.momentumPercentage then
		f2_arg0.momentumPercentage = 0
	end
	local f2_local0 = f2_arg1 - f2_arg0.momentumPercentage
	if f2_local0 < 0 then
		f2_arg0.percentageTarget = f2_arg1
		f2_arg1 = 1
		f2_local0 = 1 - f2_arg0.momentumPercentage
	end
	f2_arg0.momentumPercentage = f2_arg1
	f2_arg0:beginAnimation( "update_momentum", 500 * f2_local0 )
	SetProgressBarStencilTopBottom( f2_arg0, f2_arg1 )
end

function ProgressBar_TransitionCompleteUpdateMomentum( f3_arg0 )
	local f3_local0 = f3_arg0.percentageTarget
	if f3_local0 then
		f3_arg0.percentageTarget = nil
		if f3_local0 < f3_arg0.momentumPercentage then
			f3_arg0.momentumPercentage = 0
			f3_arg0:setTopBottom( false, true, 0, 0 )
		end
		AnimateProgressBar( f3_arg0, f3_local0 )
	end
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.killstreakProgressBarFill:registerEventHandler( "transition_complete_update_momentum", ProgressBar_TransitionCompleteUpdateMomentum )
end

CoD.KillstreakProgressBar = InheritFrom( LUI.UIElement )
CoD.KillstreakProgressBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.KillstreakProgressBar )
	self.id = "KillstreakProgressBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 128 )
	
	local progressBarBackground = LUI.UIImage.new()
	progressBarBackground:setLeftRight( true, true, 0, 0 )
	progressBarBackground:setTopBottom( true, true, 0, 0 )
	progressBarBackground:setImage( RegisterImage( "uie_hud_mp_vis_ks_bar_backing" ) )
	self:addElement( progressBarBackground )
	self.progressBarBackground = progressBarBackground
	
	local progressArrowBar = LUI.UIImage.new()
	progressArrowBar:setLeftRight( false, false, 1, 33 )
	progressArrowBar:setTopBottom( false, false, 18, 50 )
	progressArrowBar:setImage( RegisterImage( "uie_hud_mp_vis_ks_prog_arrow_back" ) )
	self:addElement( progressArrowBar )
	self.progressArrowBar = progressArrowBar
	
	local killstreakProgressBarFill = CoD.KillstreakProgressBarFill.new( menu, controller )
	killstreakProgressBarFill:setLeftRight( true, true, 0, 0 )
	killstreakProgressBarFill:setTopBottom( false, true, -128, 0 )
	self:addElement( killstreakProgressBarFill )
	self.killstreakProgressBarFill = killstreakProgressBarFill
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				progressBarBackground:completeAnimation()
				self.progressBarBackground:setRGB( 1, 1, 1 )
				self.progressBarBackground:setAlpha( 1 )
				self.clipFinished( progressBarBackground, {} )

				progressArrowBar:completeAnimation()
				self.progressArrowBar:setLeftRight( false, false, 0, 32 )
				self.progressArrowBar:setTopBottom( false, false, 18, 50 )
				self.progressArrowBar:setAlpha( 1 )
				self.clipFinished( progressArrowBar, {} )

				killstreakProgressBarFill:completeAnimation()
				self.killstreakProgressBarFill:setAlpha( 1 )
				self.clipFinished( killstreakProgressBarFill, {} )
			end,
			Reward2 = function ()
				self:setupElementClipCounter( 1 )

				progressArrowBar:completeAnimation()
				self.progressArrowBar:setLeftRight( false, false, 6, 38 )
				self.progressArrowBar:setTopBottom( false, false, -13, 19 )
				self.clipFinished( progressArrowBar, {} )
			end,
			Reward1 = function ()
				self:setupElementClipCounter( 1 )

				progressArrowBar:completeAnimation()
				self.progressArrowBar:setLeftRight( false, false, 12, 44 )
				self.progressArrowBar:setTopBottom( false, false, -54, -22 )
				self.clipFinished( progressArrowBar, {} )
			end,
			Reward3 = function ()
				self:setupElementClipCounter( 1 )

				progressArrowBar:completeAnimation()
				self.progressArrowBar:setLeftRight( false, false, 1, 33 )
				self.progressArrowBar:setTopBottom( false, false, 18, 50 )
				self.clipFinished( progressArrowBar, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				progressBarBackground:completeAnimation()
				self.progressBarBackground:setRGB( 1, 1, 1 )
				self.progressBarBackground:setAlpha( 0 )
				self.clipFinished( progressBarBackground, {} )

				progressArrowBar:completeAnimation()
				self.progressArrowBar:setAlpha( 0 )
				self.clipFinished( progressArrowBar, {} )

				killstreakProgressBarFill:completeAnimation()
				self.killstreakProgressBarFill:setAlpha( 0 )
				self.clipFinished( killstreakProgressBarFill, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				progressBarBackground:completeAnimation()
				self.progressBarBackground:setAlpha( 1 )
				self.clipFinished( progressBarBackground, {} )

				progressArrowBar:completeAnimation()
				self.progressArrowBar:setAlpha( 1 )
				self.clipFinished( progressArrowBar, {} )

				killstreakProgressBarFill:completeAnimation()
				self.killstreakProgressBarFill:setAlpha( 1 )
				self.clipFinished( killstreakProgressBarFill, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.killstreakProgressBarFill:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

