-- 9a79bbff4600427ad4549e0214a0d98e
-- This hash is used for caching, delete to decompile the file again

CoD.StartMenu_ConnectionMeter_PacketLossImage = InheritFrom( LUI.UIElement )
CoD.StartMenu_ConnectionMeter_PacketLossImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.StartMenu_ConnectionMeter_PacketLossImage )
	self.id = "StartMenu_ConnectionMeter_PacketLossImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 29 )
	self:setTopBottom( true, false, 0, 31 )
	
	local Level1Image = LUI.UIImage.new()
	Level1Image:setLeftRight( true, false, 0, 29 )
	Level1Image:setTopBottom( true, false, 0, 31 )
	Level1Image:setAlpha( 0 )
	Level1Image:setImage( RegisterImage( "uie_t7_icon_network_packet1" ) )
	self:addElement( Level1Image )
	self.Level1Image = Level1Image
	
	local Level2Image = LUI.UIImage.new()
	Level2Image:setLeftRight( true, false, 0, 29 )
	Level2Image:setTopBottom( true, false, 0, 31 )
	Level2Image:setAlpha( 0 )
	Level2Image:setImage( RegisterImage( "uie_t7_icon_network_packet2" ) )
	self:addElement( Level2Image )
	self.Level2Image = Level2Image
	
	local Level3Image = LUI.UIImage.new()
	Level3Image:setLeftRight( true, false, 0, 29 )
	Level3Image:setTopBottom( true, false, 0, 31 )
	Level3Image:setAlpha( 0 )
	Level3Image:setImage( RegisterImage( "uie_t7_icon_network_packet3" ) )
	self:addElement( Level3Image )
	self.Level3Image = Level3Image
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )

				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )

				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
			end
		},
		Level1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 1 )
				self.clipFinished( Level1Image, {} )

				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )

				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
			end
		},
		Level2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )

				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 1 )
				self.clipFinished( Level2Image, {} )

				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 0 )
				self.clipFinished( Level3Image, {} )
			end
		},
		Level3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				Level1Image:completeAnimation()
				self.Level1Image:setAlpha( 0 )
				self.clipFinished( Level1Image, {} )

				Level2Image:completeAnimation()
				self.Level2Image:setAlpha( 0 )
				self.clipFinished( Level2Image, {} )

				Level3Image:completeAnimation()
				self.Level3Image:setAlpha( 1 )
				self.clipFinished( Level3Image, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Level1",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "NETSTATS_PACKETLOSS", 5 )
			end
		},
		{
			stateName = "Level2",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "NETSTATS_PACKETLOSS", 2 ) and IsSelfModelValueLessThan( element, controller, "NETSTATS_PACKETLOSS", 5 )
			end
		},
		{
			stateName = "Level3",
			condition = function ( menu, element, event )
				return IsSelfModelValueGreaterThanOrEqualTo( element, controller, "NETSTATS_PACKETLOSS", 0 ) and IsSelfModelValueLessThan( element, controller, "NETSTATS_PACKETLOSS", 2 )
			end
		}
	} )
	self:linkToElementModel( self, "NETSTATS_PACKETLOSS", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "NETSTATS_PACKETLOSS"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

