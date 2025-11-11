CoD.Pregame_RestrictionIndicator = InheritFrom( LUI.UIElement )
CoD.Pregame_RestrictionIndicator.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_RestrictionIndicator )
	self.id = "Pregame_RestrictionIndicator"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	
	local Restricted = LUI.UIImage.new()
	Restricted:setLeftRight( 0, 1, 51, -51 )
	Restricted:setTopBottom( 0, 1, 54, -60 )
	Restricted:setRGB( 1, 0, 0 )
	Restricted:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( Restricted )
	self.Restricted = Restricted
	
	local BanOnly = LUI.UIImage.new()
	BanOnly:setLeftRight( 0, 1, 211, 97 )
	BanOnly:setTopBottom( 0, 1, -19, -143 )
	BanOnly:setRGB( 1, 0, 0 )
	BanOnly:setImage( RegisterImage( "uie_t7_icon_pregame_banned" ) )
	self:addElement( BanOnly )
	self.BanOnly = BanOnly
	
	local Protected = LUI.UIImage.new()
	Protected:setLeftRight( 0, 1, 58, -58 )
	Protected:setTopBottom( 0, 1, 54, -54 )
	Protected:setAlpha( 0.4 )
	Protected:setImage( RegisterImage( "uie_t7_icon_pregame_protected2" ) )
	self:addElement( Protected )
	self.Protected = Protected
	
	self.resetProperties = function ()
		Restricted:completeAnimation()
		BanOnly:completeAnimation()
		Protected:completeAnimation()
		Restricted:setAlpha( 1 )
		BanOnly:setAlpha( 1 )
		Protected:setAlpha( 0.4 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Restricted:completeAnimation()
				self.Restricted:setAlpha( 0 )
				self.clipFinished( Restricted, {} )
				BanOnly:completeAnimation()
				self.BanOnly:setAlpha( 0 )
				self.clipFinished( BanOnly, {} )
				Protected:completeAnimation()
				self.Protected:setAlpha( 0 )
				self.clipFinished( Protected, {} )
			end
		},
		Restricted = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Restricted:completeAnimation()
				self.Restricted:setAlpha( 0.6 )
				self.clipFinished( Restricted, {} )
				BanOnly:completeAnimation()
				self.BanOnly:setAlpha( 0 )
				self.clipFinished( BanOnly, {} )
				Protected:completeAnimation()
				self.Protected:setAlpha( 0 )
				self.clipFinished( Protected, {} )
			end
		},
		BanOnly = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				Restricted:completeAnimation()
				self.Restricted:setAlpha( 0 )
				self.clipFinished( Restricted, {} )
				BanOnly:completeAnimation()
				self.BanOnly:setAlpha( 0 )
				self.clipFinished( BanOnly, {} )
				Protected:completeAnimation()
				self.Protected:setAlpha( 0 )
				self.clipFinished( Protected, {} )
			end
		},
		Protected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Restricted:completeAnimation()
				self.Restricted:setAlpha( 0 )
				self.clipFinished( Restricted, {} )
				BanOnly:completeAnimation()
				self.BanOnly:setAlpha( 0 )
				self.clipFinished( BanOnly, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Restricted",
			condition = function ( menu, element, event )
				return ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED )
			end
		},
		{
			stateName = "BanOnly",
			condition = function ( menu, element, event )
				return ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY )
			end
		},
		{
			stateName = "Protected",
			condition = function ( menu, element, event )
				return ItemIsInRestrictionState( menu, element, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

