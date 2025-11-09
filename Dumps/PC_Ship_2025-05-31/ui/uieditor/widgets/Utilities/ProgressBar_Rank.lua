require( "ui.uieditor.widgets.AAR.XPbarFrame" )

CoD.ProgressBar_Rank = InheritFrom( LUI.UIElement )
CoD.ProgressBar_Rank.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ProgressBar_Rank )
	self.id = "ProgressBar_Rank"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 1150 )
	self:setTopBottom( true, false, 0, 65 )
	self.anyChildUsesUpdateState = true
	
	local XpBarBg = LUI.UIImage.new()
	XpBarBg:setLeftRight( true, true, 121, -118 )
	XpBarBg:setTopBottom( true, false, 27, 42 )
	XpBarBg:setRGB( 0.62, 0.62, 0.62 )
	XpBarBg:setAlpha( 0.28 )
	self:addElement( XpBarBg )
	self.XpBarBg = XpBarBg
	
	local XpBarFrame = CoD.XPbarFrame.new( menu, controller )
	XpBarFrame:setLeftRight( true, true, 119, -116 )
	XpBarFrame:setTopBottom( true, false, 23, 46 )
	self:addElement( XpBarFrame )
	self.XpBarFrame = XpBarFrame
	
	local curRank = LUI.UIText.new()
	curRank:setLeftRight( true, false, 62, 110 )
	curRank:setTopBottom( false, true, -42, -18 )
	curRank:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	curRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	curRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	curRank:subscribeToGlobalModel( controller, "XPProgressionBar", "currentRank", function ( model )
		local currentRank = Engine.GetModelValue( model )
		if currentRank then
			curRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, currentRank ) )
		end
	end )
	curRank:subscribeToGlobalModel( controller, "XPProgressionBar", "currentRank", function ( model )
		local currentRank = Engine.GetModelValue( model )
		if currentRank then
			curRank:setText( Engine.Localize( currentRank ) )
		end
	end )
	self:addElement( curRank )
	self.curRank = curRank
	
	local curRankImg = LUI.UIImage.new()
	curRankImg:setLeftRight( true, false, -0.5, 62 )
	curRankImg:setTopBottom( false, true, -59, -3 )
	curRankImg:subscribeToGlobalModel( controller, "XPProgressionBar", "currentRankIcon", function ( model )
		local currentRankIcon = Engine.GetModelValue( model )
		if currentRankIcon then
			curRankImg:setImage( RegisterImage( GetRankIconLarge( currentRankIcon ) ) )
		end
	end )
	self:addElement( curRankImg )
	self.curRankImg = curRankImg
	
	local progress = LUI.UIImage.new()
	progress:setLeftRight( true, true, 121, -118 )
	progress:setTopBottom( true, false, 27, 42 )
	progress:setRGB( 1, 0.35, 0 )
	progress:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	progress:setShaderVector( 1, 0, 0, 0, 0 )
	progress:setShaderVector( 2, 1, 0, 0, 0 )
	progress:setShaderVector( 3, 0, 0, 0, 0 )
	progress:subscribeToGlobalModel( controller, "XPProgressionBar", "progress", function ( model )
		local _progress = Engine.GetModelValue( model )
		if _progress then
			progress:setShaderVector( 0, CoD.GetVectorComponentFromString( _progress, 1 ), CoD.GetVectorComponentFromString( _progress, 2 ), CoD.GetVectorComponentFromString( _progress, 3 ), CoD.GetVectorComponentFromString( _progress, 4 ) )
		end
	end )
	self:addElement( progress )
	self.progress = progress
	
	local nextRank = LUI.UIText.new()
	nextRank:setLeftRight( false, true, -112, -64 )
	nextRank:setTopBottom( false, true, -41, -17 )
	nextRank:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	nextRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	nextRank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	nextRank:subscribeToGlobalModel( controller, "XPProgressionBar", "nextRank", function ( model )
		local _nextRank = Engine.GetModelValue( model )
		if _nextRank then
			nextRank:setRGB( SetToParagonColorIfPrestigeMasterByRank( 255, 255, 255, _nextRank ) )
		end
	end )
	nextRank:subscribeToGlobalModel( controller, "XPProgressionBar", "nextRank", function ( model )
		local _nextRank = Engine.GetModelValue( model )
		if _nextRank then
			nextRank:setText( Engine.Localize( _nextRank ) )
		end
	end )
	self:addElement( nextRank )
	self.nextRank = nextRank
	
	local nextRankImage = LUI.UIImage.new()
	nextRankImage:setLeftRight( false, true, -64, 0 )
	nextRankImage:setTopBottom( false, true, -58.5, -2.5 )
	nextRankImage:subscribeToGlobalModel( controller, "XPProgressionBar", "nextRankIcon", function ( model )
		local nextRankIcon = Engine.GetModelValue( model )
		if nextRankIcon then
			nextRankImage:setImage( RegisterImage( GetRankIconLarge( nextRankIcon ) ) )
		end
	end )
	self:addElement( nextRankImage )
	self.nextRankImage = nextRankImage
	
	local nextRankDesc = LUI.UIText.new()
	nextRankDesc:setLeftRight( false, true, -193.13, -118.13 )
	nextRankDesc:setTopBottom( true, false, 2.5, 22.5 )
	nextRankDesc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextRankDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	nextRankDesc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	nextRankDesc:subscribeToGlobalModel( controller, "XPProgressionBar", "xpToNextRank", function ( model )
		local xpToNextRank = Engine.GetModelValue( model )
		if xpToNextRank then
			nextRankDesc:setText( LocalizeIntoString( "MPUI_N_XP", xpToNextRank ) )
		end
	end )
	self:addElement( nextRankDesc )
	self.nextRankDesc = nextRankDesc
	
	local nextRankDesc0 = LUI.UIText.new()
	nextRankDesc0:setLeftRight( false, true, -322.13, -193.13 )
	nextRankDesc0:setTopBottom( true, false, 2, 22 )
	nextRankDesc0:setText( Engine.Localize( "MENU_NEXT_LEVEL" ) )
	nextRankDesc0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextRankDesc0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	nextRankDesc0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( nextRankDesc0 )
	self.nextRankDesc0 = nextRankDesc0
	
	local nextRankDesc00 = LUI.UIText.new()
	nextRankDesc00:setLeftRight( false, true, -316.13, -187.13 )
	nextRankDesc00:setTopBottom( true, false, 2, 22 )
	nextRankDesc00:setText( Engine.Localize( ":" ) )
	nextRankDesc00:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	nextRankDesc00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	nextRankDesc00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( nextRankDesc00 )
	self.nextRankDesc00 = nextRankDesc00
	
	local maxRankTextBox = LUI.UIText.new()
	maxRankTextBox:setLeftRight( false, true, -104, -27 )
	maxRankTextBox:setTopBottom( false, true, -41, -17 )
	maxRankTextBox:setAlpha( 0 )
	maxRankTextBox:setText( Engine.Localize( "MPUI_MAX_CAPS" ) )
	maxRankTextBox:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	maxRankTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	maxRankTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( maxRankTextBox )
	self.maxRankTextBox = maxRankTextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				XpBarBg:completeAnimation()
				self.XpBarBg:setAlpha( 0.28 )
				self.clipFinished( XpBarBg, {} )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 1 )
				self.clipFinished( XpBarFrame, {} )
				curRank:completeAnimation()
				self.curRank:setAlpha( 1 )
				self.clipFinished( curRank, {} )
				curRankImg:completeAnimation()
				self.curRankImg:setAlpha( 1 )
				self.clipFinished( curRankImg, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 1 )
				self.clipFinished( progress, {} )
				nextRank:completeAnimation()
				self.nextRank:setAlpha( 1 )
				self.clipFinished( nextRank, {} )
				nextRankImage:completeAnimation()
				self.nextRankImage:setAlpha( 1 )
				self.clipFinished( nextRankImage, {} )
				nextRankDesc:completeAnimation()
				self.nextRankDesc:setAlpha( 1 )
				self.clipFinished( nextRankDesc, {} )
				nextRankDesc0:completeAnimation()
				self.nextRankDesc0:setAlpha( 1 )
				self.clipFinished( nextRankDesc0, {} )
				nextRankDesc00:completeAnimation()
				self.nextRankDesc00:setAlpha( 1 )
				self.clipFinished( nextRankDesc00, {} )
				maxRankTextBox:completeAnimation()
				self.maxRankTextBox:setAlpha( 0 )
				self.clipFinished( maxRankTextBox, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				XpBarBg:completeAnimation()
				self.XpBarBg:setAlpha( 0 )
				self.clipFinished( XpBarBg, {} )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 0 )
				self.clipFinished( XpBarFrame, {} )
				curRank:completeAnimation()
				self.curRank:setAlpha( 0 )
				self.clipFinished( curRank, {} )
				curRankImg:completeAnimation()
				self.curRankImg:setAlpha( 0 )
				self.clipFinished( curRankImg, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 0 )
				self.clipFinished( progress, {} )
				nextRank:completeAnimation()
				self.nextRank:setAlpha( 0 )
				self.clipFinished( nextRank, {} )
				nextRankImage:completeAnimation()
				self.nextRankImage:setAlpha( 0 )
				self.clipFinished( nextRankImage, {} )
				nextRankDesc:completeAnimation()
				self.nextRankDesc:setAlpha( 0 )
				self.clipFinished( nextRankDesc, {} )
				nextRankDesc0:completeAnimation()
				self.nextRankDesc0:setAlpha( 0 )
				self.clipFinished( nextRankDesc0, {} )
				nextRankDesc00:completeAnimation()
				self.nextRankDesc00:setAlpha( 0 )
				self.clipFinished( nextRankDesc00, {} )
				maxRankTextBox:completeAnimation()
				self.maxRankTextBox:setAlpha( 0 )
				self.clipFinished( maxRankTextBox, {} )
			end
		},
		MaxLevelCP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				XpBarBg:completeAnimation()
				self.XpBarBg:setAlpha( 0.28 )
				self.clipFinished( XpBarBg, {} )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 1 )
				self.clipFinished( XpBarFrame, {} )
				curRank:completeAnimation()
				self.curRank:setAlpha( 1 )
				self.clipFinished( curRank, {} )
				curRankImg:completeAnimation()
				self.curRankImg:setAlpha( 1 )
				self.clipFinished( curRankImg, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 0 )
				self.clipFinished( progress, {} )
				nextRank:completeAnimation()
				self.nextRank:setAlpha( 0 )
				self.clipFinished( nextRank, {} )
				nextRankImage:completeAnimation()
				self.nextRankImage:setAlpha( 0 )
				self.clipFinished( nextRankImage, {} )
				nextRankDesc:completeAnimation()
				self.nextRankDesc:setAlpha( 0 )
				self.clipFinished( nextRankDesc, {} )
				nextRankDesc0:completeAnimation()
				self.nextRankDesc0:setAlpha( 0 )
				self.clipFinished( nextRankDesc0, {} )
				nextRankDesc00:completeAnimation()
				self.nextRankDesc00:setAlpha( 0 )
				self.clipFinished( nextRankDesc00, {} )
				maxRankTextBox:completeAnimation()
				self.maxRankTextBox:setLeftRight( false, true, -104, -27 )
				self.maxRankTextBox:setTopBottom( false, true, -41, -17 )
				self.maxRankTextBox:setAlpha( 0 )
				self.maxRankTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
				self.clipFinished( maxRankTextBox, {} )
			end
		},
		MaxLevel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				XpBarBg:completeAnimation()
				self.XpBarBg:setAlpha( 0.28 )
				self.clipFinished( XpBarBg, {} )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 1 )
				self.clipFinished( XpBarFrame, {} )
				curRank:completeAnimation()
				self.curRank:setAlpha( 1 )
				self.clipFinished( curRank, {} )
				curRankImg:completeAnimation()
				self.curRankImg:setAlpha( 1 )
				self.clipFinished( curRankImg, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 1 )
				self.clipFinished( progress, {} )
				nextRank:completeAnimation()
				self.nextRank:setAlpha( 0 )
				self.clipFinished( nextRank, {} )
				nextRankImage:completeAnimation()
				self.nextRankImage:setAlpha( 0 )
				self.clipFinished( nextRankImage, {} )
				nextRankDesc:completeAnimation()
				self.nextRankDesc:setAlpha( 1 )
				self.clipFinished( nextRankDesc, {} )
				nextRankDesc0:completeAnimation()
				self.nextRankDesc0:setAlpha( 1 )
				self.clipFinished( nextRankDesc0, {} )
				nextRankDesc00:completeAnimation()
				self.nextRankDesc00:setAlpha( 1 )
				self.clipFinished( nextRankDesc00, {} )
				maxRankTextBox:completeAnimation()
				self.maxRankTextBox:setAlpha( 1 )
				self.clipFinished( maxRankTextBox, {} )
			end
		},
		MaxParagonLevel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 11 )
				XpBarBg:completeAnimation()
				self.XpBarBg:setAlpha( 0 )
				self.clipFinished( XpBarBg, {} )
				XpBarFrame:completeAnimation()
				self.XpBarFrame:setAlpha( 0 )
				self.clipFinished( XpBarFrame, {} )
				curRank:completeAnimation()
				self.curRank:setAlpha( 0 )
				self.clipFinished( curRank, {} )
				curRankImg:completeAnimation()
				self.curRankImg:setAlpha( 0 )
				self.clipFinished( curRankImg, {} )
				progress:completeAnimation()
				self.progress:setAlpha( 0 )
				self.clipFinished( progress, {} )
				nextRank:completeAnimation()
				self.nextRank:setAlpha( 0 )
				self.clipFinished( nextRank, {} )
				nextRankImage:completeAnimation()
				self.nextRankImage:setAlpha( 0 )
				self.clipFinished( nextRankImage, {} )
				nextRankDesc:completeAnimation()
				self.nextRankDesc:setAlpha( 0 )
				self.clipFinished( nextRankDesc, {} )
				nextRankDesc0:completeAnimation()
				self.nextRankDesc0:setAlpha( 0 )
				self.clipFinished( nextRankDesc0, {} )
				nextRankDesc00:completeAnimation()
				self.nextRankDesc00:setAlpha( 0 )
				self.clipFinished( nextRankDesc00, {} )
				maxRankTextBox:completeAnimation()
				self.maxRankTextBox:setAlpha( 0 )
				self.clipFinished( maxRankTextBox, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return IsLobbyNetworkModeLAN()
			end
		},
		{
			stateName = "MaxLevelCP",
			condition = function ( menu, element, event )
				return IsModelValueGreaterThan( controller, "XPProgressionBar.nextRank", CoD.MAX_RANK + 1 ) and IsCampaign()
			end
		},
		{
			stateName = "MaxLevel",
			condition = function ( menu, element, event )
				local f17_local0
				if not IsMaxPrestigeLevel( controller ) then
					f17_local0 = IsModelValueGreaterThan( controller, "XPProgressionBar.nextRank", CoD.MAX_RANK + 1 )
				else
					f17_local0 = false
				end
				return f17_local0
			end
		},
		{
			stateName = "MaxParagonLevel",
			condition = function ( menu, element, event )
				local f18_local0 = IsInParagonCapableGameMode()
				if f18_local0 then
					f18_local0 = IsMaxPrestigeLevel( controller )
					if f18_local0 then
						f18_local0 = IsModelValueGreaterThan( controller, "XPProgressionBar.nextRank", CoD.MAX_PARAGON_RANK + CoD.MAX_RANK + 2 )
					end
				end
				return f18_local0
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "XPProgressionBar.nextRank" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "XPProgressionBar.nextRank"
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.XpBarFrame:close()
		element.curRank:close()
		element.curRankImg:close()
		element.progress:close()
		element.nextRank:close()
		element.nextRankImage:close()
		element.nextRankDesc:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

