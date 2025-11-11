require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.InGame.Draft.PositionDraft_ClientHeadshot" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardPlayerDetails_Data" )
require( "ui.uieditor.widgets.Scoreboard.ScoreboardPlayerDetails_Overview" )

local PostLoadFunc = function ( self, controller )
	self.Team.showHealthBar = false
	self.Team.friendlyTeam = true
	self.Team:updateDataSource( true )
	self.EnemyTeam.showHealthBar = false
	self.EnemyTeam.enemyTeam = true
	self.EnemyTeam:updateDataSource( true )
	local f1_local0 = self
	local f1_local1 = self.subscribeToModel
	local f1_local2 = Engine.GetGlobalModel()
	f1_local1( f1_local0, f1_local2:create( "lobbyRoot.gameClient.update" ), function ( model )
		self.Team:updateDataSource( true )
		self.EnemyTeam:updateDataSource( true )
	end )
end

CoD.ScoreboardPlayerDetails = InheritFrom( LUI.UIElement )
CoD.ScoreboardPlayerDetails.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ScoreboardPlayerDetails )
	self.id = "ScoreboardPlayerDetails"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1440 )
	self:setTopBottom( 0, 0, 0, 662 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local BlurBox = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	BlurBox:setLeftRight( 0, 0, 0, 1440 )
	BlurBox:setTopBottom( 0, 0, 450, 618 )
	BlurBox:setRGB( 0.49, 0.54, 0.56 )
	BlurBox:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	BlurBox:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( BlurBox )
	self.BlurBox = BlurBox
	
	local BlurBox2 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	BlurBox2:setLeftRight( 0, 0, 0, 1440 )
	BlurBox2:setTopBottom( 0, 0, -107, 437 )
	BlurBox2:setRGB( 0.49, 0.54, 0.56 )
	BlurBox2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	BlurBox2:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( BlurBox2 )
	self.BlurBox2 = BlurBox2
	
	local BlackBox = LUI.UIImage.new()
	BlackBox:setLeftRight( 0, 0, 0, 1440 )
	BlackBox:setTopBottom( 0, 0, 450, 618 )
	BlackBox:setRGB( 0, 0, 0 )
	BlackBox:setAlpha( 0.65 )
	self:addElement( BlackBox )
	self.BlackBox = BlackBox
	
	local BlackBox2 = LUI.UIImage.new()
	BlackBox2:setLeftRight( 0, 0, 0, 1440 )
	BlackBox2:setTopBottom( 0, 0, -107, 437 )
	BlackBox2:setRGB( 0, 0, 0 )
	BlackBox2:setAlpha( 0.65 )
	self:addElement( BlackBox2 )
	self.BlackBox2 = BlackBox2
	
	local EnemyLineL = LUI.UIImage.new()
	EnemyLineL:setLeftRight( 0, 0, 0, 1440 )
	EnemyLineL:setTopBottom( 0, 0, 171, 437 )
	EnemyLineL:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	EnemyLineL:setAlpha( 0.04 )
	EnemyLineL:setYRot( 180 )
	EnemyLineL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	EnemyLineL:setShaderVector( 0, 0, 1, 0, 0 )
	EnemyLineL:setShaderVector( 1, 0, 0, 0, 0 )
	EnemyLineL:setShaderVector( 2, 0, 1, 0, 0 )
	EnemyLineL:setShaderVector( 3, 1, 0, 0, 0 )
	self:addElement( EnemyLineL )
	self.EnemyLineL = EnemyLineL
	
	local EnemyLineL2 = LUI.UIImage.new()
	EnemyLineL2:setLeftRight( 0, 0, 0, 1440 )
	EnemyLineL2:setTopBottom( 0, 0, 427, 437 )
	EnemyLineL2:setRGB( ColorSet.EnemyOrange.r, ColorSet.EnemyOrange.g, ColorSet.EnemyOrange.b )
	EnemyLineL2:setAlpha( 0.15 )
	EnemyLineL2:setYRot( 180 )
	self:addElement( EnemyLineL2 )
	self.EnemyLineL2 = EnemyLineL2
	
	local FriendlyLineL = LUI.UIImage.new()
	FriendlyLineL:setLeftRight( 0, 0, 0, 1440 )
	FriendlyLineL:setTopBottom( 0, 0, -107, 158 )
	FriendlyLineL:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	FriendlyLineL:setAlpha( 0.04 )
	FriendlyLineL:setYRot( 180 )
	FriendlyLineL:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	FriendlyLineL:setShaderVector( 0, 0, 1, 0, 0 )
	FriendlyLineL:setShaderVector( 1, 0, 0, 0, 0 )
	FriendlyLineL:setShaderVector( 2, 0, 1, 0, 0 )
	FriendlyLineL:setShaderVector( 3, 0, 1, 0, 0 )
	self:addElement( FriendlyLineL )
	self.FriendlyLineL = FriendlyLineL
	
	local FriendlyLineL2 = LUI.UIImage.new()
	FriendlyLineL2:setLeftRight( 0, 0, 0, 1440 )
	FriendlyLineL2:setTopBottom( 0, 0, -107, -97 )
	FriendlyLineL2:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	FriendlyLineL2:setAlpha( 0.15 )
	FriendlyLineL2:setYRot( 180 )
	self:addElement( FriendlyLineL2 )
	self.FriendlyLineL2 = FriendlyLineL2
	
	local CharacterPortrait = LUI.UIImage.new()
	CharacterPortrait:setLeftRight( 0, 0, 199, 305 )
	CharacterPortrait:setTopBottom( 0, 0, 14, 123 )
	CharacterPortrait:setRGB( 0.78, 0.78, 0.78 )
	CharacterPortrait:setAlpha( 0 )
	CharacterPortrait:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CharacterPortrait:setImage( RegisterImage( GetPositionDraftIconByIndex( GetCharacterIndexForClientNum( controller, modelValue ) ) ) )
		end
	end )
	self:addElement( CharacterPortrait )
	self.CharacterPortrait = CharacterPortrait
	
	local CharacterCategoryIcon = LUI.UIImage.new()
	CharacterCategoryIcon:setLeftRight( 0, 0, 820, 860 )
	CharacterCategoryIcon:setTopBottom( 0, 0, 473, 512 )
	CharacterCategoryIcon:setAlpha( 0.5 )
	CharacterCategoryIcon:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CharacterCategoryIcon:setImage( RegisterImage( GetPositionCategoryIcon( GetCharacterIndexForClientNum( controller, modelValue ) ) ) )
		end
	end )
	self:addElement( CharacterCategoryIcon )
	self.CharacterCategoryIcon = CharacterCategoryIcon
	
	local CharacterName = LUI.UIText.new()
	CharacterName:setLeftRight( 0, 0, 316, 610 )
	CharacterName:setTopBottom( 0, 0, 61, 131 )
	CharacterName:setAlpha( 0 )
	CharacterName:setTTF( "fonts/default.ttf" )
	CharacterName:setLetterSpacing( 10 )
	CharacterName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CharacterName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CharacterName:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CharacterName:setText( Engine.Localize( GetCharacterDisplayNameByIndex( GetCharacterIndexForClientNum( controller, modelValue ) ) ) )
		end
	end )
	self:addElement( CharacterName )
	self.CharacterName = CharacterName
	
	local Overview = CoD.ScoreboardPlayerDetails_Overview.new( menu, controller )
	Overview:setLeftRight( 0, 0, 412, 822 )
	Overview:setTopBottom( 0, 0, 437, 523 )
	Overview:setScale( 0.9 )
	self:addElement( Overview )
	self.Overview = Overview
	
	local RoleScore = CoD.ScoreboardPlayerDetails_Data.new( menu, controller )
	RoleScore:setLeftRight( 0, 0, 439, 620 )
	RoleScore:setTopBottom( 0, 0, 516, 601 )
	RoleScore:setAlpha( 0.8 )
	RoleScore.Data:setRGB( 0.18, 0.57, 0.91 )
	RoleScore:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RoleScore.Data:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 0, modelValue ) ) )
		end
	end )
	RoleScore:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			RoleScore.Name:setText( AppendLocalizeString( "MPUI_SCORE_CAPS", AppendString( " ", GetPositionCategoryName( GetCharacterIndexForClientNum( controller, modelValue ) ) ) ) )
		end
	end )
	self:addElement( RoleScore )
	self.RoleScore = RoleScore
	
	local TotalScore = CoD.ScoreboardPlayerDetails_Data.new( menu, controller )
	TotalScore:setLeftRight( 0, 0, 628, 809 )
	TotalScore:setTopBottom( 0, 0, 516, 601 )
	TotalScore:setAlpha( 0.8 )
	TotalScore.Name:setText( Engine.Localize( "MENU_TOTAL_SCORE_CAPS" ) )
	TotalScore:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TotalScore.Data:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 1, modelValue ) ) )
		end
	end )
	self:addElement( TotalScore )
	self.TotalScore = TotalScore
	
	local Kills = CoD.ScoreboardPlayerDetails_Data.new( menu, controller )
	Kills:setLeftRight( 0, 0, 815, 908 )
	Kills:setTopBottom( 0, 0, 516, 600 )
	Kills:setAlpha( 0.8 )
	Kills.Name:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	Kills:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Kills.Data:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 2, modelValue ) ) )
		end
	end )
	self:addElement( Kills )
	self.Kills = Kills
	
	local Deaths = CoD.ScoreboardPlayerDetails_Data.new( menu, controller )
	Deaths:setLeftRight( 0, 0, 916, 1009 )
	Deaths:setTopBottom( 0, 0, 516, 601 )
	Deaths:setAlpha( 0.8 )
	Deaths.Name:setText( Engine.Localize( "MENU_DEATHS_CAPS" ) )
	Deaths:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Deaths.Data:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 3, modelValue ) ) )
		end
	end )
	self:addElement( Deaths )
	self.Deaths = Deaths
	
	local ObjTime = CoD.ScoreboardPlayerDetails_Data.new( menu, controller )
	ObjTime:setLeftRight( 0, 0, 1020, 1113 )
	ObjTime:setTopBottom( 0, 0, 521, 602 )
	ObjTime:setAlpha( 0 )
	ObjTime.Name:setText( Engine.Localize( "MPUI_OBJ_TIME_CAPS" ) )
	ObjTime:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ObjTime.Data:setText( Engine.Localize( GetScoreboardPlayerScoreColumn( controller, 4, modelValue ) ) )
		end
	end )
	self:addElement( ObjTime )
	self.ObjTime = ObjTime
	
	local Team = LUI.UIList.new( menu, controller, 20, 0, nil, false, false, 0, 0, false, false )
	Team:makeFocusable()
	Team:setLeftRight( 0, 0, 156, 1456 )
	Team:setTopBottom( 0, 0, -107, 153 )
	Team:setAlpha( 0.8 )
	Team:setScale( 0.8 )
	Team:setWidgetType( CoD.PositionDraft_ClientHeadshot )
	Team:setHorizontalCount( 6 )
	Team:setSpacing( 20 )
	Team:setDataSource( "Clients" )
	self:addElement( Team )
	self.Team = Team
	
	local EnemyTeam = LUI.UIList.new( menu, controller, 20, 0, nil, false, false, 0, 0, false, false )
	EnemyTeam:makeFocusable()
	EnemyTeam:setLeftRight( 0, 0, 156, 1456 )
	EnemyTeam:setTopBottom( 0, 0, 177, 437 )
	EnemyTeam:setAlpha( 0.8 )
	EnemyTeam:setScale( 0.8 )
	EnemyTeam:setWidgetType( CoD.PositionDraft_ClientHeadshot )
	EnemyTeam:setHorizontalCount( 6 )
	EnemyTeam:setSpacing( 20 )
	EnemyTeam:setDataSource( "Clients" )
	self:addElement( EnemyTeam )
	self.EnemyTeam = EnemyTeam
	
	local CirclePanel = LUI.UIImage.new()
	CirclePanel:setLeftRight( 0, 0, 665, 775 )
	CirclePanel:setTopBottom( 0, 0, 109, 219 )
	CirclePanel:setAlpha( 0.1 )
	CirclePanel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring" ) )
	CirclePanel:setShaderVector( 0, 66.66, 13.42, 0, 0 )
	CirclePanel:setShaderVector( 1, 100, 100, 0, 0 )
	CirclePanel:setShaderVector( 2, 0.2, 0.2, 0, 0 )
	self:addElement( CirclePanel )
	self.CirclePanel = CirclePanel
	
	local VS = LUI.UIText.new()
	VS:setLeftRight( 0, 0, 135, 1305 )
	VS:setTopBottom( 0, 0, 144, 189 )
	VS:setAlpha( 0.2 )
	VS:setText( Engine.Localize( "MP_VERSUS" ) )
	VS:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	VS:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VS:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VS )
	self.VS = VS
	
	local SelectSpecialist = LUI.UIText.new()
	SelectSpecialist:setLeftRight( 0, 0, 866, 1203 )
	SelectSpecialist:setTopBottom( 0, 0, 475, 512 )
	SelectSpecialist:setAlpha( 0.5 )
	SelectSpecialist:setTTF( "fonts/default.ttf" )
	SelectSpecialist:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_outline" ) )
	SelectSpecialist:setShaderVector( 0, 0, 0, 0, 0 )
	SelectSpecialist:setLetterSpacing( 3.9 )
	SelectSpecialist:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SelectSpecialist:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	SelectSpecialist:subscribeToGlobalModel( controller, "Player", "clientNum", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			SelectSpecialist:setText( Engine.Localize( GetPositionCategoryField( "string", "displayName", GetCharacterIndexForClientNum( controller, modelValue ) ) ) )
		end
	end )
	self:addElement( SelectSpecialist )
	self.SelectSpecialist = SelectSpecialist
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 199, 682 )
	Image:setTopBottom( 0, 0, 164, 166 )
	Image:setAlpha( 0.1 )
	Image:setYRot( 180 )
	self:addElement( Image )
	self.Image = Image
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0.4, 0.4, 182, 663 )
	Image2:setTopBottom( 0, 0, 164, 166 )
	Image2:setAlpha( 0.1 )
	Image2:setYRot( 180 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	Team.navigation = {
		down = EnemyTeam
	}
	EnemyTeam.navigation = {
		up = Team
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	self:subscribeToGlobalModel( controller, "PerController", "UIVisibilityBit.45", function ( model )
		local element = self
		if IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
			SetPerControllerTableProperty( controller, "showHealthBars", true )
		end
	end )
	Team.id = "Team"
	EnemyTeam.id = "EnemyTeam"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.Team:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BlurBox:close()
		self.BlurBox2:close()
		self.Overview:close()
		self.RoleScore:close()
		self.TotalScore:close()
		self.Kills:close()
		self.Deaths:close()
		self.ObjTime:close()
		self.Team:close()
		self.EnemyTeam:close()
		self.CharacterPortrait:close()
		self.CharacterCategoryIcon:close()
		self.CharacterName:close()
		self.SelectSpecialist:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

