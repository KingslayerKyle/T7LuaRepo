-- 9b93b755b7d70e0c8bc03e581430edc3
-- This hash is used for caching, delete to decompile the file again

CoD.LiveEventViewerStatusWidget = InheritFrom( LUI.UIElement )
CoD.LiveEventViewerStatusWidget.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 5
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LiveEventViewerStatusWidget )
	self.id = "LiveEventViewerStatusWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 51 )
	self:setTopBottom( true, false, 0, 25 )
	
	local liveLabel = LUI.UITightText.new()
	liveLabel:setLeftRight( true, false, 25, 51 )
	liveLabel:setTopBottom( false, false, -12.5, 12.5 )
	liveLabel:setText( Engine.Localize( "MENU_LIVE_CAPS" ) )
	liveLabel:setTTF( "fonts/default.ttf" )
	self:addElement( liveLabel )
	self.liveLabel = liveLabel
	
	local liveCircle = LUI.UIImage.new()
	liveCircle:setLeftRight( true, false, 0, 20 )
	liveCircle:setTopBottom( false, false, -10, 10 )
	liveCircle:setRGB( 1, 0, 0 )
	liveCircle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_elliptical_ring" ) )
	liveCircle:setShaderVector( 0, 8, 2, 0, 0 )
	liveCircle:setShaderVector( 1, 20, 20, 0, 0 )
	liveCircle:setShaderVector( 2, 0.2, 0.2, 0, 0 )
	self:addElement( liveCircle )
	self.liveCircle = liveCircle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				liveLabel:completeAnimation()
				self.liveLabel:setAlpha( 0 )
				self.clipFinished( liveLabel, {} )

				liveCircle:completeAnimation()
				self.liveCircle:setAlpha( 0 )
				self.clipFinished( liveCircle, {} )
			end,
			ShowPrompts = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Live = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				liveLabel:completeAnimation()
				self.liveLabel:setAlpha( 1 )
				self.liveLabel:setText( Engine.Localize( "MENU_LIVE_CAPS" ) )
				self.clipFinished( liveLabel, {} )

				liveCircle:completeAnimation()
				self.liveCircle:setRGB( 1, 0, 0 )
				self.liveCircle:setAlpha( 1 )
				self.clipFinished( liveCircle, {} )
			end
		},
		Replay = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				liveLabel:completeAnimation()
				self.liveLabel:setAlpha( 1 )
				self.liveLabel:setText( Engine.Localize( "MENU_REPLAY_CAPS" ) )
				self.clipFinished( liveLabel, {} )

				liveCircle:completeAnimation()
				self.liveCircle:setRGB( 0.02, 1, 0 )
				self.liveCircle:setAlpha( 1 )
				self.clipFinished( liveCircle, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Live",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "liveEventViewer.liveState", Enum.HlsChannelState_e.HLS_CHANNEL_STATE_LIVE )
			end
		},
		{
			stateName = "Replay",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualToEnum( element, controller, "liveEventViewer.liveState", Enum.HlsChannelState_e.HLS_CHANNEL_STATE_REPLAY )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "liveEventViewer.liveState" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "liveEventViewer.liveState"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

