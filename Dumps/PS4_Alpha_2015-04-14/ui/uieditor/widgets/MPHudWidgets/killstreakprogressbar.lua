require( "ui.uieditor.widgets.MPHudWidgets.KillstreakProgressBarFill" )

function SetProgressBarStencilTopBottom( progressBar, momentumPercentage )
	local minProgress = 12
	local scalableHeight = 114 - minProgress
	local newHeight = -(scalableHeight * momentumPercentage - minProgress) - 24
	progressBar:setTopBottom( false, true, newHeight, 0 )
end

function AnimateProgressBar( progressBar, momentumPercentage )
	if not progressBar.momentumPercentage then
		progressBar.momentumPercentage = 0
	end
	local momentumChange = momentumPercentage - progressBar.momentumPercentage
	if momentumChange < 0 then
		progressBar.percentageTarget = momentumPercentage
		momentumPercentage = 1
		momentumChange = 1 - progressBar.momentumPercentage
	end
	progressBar.momentumPercentage = momentumPercentage
	local animationDuration = 500 * momentumChange
	progressBar:beginAnimation( "update_momentum", animationDuration )
	SetProgressBarStencilTopBottom( progressBar, momentumPercentage )
end

function ProgressBar_TransitionCompleteUpdateMomentum( progressBar )
	local percentageTarget = progressBar.percentageTarget
	if percentageTarget then
		progressBar.percentageTarget = nil
		if percentageTarget < progressBar.momentumPercentage then
			progressBar.momentumPercentage = 0
			progressBar:setTopBottom( false, true, 0, 0 )
		end
		AnimateProgressBar( progressBar, percentageTarget )
	end
end

local PostLoadFunc = function ( self )
	self.killstreakProgressBarFill:registerEventHandler( "transition_complete_update_momentum", ProgressBar_TransitionCompleteUpdateMomentum )
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
	progressBarBackground:setRGB( 1, 1, 1 )
	progressBarBackground:setImage( RegisterImage( "uie_hud_mp_vis_ks_bar_backing" ) )
	progressBarBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( progressBarBackground )
	self.progressBarBackground = progressBarBackground
	
	local progressArrowBar = LUI.UIImage.new()
	progressArrowBar:setLeftRight( false, false, 1, 33 )
	progressArrowBar:setTopBottom( false, false, 18, 50 )
	progressArrowBar:setRGB( 1, 1, 1 )
	progressArrowBar:setImage( RegisterImage( "uie_hud_mp_vis_ks_prog_arrow_back" ) )
	progressArrowBar:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( progressArrowBar )
	self.progressArrowBar = progressArrowBar
	
	local killstreakProgressBarFill = CoD.KillstreakProgressBarFill.new( menu, controller )
	killstreakProgressBarFill:setLeftRight( true, true, 0, 0 )
	killstreakProgressBarFill:setTopBottom( false, true, -128, 0 )
	killstreakProgressBarFill:setRGB( 1, 1, 1 )
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
	self.close = function ( self )
		self.killstreakProgressBarFill:close()
		CoD.KillstreakProgressBar.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

