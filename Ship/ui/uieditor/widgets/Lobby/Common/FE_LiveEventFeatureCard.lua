-- 5b91c7c69464ecb2a61b224d5b117367
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.onOffImage" )
require( "ui.uieditor.widgets.Lobby.Common.LiveEventViewerStatusWidget" )

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
	self:setForceMouseEventDispatch( true )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		if FeaturedCards_IsEnabled( f2_arg0, controller ) then
			FeaturedCardsActionButtonHandler( menu, f2_arg0, controller, "", menu )
		end
		return true
	end
	
	if f1_local0 then
		self:registerEventHandler( "leftmouseup", f1_local0 )
	end
end

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
	self:setLeftRight( true, false, 0, 306 )
	self:setTopBottom( true, false, 0, 87 )
	self.anyChildUsesUpdateState = true
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, true, 0, 0 )
	backing:setTopBottom( true, true, 0, 0 )
	backing:subscribeToGlobalModel( controller, "LiveEventViewer", "stream", function ( model )
		local stream = Engine.GetModelValue( model )
		if stream then
			backing:setImage( RegisterImage( GetLiveEventViewerImage( stream ) ) )
		end
	end )
	self:addElement( backing )
	self.backing = backing
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, true, 0, 0 )
	TitleBg:setTopBottom( true, false, 66.5, 87.4 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( true, false, 5.88, 205.88 )
	Title:setTopBottom( true, false, 66.5, 86.5 )
	Title:setTTF( "fonts/default.ttf" )
	Title:setLetterSpacing( 0.5 )
	Title:subscribeToGlobalModel( controller, "LiveEventViewer", "title", function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			Title:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( Title )
	self.Title = Title
	
	local twitchIcon = CoD.onOffImage.new( menu, controller )
	twitchIcon:setLeftRight( true, false, 281, 301 )
	twitchIcon:setTopBottom( true, false, 5, 25 )
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
	
	local LiveEventViewerStatusWidget0 = CoD.LiveEventViewerStatusWidget.new( menu, controller )
	LiveEventViewerStatusWidget0:setLeftRight( false, true, -56, -5 )
	LiveEventViewerStatusWidget0:setTopBottom( true, false, 5, 30 )
	self:addElement( LiveEventViewerStatusWidget0 )
	self.LiveEventViewerStatusWidget0 = LiveEventViewerStatusWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				backing:completeAnimation()
				self.backing:setAlpha( 1 )
				self.clipFinished( backing, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 1 )

				backing:completeAnimation()
				self.backing:setAlpha( 1 )
				self.clipFinished( backing, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.twitchIcon:close()
		element.LiveEventViewerStatusWidget0:close()
		element.backing:close()
		element.Title:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
