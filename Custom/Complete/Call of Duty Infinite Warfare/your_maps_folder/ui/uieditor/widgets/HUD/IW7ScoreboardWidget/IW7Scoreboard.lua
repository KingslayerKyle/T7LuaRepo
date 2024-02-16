require( "ui.uieditor.widgets.HUD.IW7ScoreboardWidget.IW7ScoreboardListItem" )

local PostLoadFunc = function ( self, controller )
	self.Team1:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( controller ), "updateScoreboard" ), function ( model )
		self.Team1:updateDataSource( false, true )
	end )

	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		self.m_inputDisabled = not Engine.GetModelValue( model )
	end )

	-- Keep character images up-to-date until the game ends
	for clientIndex = 0, Dvar.com_maxclients:get() - 1 do
		self.Team1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PlayerList." .. clientIndex .. ".zombiePlayerIcon" ), function ( model )
			-- If we update the images after this is set to 1, the wrong images will be set.
			if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ) ) ~= 1 then
				self.Team1:updateDataSource()
			end
		end )
	end
end

local PreLoadFunc = function ( self, controller )
	CoD.ScoreboardUtility.SetScoreboardUIModels( controller )
end

CoD.IW7Scoreboard = InheritFrom( LUI.UIElement )
CoD.IW7Scoreboard.new = function ( menu, controller )
    local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.IW7Scoreboard )
	self.id = "IW7Scoreboard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true

	self.HeaderImage = LUI.UIImage.new()
	self.HeaderImage:setLeftRight( true, false, 64, 774 )
	self.HeaderImage:setTopBottom( true, false, 36, 52 )
	self.HeaderImage:setImage( RegisterImage( "cp_zmb_inventory_pink_bg" ) )
	self:addElement( self.HeaderImage )

	self.SurvivorsIcon = LUI.UIImage.new()
	self.SurvivorsIcon:setLeftRight( true, false, 423.5 - 11, 455.5 + 11 )
	self.SurvivorsIcon:setTopBottom( true, false, 20 - 11, 52 + 11 )
	self.SurvivorsIcon:setImage( RegisterImage( "category_icon_survivors" ) )
	self:addElement( self.SurvivorsIcon )

	self.KillsIcon = LUI.UIImage.new()
	self.KillsIcon:setLeftRight( true, false, 508.5 - 11, 540.5 + 11 )
	self.KillsIcon:setTopBottom( true, false, 20 - 11, 52 + 11 )
	self.KillsIcon:setImage( RegisterImage( "category_icon_kills" ) )
	self:addElement( self.KillsIcon )

	self.HeadshotsIcon = LUI.UIImage.new()
	self.HeadshotsIcon:setLeftRight( true, false, 597 - 11, 629 + 11 )
	self.HeadshotsIcon:setTopBottom( true, false, 20 - 11, 52 + 11 )
	self.HeadshotsIcon:setImage( RegisterImage( "category_icon_headshots" ) )
	self:addElement( self.HeadshotsIcon )

	self.RevivesIcon = LUI.UIImage.new()
	self.RevivesIcon:setLeftRight( true, false, 668.5 - 11, 700.5 + 11 )
	self.RevivesIcon:setTopBottom( true, false, 20 - 11, 52 + 11 )
	self.RevivesIcon:setImage( RegisterImage( "category_icon_revives" ) )
	self:addElement( self.RevivesIcon )

	self.DownsIcon = LUI.UIImage.new()
	self.DownsIcon:setLeftRight( true, false, 726.5 - 11, 758.5 + 11 )
	self.DownsIcon:setTopBottom( true, false, 20 - 11, 52 + 11 )
	self.DownsIcon:setImage( RegisterImage( "category_icon_downs" ) )
	self:addElement( self.DownsIcon )

	self.Team1 = LUI.UIList.new( menu, controller, 1, 0, nil, false, false, 0, 0, false, false )
	self.Team1:makeFocusable()
	self.Team1:setLeftRight( true, true, 0, 0 )
	self.Team1:setTopBottom( true, true, 0, 0 )
	self.Team1:setDataSource( "ScoreboardTeam1List" )
	self.Team1:setWidgetType( CoD.IW7ScoreboardListItem )
	self.Team1:setVerticalCount( 9 )
	self.Team1:setSpacing( 1 )
	self:addElement( self.Team1 )

	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				self.HeaderImage:completeAnimation()
				self.HeaderImage:setAlpha( 0 )
				self.clipFinished( self.HeaderImage, {} )

				self.SurvivorsIcon:completeAnimation()
				self.SurvivorsIcon:setAlpha( 0 )
				self.clipFinished( self.SurvivorsIcon, {} )

				self.KillsIcon:completeAnimation()
				self.KillsIcon:setAlpha( 0 )
				self.clipFinished( self.KillsIcon, {} )

				self.HeadshotsIcon:completeAnimation()
				self.HeadshotsIcon:setAlpha( 0 )
				self.clipFinished( self.HeadshotsIcon, {} )

				self.RevivesIcon:completeAnimation()
				self.RevivesIcon:setAlpha( 0 )
				self.clipFinished( self.RevivesIcon, {} )

				self.DownsIcon:completeAnimation()
				self.DownsIcon:setAlpha( 0 )
				self.clipFinished( self.DownsIcon, {} )

				self.Team1:completeAnimation()
				self.Team1:setAlpha( 0 )
				self.clipFinished( self.Team1, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )

				self.HeaderImage:completeAnimation()
				self.HeaderImage:setAlpha( 1 )
				self.clipFinished( self.HeaderImage, {} )
				
				self.SurvivorsIcon:completeAnimation()
				self.SurvivorsIcon:setAlpha( 1 )
				self.clipFinished( self.SurvivorsIcon, {} )
				
				self.KillsIcon:completeAnimation()
				self.KillsIcon:setAlpha( 1 )
				self.clipFinished( self.KillsIcon, {} )
				
				self.HeadshotsIcon:completeAnimation()
				self.HeadshotsIcon:setAlpha( 1 )
				self.clipFinished( self.HeadshotsIcon, {} )
				
				self.RevivesIcon:completeAnimation()
				self.RevivesIcon:setAlpha( 1 )
				self.clipFinished( self.RevivesIcon, {} )
				
				self.DownsIcon:completeAnimation()
				self.DownsIcon:setAlpha( 1 )
				self.clipFinished( self.DownsIcon, {} )
				
				self.Team1:completeAnimation()
				self.Team1:setAlpha( 1 )
				self.clipFinished( self.Team1, {} )
			end
		}
	}
	
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
					return true
				else
					return false
				end
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )

	self.Team1.id = "Team1"

	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Team1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.HeaderImage:close()
		element.SurvivorsIcon:close()
		element.KillsIcon:close()
		element.HeadshotsIcon:close()
		element.RevivesIcon:close()
		element.DownsIcon:close()
		element.Team1:close()
	end )

	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end

	return self
end
