-- fabe8dfabcaabbd7d5f15006af242747
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.menus.AAR.CP.RewardsOverlayTrainingSim" )
require( "ui.uieditor.widgets.StartMenu.CP.StartMenu_CampaignBG" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteBack" )
require( "ui.uieditor.widgets.AAR.CP.TrainingSimAAR.Rating" )
require( "ui.uieditor.widgets.HUD.TrainingSim.CPTrainingSimRankIcon" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.ScoreWidget" )
require( "ui.uieditor.widgets.AAR.PerformanceTab.TitleWidget" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )

local PreLoadFunc = function ( self, controller )
	CoD.AARUtilityCP.CreateModelsForRewards( controller )
	CoD.perController[controller].fromMaxLevelMessage = true
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	local f2_local0 = tonumber( Engine.GetModelValue( Engine.GetModel( f2_arg0:getModel(), "training_sim_aar_score" ) ) )
	local f2_local1 = Engine.GetAssetList( "rating_list" )
	local f2_local2 = 0
	local f2_local3 = f2_local1[f2_local2 + 1]
	local f2_local4 = f2_local1[1].ratingImage
	local f2_local5 = 0
	while f2_local3.requiredScore < f2_local0 do
		f2_local5 = f2_local3.requiredScore
		f2_local2 = f2_local2 + 1
		f2_local4 = f2_local1[f2_local2].ratingImage
		if f2_local2 == #f2_local1 then
			break
		end
		f2_local3 = f2_local1[f2_local2 + 1]
	end
	f2_arg0.CPTrainingSimRankIcon.RatingIcon:setImage( RegisterImage( f2_local4 ) )
	if f2_local2 > 0 then
		f2_arg0.CPTrainingSimRankIcon:setState( "Show" )
	end
	local f2_local6 = (f2_local0 - f2_local5) / (f2_local3.requiredScore - f2_local5) * 1
	if f2_local3.requiredScore == 0 then
		f2_local6 = 0
	end
	DebugPrint( "PERCENTAGE: " .. f2_local6 )
	if f2_local6 < 1 and f2_local2 < #f2_local1 then
		f2_arg0.Rating.LossesRing:setShaderVector( 0, 1 - f2_local6, 0, 0, 0 )
	else
		f2_arg0.Rating.LossesRing:setShaderVector( 0, 0, 0, 0, 0 )
	end
end

LUI.createMenu.TrainingSimAAR = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "TrainingSimAAR" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "TrainingSimAAR.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuCampaignBG = CoD.StartMenu_CampaignBG.new( f3_local1, controller )
	StartMenuCampaignBG:setLeftRight( true, true, 0, 0 )
	StartMenuCampaignBG:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuCampaignBG )
	self.StartMenuCampaignBG = StartMenuCampaignBG
	
	local VignetteBack = CoD.VehicleGround_VignetteBack.new( f3_local1, controller )
	VignetteBack:setLeftRight( true, true, 0, 0 )
	VignetteBack:setTopBottom( true, true, 0, 0 )
	self:addElement( VignetteBack )
	self.VignetteBack = VignetteBack
	
	local Rating = CoD.Rating.new( f3_local1, controller )
	Rating:setLeftRight( false, false, -519.91, -327.91 )
	Rating:setTopBottom( true, false, 290, 482 )
	Rating.LossesRing:setShaderVector( 0, 0.37, 0, 0, 0 )
	self:addElement( Rating )
	self.Rating = Rating
	
	local CPTrainingSimRankIcon = CoD.CPTrainingSimRankIcon.new( f3_local1, controller )
	CPTrainingSimRankIcon:setLeftRight( false, false, -460.91, -386.91 )
	CPTrainingSimRankIcon:setTopBottom( true, false, 352, 429.5 )
	CPTrainingSimRankIcon:setScale( 1.6 )
	self:addElement( CPTrainingSimRankIcon )
	self.CPTrainingSimRankIcon = CPTrainingSimRankIcon
	
	local fadefromblack = LUI.UIImage.new()
	fadefromblack:setLeftRight( true, true, 1121.85, -30.16 )
	fadefromblack:setTopBottom( true, true, 25.93, -566.07 )
	fadefromblack:setRGB( 0, 0, 0 )
	self:addElement( fadefromblack )
	self.fadefromblack = fadefromblack
	
	local KillsInfo = CoD.ScoreWidget.new( f3_local1, controller )
	KillsInfo:setLeftRight( false, false, -188.03, 114.22 )
	KillsInfo:setTopBottom( true, false, 234, 369 )
	KillsInfo.ScoreLabel:setText( Engine.Localize( "MENU_TRAININGSIM_SCORE" ) )
	KillsInfo.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TRAININGSIM_SCORE" ) )
	self:addElement( KillsInfo )
	self.KillsInfo = KillsInfo
	
	local DeathsInfo = CoD.ScoreWidget.new( f3_local1, controller )
	DeathsInfo:setLeftRight( false, false, -188.03, 114.22 )
	DeathsInfo:setTopBottom( true, false, 429.5, 564.5 )
	DeathsInfo.ScoreLabel:setText( Engine.Localize( "MENU_TRAININGSIM_ROUND" ) )
	DeathsInfo.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TRAININGSIM_ROUND" ) )
	self:addElement( DeathsInfo )
	self.DeathsInfo = DeathsInfo
	
	local TitleWidget00 = CoD.TitleWidget.new( f3_local1, controller )
	TitleWidget00:setLeftRight( false, false, -561.41, -286.41 )
	TitleWidget00:setTopBottom( true, false, 176.93, 202.93 )
	TitleWidget00.weaponNameLabel:setText( Engine.Localize( "MENU_TRAININGSIM_RATING" ) )
	self:addElement( TitleWidget00 )
	self.TitleWidget00 = TitleWidget00
	
	local KillsInfo0 = CoD.ScoreWidget.new( f3_local1, controller )
	KillsInfo0:setLeftRight( false, false, 238.78, 541.03 )
	KillsInfo0:setTopBottom( true, false, 234, 330 )
	KillsInfo0.ScoreLabel:setText( Engine.Localize( "MENU_TRAININGSIM_LETHALS" ) )
	KillsInfo0.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TRAININGSIM_LETHALS" ) )
	self:addElement( KillsInfo0 )
	self.KillsInfo0 = KillsInfo0
	
	local KillsInfo00 = CoD.ScoreWidget.new( f3_local1, controller )
	KillsInfo00:setLeftRight( false, false, 238.78, 541.03 )
	KillsInfo00:setTopBottom( true, false, 357.5, 452.5 )
	KillsInfo00.ScoreLabel:setText( Engine.Localize( "MENU_TRAININGSIM_TORSOHITS" ) )
	KillsInfo00.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TRAININGSIM_TORSOHITS" ) )
	self:addElement( KillsInfo00 )
	self.KillsInfo00 = KillsInfo00
	
	local KillsInfo000 = CoD.ScoreWidget.new( f3_local1, controller )
	KillsInfo000:setLeftRight( false, false, 238.78, 541.03 )
	KillsInfo000:setTopBottom( true, false, 469.59, 564.59 )
	KillsInfo000.ScoreLabel:setText( Engine.Localize( "MENU_TRAININGSIM_LIMB_HITS" ) )
	KillsInfo000.StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "MENU_TRAININGSIM_LIMB_HITS" ) )
	self:addElement( KillsInfo000 )
	self.KillsInfo000 = KillsInfo000
	
	local GenericMenuFrame = CoD.GenericMenuFrame.new( f3_local1, controller )
	GenericMenuFrame:setLeftRight( true, true, 0, 0 )
	GenericMenuFrame:setTopBottom( true, true, 0, 0 )
	GenericMenuFrame.titleLabel:setText( Engine.Localize( LocalizeToUpperString( "MENU_TRAININGSIM_PERFORMANCE_TITLE" ) ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( LocalizeToUpperString( "MENU_TRAININGSIM_PERFORMANCE_TITLE" ) ) )
	GenericMenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_combatimmersion" ) )
	GenericMenuFrame:registerEventHandler( "menu_loaded", function ( element, event )
		local f4_local0 = nil
		ShowHeaderIconOnly( f3_local1 )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( GenericMenuFrame )
	self.GenericMenuFrame = GenericMenuFrame
	
	local TitleWidget0 = CoD.TitleWidget.new( f3_local1, controller )
	TitleWidget0:setLeftRight( false, false, 252.4, 527.4 )
	TitleWidget0:setTopBottom( true, false, 176.93, 202.93 )
	TitleWidget0.weaponNameLabel:setText( Engine.Localize( "MENU_TRAININGSIM_ACCURACY" ) )
	self:addElement( TitleWidget0 )
	self.TitleWidget0 = TitleWidget0
	
	local TitleWidget01 = CoD.TitleWidget.new( f3_local1, controller )
	TitleWidget01:setLeftRight( false, false, -176.45, 98.55 )
	TitleWidget01:setTopBottom( true, false, 176.93, 202.93 )
	TitleWidget01.weaponNameLabel:setText( Engine.Localize( "MENU_RESULT" ) )
	self:addElement( TitleWidget01 )
	self.TitleWidget01 = TitleWidget01
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( false, false, 45.09, 300 )
	CategoryListLine00:setTopBottom( true, false, 399, 407 )
	CategoryListLine00:setAlpha( 0.33 )
	CategoryListLine00:setZRot( 90 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local CategoryListLine000 = LUI.UIImage.new()
	CategoryListLine000:setLeftRight( false, false, -369.91, -115 )
	CategoryListLine000:setTopBottom( true, false, 399, 407 )
	CategoryListLine000:setAlpha( 0.33 )
	CategoryListLine000:setZRot( 90 )
	CategoryListLine000:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CategoryListLine000 )
	self.CategoryListLine000 = CategoryListLine000
	
	self.KillsInfo:linkToElementModel( self, "training_sim_aar_score", true, function ( model )
		local trainingSimAarScore = Engine.GetModelValue( model )
		if trainingSimAarScore then
			KillsInfo.Score.Numbers:setText( Engine.Localize( trainingSimAarScore ) )
		end
	end )
	self.DeathsInfo:linkToElementModel( self, "training_sim_aar_round", true, function ( model )
		local trainingSimAarRound = Engine.GetModelValue( model )
		if trainingSimAarRound then
			DeathsInfo.Score.Numbers:setText( Engine.Localize( trainingSimAarRound ) )
		end
	end )
	self.KillsInfo0:linkToElementModel( self, "training_sim_aar_lethals", true, function ( model )
		local trainingSimAarLethals = Engine.GetModelValue( model )
		if trainingSimAarLethals then
			KillsInfo0.Score.Numbers:setText( Engine.Localize( trainingSimAarLethals ) )
		end
	end )
	self.KillsInfo00:linkToElementModel( self, "training_sim_aar_torsohits", true, function ( model )
		local trainingSimAarTorsohits = Engine.GetModelValue( model )
		if trainingSimAarTorsohits then
			KillsInfo00.Score.Numbers:setText( Engine.Localize( trainingSimAarTorsohits ) )
		end
	end )
	self.KillsInfo000:linkToElementModel( self, "training_sim_aar_limbhits", true, function ( model )
		local trainingSimAarLimbhits = Engine.GetModelValue( model )
		if trainingSimAarLimbhits then
			KillsInfo000.Score.Numbers:setText( Engine.Localize( trainingSimAarLimbhits ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local fadefromblackFrame2 = function ( fadefromblack, event )
					if not event.interrupted then
						fadefromblack:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
					end
					fadefromblack:setLeftRight( true, true, 0, 0 )
					fadefromblack:setTopBottom( true, true, 0, 0 )
					fadefromblack:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( fadefromblack, event )
					else
						fadefromblack:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				fadefromblack:completeAnimation()
				self.fadefromblack:setLeftRight( true, true, 0, 0 )
				self.fadefromblack:setTopBottom( true, true, 0, 0 )
				self.fadefromblack:setAlpha( 1 )
				fadefromblackFrame2( fadefromblack, {} )
			end
		}
	}
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "aarRewards.aarRewardsCount" ), function ( model )
		local f12_local0 = self
		local f12_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "aarRewards.aarRewardsCount"
		}
		CoD.Menu.UpdateButtonShownState( f12_local0, f3_local1, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE )
	end )
	self:registerEventHandler( "menu_opened", function ( element, event )
		local f13_local0 = nil
		if IsModelValueGreaterThan( controller, "aarRewards.aarRewardsCount", 0 ) then
			PrepareOpenMenuInSafehouse( controller )
			OpenOverlay( self, "RewardsOverlayTrainingSim", controller, "", "" )
		else
			PrepareOpenMenuInSafehouse( controller )
		end
		if not f13_local0 then
			f13_local0 = element:dispatchEventToChildren( event )
		end
		return f13_local0
	end )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		PrepareCloseMenuInSafehouse( f14_arg2 )
		SendOwnMenuResponse( f14_arg1, f14_arg2, "closed" )
		CloseCPAAR( f14_arg1, f14_arg2 )
		return true
	end, function ( f15_arg0, f15_arg1, f15_arg2 )
		CoD.Menu.SetButtonLabel( f15_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
		return true
	end, false )
	f3_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
		if IsModelValueGreaterThan( f16_arg2, "aarRewards.aarRewardsCount", 0 ) then
			OpenOverlay( self, "RewardsOverlayTrainingSim", f16_arg2, "", "" )
			return true
		else
			
		end
	end, function ( f17_arg0, f17_arg1, f17_arg2 )
		CoD.Menu.SetButtonLabel( f17_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		if IsModelValueGreaterThan( f17_arg2, "aarRewards.aarRewardsCount", 0 ) then
			return true
		else
			return false
		end
	end, false )
	GenericMenuFrame:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuCampaignBG:close()
		element.VignetteBack:close()
		element.Rating:close()
		element.CPTrainingSimRankIcon:close()
		element.KillsInfo:close()
		element.DeathsInfo:close()
		element.TitleWidget00:close()
		element.KillsInfo0:close()
		element.KillsInfo00:close()
		element.KillsInfo000:close()
		element.GenericMenuFrame:close()
		element.TitleWidget0:close()
		element.TitleWidget01:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "TrainingSimAAR.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

