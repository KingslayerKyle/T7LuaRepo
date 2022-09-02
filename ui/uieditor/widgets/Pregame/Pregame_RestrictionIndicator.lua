-- d08a09882b2932e0a60646eea09a13b5
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 108 )
	self:setTopBottom( true, false, 0, 108 )
	
	local Restricted = LUI.UIImage.new()
	Restricted:setLeftRight( true, true, 34.17, -34.17 )
	Restricted:setTopBottom( true, true, 36, -40.5 )
	Restricted:setRGB( 1, 0, 0 )
	Restricted:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( Restricted )
	self.Restricted = Restricted
	
	local BanOnly = LUI.UIImage.new()
	BanOnly:setLeftRight( true, true, 140.75, 65.25 )
	BanOnly:setTopBottom( true, true, -13, -95 )
	BanOnly:setRGB( 1, 0, 0 )
	BanOnly:setImage( RegisterImage( "uie_t7_icon_pregame_banned" ) )
	self:addElement( BanOnly )
	self.BanOnly = BanOnly
	
	local Protected = LUI.UIImage.new()
	Protected:setLeftRight( true, true, 39, -39 )
	Protected:setTopBottom( true, true, 36, -36 )
	Protected:setAlpha( 0.4 )
	Protected:setImage( RegisterImage( "uie_t7_icon_pregame_protected2" ) )
	self:addElement( Protected )
	self.Protected = Protected
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )

				Restricted:completeAnimation()
				self.Restricted:setRGB( 1, 0, 0 )
				self.Restricted:setAlpha( 0 )
				self.clipFinished( Restricted, {} )

				BanOnly:completeAnimation()
				self.BanOnly:setAlpha( 0 )
				self.clipFinished( BanOnly, {} )

				Protected:completeAnimation()
				self.Protected:setAlpha( 0.4 )
				self.clipFinished( Protected, {} )
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

