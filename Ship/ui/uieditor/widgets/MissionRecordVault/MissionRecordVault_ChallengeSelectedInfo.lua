-- 3e5b01f6300a290758e1a999e065f86c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_AccoladesDifficulty" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_YourBest" )
require( "ui.uieditor.widgets.MissionRecordVault.MissionRecordVault_ScoreWidget" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = Engine.CreateModel( menu:getModel(), "selectedAccolade" )
	Engine.CreateModel( f1_local0, "rewardName" )
	Engine.CreateModel( f1_local0, "rewardImage" )
	Engine.CreateModel( f1_local0, "challengeWidget" )
	Engine.CreateModel( f1_local0, "centerText" )
	Engine.CreateModel( f1_local0, "challengeProgressQuantity" )
	Engine.CreateModel( f1_local0, "challengeName" )
	Engine.CreateModel( f1_local0, "challengeDetails" )
	Engine.CreateModel( f1_local0, "completed" )
	local f1_local1 = nil
	f1_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
		local f2_local0 = CoD
		local f2_local1 = "MissionRecordVault_Accolades"
		f2_local0 = f2_local0["MissionRecordVault_Accolades" .. f2_arg1].new( menu, controller )
		f2_local0:setLeftRight( f2_arg0:getLocalLeftRight() )
		f2_local0:setTopBottom( f2_arg0:getLocalTopBottom() )
		f2_local0:setModel( f2_arg3, controller )
		f2_local0:addElementBefore( f2_arg0 )
		self.MissionRecordVaultAccolade = f2_local0
		f2_arg0:close()
		f2_local0:subscribeToModel( f2_arg2, function ( model )
			local modelValue = Engine.GetModelValue( f2_arg2 )
			if modelValue ~= nil then
				f1_local1( f2_local0, modelValue, f2_arg2, f2_arg3 )
			end
		end, false )
	end
	
	local f1_local2 = self.MissionRecordVaultAccolade
	local f1_local3 = Engine.GetModel( menu:getModel(), "selectedAccolade" )
	Engine.SetModelValue( Engine.GetModel( f1_local3, "challengeWidget" ), "Kills" )
	f1_local2:subscribeToModel( f1_local3, function ( model )
		local f4_local0 = Engine.GetModel( model, "challengeWidget" )
		local f4_local1 = Engine.GetModelValue( f4_local0 )
		if f4_local1 == nil then
			f1_local2:subscribeToModel( f4_local0, function ( model )
				local modelValue = Engine.GetModelValue( f4_local0 )
				if modelValue ~= nil then
					f1_local1( f1_local2, modelValue, f4_local0, model )
				end
			end )
		else
			f1_local1( f1_local2, f4_local1, f4_local0, model )
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
	self:setLeftRight( true, false, 0, 440 )
	self:setTopBottom( true, false, 0, 432 )
	self.anyChildUsesUpdateState = true
	
	local SecTitleBG = LUI.UIImage.new()
	SecTitleBG:setLeftRight( true, false, -65, 490 )
	SecTitleBG:setTopBottom( false, false, 40, 88.22 )
	SecTitleBG:setAlpha( 0.65 )
	SecTitleBG:setImage( RegisterImage( "uie_t7_menu_cp_vault_sec_title_bg" ) )
	self:addElement( SecTitleBG )
	self.SecTitleBG = SecTitleBG
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 16, 46 )
	Image0:setTopBottom( false, true, -45, -15 )
	Image0:setAlpha( 0 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	Image0:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			Image0:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, -27, 1 )
	Image30:setTopBottom( false, false, 38, 42 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 52, 267 )
	TextBox0:setTopBottom( true, false, 392, 412 )
	TextBox0:setAlpha( 0 )
	TextBox0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox0:linkToElementModel( self, "rewardName", true, function ( model )
		local rewardName = Engine.GetModelValue( model )
		if rewardName then
			TextBox0:setText( Engine.Localize( rewardName ) )
		end
	end )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, -27, 1 )
	Image300:setTopBottom( false, false, 83, 87 )
	Image300:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local TextBox1 = LUI.UIText.new()
	TextBox1:setLeftRight( true, false, 16, 433 )
	TextBox1:setTopBottom( false, false, 55, 75 )
	TextBox1:setTTF( "fonts/escom.ttf" )
	TextBox1:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TextBox1:setShaderVector( 0, 0.06, 0, 0, 0 )
	TextBox1:setShaderVector( 1, 0.02, 0, 0, 0 )
	TextBox1:setShaderVector( 2, 1, 0, 0, 0 )
	TextBox1:setLetterSpacing( 1 )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox1:linkToElementModel( self, "challengeName", true, function ( model )
		local challengeName = Engine.GetModelValue( model )
		if challengeName then
			TextBox1:setText( LocalizeToUpperString( challengeName ) )
		end
	end )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local TextBox2 = LUI.UIText.new()
	TextBox2:setLeftRight( true, false, 16, 421 )
	TextBox2:setTopBottom( true, false, 350, 369 )
	TextBox2:setAlpha( 0.55 )
	TextBox2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox2:linkToElementModel( self, "challengeDetails", true, function ( model )
		local challengeDetails = Engine.GetModelValue( model )
		if challengeDetails then
			TextBox2:setText( Engine.Localize( challengeDetails ) )
		end
	end )
	self:addElement( TextBox2 )
	self.TextBox2 = TextBox2
	
	local line00 = LUI.UIImage.new()
	line00:setLeftRight( true, false, 67.14, 68.14 )
	line00:setTopBottom( true, false, 328.16, 431.16 )
	line00:setAlpha( 0.27 )
	line00:setZRot( 90 )
	self:addElement( line00 )
	self.line00 = line00
	
	local MissionRecordVaultAccolade = CoD.MissionRecordVault_AccoladesDifficulty.new( menu, controller )
	MissionRecordVaultAccolade:setLeftRight( false, false, -125, 125 )
	MissionRecordVaultAccolade:setTopBottom( true, false, 10, 260 )
	MissionRecordVaultAccolade:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultAccolade:setModel( model, controller )
	end )
	MissionRecordVaultAccolade:linkToElementModel( self, "challengeWidget", true, function ( model )
		local f12_local0 = MissionRecordVaultAccolade
	end )
	self:addElement( MissionRecordVaultAccolade )
	self.MissionRecordVaultAccolade = MissionRecordVaultAccolade
	
	local MissionRecordVaultYourBest = CoD.MissionRecordVault_YourBest.new( menu, controller )
	MissionRecordVaultYourBest:setLeftRight( true, false, 230.5, 358.5 )
	MissionRecordVaultYourBest:setTopBottom( true, false, 280.11, 344.11 )
	MissionRecordVaultYourBest:setAlpha( 0 )
	MissionRecordVaultYourBest:linkToElementModel( self, "challengeProgressQuantity", true, function ( model )
		local challengeProgressQuantity = Engine.GetModelValue( model )
		if challengeProgressQuantity then
			MissionRecordVaultYourBest.value:setText( Engine.Localize( challengeProgressQuantity ) )
		end
	end )
	self:addElement( MissionRecordVaultYourBest )
	self.MissionRecordVaultYourBest = MissionRecordVaultYourBest
	
	local MissionRecordVaultScoreWidget0 = CoD.MissionRecordVault_ScoreWidget.new( menu, controller )
	MissionRecordVaultScoreWidget0:setLeftRight( true, false, 16, 235 )
	MissionRecordVaultScoreWidget0:setTopBottom( true, false, 307, 346 )
	MissionRecordVaultScoreWidget0:linkToElementModel( self, nil, false, function ( model )
		MissionRecordVaultScoreWidget0:setModel( model, controller )
	end )
	self:addElement( MissionRecordVaultScoreWidget0 )
	self.MissionRecordVaultScoreWidget0 = MissionRecordVaultScoreWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NoAccolades = {
			DefaultClip = function ()
				self:setupElementClipCounter( 9 )

				SecTitleBG:completeAnimation()
				self.SecTitleBG:setAlpha( 0.65 )
				self.clipFinished( SecTitleBG, {} )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				Image30:completeAnimation()
				self.Image30:setAlpha( 1 )
				self.clipFinished( Image30, {} )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )

				Image300:completeAnimation()
				self.Image300:setAlpha( 1 )
				self.clipFinished( Image300, {} )

				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 1 )
				self.clipFinished( TextBox1, {} )

				TextBox2:completeAnimation()
				self.TextBox2:setAlpha( 0.55 )
				self.clipFinished( TextBox2, {} )

				MissionRecordVaultAccolade:completeAnimation()
				self.MissionRecordVaultAccolade:setAlpha( 0 )
				self.clipFinished( MissionRecordVaultAccolade, {} )

				MissionRecordVaultYourBest:completeAnimation()
				self.MissionRecordVaultYourBest:setAlpha( 0 )
				self.clipFinished( MissionRecordVaultYourBest, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )

				TextBox0:completeAnimation()
				self.TextBox0:setRGB( 1, 1, 1 )
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )

				MissionRecordVaultYourBest:completeAnimation()
				self.MissionRecordVaultYourBest:setAlpha( 0 )
				self.clipFinished( MissionRecordVaultYourBest, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.MissionRecordVaultAccolade:close()
		element.MissionRecordVaultYourBest:close()
		element.MissionRecordVaultScoreWidget0:close()
		element.Image0:close()
		element.TextBox0:close()
		element.TextBox1:close()
		element.TextBox2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
