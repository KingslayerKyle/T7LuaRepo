require( "ui.uieditor.widgets.ArabicAlignTextBox" )

CoD.LiveEventViewerStreamerCount = InheritFrom( LUI.UIElement )
CoD.LiveEventViewerStreamerCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LiveEventViewerStreamerCount )
	self.id = "LiveEventViewerStreamerCount"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 157 )
	self:setTopBottom( true, false, 0, 26 )
	self.anyChildUsesUpdateState = true
	
	local streamerCountIcon = LUI.UIImage.new()
	streamerCountIcon:setLeftRight( false, true, -157, -132 )
	streamerCountIcon:setTopBottom( false, true, -25.5, 0 )
	streamerCountIcon:setImage( RegisterImage( "uie_twitch_streamers_white" ) )
	self:addElement( streamerCountIcon )
	self.streamerCountIcon = streamerCountIcon
	
	local streamerCount = CoD.ArabicAlignTextBox.new( menu, controller )
	streamerCount:setLeftRight( false, true, -132, 0 )
	streamerCount:setTopBottom( false, true, -23.75, -1.75 )
	streamerCount.textBox:setTTF( "fonts/default.ttf" )
	streamerCount.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	streamerCount:subscribeToGlobalModel( controller, "LiveEventViewer", "viewers", function ( model )
		local viewers = Engine.GetModelValue( model )
		if viewers then
			streamerCount.textBox:setText( Engine.Localize( viewers ) )
		end
	end )
	self:addElement( streamerCount )
	self.streamerCount = streamerCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				streamerCountIcon:completeAnimation()
				self.streamerCountIcon:setAlpha( 1 )
				self.clipFinished( streamerCountIcon, {} )
				streamerCount:completeAnimation()
				self.streamerCount:setAlpha( 1 )
				self.clipFinished( streamerCount, {} )
			end
		},
		NoViewers = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				streamerCountIcon:completeAnimation()
				self.streamerCountIcon:setAlpha( 0 )
				self.clipFinished( streamerCountIcon, {} )
				streamerCount:completeAnimation()
				self.streamerCount:setAlpha( 0 )
				self.clipFinished( streamerCount, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoViewers",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "liveEventViewer.viewers", 0 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "liveEventViewer.viewers" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "liveEventViewer.viewers"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.streamerCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

