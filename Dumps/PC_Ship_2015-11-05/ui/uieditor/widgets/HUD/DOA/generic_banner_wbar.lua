require( "ui.uieditor.widgets.HUD.GenericUpdateBarWithLink" )

CoD.generic_banner_wbar = InheritFrom( LUI.UIElement )
CoD.generic_banner_wbar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.generic_banner_wbar )
	self.id = "generic_banner_wbar"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 31 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, -5, 84 )
	background:setTopBottom( true, true, 0, 33 )
	background:setImage( RegisterImage( "uie_scorebar_zom_1" ) )
	background:linkToElementModel( self, "grgb1", true, function ( model )
		local grgb1 = Engine.GetModelValue( model )
		if grgb1 then
			background:setRGB( grgb1 )
		end
	end )
	self:addElement( background )
	self.background = background
	
	local bannertext = LUI.UIText.new()
	bannertext:setLeftRight( true, true, -46.25, 128 )
	bannertext:setTopBottom( true, true, 4, 22.5 )
	bannertext:setTTF( "fonts/GatewayA2.ttf" )
	bannertext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	bannertext:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	bannertext:linkToElementModel( self, "grgb2", true, function ( model )
		local grgb2 = Engine.GetModelValue( model )
		if grgb2 then
			bannertext:setRGB( grgb2 )
		end
	end )
	bannertext:linkToElementModel( self, "gbanner", true, function ( model )
		local gbanner = Engine.GetModelValue( model )
		if gbanner then
			bannertext:setText( Engine.Localize( gbanner ) )
		end
	end )
	self:addElement( bannertext )
	self.bannertext = bannertext
	
	local updatebar = CoD.GenericUpdateBarWithLink.new( menu, controller )
	updatebar:setLeftRight( true, true, 5.75, 64 )
	updatebar:setTopBottom( true, false, 62.5, 71.5 )
	updatebar:subscribeToGlobalModel( controller, "DeadOpsArcadeGlobal", nil, function ( model )
		updatebar:setModel( model, controller )
	end )
	updatebar:linkToElementModel( self, "grgb3", true, function ( model )
		local grgb3 = Engine.GetModelValue( model )
		if grgb3 then
			updatebar:setRGB( grgb3 )
		end
	end )
	updatebar:linkToElementModel( self, "gpr0", true, function ( model )
		local gpr0 = Engine.GetModelValue( model )
		if gpr0 then
			updatebar.barImage:setShaderVector( 0, CoD.GetVectorComponentFromString( gpr0, 1 ), CoD.GetVectorComponentFromString( gpr0, 2 ), CoD.GetVectorComponentFromString( gpr0, 3 ), CoD.GetVectorComponentFromString( gpr0, 4 ) )
		end
	end )
	self:addElement( updatebar )
	self.updatebar = updatebar
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setAlpha( 1 )
				self.clipFinished( background, {} )
				bannertext:completeAnimation()
				self.bannertext:setAlpha( 1 )
				self.clipFinished( bannertext, {} )
				updatebar:completeAnimation()
				self.updatebar:setAlpha( 1 )
				self.clipFinished( updatebar, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				background:completeAnimation()
				self.background:setAlpha( 0 )
				self.clipFinished( background, {} )
				bannertext:completeAnimation()
				self.bannertext:setAlpha( 0 )
				self.clipFinished( bannertext, {} )
				updatebar:completeAnimation()
				self.updatebar:setAlpha( 0 )
				self.clipFinished( updatebar, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.updatebar:close()
		element.background:close()
		element.bannertext:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

