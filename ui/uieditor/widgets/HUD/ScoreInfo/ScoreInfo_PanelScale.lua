-- 743d830e166e252e761b074d628d7743
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScaleContainer" )

CoD.ScoreInfo_PanelScale = InheritFrom( LUI.UIElement )
CoD.ScoreInfo_PanelScale.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ScoreInfo_PanelScale )
	self.id = "ScoreInfo_PanelScale"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 56 )
	
	local ScoreInfoPanelScaleContainer0 = CoD.ScoreInfo_PanelScaleContainer.new( menu, controller )
	ScoreInfoPanelScaleContainer0:setLeftRight( true, true, 0, 0 )
	ScoreInfoPanelScaleContainer0:setTopBottom( true, true, 0, 0 )
	ScoreInfoPanelScaleContainer0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	ScoreInfoPanelScaleContainer0:setShaderVector( 0, 0, 3, 0, 0 )
	self:addElement( ScoreInfoPanelScaleContainer0 )
	self.ScoreInfoPanelScaleContainer0 = ScoreInfoPanelScaleContainer0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ScoreInfoPanelScaleContainer0:completeAnimation()
				self.ScoreInfoPanelScaleContainer0:setAlpha( 1 )
				self.clipFinished( ScoreInfoPanelScaleContainer0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ScoreInfoPanelScaleContainer0:completeAnimation()
				self.ScoreInfoPanelScaleContainer0:setAlpha( 0 )
				self.clipFinished( ScoreInfoPanelScaleContainer0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreInfoPanelScaleContainer0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

