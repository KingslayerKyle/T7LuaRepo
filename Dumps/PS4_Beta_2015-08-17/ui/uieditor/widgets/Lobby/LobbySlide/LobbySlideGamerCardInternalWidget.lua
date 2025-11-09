CoD.LobbySlideGamerCardInternalWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideGamerCardInternalWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideGamerCardInternalWidget )
	self.id = "LobbySlideGamerCardInternalWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( true, false, 0, 340 )
	self:setTopBottom( true, false, 0, 100 )
	
	local GamerCard = LUI.UIImage.new()
	GamerCard:setLeftRight( true, true, 10, -10 )
	GamerCard:setTopBottom( true, true, 10, -10 )
	GamerCard:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( GamerCard )
	self.GamerCard = GamerCard
	
	self.GamerCard:linkToElementModel( self, "xuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GamerCard:setImage( RegisterImage( GetRandomPlayercardForPlayer( modelValue ) ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				GamerCard:completeAnimation()
				self.GamerCard:setAlpha( 1 )
				self.clipFinished( GamerCard, {} )
			end,
			SlideLeft = function ()
				self:setupElementClipCounter( 0 )
			end,
			SlideRight = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				GamerCard:completeAnimation()
				self.GamerCard:setAlpha( 0 )
				self.clipFinished( GamerCard, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GamerCard:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

