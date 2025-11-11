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
	self:setLeftRight( 0, 0, 0, 235 )
	self:setTopBottom( 0, 0, 0, 39 )
	
	local streamerCountIcon = LUI.UIImage.new()
	streamerCountIcon:setLeftRight( 1, 1, -236, -198 )
	streamerCountIcon:setTopBottom( 1, 1, -38, 0 )
	streamerCountIcon:setImage( RegisterImage( "uie_twitch_streamers_white" ) )
	self:addElement( streamerCountIcon )
	self.streamerCountIcon = streamerCountIcon
	
	local streamerCount = CoD.ArabicAlignTextBox.new( menu, controller )
	streamerCount:setLeftRight( 1, 1, -198, 0 )
	streamerCount:setTopBottom( 1, 1, -35.5, -2.5 )
	streamerCount.textBox:setTTF( "fonts/default.ttf" )
	streamerCount.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	streamerCount:subscribeToGlobalModel( controller, "LiveEventViewer", "viewers", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			streamerCount.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( streamerCount )
	self.streamerCount = streamerCount
	
	self.resetProperties = function ()
		streamerCountIcon:completeAnimation()
		streamerCount:completeAnimation()
		streamerCountIcon:setAlpha( 1 )
		streamerCount:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoViewers = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.streamerCount:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

