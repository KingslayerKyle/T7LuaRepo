require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

CoD.ScoreboardWidgetButtonContainer = InheritFrom( LUI.UIElement )
CoD.ScoreboardWidgetButtonContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardWidgetButtonContainer )
	self.id = "ScoreboardWidgetButtonContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 667 )
	self:setTopBottom( 0, 0, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local ScoreboardButtons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	ScoreboardButtons:setLeftRight( 0, 0, 0, 668 )
	ScoreboardButtons:setTopBottom( 0, 0, 0, 48 )
	self:addElement( ScoreboardButtons )
	self.ScoreboardButtons = ScoreboardButtons
	
	self.resetProperties = function ()
		ScoreboardButtons:completeAnimation()
		ScoreboardButtons:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		AAR = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ScoreboardButtons:completeAnimation()
				self.ScoreboardButtons:setAlpha( 0 )
				self.clipFinished( ScoreboardButtons, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AAR",
			condition = function ( menu, element, event )
				return not IsInGame()
			end
		}
	} )
	ScoreboardButtons:setModel( menu.buttonModel, controller )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ScoreboardButtons:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

