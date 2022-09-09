-- e5b79ca68a7db6fc183ea1bfa3918d71
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelCircleInternal" )
require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSimProgressWidget" )
require( "ui.uieditor.widgets.HUD.ZM_Notif.ZmNotif1_CursorHint" )

CoD.TrialWidget_Genesis = InheritFrom( LUI.UIElement )
CoD.TrialWidget_Genesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.TrialWidget_Genesis )
	self.id = "TrialWidget_Genesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 112 )
	self:setTopBottom( true, false, 0, 132 )
	self.anyChildUsesUpdateState = true
	
	local ScoreInfoPanelCircleInternal = CoD.ScoreInfo_PanelCircleInternal.new( menu, controller )
	ScoreInfoPanelCircleInternal:setLeftRight( false, false, -44, 44 )
	ScoreInfoPanelCircleInternal:setTopBottom( true, false, 12, 100 )
	ScoreInfoPanelCircleInternal:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	ScoreInfoPanelCircleInternal:setShaderVector( 0, 3, 3, 0, 0 )
	self:addElement( ScoreInfoPanelCircleInternal )
	self.ScoreInfoPanelCircleInternal = ScoreInfoPanelCircleInternal
	
	local whiteCircle = LUI.UIImage.new()
	whiteCircle:setLeftRight( false, false, -37, 37 )
	whiteCircle:setTopBottom( true, false, 20, 94 )
	whiteCircle:setAlpha( 0.25 )
	whiteCircle:setImage( RegisterImage( "uie_t7_core_hud_scorewidget_panelcircle" ) )
	self:addElement( whiteCircle )
	self.whiteCircle = whiteCircle
	
	local CompleteImage = LUI.UIImage.new()
	CompleteImage:setLeftRight( false, false, -36.5, 38.5 )
	CompleteImage:setTopBottom( true, false, 18.5, 93.5 )
	CompleteImage:setScale( 1.4 )
	CompleteImage:setImage( RegisterImage( "uie_t7_icon_zm_dlc_trials_active" ) )
	self:addElement( CompleteImage )
	self.CompleteImage = CompleteImage
	
	local InProgressImage = LUI.UIImage.new()
	InProgressImage:setLeftRight( false, false, -35.5, 39.5 )
	InProgressImage:setTopBottom( true, false, 18.5, 93.5 )
	InProgressImage:setScale( 1.4 )
	InProgressImage:setImage( RegisterImage( "uie_t7_icon_zm_dlc_trials" ) )
	self:addElement( InProgressImage )
	self.InProgressImage = InProgressImage
	
	local ProgressWidget = CoD.CPTrainingSimProgressWidget.new( menu, controller )
	ProgressWidget:setLeftRight( false, false, -56, 56 )
	ProgressWidget:setTopBottom( true, false, 0, 112 )
	ProgressWidget.progressRing:setShaderVector( 0, 0.5, 0, 0, 0 )
	self:addElement( ProgressWidget )
	self.ProgressWidget = ProgressWidget
	
	local ZmNotif1CursorHint = CoD.ZmNotif1_CursorHint.new( menu, controller )
	ZmNotif1CursorHint:setLeftRight( false, false, -256, 256 )
	ZmNotif1CursorHint:setTopBottom( true, false, 112, 132 )
	ZmNotif1CursorHint.CursorHintText:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( ZmNotif1CursorHint )
	self.ZmNotif1CursorHint = ZmNotif1CursorHint
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ScoreInfoPanelCircleInternal:completeAnimation()
				self.ScoreInfoPanelCircleInternal:setAlpha( 0 )
				self.clipFinished( ScoreInfoPanelCircleInternal, {} )

				whiteCircle:completeAnimation()
				self.whiteCircle:setAlpha( 0 )
				self.clipFinished( whiteCircle, {} )

				CompleteImage:completeAnimation()
				self.CompleteImage:setAlpha( 0 )
				self.clipFinished( CompleteImage, {} )

				InProgressImage:completeAnimation()
				self.InProgressImage:setAlpha( 0 )
				self.clipFinished( InProgressImage, {} )

				ProgressWidget:completeAnimation()
				self.ProgressWidget:setAlpha( 0 )
				self.clipFinished( ProgressWidget, {} )

				ZmNotif1CursorHint:completeAnimation()
				self.ZmNotif1CursorHint:setAlpha( 0 )
				self.clipFinished( ZmNotif1CursorHint, {} )
			end
		},
		InProgress = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ScoreInfoPanelCircleInternal:completeAnimation()
				self.ScoreInfoPanelCircleInternal:setAlpha( 1 )
				self.clipFinished( ScoreInfoPanelCircleInternal, {} )

				whiteCircle:completeAnimation()
				self.whiteCircle:setAlpha( 0.25 )
				self.clipFinished( whiteCircle, {} )

				CompleteImage:completeAnimation()
				self.CompleteImage:setAlpha( 0 )
				self.clipFinished( CompleteImage, {} )

				InProgressImage:completeAnimation()
				self.InProgressImage:setAlpha( 1 )
				self.clipFinished( InProgressImage, {} )

				ProgressWidget:completeAnimation()
				self.ProgressWidget:setAlpha( 1 )
				self.clipFinished( ProgressWidget, {} )

				ZmNotif1CursorHint:completeAnimation()
				self.ZmNotif1CursorHint:setAlpha( 1 )
				self.clipFinished( ZmNotif1CursorHint, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )

				ScoreInfoPanelCircleInternal:completeAnimation()
				self.ScoreInfoPanelCircleInternal:setAlpha( 1 )
				self.clipFinished( ScoreInfoPanelCircleInternal, {} )

				whiteCircle:completeAnimation()
				self.whiteCircle:setAlpha( 0.25 )
				self.clipFinished( whiteCircle, {} )

				CompleteImage:completeAnimation()
				self.CompleteImage:setAlpha( 1 )
				self.clipFinished( CompleteImage, {} )

				InProgressImage:completeAnimation()
				self.InProgressImage:setAlpha( 0 )
				self.clipFinished( InProgressImage, {} )

				ProgressWidget:completeAnimation()
				self.ProgressWidget:setAlpha( 1 )
				self.clipFinished( ProgressWidget, {} )

				ZmNotif1CursorHint:completeAnimation()
				self.ZmNotif1CursorHint:setAlpha( 1 )
				self.clipFinished( ZmNotif1CursorHint, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreInfoPanelCircleInternal:close()
		element.ProgressWidget:close()
		element.ZmNotif1CursorHint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
