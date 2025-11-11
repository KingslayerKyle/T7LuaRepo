require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )
require( "ui.uieditor.widgets.FaceButtonThatHidesWithLabel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedCardsTitleBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FeaturedFrame" )

local PostLoadFunc = function ( self, controller, menu )
	local menuModel = Engine.CreateModel( Engine.GetModelForController( controller ), "DailyChallengeWidget" )
	local challengeDataModel = Engine.CreateModel( menuModel, "Data" )
	local updateModel = Engine.CreateModel( menuModel, "Update" )
	Engine.SetModelValue( updateModel, 0 )
	CoD.ChallengesUtility.UpdateDailyChallengeModel( controller, challengeDataModel, Enum.eModes.MODE_ZOMBIES )
	self:setModel( challengeDataModel )
	self:subscribeToModel( updateModel, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == 0 then
			return 
		else
			CoD.ChallengesUtility.UpdateDailyChallengeModel( controller, self:getModel(), Enum.eModes.MODE_ZOMBIES )
			Engine.SetModelValue( model, 0 )
		end
	end )
end

CoD.Challenges_ZM_LobbyWidget = InheritFrom( LUI.UIElement )
CoD.Challenges_ZM_LobbyWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_ZM_LobbyWidget )
	self.id = "Challenges_ZM_LobbyWidget"
	self.soundSet = "Special_widgets"
	self:setLeftRight( 0, 0, 0, 502 )
	self:setTopBottom( 0, 0, 0, 249 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 41, 477 )
	bg:setTopBottom( 0, 0, 59, 224 )
	bg:setRGB( 0.1, 0.1, 0.1 )
	bg:setAlpha( 0.79 )
	self:addElement( bg )
	self.bg = bg
	
	local FEFeaturedFrame = CoD.FE_FeaturedFrame.new( menu, controller )
	FEFeaturedFrame:setLeftRight( 0, 0, 39, 479 )
	FEFeaturedFrame:setTopBottom( 0, 0, 57, 190 )
	self:addElement( FEFeaturedFrame )
	self.FEFeaturedFrame = FEFeaturedFrame
	
	local pixelLL = LUI.UIImage.new()
	pixelLL:setLeftRight( 0, 0, 0, 42 )
	pixelLL:setTopBottom( 0.5, 0.5, 61, 67 )
	pixelLL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelLL )
	self.pixelLL = pixelLL
	
	local pixelBL = LUI.UIImage.new()
	pixelBL:setLeftRight( 0, 0, 0, 42 )
	pixelBL:setTopBottom( 0.5, 0.5, -71, -65 )
	pixelBL:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	pixelBL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelBL )
	self.pixelBL = pixelBL
	
	local pixelUR = LUI.UIImage.new()
	pixelUR:setLeftRight( 0.5, 0.5, 217, 271 )
	pixelUR:setTopBottom( 0.5, 0.5, -70, -65 )
	pixelUR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelUR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelUR )
	self.pixelUR = pixelUR
	
	local pixelBR = LUI.UIImage.new()
	pixelBR:setLeftRight( 0.5, 0.5, 217, 271 )
	pixelBR:setTopBottom( 0.5, 0.5, 63, 68 )
	pixelBR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelBR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelBR )
	self.pixelBR = pixelBR
	
	local DailyChallenge = CoD.FE_FeaturedCardsTitleBox.new( menu, controller )
	DailyChallenge:setLeftRight( 0, 0, 178, 469 )
	DailyChallenge:setTopBottom( 0, 0, 66, 93 )
	DailyChallenge.ScorestreaksLabel:setText( ConvertToUpperString( "MENU_DAILY_CHALLENGE" ) )
	self:addElement( DailyChallenge )
	self.DailyChallenge = DailyChallenge
	
	local FaceButtonThatHidesWithLabel = CoD.FaceButtonThatHidesWithLabel.new( menu, controller )
	FaceButtonThatHidesWithLabel:setLeftRight( 0, 0, 68, 368 )
	FaceButtonThatHidesWithLabel:setTopBottom( 0, 0, 189, 219 )
	FaceButtonThatHidesWithLabel.ButtonLabel:setText( Engine.Localize( "MENU_DETAILS" ) )
	FaceButtonThatHidesWithLabel:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FaceButtonThatHidesWithLabel.ButtonImage.ControllerImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( FaceButtonThatHidesWithLabel )
	self.FaceButtonThatHidesWithLabel = FaceButtonThatHidesWithLabel
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 175, 475 )
	Title:setTopBottom( 0, 0, 105, 143 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PercentCompleteWidget:setLeftRight( 0, 0, 53, 158 )
	PercentCompleteWidget:setTopBottom( 0, 0, 71.5, 176.5 )
	PercentCompleteWidget:linkToElementModel( self, "progressPercentage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	PercentCompleteWidget:linkToElementModel( self, "progressPercentage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentCompleteWidget.percentText:setText( FractionToPercentageRounded( modelValue ) )
		end
	end )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local CompleteImage = LUI.UIImage.new()
	CompleteImage:setLeftRight( 0, 0, 39, 175 )
	CompleteImage:setTopBottom( 0, 0, 57, 193 )
	CompleteImage:setAlpha( 0 )
	CompleteImage:setImage( RegisterImage( "uie_t7_menu_challenges_complete_icon" ) )
	self:addElement( CompleteImage )
	self.CompleteImage = CompleteImage
	
	local CompletedText = LUI.UIText.new()
	CompletedText:setLeftRight( 0.5, 0.5, -77, 217 )
	CompletedText:setTopBottom( 0, 0, 105, 143 )
	CompletedText:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	CompletedText:setAlpha( 0 )
	CompletedText:setText( Engine.Localize( "MENU_RTS_COMPLETE_CAPS" ) )
	CompletedText:setTTF( "fonts/default.ttf" )
	CompletedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CompletedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletedText )
	self.CompletedText = CompletedText
	
	self.resetProperties = function ()
		PercentCompleteWidget:completeAnimation()
		Title:completeAnimation()
		bg:completeAnimation()
		CompleteImage:completeAnimation()
		CompletedText:completeAnimation()
		FaceButtonThatHidesWithLabel:completeAnimation()
		DailyChallenge:completeAnimation()
		pixelBR:completeAnimation()
		pixelUR:completeAnimation()
		pixelBL:completeAnimation()
		pixelLL:completeAnimation()
		FEFeaturedFrame:completeAnimation()
		PercentCompleteWidget:setAlpha( 1 )
		Title:setAlpha( 1 )
		bg:setAlpha( 0.79 )
		CompleteImage:setAlpha( 0 )
		CompletedText:setAlpha( 0 )
		FaceButtonThatHidesWithLabel:setAlpha( 1 )
		DailyChallenge:setAlpha( 1 )
		pixelBR:setAlpha( 1 )
		pixelUR:setAlpha( 1 )
		pixelBL:setAlpha( 1 )
		pixelLL:setAlpha( 1 )
		FEFeaturedFrame:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Complete = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				PercentCompleteWidget:completeAnimation()
				self.PercentCompleteWidget:setAlpha( 0 )
				self.clipFinished( PercentCompleteWidget, {} )
				CompleteImage:completeAnimation()
				self.CompleteImage:setAlpha( 1 )
				self.clipFinished( CompleteImage, {} )
				CompletedText:completeAnimation()
				self.CompletedText:setAlpha( 1 )
				self.clipFinished( CompletedText, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				bg:completeAnimation()
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				FEFeaturedFrame:completeAnimation()
				self.FEFeaturedFrame:setAlpha( 0 )
				self.clipFinished( FEFeaturedFrame, {} )
				pixelLL:completeAnimation()
				self.pixelLL:setAlpha( 0 )
				self.clipFinished( pixelLL, {} )
				pixelBL:completeAnimation()
				self.pixelBL:setAlpha( 0 )
				self.clipFinished( pixelBL, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 0 )
				self.clipFinished( pixelUR, {} )
				pixelBR:completeAnimation()
				self.pixelBR:setAlpha( 0 )
				self.clipFinished( pixelBR, {} )
				DailyChallenge:completeAnimation()
				self.DailyChallenge:setAlpha( 0 )
				self.clipFinished( DailyChallenge, {} )
				FaceButtonThatHidesWithLabel:completeAnimation()
				self.FaceButtonThatHidesWithLabel:setAlpha( 0 )
				self.clipFinished( FaceButtonThatHidesWithLabel, {} )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
				PercentCompleteWidget:completeAnimation()
				self.PercentCompleteWidget:setAlpha( 0 )
				self.clipFinished( PercentCompleteWidget, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				local f13_local0 = IsLive()
				if f13_local0 then
					f13_local0 = IsZombies()
					if f13_local0 then
						f13_local0 = IsSelfModelValueGreaterThanOrEqualTo( element, controller, "progressPercentage", 1 )
					end
				end
				return f13_local0
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsLive() and IsZombies()
			end
		},
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNetworkMode"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:linkToElementModel( self, "progressPercentage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "progressPercentage"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEFeaturedFrame:close()
		self.DailyChallenge:close()
		self.FaceButtonThatHidesWithLabel:close()
		self.PercentCompleteWidget:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

