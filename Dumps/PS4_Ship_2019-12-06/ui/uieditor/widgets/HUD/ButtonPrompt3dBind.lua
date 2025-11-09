local PostLoadFunc = function ( self, controller, menu )
	
end

CoD.ButtonPrompt3dBind = InheritFrom( LUI.UIElement )
CoD.ButtonPrompt3dBind.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ButtonPrompt3dBind )
	self.id = "ButtonPrompt3dBind"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 39 )
	
	local CenterBlackRect = LUI.UIImage.new()
	CenterBlackRect:setLeftRight( true, true, 19.5, -19.5 )
	CenterBlackRect:setTopBottom( true, true, 2, -2 )
	CenterBlackRect:setRGB( 0, 0, 0 )
	self:addElement( CenterBlackRect )
	self.CenterBlackRect = CenterBlackRect
	
	local LeftBlackCircle = LUI.UIImage.new()
	LeftBlackCircle:setLeftRight( true, false, 0, 39 )
	LeftBlackCircle:setTopBottom( true, false, 0, 39 )
	LeftBlackCircle:setRGB( 0, 0, 0 )
	LeftBlackCircle:setImage( RegisterImage( "uie_t7_icons_blackcircle" ) )
	self:addElement( LeftBlackCircle )
	self.LeftBlackCircle = LeftBlackCircle
	
	local RightBlackCircle = LUI.UIImage.new()
	RightBlackCircle:setLeftRight( false, true, -39, 0 )
	RightBlackCircle:setTopBottom( true, false, 0, 39 )
	RightBlackCircle:setRGB( 0, 0, 0 )
	RightBlackCircle:setImage( RegisterImage( "uie_t7_icons_blackcircle" ) )
	self:addElement( RightBlackCircle )
	self.RightBlackCircle = RightBlackCircle
	
	local promptKM = LUI.UIText.new()
	promptKM:setLeftRight( false, true, -227, -14 )
	promptKM:setTopBottom( true, false, 5, 34 )
	promptKM:setText( Engine.Localize( "PLATFORM_ACTIVATE_BIND" ) )
	promptKM:setTTF( "fonts/default.ttf" )
	promptKM:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	promptKM:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( promptKM )
	self.promptKM = promptKM
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( true, true, 15, -19.5 )
	progressMeter:setTopBottom( false, true, -5, 0 )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	progressMeter:setShaderVector( 1, 0, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 1, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	progressMeter:linkToElementModel( self, "progress", true, function ( model )
		local progress = Engine.GetModelValue( model )
		if progress then
			progressMeter:setShaderVector( 0, CoD.GetVectorComponentFromString( progress, 1 ), CoD.GetVectorComponentFromString( progress, 2 ), CoD.GetVectorComponentFromString( progress, 3 ), CoD.GetVectorComponentFromString( progress, 4 ) )
		end
	end )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				progressMeter:completeAnimation()
				self.progressMeter:setLeftRight( true, false, 2.5, 45.5 )
				self.progressMeter:setTopBottom( true, false, 10.5, 53.5 )
				self.progressMeter:setAlpha( 1 )
				self.clipFinished( progressMeter, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.progressMeter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

