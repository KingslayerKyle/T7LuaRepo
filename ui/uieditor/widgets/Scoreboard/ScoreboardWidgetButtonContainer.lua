-- db9b4148647f06289b3b59a32ca99739
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 445 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local ScoreboardButtons = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	ScoreboardButtons:setLeftRight( true, false, 0, 445 )
	ScoreboardButtons:setTopBottom( true, false, 0, 32 )
	self:addElement( ScoreboardButtons )
	self.ScoreboardButtons = ScoreboardButtons
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ScoreboardButtons:completeAnimation()
				self.ScoreboardButtons:setAlpha( 1 )
				self.clipFinished( ScoreboardButtons, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		AAR = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ScoreboardButtons:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
