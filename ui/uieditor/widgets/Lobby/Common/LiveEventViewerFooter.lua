-- 11e0a393da522c9f3a6c0d82381e1db1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.Lobby.Common.LiveEventViewerStreamerCount" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 65 )
	self.anyChildUsesUpdateState = true
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( true, true, -123, 131.5 )
	blackleftBG:setTopBottom( false, true, -40, 149 )
	blackleftBG:setRGB( 0, 0, 0 )
	blackleftBG:setAlpha( 0.6 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, -123, 131.5 )
	LineLeft:setTopBottom( false, true, -41.85, -37.85 )
	LineLeft:setAlpha( 0.55 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	local feLeftContainer = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	feLeftContainer:setLeftRight( true, false, 15, 550 )
	feLeftContainer:setTopBottom( false, true, -48, -4 )
	feLeftContainer:linkToElementModel( self, nil, false, function ( model )
		feLeftContainer:setModel( model, controller )
	end )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	local twitchIcon = CoD.onOffImage.new( menu, controller )
	twitchIcon:setLeftRight( false, true, -36, -11 )
	twitchIcon:setTopBottom( false, true, -32, -7 )
	twitchIcon.image:setImage( RegisterImage( "uie_twitch_icon_white" ) )
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
	self:addElement( twitchIcon )
	self.twitchIcon = twitchIcon
	
	local LiveEventViewerStreamerCount0 = CoD.LiveEventViewerStreamerCount.new( menu, controller )
	LiveEventViewerStreamerCount0:setLeftRight( false, true, -190, -33 )
	LiveEventViewerStreamerCount0:setTopBottom( false, true, -32.5, -7 )
	self:addElement( LiveEventViewerStreamerCount0 )
	self.LiveEventViewerStreamerCount0 = LiveEventViewerStreamerCount0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feLeftContainer:close()
		element.twitchIcon:close()
		element.LiveEventViewerStreamerCount0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

