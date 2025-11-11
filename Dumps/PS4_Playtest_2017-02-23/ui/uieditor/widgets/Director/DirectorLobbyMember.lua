CoD.DirectorLobbyMember = InheritFrom( LUI.UIElement )
CoD.DirectorLobbyMember.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DirectorLobbyMember )
	self.id = "DirectorLobbyMember"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 64 )
	self:setTopBottom( 0, 0, 0, 64 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 0, 64 )
	Image:setTopBottom( 0, 0, 0, 64 )
	Image:setRGB( ColorSet.PlayerCount.r, ColorSet.PlayerCount.g, ColorSet.PlayerCount.b )
	Image:setAlpha( 0.5 )
	self:addElement( Image )
	self.Image = Image
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 0, 0, 2, 62 )
	emblem:setTopBottom( 0, 0, 2, 62 )
	emblem:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setupPlayerEmblemByXUID( modelValue )
		end
	end )
	self:addElement( emblem )
	self.emblem = emblem
	
	local rankicon = LUI.UIImage.new()
	rankicon:setLeftRight( 0, 0, 0, 39 )
	rankicon:setTopBottom( 0, 0, -0.5, 38.5 )
	rankicon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankicon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( rankicon )
	self.rankicon = rankicon
	
	self.resetProperties = function ()
		Image:completeAnimation()
		Image:setRGB( ColorSet.PlayerCount.r, ColorSet.PlayerCount.g, ColorSet.PlayerCount.b )
		Image:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Image:completeAnimation()
				self.Image:setRGB( ColorSet.PlayerCount.r, ColorSet.PlayerCount.g, ColorSet.PlayerCount.b )
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.emblem:close()
		self.rankicon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

