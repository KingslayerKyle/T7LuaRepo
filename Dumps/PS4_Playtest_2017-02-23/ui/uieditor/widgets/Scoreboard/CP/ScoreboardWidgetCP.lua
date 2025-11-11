require( "ui.uieditor.widgets.Scoreboard.CP.ScoreboardHeaderWidgetCP" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardFactionScoresList" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardWidgetButtonContainer" )

local PostLoadFunc = function ( self, controller )
	self.ScoreboardFactionScoresListCP0.Team1:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "updateScoreboard" ), function ( model )
		CoD.ScoreboardUtility.UpdateScoreboardTeamScores( controller )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self.m_inputDisabled = not Engine.GetModelValue( model )
	end )
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.ScoreboardWidgetCP = InheritFrom( LUI.UIElement )
CoD.ScoreboardWidgetCP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardWidgetCP )
	self.id = "ScoreboardWidgetCP"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1509 )
	self:setTopBottom( 0, 0, 0, 789 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local ScoreboardHeaderWidgetCP0 = CoD.ScoreboardHeaderWidgetCP.new( menu, controller )
	ScoreboardHeaderWidgetCP0:setLeftRight( 0, 0, 132, 1340 )
	ScoreboardHeaderWidgetCP0:setTopBottom( 0, 0, 15, 71 )
	ScoreboardHeaderWidgetCP0:setAlpha( 0 )
	ScoreboardHeaderWidgetCP0:subscribeToGlobalModel( controller, "Scoreboard", nil, function ( model )
		ScoreboardHeaderWidgetCP0:setModel( model, controller )
	end )
	self:addElement( ScoreboardHeaderWidgetCP0 )
	self.ScoreboardHeaderWidgetCP0 = ScoreboardHeaderWidgetCP0
	
	local ScoreboardFactionScoresListCP0 = CoD.ScoreboardFactionScoresList.new( menu, controller )
	ScoreboardFactionScoresListCP0:setLeftRight( 0, 0, 133, 1372 )
	ScoreboardFactionScoresListCP0:setTopBottom( 0, 0, 71, 773 )
	ScoreboardFactionScoresListCP0.Team1:setVerticalCount( 8 )
	ScoreboardFactionScoresListCP0.Team2:setVerticalCount( 8 )
	ScoreboardFactionScoresListCP0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		local element = ScoreboardFactionScoresListCP0
		local event = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		}
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	ScoreboardFactionScoresListCP0:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateScoreboardClientMuteButtonPrompt( element, controller )
		return retVal
	end )
	ScoreboardFactionScoresListCP0:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ScoreboardFactionScoresListCP0:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ScoreboardFactionScoresListCP0, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		if ScoreboardVisible( controller ) then
			BlockGameFromKeyEvent( controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if ScoreboardVisible( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
			return false
		else
			return false
		end
	end, false )
	self:addElement( ScoreboardFactionScoresListCP0 )
	self.ScoreboardFactionScoresListCP0 = ScoreboardFactionScoresListCP0
	
	local ScoreboardWidgetButtonContainer = CoD.ScoreboardWidgetButtonContainer.new( menu, controller )
	ScoreboardWidgetButtonContainer:setLeftRight( 0, 0, 132, 800 )
	ScoreboardWidgetButtonContainer:setTopBottom( 0, 0, 228, 276 )
	self:addElement( ScoreboardWidgetButtonContainer )
	self.ScoreboardWidgetButtonContainer = ScoreboardWidgetButtonContainer
	
	local loadingImage = LUI.UIImage.new()
	loadingImage:setLeftRight( 0.5, 0.5, -960, 960 )
	loadingImage:setTopBottom( 0.5, 0.5, -540, 540 )
	loadingImage:setImage( RegisterImage( MapNameToMapLoadingImage( controller, GetCurrentMapID( "uie_img_t7_menu_mp_loadscreen_sector" ) ) ) )
	loadingImage:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_expensive_blur" ) )
	loadingImage:setShaderVector( 0, 0, 0, 0, 0 )
	loadingImage:setShaderVector( 1, 1, 0, 0, 0 )
	self:addElement( loadingImage )
	self.loadingImage = loadingImage
	
	local Box = LUI.UIImage.new()
	Box:setLeftRight( 0, 0, 82, 634 )
	Box:setTopBottom( 0, 0, 789, 842 )
	Box:setRGB( 1, 0.52, 0 )
	Box:setAlpha( 0.15 )
	self:addElement( Box )
	self.Box = Box
	
	local ScoreBoardText = LUI.UIText.new()
	ScoreBoardText:setLeftRight( 0, 0, 91, 905 )
	ScoreBoardText:setTopBottom( 0, 0, 789, 842 )
	ScoreBoardText:setAlpha( 0.8 )
	ScoreBoardText:setText( Engine.Localize( "Scoreboard Coming Soon" ) )
	ScoreBoardText:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	ScoreBoardText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	ScoreBoardText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ScoreBoardText )
	self.ScoreBoardText = ScoreBoardText
	
	self.resetProperties = function ()
		ScoreboardFactionScoresListCP0:completeAnimation()
		ScoreboardWidgetButtonContainer:completeAnimation()
		loadingImage:completeAnimation()
		ScoreBoardText:completeAnimation()
		Box:completeAnimation()
		ScoreboardHeaderWidgetCP0:completeAnimation()
		ScoreboardFactionScoresListCP0:setAlpha( 1 )
		ScoreboardWidgetButtonContainer:setAlpha( 1 )
		loadingImage:setAlpha( 1 )
		ScoreBoardText:setAlpha( 0.8 )
		Box:setAlpha( 0.15 )
		ScoreboardHeaderWidgetCP0:setLeftRight( 0, 0, 132, 1340 )
		ScoreboardHeaderWidgetCP0:setTopBottom( 0, 0, 15, 71 )
		ScoreboardHeaderWidgetCP0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				ScoreboardFactionScoresListCP0:completeAnimation()
				self.ScoreboardFactionScoresListCP0:setAlpha( 0 )
				self.clipFinished( ScoreboardFactionScoresListCP0, {} )
				ScoreboardWidgetButtonContainer:completeAnimation()
				self.ScoreboardWidgetButtonContainer:setAlpha( 0 )
				self.clipFinished( ScoreboardWidgetButtonContainer, {} )
				loadingImage:completeAnimation()
				self.loadingImage:setAlpha( 0 )
				self.clipFinished( loadingImage, {} )
				Box:completeAnimation()
				self.Box:setAlpha( 0 )
				self.clipFinished( Box, {} )
				ScoreBoardText:completeAnimation()
				self.ScoreBoardText:setAlpha( 0 )
				self.clipFinished( ScoreBoardText, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local ScoreboardHeaderWidgetCP0Frame2 = function ( ScoreboardHeaderWidgetCP0, event )
					if not event.interrupted then
						ScoreboardHeaderWidgetCP0:beginAnimation( "keyframe", 189, false, false, CoD.TweenType.Linear )
					end
					ScoreboardHeaderWidgetCP0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ScoreboardHeaderWidgetCP0, event )
					else
						ScoreboardHeaderWidgetCP0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 0 )
				ScoreboardHeaderWidgetCP0Frame2( ScoreboardHeaderWidgetCP0, {} )
				local ScoreboardFactionScoresListCP0Frame2 = function ( ScoreboardFactionScoresListCP0, event )
					if not event.interrupted then
						ScoreboardFactionScoresListCP0:beginAnimation( "keyframe", 289, false, false, CoD.TweenType.Bounce )
					end
					ScoreboardFactionScoresListCP0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ScoreboardFactionScoresListCP0, event )
					else
						ScoreboardFactionScoresListCP0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ScoreboardFactionScoresListCP0:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				ScoreboardFactionScoresListCP0:setAlpha( 0 )
				ScoreboardFactionScoresListCP0:registerEventHandler( "transition_complete_keyframe", ScoreboardFactionScoresListCP0Frame2 )
			end
		},
		ArabicZombieAAR = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setLeftRight( 0, 0, 228.5, 1431.5 )
				self.ScoreboardHeaderWidgetCP0:setTopBottom( 0, 0, 0, 48 )
				self.ScoreboardHeaderWidgetCP0:setAlpha( 1 )
				self.clipFinished( ScoreboardHeaderWidgetCP0, {} )
				ScoreboardWidgetButtonContainer:completeAnimation()
				self.ScoreboardWidgetButtonContainer:setAlpha( 0 )
				self.clipFinished( ScoreboardWidgetButtonContainer, {} )
				loadingImage:completeAnimation()
				self.loadingImage:setAlpha( 0 )
				self.clipFinished( loadingImage, {} )
				Box:completeAnimation()
				self.Box:setAlpha( 0 )
				self.clipFinished( Box, {} )
				ScoreBoardText:completeAnimation()
				self.ScoreBoardText:setAlpha( 0 )
				self.clipFinished( ScoreBoardText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 1 )
				self.clipFinished( ScoreboardHeaderWidgetCP0, {} )
			end
		},
		ForceVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ScoreboardHeaderWidgetCP0:completeAnimation()
				self.ScoreboardHeaderWidgetCP0:setAlpha( 1 )
				self.clipFinished( ScoreboardHeaderWidgetCP0, {} )
			end
		},
		Frontend = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				loadingImage:completeAnimation()
				self.loadingImage:setAlpha( 0 )
				self.clipFinished( loadingImage, {} )
				Box:completeAnimation()
				self.Box:setAlpha( 0 )
				self.clipFinished( Box, {} )
				ScoreBoardText:completeAnimation()
				self.ScoreBoardText:setAlpha( 0 )
				self.clipFinished( ScoreBoardText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ArabicZombieAAR",
			condition = function ( menu, element, event )
				local f22_local0 = IsCurrentLanguageArabic()
				if f22_local0 then
					f22_local0 = IsZombies()
					if f22_local0 then
						f22_local0 = AlwaysFalse()
					end
				end
				return f22_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
			end
		},
		{
			stateName = "ForceVisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "forceScoreboard", 1 )
			end
		},
		{
			stateName = "Frontend",
			condition = function ( menu, element, event )
				return not IsInGame()
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "forceScoreboard" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "forceScoreboard"
		} )
	end )
	ScoreboardFactionScoresListCP0.id = "ScoreboardFactionScoresListCP0"
	ScoreboardWidgetButtonContainer:setModel( menu.buttonModel, controller )
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ScoreboardFactionScoresListCP0:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ScoreboardHeaderWidgetCP0:close()
		self.ScoreboardFactionScoresListCP0:close()
		self.ScoreboardWidgetButtonContainer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

