require( "ui.uieditor.widgets.ZMInventoryStalingrad.GameTimeGroup" )

local SetHealthText = function ( controller, element )
	local health = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "CSGO.Health" ) )
	local juggernaut = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.perks.juggernaut" ) )

	if health ~= nil and juggernaut ~= nil then
		if juggernaut > 0 then
			element:setText( Engine.Localize( math.floor( ( health * 100 ) * 2 ) ) )
		else
			element:setText( Engine.Localize( math.floor( health * 100 ) ) )
		end
	end
end

local PreLoadFunc = function ( self, controller )
	Engine.CreateModel( Engine.GetModelForController( controller ), "csgo_zone_name" )
end

CoD.CSGOSelfScore = InheritFrom( LUI.UIElement )
CoD.CSGOSelfScore.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CSGOSelfScore )
	self.id = "CSGOSelfScore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.ZoneText = LUI.UIText.new()
	self.ZoneText:setLeftRight( true, false, 20, 0 )
	self.ZoneText:setTopBottom( true, false, 20, 40 )
	self.ZoneText:setText( Engine.Localize( "" ) )
	self.ZoneText:setTTF( "fonts/stratum2bold.ttf" )
	self.ZoneText:setRGB( 0.9, 0.9, 0.9 )
	self.ZoneText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ZoneText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "csgo_zone_name" ), function ( model )
		local csgo_zone_name = Engine.GetModelValue( model )

		if csgo_zone_name then
			if csgo_zone_name == "none" then
				self.ZoneText:setText( Engine.Localize( "" ) )
			else
				self.ZoneText:setText( Engine.Localize( csgo_zone_name ) )
			end
		end
	end )
	self:addElement( self.ZoneText )

	self.TimeBG = LUI.UIImage.new()
	self.TimeBG:setLeftRight( true, false, 612, 668 )
	self.TimeBG:setTopBottom( true, false, 1.5, 18 )
	self.TimeBG:setImage( RegisterImage( "$white" ) )
	self.TimeBG:setRGB( 0, 0, 0 )
	self.TimeBG:setAlpha( 0.5 )
	self:addElement( self.TimeBG )

	self.GameTimeGroup = CoD.GameTimeGroup.new( menu, controller )
	self.GameTimeGroup:setLeftRight( false, false, -42.5, 0 )
	self.GameTimeGroup:setTopBottom( true, false, -31, 0 )
	self.GameTimeGroup:setScale( 0.5 )
	self.GameTimeGroup.CurrentClockTime.FEButtonPanelShaderContainer:setScale( 0 )
	self.GameTimeGroup.CurrentClockTime.Backing:setScale( 0 )
	self.GameTimeGroup.CurrentClockTime.BackPanel:setScale( 0 )
	self.GameTimeGroup.CurrentClockTime.TimeElasped:setScale( 0 )
	self.GameTimeGroup.CurrentClockTime.GameTimer:setTTF( "fonts/stratum2bold.ttf" )
	self.GameTimeGroup.CurrentClockTime.GameTimer:setRGB( 0.9, 0.9, 0.9 )
	self.GameTimeGroup.CurrentClockTime.HighlightFrame:setScale( 0 )
	self.GameTimeGroup.SurviveTime:setScale( 0 )
	self.GameTimeGroup.Last5RoundTime:setScale( 0 )
	self.GameTimeGroup.QuestTime:setScale( 0 )
	self:addElement( self.GameTimeGroup )

	self.PortraitImageBG = LUI.UIImage.new()
	self.PortraitImageBG:setLeftRight( true, false, 540, 575 )
	self.PortraitImageBG:setTopBottom( true, false, 1.5, 38 )
	self.PortraitImageBG:setImage( RegisterImage( "$white" ) )
	self.PortraitImageBG:setRGB( 0, 0, 0.11 )
	self.PortraitImageBG:setAlpha( 0.5 )
	self:addElement( self.PortraitImageBG )

	self.PortraitImage = LUI.UIImage.new()
	self.PortraitImage:setLeftRight( true, false, 540, 575 )
	self.PortraitImage:setTopBottom( true, false, 1.5, 38 )
	self.PortraitImage:setImage( RegisterImage( "csgo_player_none" ) )
	self.PortraitImage:linkToElementModel( self, "zombiePlayerIcon", true, function ( model )
		local zombiePlayerIcon = Engine.GetModelValue( model )

		if zombiePlayerIcon then
			if zombiePlayerIcon == "blacktransparent" then
				self.PortraitImage:setImage( RegisterImage( "csgo_player_none" ) )
			else
				self.PortraitImage:setImage( RegisterImage( zombiePlayerIcon ) )
			end
		end
	end )
	self:addElement( self.PortraitImage )

	self.PortraitImageFrame = LUI.UIImage.new()
	self.PortraitImageFrame:setLeftRight( true, false, 540, 575 )
	self.PortraitImageFrame:setTopBottom( true, false, 1.5, 38 )
	self.PortraitImageFrame:setImage( RegisterImage( "csgo_player_frame" ) )
	self.PortraitImageFrame:setRGB( 0.71, 0.83, 0.92 )
	self.PortraitImageFrame:linkToElementModel( self, "clientNum", true, function ( model )
		local clientNum = Engine.GetModelValue( model )

		if clientNum then
			self.PortraitImageFrame:setRGB( ZombieClientScoreboardGlowColor( clientNum ) )
		end
	end )
	self:addElement( self.PortraitImageFrame )

	self.ScoreBG = LUI.UIImage.new()
	self.ScoreBG:setLeftRight( true, false, 0, 110 )
	self.ScoreBG:setTopBottom( true, false, 237 - 2.5, 263 + 2.5 )
	self.ScoreBG:setImage( RegisterImage( "$white" ) )
	self.ScoreBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.ScoreBG:setShaderVector( 0, 0.2, 0.02, 0.2, 0.02 )
	self.ScoreBG:setRGB( 0, 0, 0 )
	self.ScoreBG:setAlpha( 0.2 )
	self:addElement( self.ScoreBG )

	self.ScoreText = LUI.UIText.new()
	self.ScoreText:setLeftRight( true, true, 20, 0 )
	self.ScoreText:setTopBottom( true, false, 237, 263 )
	self.ScoreText:setTTF( "fonts/stratum2bold.ttf" )
	self.ScoreText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.ScoreText:setRGB( 0.9, 0.9, 0.9 )
	self.ScoreText:linkToElementModel( self, "playerScore", true, function ( model )
		local playerScore = Engine.GetModelValue( model )

		if playerScore then
			self.ScoreText:setText( Engine.Localize( "$" .. playerScore ) )
		end
	end )
	self:addElement( self.ScoreText )

	self.BottomBG = LUI.UIImage.new()
	self.BottomBG:setLeftRight( true, false, 0, 290 )
	self.BottomBG:setTopBottom( false, true, -35, 0 )
	self.BottomBG:setImage( RegisterImage( "$white" ) )
	self.BottomBG:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	self.BottomBG:setShaderVector( 0, 0.2, 0.02, 0.2, 0.02 )
	self.BottomBG:setRGB( 0, 0, 0 )
	self.BottomBG:setAlpha( 0.2 )
	self:addElement( self.BottomBG )

	self.HealthIcon = LUI.UIImage.new()
	self.HealthIcon:setLeftRight( true, false, 19.5, 32 )
	self.HealthIcon:setTopBottom( false, true, -24, -11.5 )
	self.HealthIcon:setImage( RegisterImage( "csgo_health" ) )
	self.HealthIcon:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( self.HealthIcon )

	self.HealthText = LUI.UIText.new()
	self.HealthText:setLeftRight( true, false, 32, 82.5 )
	self.HealthText:setTopBottom( false, true, -33, -1 )
	self.HealthText:setTTF( "fonts/stratum2bold.ttf" )
	self.HealthText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.HealthText:setText( Engine.Localize( "0" ) )
	self.HealthText:setRGB( 0.9, 0.9, 0.9 )
	self.HealthText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CSGO.Health" ), function ( model )
		SetHealthText( controller, self.HealthText )
	end )
	self.HealthText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.perks.juggernaut" ), function ( model )
		SetHealthText( controller, self.HealthText )
	end )
	self:addElement( self.HealthText )

	self.HealthBarBG = LUI.UIImage.new()
	self.HealthBarBG:setLeftRight( true, false, 82.5, 137 )
	self.HealthBarBG:setTopBottom( false, true, -21, -13 )
	self.HealthBarBG:setImage( RegisterImage( "$white" ) )
	self.HealthBarBG:setRGB( 0.11, 0.11, 0.11 )
	self.HealthBarBG:setAlpha( 0.25 )
	self:addElement( self.HealthBarBG )

	self.HealthBar = LUI.UIImage.new()
	self.HealthBar:setLeftRight( true, false, 82.5, 137 )
	self.HealthBar:setTopBottom( false, true, -21, -13 )
	self.HealthBar:setImage( RegisterImage( "$white" ) )
	self.HealthBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.HealthBar:setShaderVector( 1, 0, 0, 0, 0 )
	self.HealthBar:setShaderVector( 2, 1, 0, 0, 0 )
	self.HealthBar:setShaderVector( 3, 0, 0, 0, 0 )
	self.HealthBar:setRGB( 0.9, 0.9, 0.9 )
	self.HealthBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CSGO.Health" ), function ( model )
		local health = Engine.GetModelValue( model )

		if health then
			self.HealthBar:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
			
			if health <= 0.33 then
				self.HealthBar:setRGB( 1, 0.11, 0.11 )
			else
				self.HealthBar:setRGB( 0.9, 0.9, 0.9 )
			end

			self.HealthBar:setShaderVector( 0,
				CoD.GetVectorComponentFromString( health, 1 ),
				CoD.GetVectorComponentFromString( health, 2 ),
				CoD.GetVectorComponentFromString( health, 3 ),
				CoD.GetVectorComponentFromString( health, 4 ) )
		end
	end )
	self:addElement( self.HealthBar )

	self.ArmorIcon = LUI.UIImage.new()
	self.ArmorIcon:setLeftRight( true, false, 157.5, 170 )
	self.ArmorIcon:setTopBottom( false, true, -24, -11.5 )
	self.ArmorIcon:setImage( RegisterImage( "csgo_shield" ) )
	self.ArmorIcon:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( self.ArmorIcon )

	self.ArmorText = LUI.UIText.new()
	self.ArmorText:setLeftRight( true, false, 170, 220.5 )
	self.ArmorText:setTopBottom( false, true, -33, -1 )
	self.ArmorText:setTTF( "fonts/stratum2bold.ttf" )
	self.ArmorText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self.ArmorText:setText( Engine.Localize( "0" ) )
	self.ArmorText:setRGB( 0.9, 0.9, 0.9 )
	self.ArmorText:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMInventory.shield_health" ), function ( model )
		local shield_health = Engine.GetModelValue( model )

		if shield_health then
			local armorInt = math.floor( ( shield_health * 100 ) + 0.5 )

			local showDpadDown = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ) )
			
			if showDpadDown ~= nil then
				if showDpadDown > 0 then
					if armorInt < 0 then
						self.ArmorText:setText( Engine.Localize( "0" ) )
					else
						self.ArmorText:setText( Engine.Localize( armorInt ) )
					end
				else
					self.ArmorText:setText( Engine.Localize( "0" ) )
				end
			end
		end
	end )
	self:addElement( self.ArmorText )

	self.ArmorBarBG = LUI.UIImage.new()
	self.ArmorBarBG:setLeftRight( true, false, 220.5, 275 )
	self.ArmorBarBG:setTopBottom( false, true, -21, -13 )
	self.ArmorBarBG:setImage( RegisterImage( "$white" ) )
	self.ArmorBarBG:setRGB( 0.11, 0.11, 0.11 )
	self.ArmorBarBG:setAlpha( 0.25 )
	self:addElement( self.ArmorBarBG )

	self.ArmorBar = LUI.UIImage.new()
	self.ArmorBar:setLeftRight( true, false, 220.5, 275 )
	self.ArmorBar:setTopBottom( false, true, -21, -13 )
	self.ArmorBar:setImage( RegisterImage( "blacktransparent" ) )
	self.ArmorBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	self.ArmorBar:setShaderVector( 1, 0, 0, 0, 0 )
	self.ArmorBar:setShaderVector( 2, 1, 0, 0, 0 )
	self.ArmorBar:setShaderVector( 3, 0, 0, 0, 0 )
	self.ArmorBar:setRGB( 0.9, 0.9, 0.9 )
	self.ArmorBar:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMInventory.shield_health" ), function ( model )
		local shield_health = Engine.GetModelValue( model )

		if shield_health then
			local showDpadDown = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDpadDown" ) )

			if showDpadDown ~= nil then
				if showDpadDown > 0 then
					self.ArmorBar:setImage( RegisterImage( "$white" ) )
				else
					self.ArmorBar:setImage( RegisterImage( "blacktransparent" ) )
				end
			end

			self.ArmorBar:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
			
			if shield_health <= 0.33 then
				self.ArmorBar:setRGB( 1, 0.11, 0.11 )
			else
				self.ArmorBar:setRGB( 0.9, 0.9, 0.9 )
			end

			self.ArmorBar:setShaderVector( 0, AdjustStartEnd( 0, 1,
				CoD.GetVectorComponentFromString( shield_health, 1 ),
				CoD.GetVectorComponentFromString( shield_health, 2 ),
				CoD.GetVectorComponentFromString( shield_health, 3 ),
				CoD.GetVectorComponentFromString( shield_health, 4 ) ) )
		end
	end )
	self:addElement( self.ArmorBar )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ZoneText:close()
		element.TimeBG:close()
		element.GameTimeGroup:close()
		element.PortraitImageBG:close()
		element.PortraitImage:close()
		element.PortraitImageFrame:close()
		element.ScoreBG:close()
		element.ScoreText:close()
		element.BottomBG:close()
		element.HealthIcon:close()
		element.HealthText:close()
		element.HealthBarBG:close()
		element.HealthBar:close()
		element.ArmorIcon:close()
		element.ArmorText:close()
		element.ArmorBarBG:close()
		element.ArmorBar:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
