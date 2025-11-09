CoD.Nat = InheritFrom( LUI.UIElement )
CoD.Nat.new = function ( menu, controller )
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
	self:setUseStencil( true )
	self:setClass( CoD.Nat )
	self.id = "Nat"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local NAT = LUI.UITightText.new()
	NAT:setLeftRight( false, true, -63, 0 )
	NAT:setTopBottom( false, false, -12.5, 7.5 )
	NAT:setRGB( 1, 1, 1 )
	NAT:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	NAT:setLetterSpacing( 0.5 )
	NAT:subscribeToGlobalModel( controller, "LobbyGlobal", "lobbyNatType", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			NAT:setText( Engine.Localize( NatTypeToString( modelValue ) ) )
		end
	end )
	self:addElement( NAT )
	self.NAT = NAT
	
	local Divider = LUI.UIImage.new()
	Divider:setLeftRight( false, true, -69, -68 )
	Divider:setTopBottom( false, false, -12.5, 12.5 )
	Divider:setRGB( 1, 1, 1 )
	Divider:setAlpha( 0.5 )
	Divider:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Divider )
	self.Divider = Divider
	
	local NATType = LUI.UITightText.new()
	NATType:setLeftRight( false, true, -102, -74 )
	NATType:setTopBottom( false, false, -12.5, 7.5 )
	NATType:setRGB( 1, 1, 1 )
	NATType:setText( Engine.Localize( "MENU_SYSINFO_NAT_TYPE_LOBBY" ) )
	NATType:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	NATType:setLetterSpacing( 0.5 )
	self:addElement( NATType )
	self.NATType = NATType
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NATType:completeAnimation()
				self.NATType:setAlpha( 1 )
				self.clipFinished( NATType, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				NATType:completeAnimation()
				self.NATType:setAlpha( 0 )
				self.clipFinished( NATType, {} )
			end
		}
	}
	self.close = function ( self )
		self.NAT:close()
		CoD.Nat.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

