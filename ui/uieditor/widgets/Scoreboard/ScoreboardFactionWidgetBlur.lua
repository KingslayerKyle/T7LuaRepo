-- abe5b3b6805669fb995a009d1daf08a9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.ScoreboardFactionWidgetBlur = InheritFrom( LUI.UIElement )
CoD.ScoreboardFactionWidgetBlur.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ScoreboardFactionWidgetBlur )
	self.id = "ScoreboardFactionWidgetBlur"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 234 )
	self:setTopBottom( true, false, 0, 84 )
	
	local Top3PlayerScoreBlurBox = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox:setLeftRight( true, true, 0, 0 )
	Top3PlayerScoreBlurBox:setTopBottom( true, true, 0, 0 )
	Top3PlayerScoreBlurBox:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2" ) )
	Top3PlayerScoreBlurBox:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox )
	self.Top3PlayerScoreBlurBox = Top3PlayerScoreBlurBox
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, true, 0, 0 )
	VSpanel:setTopBottom( true, true, 0, 0 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.45 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Top3PlayerScoreBlurBox:completeAnimation()
				self.Top3PlayerScoreBlurBox:setAlpha( 1 )
				self.clipFinished( Top3PlayerScoreBlurBox, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.45 )
				self.clipFinished( VSpanel, {} )
			end
		},
		Frontend = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Top3PlayerScoreBlurBox:completeAnimation()
				self.Top3PlayerScoreBlurBox:setAlpha( 0 )
				self.clipFinished( Top3PlayerScoreBlurBox, {} )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Top3PlayerScoreBlurBox:close()
		element.VSpanel:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

