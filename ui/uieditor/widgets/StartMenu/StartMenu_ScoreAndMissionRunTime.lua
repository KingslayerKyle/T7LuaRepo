-- a78e21a2e1319f43c23486ed6ac39811
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_ScoreAndMissionRunTime = InheritFrom( LUI.UIElement )
CoD.StartMenu_ScoreAndMissionRunTime.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_ScoreAndMissionRunTime )
	self.id = "StartMenu_ScoreAndMissionRunTime"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 129 )
	self:setTopBottom( true, false, 0, 93 )
	
	local score = LUI.UIText.new()
	score:setLeftRight( true, true, 0, 0 )
	score:setTopBottom( true, false, 0, 50 )
	score:setTTF( "fonts/default.ttf" )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	score:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	score:subscribeToGlobalModel( controller, "StartMenu", "score", function ( model )
		local _score = Engine.GetModelValue( model )
		if _score then
			score:setText( Engine.Localize( _score ) )
		end
	end )
	self:addElement( score )
	self.score = score
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		CP_PauseMenu = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CP_PauseMenu",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.score:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

