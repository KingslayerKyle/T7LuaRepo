-- 09463613353de30782011d99ae2d3f88
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_ZM_LobbyWidget" )

CoD.DailyChallengeWidgetContainer = InheritFrom( LUI.UIElement )
CoD.DailyChallengeWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DailyChallengeWidgetContainer )
	self.id = "DailyChallengeWidgetContainer"
	self.soundSet = "Special_widgets"
	self:setLeftRight( true, false, 0, 306 )
	self:setTopBottom( true, false, 0, 87 )
	self.anyChildUsesUpdateState = true
	
	local DailyChallengeWidget = CoD.Challenges_ZM_LobbyWidget.new( menu, controller )
	DailyChallengeWidget:setLeftRight( false, false, -153, 153 )
	DailyChallengeWidget:setTopBottom( false, false, -43.5, 43.5 )
	self:addElement( DailyChallengeWidget )
	self.DailyChallengeWidget = DailyChallengeWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )

				DailyChallengeWidget:completeAnimation()
				self.DailyChallengeWidget:setAlpha( 1 )
				self.clipFinished( DailyChallengeWidget, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DailyChallengeWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
