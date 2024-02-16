-- 01543957dc7cd2166581b33515d21763
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 25 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local readyImage = LUI.UIImage.new()
	readyImage:setLeftRight( true, false, 3, 22 )
	readyImage:setTopBottom( true, false, 3, 22 )
	readyImage:setRGB( 1, 0, 0 )
	readyImage:setImage( RegisterImage( "uie_t7_icon_zm_ready_go" ) )
	self:addElement( readyImage )
	self.readyImage = readyImage
	
	local readyImage0 = LUI.UIImage.new()
	readyImage0:setLeftRight( true, false, 3, 22 )
	readyImage0:setTopBottom( true, false, 3, 22 )
	readyImage0:setRGB( 1, 0, 0 )
	readyImage0:setAlpha( 0.15 )
	readyImage0:setImage( RegisterImage( "uie_t7_icon_zm_ready_go" ) )
	readyImage0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( readyImage0 )
	self.readyImage0 = readyImage0
	
	local readyRing = LUI.UIImage.new()
	readyRing:setLeftRight( true, false, 1, 24 )
	readyRing:setTopBottom( true, false, 1, 24 )
	readyRing:setAlpha( 0.6 )
	readyRing:setImage( RegisterImage( "uie_t7_icon_zm_ready_go_ring" ) )
	self:addElement( readyRing )
	self.readyRing = readyRing
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 0 )
			end,
			Intro = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )

				readyImage:completeAnimation()
				self.readyImage:setRGB( 0, 0.87, 0.1 )
				self.readyImage:setAlpha( 1 )
				self.clipFinished( readyImage, {} )

				readyImage0:completeAnimation()
				self.readyImage0:setRGB( 0, 0.87, 0.1 )
				self.readyImage0:setAlpha( 0.15 )
				self.clipFinished( readyImage0, {} )

				readyRing:completeAnimation()
				self.readyRing:setRGB( 1, 1, 1 )
				self.readyRing:setAlpha( 0.6 )
				self.clipFinished( readyRing, {} )
			end
		},
		Ready = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				readyImage:completeAnimation()
				self.readyImage:setRGB( 1, 0, 0 )
				self.readyImage:setAlpha( 1 )
				self.clipFinished( readyImage, {} )

				readyImage0:completeAnimation()
				self.readyImage0:setRGB( 1, 0, 0 )
				self.readyImage0:setAlpha( 0.15 )
				self.clipFinished( readyImage0, {} )

				readyRing:completeAnimation()
				self.readyRing:setRGB( 1, 1, 1 )
				self.readyRing:setAlpha( 0.6 )
				self.clipFinished( readyRing, {} )
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
