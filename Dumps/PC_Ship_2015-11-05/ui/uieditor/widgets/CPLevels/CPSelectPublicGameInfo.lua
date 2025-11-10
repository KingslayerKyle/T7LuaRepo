require( "ui.uieditor.widgets.CPLevels.CPMissionInfo" )
require( "ui.uieditor.widgets.CPLevels.CP_FrameBox" )
require( "ui.uieditor.widgets.CPLevels.CPMissionTitle" )

CoD.CPSelectPublicGameInfo = InheritFrom( LUI.UIElement )
CoD.CPSelectPublicGameInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CPSelectPublicGameInfo )
	self.id = "CPSelectPublicGameInfo"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 869 )
	self:setTopBottom( true, false, 0, 417 )
	self.anyChildUsesUpdateState = true
	
	local CPMissionInfo = CoD.CPMissionInfo.new( menu, controller )
	CPMissionInfo:setLeftRight( true, false, 0, 869 )
	CPMissionInfo:setTopBottom( true, false, 0, 417 )
	CPMissionInfo.CPMissionTitle:setAlpha( 0 )
	CPMissionInfo:linkToElementModel( self, "mapInfoVis", true, function ( model )
		local mapInfoVis = Engine.GetModelValue( model )
		if mapInfoVis then
			CPMissionInfo:setAlpha( mapInfoVis )
		end
	end )
	CPMissionInfo:linkToElementModel( self, nil, false, function ( model )
		CPMissionInfo:setModel( model, controller )
	end )
	self:addElement( CPMissionInfo )
	self.CPMissionInfo = CPMissionInfo
	
	local InfoImage = LUI.UIImage.new()
	InfoImage:setLeftRight( true, false, 0, 587 )
	InfoImage:setTopBottom( true, false, 0, 279.88 )
	InfoImage:linkToElementModel( self, "Image", true, function ( model )
		local Image = Engine.GetModelValue( model )
		if Image then
			InfoImage:setImage( RegisterImage( Image ) )
		end
	end )
	self:addElement( InfoImage )
	self.InfoImage = InfoImage
	
	local InfoText = LUI.UIText.new()
	InfoText:setLeftRight( true, false, 35, 587 )
	InfoText:setTopBottom( true, false, 350, 372 )
	InfoText:setAlpha( 0.5 )
	InfoText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	InfoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	InfoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	InfoText:linkToElementModel( self, "infoText", true, function ( model )
		local infoText = Engine.GetModelValue( model )
		if infoText then
			InfoText:setText( Engine.Localize( infoText ) )
		end
	end )
	self:addElement( InfoText )
	self.InfoText = InfoText
	
	local PlayerCount = LUI.UIText.new()
	PlayerCount:setLeftRight( true, false, 6, 578 )
	PlayerCount:setTopBottom( true, false, 253.88, 273.88 )
	PlayerCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PlayerCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PlayerCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerCount:linkToElementModel( self, "playerCountText", true, function ( model )
		local playerCountText = Engine.GetModelValue( model )
		if playerCountText then
			PlayerCount:setText( Engine.Localize( playerCountText ) )
		end
	end )
	self:addElement( PlayerCount )
	self.PlayerCount = PlayerCount
	
	local CPFrameBox = CoD.CP_FrameBox.new( menu, controller )
	CPFrameBox:setLeftRight( true, false, 0, 587 )
	CPFrameBox:setTopBottom( true, false, 0, 281 )
	self:addElement( CPFrameBox )
	self.CPFrameBox = CPFrameBox
	
	local CPMissionTitle = CoD.CPMissionTitle.new( menu, controller )
	CPMissionTitle:setLeftRight( true, false, -4.45, 537.55 )
	CPMissionTitle:setTopBottom( true, false, 290.78, 339.78 )
	CPMissionTitle.BriefingHeading:setText( Engine.Localize( "MENU_COOPERATIVE_CAMPAIGN_MISSION" ) )
	self:addElement( CPMissionTitle )
	self.CPMissionTitle = CPMissionTitle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		AnyMission = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				InfoText:completeAnimation()
				self.InfoText:setAlpha( 0.5 )
				self.clipFinished( InfoText, {} )
				CPMissionTitle:completeAnimation()
				self.CPMissionTitle:setAlpha( 1 )
				self.clipFinished( CPMissionTitle, {} )
			end
		},
		CurrentMission = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				CPMissionInfo:completeAnimation()
				CPMissionInfo.CPMissionTitle:completeAnimation()
				self.CPMissionInfo.CPMissionTitle:setAlpha( 1 )
				self.clipFinished( CPMissionInfo, {} )
				InfoText:completeAnimation()
				self.InfoText:setAlpha( 0 )
				self.clipFinished( InfoText, {} )
				CPMissionTitle:completeAnimation()
				self.CPMissionTitle:setAlpha( 0 )
				self.clipFinished( CPMissionTitle, {} )
			end
		},
		SpecificMission = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				InfoText:completeAnimation()
				self.InfoText:setAlpha( 0.5 )
				self.clipFinished( InfoText, {} )
				CPMissionTitle:completeAnimation()
				self.CPMissionTitle:setAlpha( 1 )
				self.clipFinished( CPMissionTitle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AnyMission",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "anyMission" )
			end
		},
		{
			stateName = "CurrentMission",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "currentMission" )
			end
		},
		{
			stateName = "SpecificMission",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "type", "specificMission" )
			end
		}
	} )
	self:linkToElementModel( self, "type", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "type"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPMissionInfo:close()
		element.CPFrameBox:close()
		element.CPMissionTitle:close()
		element.InfoImage:close()
		element.InfoText:close()
		element.PlayerCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

