require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesDifficulty" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ScoreWidget" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_YourBest" )

local PostLoadFunc = function ( self, controller, menu )
	local selectedAccoladeModel = Engine.CreateModel( menu:getModel(), "selectedAccolade" )
	Engine.CreateModel( selectedAccoladeModel, "rewardName" )
	Engine.CreateModel( selectedAccoladeModel, "rewardImage" )
	Engine.CreateModel( selectedAccoladeModel, "challengeWidget" )
	Engine.CreateModel( selectedAccoladeModel, "centerText" )
	Engine.CreateModel( selectedAccoladeModel, "challengeProgressQuantity" )
	Engine.CreateModel( selectedAccoladeModel, "challengeName" )
	Engine.CreateModel( selectedAccoladeModel, "challengeDetails" )
	Engine.CreateModel( selectedAccoladeModel, "completed" )
	local ReplaceWidgetWithType = nil
	ReplaceWidgetWithType = function ( oldWidget, widgetType, widgetTypeModel, selectedAccoladeModel )
		local f2_local0 = CoD
		local f2_local1 = "MissionRecordVault_Accolades"
		f2_local0 = f2_local0["MissionRecordVault_Accolades" .. widgetType].new( menu, controller )
		f2_local0:setLeftRight( oldWidget:getLocalLeftRight() )
		f2_local0:setTopBottom( oldWidget:getLocalTopBottom() )
		f2_local0:setModel( selectedAccoladeModel, controller )
		f2_local0:addElementBefore( oldWidget )
		self.MissionRecordVaultAccolade = f2_local0
		oldWidget:close()
		f2_local0:subscribeToModel( widgetTypeModel, function ( model )
			local widgetType = Engine.GetModelValue( widgetTypeModel )
			if widgetType ~= nil then
				ReplaceWidgetWithType( f2_local0, widgetType, widgetTypeModel, selectedAccoladeModel )
			end
		end, false )
	end
	
	local oldAccolade = self.MissionRecordVaultAccolade
	local accoladeModel = Engine.GetModel( menu:getModel(), "selectedAccolade" )
	Engine.SetModelValue( Engine.GetModel( accoladeModel, "challengeWidget" ), "Kills" )
	oldAccolade:subscribeToModel( accoladeModel, function ( selectedAccoladeModel )
		local widgetTypeModel = Engine.GetModel( selectedAccoladeModel, "challengeWidget" )
		local widgetType = Engine.GetModelValue( widgetTypeModel )
		if widgetType == nil then
			oldAccolade:subscribeToModel( widgetTypeModel, function ( model )
				local widgetType = Engine.GetModelValue( widgetTypeModel )
				if widgetType ~= nil then
					ReplaceWidgetWithType( oldAccolade, widgetType, widgetTypeModel, selectedAccoladeModel )
				end
			end )
		else
			ReplaceWidgetWithType( oldAccolade, widgetType, widgetTypeModel, selectedAccoladeModel )
		end
	end )
end

CoD.MissionRecordVault_ChallengeSelectedInfo = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_ChallengeSelectedInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_ChallengeSelectedInfo )
	self.id = "MissionRecordVault_ChallengeSelectedInfo"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( 0, 0, 0, 660 )
	self:setTopBottom( 0, 0, 0, 648 )
	self.anyChildUsesUpdateState = true
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( 0, 0, -97, 735 )
	SecTitleBG:setTopBottom( 0.5, 0.5, 60, 132 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 24, 69 )
	Image0:setTopBottom( 1, 1, -67, -22 )
	Image0:setAlpha( 0 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Image0:linkToElementModel( self, "rewardImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image0:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( 0, 0, -41, 1 )
	Image30:setTopBottom( 0.5, 0.5, 57, 63 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 78, 400 )
	TextBox0:setTopBottom( 0, 0, 588, 618 )
	TextBox0:setAlpha( 0 )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:linkToElementModel( self, "rewardName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( 0, 0, -41, 1 )
	Image300:setTopBottom( 0.5, 0.5, 125, 131 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( 0, 0, 24, 650 )
	TextBox1:setTopBottom( 0.5, 0.5, 83, 113 )
	TextBox1:setTTF( "fonts/escom.ttf" )
	TextBox1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TextBox1:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox1:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox1:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox1:setLetterSpacing( 1 )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox1:linkToElementModel( self, "challengeName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox1:setText( LocalizeToUpperString( modelValue ) )
		end
	end )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( 0, 0, 24, 632 )
	TextBox2:setTopBottom( 0, 0, 525, 553 )
	TextBox2:setAlpha( 0.55 )
	TextBox2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox2:linkToElementModel( self, "challengeDetails", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox2:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local line00 = LUI.UIImage.new()
	line00:setLeftRight( 0, 0, 100, 102 )
	line00:setTopBottom( 0, 0, 492, 646 )
	line00:setAlpha( 0.27 )
	line00:setZRot( 90 )
	self:addElement( line00 )
	self.line00 = line00
	
	local MissionRecordVaultAccolade = CoD.MissionRecordVault_AccoladesDifficulty.new( menu, controller )
	MissionRecordVaultAccolade:setLeftRight( 0.5, 0.5, -187.5, 187.5 )
	MissionRecordVaultAccolade:setTopBottom( 0, 0, 15, 390 )
	MissionRecordVaultAccolade:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultAccolade:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultAccolade )
	self.MissionRecordVaultAccolade = MissionRecordVaultAccolade
	
	local MissionRecordVaultYourBest = CoD.MissionRecordVault_YourBest.new( menu, controller )
	MissionRecordVaultYourBest:setLeftRight( 0, 0, 346, 538 )
	MissionRecordVaultYourBest:setTopBottom( 0, 0, 420, 516 )
	MissionRecordVaultYourBest:setAlpha( 0 )
	MissionRecordVaultYourBest:linkToElementModel( self, "challengeProgressQuantity", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MissionRecordVaultYourBest.value:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MissionRecordVaultYourBest )
	self.MissionRecordVaultYourBest = MissionRecordVaultYourBest
	
	local MissionRecordVaultScoreWidget0 = CoD.MissionRecordVault_ScoreWidget.new( menu, controller )
	MissionRecordVaultScoreWidget0:setLeftRight( 0, 0, 24, 352 )
	MissionRecordVaultScoreWidget0:setTopBottom( 0, 0, 461, 519 )
	MissionRecordVaultScoreWidget0:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultScoreWidget0:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultScoreWidget0 )
	self.MissionRecordVaultScoreWidget0 = MissionRecordVaultScoreWidget0
	
	self.resetProperties = function ()
		MissionRecordVaultAccolade:completeAnimation()
		MissionRecordVaultAccolade:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoAccolades = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				MissionRecordVaultAccolade:completeAnimation()
				self.MissionRecordVaultAccolade:setAlpha( 0 )
				self.clipFinished( MissionRecordVaultAccolade, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoAccolades",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "challengeImage" )
			end
		},
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "challengeImage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "challengeImage"
		} )
	end )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MissionRecordVaultAccolade:close()
		self.MissionRecordVaultYourBest:close()
		self.MissionRecordVaultScoreWidget0:close()
		self.Image0:close()
		self.TextBox0:close()
		self.TextBox1:close()
		self.TextBox2:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

