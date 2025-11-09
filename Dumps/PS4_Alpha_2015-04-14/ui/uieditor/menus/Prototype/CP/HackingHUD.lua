LUI.createMenu.HackingHUD = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "HackingHUD" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 104.5, 604.5 )
	TextBox0:setTopBottom( true, false, 572.5, 597.5 )
	TextBox0:setRGB( 0.55, 0.89, 1 )
	TextBox0:setText( Engine.Localize( "NETWORK_INTRUSION_ENGAGED..." ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( true, false, 104.5, 986.5 )
	ProgressBar:setTopBottom( true, false, 608.5, 666.5 )
	ProgressBar:setRGB( 0, 0.72, 1 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local TextBox00 = LUI.UIText.new()
	TextBox00:setLeftRight( true, false, 82.5, 582.5 )
	TextBox00:setTopBottom( true, false, 52.5, 77.5 )
	TextBox00:setRGB( 0.55, 0.89, 1 )
	TextBox00:setText( Engine.Localize( "NETWORK_INTRUSION_ENGAGED..." ) )
	TextBox00:setTTF( "fonts/default.ttf" )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox00:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox00 )
	self.TextBox00 = TextBox00
	
	local ProgressBar0 = LUI.UIImage.new()
	ProgressBar0:setLeftRight( true, false, 82.5, 404.5 )
	ProgressBar0:setTopBottom( true, false, 87.5, 116.5 )
	ProgressBar0:setRGB( 0, 0.72, 1 )
	ProgressBar0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar0:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar0:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar0:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ProgressBar0 )
	self.ProgressBar0 = ProgressBar0
	
	self.TextBox0:linkToElementModel( self, "HackingVisibleFPP", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox0:setAlpha( modelValue )
		end
	end )
	self.ProgressBar:linkToElementModel( self, "HackingVisibleFPP", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressBar:setAlpha( modelValue )
		end
	end )
	self.ProgressBar:linkToElementModel( self, "HackingProgress", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressBar:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self.TextBox00:linkToElementModel( self, "HackingVisibleTPP", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox00:setAlpha( modelValue )
		end
	end )
	self.ProgressBar0:linkToElementModel( self, "HackingVisibleTPP", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressBar0:setAlpha( modelValue )
		end
	end )
	self.ProgressBar0:linkToElementModel( self, "HackingProgress", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ProgressBar0:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	self.close = function ( self )
		self.TextBox0:close()
		self.ProgressBar:close()
		self.TextBox00:close()
		self.ProgressBar0:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

