-- b192e3f9358bf086e355da9e73fdffdc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )

local PostLoadFunc = function ( self, controller, menu )
	local f1_local0 = DataSources.DailyChallengeWidget.getModel( controller )
	local f1_local1 = Engine.GetModel( f1_local0, "data" )
	self:subscribeToModel( Engine.GetModel( f1_local0, "update" ), function ( model )
		if Engine.GetModelValue( model ) == 0 then
			return 
		else
			CoD.ChallengesUtility.UpdateDailyChallengeModel( controller, f1_local1, Enum.eModes.MODE_ZOMBIES )
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
	self:setLeftRight( true, false, 0, 306 )
	self:setTopBottom( true, false, 0, 87 )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0.1, 0.1, 0.1 )
	self:addElement( bg )
	self.bg = bg
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( true, false, 88.5, 302.5 )
	Title:setTopBottom( true, false, 8.25, 33.25 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Title:subscribeToGlobalModel( controller, "DailyChallengeWidget", "Data.title", function ( model )
		local DataTitle = Engine.GetModelValue( model )
		if DataTitle then
			Title:setText( Engine.Localize( DataTitle ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PercentCompleteWidget:setLeftRight( true, false, 8.05, 66.18 )
	PercentCompleteWidget:setTopBottom( true, false, 4.88, 63 )
	PercentCompleteWidget:subscribeToGlobalModel( controller, "DailyChallengeWidget", "Data.progressPercentage", function ( model )
		local DataProgressPercentage = Engine.GetModelValue( model )
		if DataProgressPercentage then
			PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( DataProgressPercentage, 1 ), CoD.GetVectorComponentFromString( DataProgressPercentage, 2 ), CoD.GetVectorComponentFromString( DataProgressPercentage, 3 ), CoD.GetVectorComponentFromString( DataProgressPercentage, 4 ) )
		end
	end )
	PercentCompleteWidget:subscribeToGlobalModel( controller, "DailyChallengeWidget", "Data.progressPercentage", function ( model )
		local DataProgressPercentage = Engine.GetModelValue( model )
		if DataProgressPercentage then
			PercentCompleteWidget.percentText:setText( FractionToPercentageRounded( DataProgressPercentage ) )
		end
	end )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local CompleteImage = LUI.UIImage.new()
	CompleteImage:setLeftRight( true, false, 3.53, 70.7 )
	CompleteImage:setTopBottom( true, false, -0.68, 66.5 )
	CompleteImage:setAlpha( 0 )
	CompleteImage:setImage( RegisterImage( "uie_t7_menu_challenges_complete_icon" ) )
	self:addElement( CompleteImage )
	self.CompleteImage = CompleteImage
	
	local CompletedText = LUI.UIText.new()
	CompletedText:setLeftRight( false, false, -79, 131 )
	CompletedText:setTopBottom( true, false, 8.25, 33.25 )
	CompletedText:setRGB( ColorSet.GroupName.r, ColorSet.GroupName.g, ColorSet.GroupName.b )
	CompletedText:setAlpha( 0 )
	CompletedText:setText( Engine.Localize( "MENU_RTS_COMPLETE_CAPS" ) )
	CompletedText:setTTF( "fonts/default.ttf" )
	CompletedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CompletedText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CompletedText )
	self.CompletedText = CompletedText
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, true, 0, 0 )
	TitleBg:setTopBottom( true, false, 66.5, 87.4 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local Title0 = LUI.UITightText.new()
	Title0:setLeftRight( true, false, 5.88, 96.88 )
	Title0:setTopBottom( true, false, 66.5, 86.5 )
	Title0:setText( Engine.Localize( "MENU_DAILY_CHALLENGE" ) )
	Title0:setTTF( "fonts/default.ttf" )
	Title0:setLetterSpacing( 0.5 )
	self:addElement( Title0 )
	self.Title0 = Title0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				bg:completeAnimation()
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )

				Title:completeAnimation()
				self.Title:setAlpha( 1 )
				self.clipFinished( Title, {} )

				PercentCompleteWidget:completeAnimation()
				self.PercentCompleteWidget:setAlpha( 1 )
				self.clipFinished( PercentCompleteWidget, {} )

				CompleteImage:completeAnimation()
				self.CompleteImage:setAlpha( 0 )
				self.clipFinished( CompleteImage, {} )

				CompletedText:completeAnimation()
				self.CompletedText:setAlpha( 0 )
				self.clipFinished( CompletedText, {} )
			end
		},
		Complete = {
			DefaultClip = function ()
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
				self.CompletedText:setLeftRight( false, false, -63.5, 146.5 )
				self.CompletedText:setTopBottom( true, false, 30.88, 55.88 )
				self.CompletedText:setAlpha( 1 )
				self.clipFinished( CompletedText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Complete",
			condition = function ( menu, element, event )
				local f9_local0 = IsLive()
				if f9_local0 then
					f9_local0 = IsZombies()
					if f9_local0 then
						f9_local0 = IsModelValueGreaterThanOrEqualTo( controller, "DailyChallengeWidget.Data.progressPercentage", 1 )
					end
				end
				return f9_local0
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "DailyChallengeWidget.Data.progressPercentage" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "DailyChallengeWidget.Data.progressPercentage"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PercentCompleteWidget:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

