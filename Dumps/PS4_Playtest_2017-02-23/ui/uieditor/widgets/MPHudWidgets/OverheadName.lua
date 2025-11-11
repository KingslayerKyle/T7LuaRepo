require( "ui.uieditor.widgets.Health.HealthBar" )
require( "ui.uieditor.widgets.MPHudWidgets.OverheadName_PlayerNameAndClanTag" )

CoD.OverheadName = InheritFrom( LUI.UIElement )
CoD.OverheadName.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OverheadName )
	self.id = "OverheadName"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 200 )
	self:setTopBottom( 0, 0, 0, 75 )
	self.anyChildUsesUpdateState = true
	
	local LevelBacking = LUI.UIImage.new()
	LevelBacking:setLeftRight( 0, 0, 2, 31 )
	LevelBacking:setTopBottom( 0, 0, 41, 70 )
	LevelBacking.__Color = function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LevelBacking:setRGB( CoD.HUDUtility.GetFriendlyOrEnemyColorByTeamId( controller, modelValue ) )
		end
	end
	
	LevelBacking:linkToElementModel( self, "team", true, LevelBacking.__Color )
	LevelBacking:subscribeToGlobalModel( controller, "PerController", "factions.playerFactionTeamEnum", function ()
		LevelBacking.__Color( self:getModel( controller, "team" ) )
	end, true )
	self:addElement( LevelBacking )
	self.LevelBacking = LevelBacking
	
	local PlayerNameAndClanTagBG = CoD.OverheadName_PlayerNameAndClanTag.new( menu, controller )
	PlayerNameAndClanTagBG:mergeStateConditions( {
		{
			stateName = "NameOnly",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "NameAndTag",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	PlayerNameAndClanTagBG:setLeftRight( 0, 0, 36.5, 236.5 )
	PlayerNameAndClanTagBG:setTopBottom( 0, 0, 41.5, 78.5 )
	PlayerNameAndClanTagBG:setRGB( 0, 0, 0 )
	PlayerNameAndClanTagBG.ClanTag:setRGB( 0, 0, 0 )
	PlayerNameAndClanTagBG.PlayerName:setRGB( 0, 0, 0 )
	PlayerNameAndClanTagBG:linkToElementModel( self, nil, false, function ( model )
		PlayerNameAndClanTagBG:setModel( model, controller )
	end )
	self:addElement( PlayerNameAndClanTagBG )
	self.PlayerNameAndClanTagBG = PlayerNameAndClanTagBG
	
	local PlayerNameAndClanTag = CoD.OverheadName_PlayerNameAndClanTag.new( menu, controller )
	PlayerNameAndClanTag:mergeStateConditions( {
		{
			stateName = "NameOnly",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "NameAndTag",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	PlayerNameAndClanTag:setLeftRight( 0, 0, 36.5, 236.5 )
	PlayerNameAndClanTag:setTopBottom( 0, 0, 41.5, 78.5 )
	PlayerNameAndClanTag.__Color = function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerNameAndClanTag:setRGB( CoD.HUDUtility.GetFriendlyOrEnemyColorByTeamId( controller, modelValue ) )
		end
	end
	
	PlayerNameAndClanTag:linkToElementModel( self, "team", true, PlayerNameAndClanTag.__Color )
	PlayerNameAndClanTag:linkToElementModel( self, nil, false, function ( model )
		PlayerNameAndClanTag:setModel( model, controller )
	end )
	PlayerNameAndClanTag:subscribeToGlobalModel( controller, "PerController", "factions.playerFactionTeamEnum", function ()
		PlayerNameAndClanTag.__Color( self:getModel( controller, "team" ) )
	end, true )
	self:addElement( PlayerNameAndClanTag )
	self.PlayerNameAndClanTag = PlayerNameAndClanTag
	
	local PlayerLevel = LUI.UIText.new()
	PlayerLevel:setLeftRight( 0, 0, -6, 39 )
	PlayerLevel:setTopBottom( 0, 0, 44, 71 )
	PlayerLevel:setRGB( 0, 0, 0 )
	PlayerLevel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	PlayerLevel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	PlayerLevel:setShaderVector( 0, 0, 0, 0, 0 )
	PlayerLevel:setShaderVector( 1, 0, 0, 0, 0 )
	PlayerLevel:setShaderVector( 2, 2, 0, 0, 0 )
	PlayerLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PlayerLevel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerLevel:linkToElementModel( self, "lpLevel", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerLevel:setText( Engine.Localize( StringAdd( 1, modelValue ) ) )
		end
	end )
	self:addElement( PlayerLevel )
	self.PlayerLevel = PlayerLevel
	
	local HealthBar = CoD.HealthBar.new( menu, controller )
	HealthBar:setLeftRight( 0, 0, 0, 158 )
	HealthBar:setTopBottom( 0, 0, 27, 37 )
	HealthBar.HealthFill:setShaderVector( 0, 1, 0, 0, 0 )
	HealthBar:linkToElementModel( self, nil, false, function ( model )
		HealthBar:setModel( model, controller )
	end )
	HealthBar.HealthFill.__Health_Bar_Color = function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			HealthBar.HealthFill:setRGB( CoD.HUDUtility.GetFriendlyOrEnemyColorByTeamId( controller, modelValue ) )
		end
	end
	
	HealthBar:linkToElementModel( self, "team", true, HealthBar.HealthFill.__Health_Bar_Color )
	HealthBar:subscribeToGlobalModel( controller, "PerController", "factions.playerFactionTeamEnum", function ()
		HealthBar.HealthFill.__Health_Bar_Color( self:getModel( controller, "team" ) )
	end, true )
	self:addElement( HealthBar )
	self.HealthBar = HealthBar
	
	self.resetProperties = function ()
		PlayerLevel:completeAnimation()
		LevelBacking:completeAnimation()
		HealthBar:completeAnimation()
		PlayerNameAndClanTag:completeAnimation()
		PlayerNameAndClanTagBG:completeAnimation()
		PlayerLevel:setAlpha( 1 )
		LevelBacking:setAlpha( 1 )
		HealthBar:setAlpha( 1 )
		PlayerNameAndClanTag:setAlpha( 1 )
		PlayerNameAndClanTagBG:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				LevelBacking:completeAnimation()
				self.LevelBacking:setAlpha( 0 )
				self.clipFinished( LevelBacking, {} )
				PlayerNameAndClanTagBG:completeAnimation()
				self.PlayerNameAndClanTagBG:setAlpha( 0 )
				self.clipFinished( PlayerNameAndClanTagBG, {} )
				PlayerNameAndClanTag:completeAnimation()
				self.PlayerNameAndClanTag:setAlpha( 0 )
				self.clipFinished( PlayerNameAndClanTag, {} )
				PlayerLevel:completeAnimation()
				self.PlayerLevel:setAlpha( 0 )
				self.clipFinished( PlayerLevel, {} )
				HealthBar:completeAnimation()
				self.HealthBar:setAlpha( 0 )
				self.clipFinished( HealthBar, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				LevelBacking:completeAnimation()
				self.LevelBacking:setAlpha( 1 )
				self.clipFinished( LevelBacking, {} )
				PlayerNameAndClanTagBG:completeAnimation()
				self.PlayerNameAndClanTagBG:setAlpha( 1 )
				self.clipFinished( PlayerNameAndClanTagBG, {} )
				PlayerNameAndClanTag:completeAnimation()
				self.PlayerNameAndClanTag:setAlpha( 1 )
				self.clipFinished( PlayerNameAndClanTag, {} )
				PlayerLevel:completeAnimation()
				self.PlayerLevel:setAlpha( 1 )
				self.clipFinished( PlayerLevel, {} )
				HealthBar:completeAnimation()
				self.HealthBar:setAlpha( 1 )
				self.clipFinished( HealthBar, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "dead" )
			end
		}
	} )
	self:linkToElementModel( self, "dead", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "dead"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PlayerNameAndClanTagBG:close()
		self.PlayerNameAndClanTag:close()
		self.HealthBar:close()
		self.LevelBacking:close()
		self.PlayerLevel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

