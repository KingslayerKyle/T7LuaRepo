require( "ui.uieditor.widgets.Lobby.Common.LiveEventViewerStatusWidget" )
require( "ui.uieditor.widgets.onOffImage" )

CoD.FE_LiveEventFeatureCard = InheritFrom( LUI.UIElement )
CoD.FE_LiveEventFeatureCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LiveEventFeatureCard )
	self.id = "FE_LiveEventFeatureCard"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( 0, 0, 0, 459 )
	self:setTopBottom( 0, 0, 0, 130 )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( 0, 1, 0, 0 )
	backing:setTopBottom( 0, 1, 0, 0 )
	backing:setImage( RegisterImage( "t7_crm_mp_featured_live_worldleague" ) )
	self:addElement( backing )
	self.backing = backing
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 0, 1, 0, 0 )
	TitleBg:setTopBottom( 0, 0, 100, 131 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0, 0, 9, 309 )
	Title:setTopBottom( 0, 0, 100, 130 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setLetterSpacing( 0.5 )
	Title:subscribeToGlobalModel( controller, "LiveEventViewer", "title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Title:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local twitchIcon = CoD.onOffImage.new( menu, controller )
	twitchIcon:mergeStateConditions( {
		{
			stateName = "On",
			condition = function ( menu, element, event )
				return not IsMLGStream( controller )
			end
		}
	} )
	twitchIcon:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "liveEventViewer.stream" ), function ( model )
		menu:updateElementState( twitchIcon, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "liveEventViewer.stream"
		} )
	end )
	twitchIcon:setLeftRight( 0, 0, 421, 451 )
	twitchIcon:setTopBottom( 0, 0, 7, 37 )
	twitchIcon.image:setImage( RegisterImage( "uie_twitch_icon_white" ) )
	self:addElement( twitchIcon )
	self.twitchIcon = twitchIcon
	
	local LiveEventViewerStatusWidget0 = CoD.LiveEventViewerStatusWidget.new( menu, controller )
	LiveEventViewerStatusWidget0:setLeftRight( 1, 1, -84, -8 )
	LiveEventViewerStatusWidget0:setTopBottom( 0, 0, 7, 45 )
	self:addElement( LiveEventViewerStatusWidget0 )
	self.LiveEventViewerStatusWidget0 = LiveEventViewerStatusWidget0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.twitchIcon:close()
		self.LiveEventViewerStatusWidget0:close()
		self.Title:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

