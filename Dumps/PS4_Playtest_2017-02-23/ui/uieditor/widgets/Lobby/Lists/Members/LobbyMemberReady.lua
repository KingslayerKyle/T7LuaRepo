CoD.LobbyMemberReady = InheritFrom( LUI.UIElement )
CoD.LobbyMemberReady.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberReady )
	self.id = "LobbyMemberReady"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 37 )
	self:setTopBottom( 0, 0, 0, 37 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local readyImage = LUI.UIImage.new()
	readyImage:setLeftRight( 0, 0, 5, 33 )
	readyImage:setTopBottom( 0, 0, 5, 33 )
	readyImage:setRGB( 1, 0, 0 )
	readyImage:setImage( RegisterImage( "uie_t7_icon_zm_ready_go" ) )
	self:addElement( readyImage )
	self.readyImage = readyImage
	
	local readyImage0 = LUI.UIImage.new()
	readyImage0:setLeftRight( 0, 0, 5, 33 )
	readyImage0:setTopBottom( 0, 0, 5, 33 )
	readyImage0:setRGB( 1, 0, 0 )
	readyImage0:setAlpha( 0.15 )
	readyImage0:setImage( RegisterImage( "uie_t7_icon_zm_ready_go" ) )
	readyImage0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( readyImage0 )
	self.readyImage0 = readyImage0
	
	local readyRing = LUI.UIImage.new()
	readyRing:setLeftRight( 0, 0, 2, 36 )
	readyRing:setTopBottom( 0, 0, 2, 36 )
	readyRing:setAlpha( 0.6 )
	readyRing:setImage( RegisterImage( "uie_t7_icon_zm_ready_go_ring" ) )
	self:addElement( readyRing )
	self.readyRing = readyRing
	
	self.resetProperties = function ()
		readyImage:completeAnimation()
		readyRing:completeAnimation()
		readyImage0:completeAnimation()
		readyImage:setRGB( 1, 0, 0 )
		readyImage:setAlpha( 1 )
		readyRing:setAlpha( 0.6 )
		readyImage0:setRGB( 1, 0, 0 )
		readyImage0:setAlpha( 0.15 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				readyImage:completeAnimation()
				self.readyImage:setAlpha( 0 )
				self.clipFinished( readyImage, {} )
				readyImage0:completeAnimation()
				self.readyImage0:setAlpha( 0 )
				self.clipFinished( readyImage0, {} )
				readyRing:completeAnimation()
				self.readyRing:setAlpha( 0 )
				self.clipFinished( readyRing, {} )
			end
		},
		IsReady = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				readyImage:completeAnimation()
				self.readyImage:setRGB( 0, 0.87, 0.1 )
				self.clipFinished( readyImage, {} )
				readyImage0:completeAnimation()
				self.readyImage0:setRGB( 0, 0.87, 0.1 )
				self.clipFinished( readyImage0, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "IsReady",
			condition = function ( menu, element, event )
				return PlayerIsReady( element, menu, controller )
			end
		},
		{
			stateName = "Ready",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	self:linkToElementModel( self, "isReady", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isReady"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

