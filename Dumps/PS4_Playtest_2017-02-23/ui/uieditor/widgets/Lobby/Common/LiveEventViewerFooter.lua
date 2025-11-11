require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Lobby.Common.LiveEventViewerStreamerCount" )
require( "ui.uieditor.widgets.onOffImage" )

CoD.LiveEventViewerFooter = InheritFrom( LUI.UIElement )
CoD.LiveEventViewerFooter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LiveEventViewerFooter )
	self.id = "LiveEventViewerFooter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( 0, 1, -185, 197 )
	blackleftBG:setTopBottom( 1, 1, -60, 224 )
	blackleftBG:setRGB( 0, 0, 0 )
	blackleftBG:setAlpha( 0.6 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( 0, 1, -185, 197 )
	LineLeft:setTopBottom( 1, 1, -63, -57 )
	LineLeft:setAlpha( 0.55 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	local feLeftContainer = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	feLeftContainer:setLeftRight( 0, 0, 23, 825 )
	feLeftContainer:setTopBottom( 1, 1, -72, -6 )
	feLeftContainer:linkToElementModel( self, nil, false, function ( model )
		feLeftContainer:setModel( model, controller )
	end )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
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
	twitchIcon:setLeftRight( 1, 1, -54, -16 )
	twitchIcon:setTopBottom( 1, 1, -48, -10 )
	twitchIcon.image:setImage( RegisterImage( "uie_twitch_icon_white" ) )
	self:addElement( twitchIcon )
	self.twitchIcon = twitchIcon
	
	local LiveEventViewerStreamerCount0 = CoD.LiveEventViewerStreamerCount.new( menu, controller )
	LiveEventViewerStreamerCount0:setLeftRight( 1, 1, -285, -49 )
	LiveEventViewerStreamerCount0:setTopBottom( 1, 1, -49, -11 )
	self:addElement( LiveEventViewerStreamerCount0 )
	self.LiveEventViewerStreamerCount0 = LiveEventViewerStreamerCount0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.feLeftContainer:close()
		self.twitchIcon:close()
		self.LiveEventViewerStreamerCount0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

