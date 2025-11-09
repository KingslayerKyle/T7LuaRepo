local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "NetworkInfo" ), "connectionType" )
end

CoD.StartMenu_Options_Network_PingImage = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Network_PingImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Network_PingImage )
	self.id = "StartMenu_Options_Network_PingImage"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 385 )
	self:setTopBottom( true, false, 0, 85 )
	
	local Wired = LUI.UIImage.new()
	Wired:setLeftRight( true, true, 0, 0 )
	Wired:setTopBottom( true, true, 0, 0 )
	Wired:setAlpha( 0 )
	Wired:setImage( RegisterImage( "uie_t7_icon_network_set1" ) )
	self:addElement( Wired )
	self.Wired = Wired
	
	local Wireless = LUI.UIImage.new()
	Wireless:setLeftRight( true, true, 0, 0 )
	Wireless:setTopBottom( true, true, 0, 0 )
	Wireless:setImage( RegisterImage( "uie_t7_icon_network_set2" ) )
	self:addElement( Wireless )
	self.Wireless = Wireless
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Wired:completeAnimation()
				self.Wired:setAlpha( 0 )
				self.clipFinished( Wired, {} )
				Wireless:completeAnimation()
				self.Wireless:setAlpha( 0 )
				self.clipFinished( Wireless, {} )
			end
		},
		Wired = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Wired:completeAnimation()
				self.Wired:setAlpha( 1 )
				self.clipFinished( Wired, {} )
				Wireless:completeAnimation()
				self.Wireless:setAlpha( 0 )
				self.clipFinished( Wireless, {} )
			end
		},
		Wireless = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Wired:completeAnimation()
				self.Wired:setAlpha( 0 )
				self.clipFinished( Wired, {} )
				Wireless:completeAnimation()
				self.Wireless:setAlpha( 1 )
				self.clipFinished( Wireless, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Wired",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "NetworkInfo.connectionType", "WIRED" )
			end
		},
		{
			stateName = "Wireless",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "NetworkInfo.connectionType", "WIRELESS" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "NetworkInfo.connectionType" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "NetworkInfo.connectionType"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

