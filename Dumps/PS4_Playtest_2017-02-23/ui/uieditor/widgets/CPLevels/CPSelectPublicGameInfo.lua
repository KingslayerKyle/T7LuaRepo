require( "ui.uieditor.widgets.CPLevels.CP_FrameBox" )
require( "ui.uieditor.widgets.CPLevels.CPMissionInfo" )
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
	self:setLeftRight( 0, 0, 0, 1303 )
	self:setTopBottom( 0, 0, 0, 625 )
	self.anyChildUsesUpdateState = true
	
	local CPMissionInfo = CoD.CPMissionInfo.new( menu, controller )
	CPMissionInfo:setLeftRight( 0, 0, 0, 1304 )
	CPMissionInfo:setTopBottom( 0, 0, 0, 626 )
	CPMissionInfo.CPMissionTitle:setAlpha( 0 )
	CPMissionInfo:linkToElementModel( self, "mapInfoVis", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CPMissionInfo:setAlpha( modelValue )
		end
	end )
	CPMissionInfo:linkToElementModel( self, nil, false, function ( model )
		CPMissionInfo:setModel( model, controller )
	end )
	self:addElement( CPMissionInfo )
	self.CPMissionInfo = CPMissionInfo
	
	local InfoImage = LUI.UIImage.new()
	InfoImage:setLeftRight( 0, 0, 0, 880 )
	InfoImage:setTopBottom( 0, 0, 0, 420 )
	InfoImage:linkToElementModel( self, "Image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InfoImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( InfoImage )
	self.InfoImage = InfoImage
	
	local InfoText = LUI.UIText.new()
	InfoText:setLeftRight( 0, 0, 52, 880 )
	InfoText:setTopBottom( 0, 0, 525, 558 )
	InfoText:setAlpha( 0.5 )
	InfoText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	InfoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	InfoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	InfoText:linkToElementModel( self, "infoText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			InfoText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( InfoText )
	self.InfoText = InfoText
	
	local PlayerCount = LUI.UIText.new()
	PlayerCount:setLeftRight( 0, 0, 9, 867 )
	PlayerCount:setTopBottom( 0, 0, 381, 411 )
	PlayerCount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	PlayerCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PlayerCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerCount:linkToElementModel( self, "playerCountText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerCount:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( PlayerCount )
	self.PlayerCount = PlayerCount
	
	local CPFrameBox = CoD.CP_FrameBox.new( menu, controller )
	CPFrameBox:setLeftRight( 0, 0, 0, 880 )
	CPFrameBox:setTopBottom( 0, 0, 0, 422 )
	self:addElement( CPFrameBox )
	self.CPFrameBox = CPFrameBox
	
	local CPMissionTitle = CoD.CPMissionTitle.new( menu, controller )
	CPMissionTitle:setLeftRight( 0, 0, -6.5, 806.5 )
	CPMissionTitle:setTopBottom( 0, 0, 436, 510 )
	CPMissionTitle.BriefingHeading:setText( Engine.Localize( "MENU_COOPERATIVE_CAMPAIGN_MISSION" ) )
	self:addElement( CPMissionTitle )
	self.CPMissionTitle = CPMissionTitle
	
	self.resetProperties = function ()
		InfoText:completeAnimation()
		CPMissionTitle:completeAnimation()
		CPMissionInfo:completeAnimation()
		InfoText:setAlpha( 0.5 )
		CPMissionTitle:setAlpha( 1 )
		CPMissionInfo.CPMissionTitle:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		AnyMission = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		CurrentMission = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CPMissionInfo:close()
		self.CPFrameBox:close()
		self.CPMissionTitle:close()
		self.InfoImage:close()
		self.InfoText:close()
		self.PlayerCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

