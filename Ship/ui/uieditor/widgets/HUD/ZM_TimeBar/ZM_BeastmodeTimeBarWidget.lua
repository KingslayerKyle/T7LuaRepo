-- b9e10dc9f854f740cd0a236ed29b12e7
-- This hash is used for caching, delete to decompile the file again

CoD.ZM_BeastmodeTimeBarWidget = InheritFrom( LUI.UIElement )
CoD.ZM_BeastmodeTimeBarWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_BeastmodeTimeBarWidget )
	self.id = "ZM_BeastmodeTimeBarWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 564 )
	self:setTopBottom( true, false, 0, 156 )
	
	local TimeBarBack = LUI.UIImage.new()
	TimeBarBack:setLeftRight( true, false, 0, 564 )
	TimeBarBack:setTopBottom( true, false, 0, 156 )
	TimeBarBack:setImage( RegisterImage( "uie_t7_zm_hud_progressbar_back" ) )
	self:addElement( TimeBarBack )
	self.TimeBarBack = TimeBarBack
	
	local TimeBarFill = LUI.UIImage.new()
	TimeBarFill:setLeftRight( true, false, 0, 564 )
	TimeBarFill:setTopBottom( true, false, 0, 156 )
	TimeBarFill:setImage( RegisterImage( "uie_t7_zm_hud_progressbar_fill" ) )
	TimeBarFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	TimeBarFill:setShaderVector( 1, 0.01, 0, 0, 0 )
	TimeBarFill:setShaderVector( 2, 1, 0, 0, 0 )
	TimeBarFill:setShaderVector( 3, 0, 0, 0, 0 )
	TimeBarFill:subscribeToGlobalModel( controller, "PerController", "player_mana", function ( model )
		local playerMana = Engine.GetModelValue( model )
		if playerMana then
			TimeBarFill:setShaderVector( 0, AdjustStartEnd( 0.2, 0.67, CoD.GetVectorComponentFromString( playerMana, 1 ), CoD.GetVectorComponentFromString( playerMana, 2 ), CoD.GetVectorComponentFromString( playerMana, 3 ), CoD.GetVectorComponentFromString( playerMana, 4 ) ) )
		end
	end )
	self:addElement( TimeBarFill )
	self.TimeBarFill = TimeBarFill
	
	local TimeBarFill0 = LUI.UIImage.new()
	TimeBarFill0:setLeftRight( true, false, 0, 564 )
	TimeBarFill0:setTopBottom( true, false, 0, 156 )
	TimeBarFill0:setAlpha( 0 )
	TimeBarFill0:setImage( RegisterImage( "uie_t7_zm_hud_progressbar_fill" ) )
	TimeBarFill0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta" ) )
	TimeBarFill0:setShaderVector( 0, 0.43, 0.46, 0, 0 )
	TimeBarFill0:setShaderVector( 1, 0.02, 0.02, 0, 0 )
	TimeBarFill0:setShaderVector( 2, 0, 1, 0, 0 )
	TimeBarFill0:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( TimeBarFill0 )
	self.TimeBarFill0 = TimeBarFill0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				TimeBarBack:completeAnimation()
				self.TimeBarBack:setAlpha( 0 )
				self.clipFinished( TimeBarBack, {} )

				TimeBarFill:completeAnimation()
				self.TimeBarFill:setAlpha( 0 )
				self.clipFinished( TimeBarFill, {} )

				TimeBarFill0:completeAnimation()
				self.TimeBarFill0:setAlpha( 0 )
				self.clipFinished( TimeBarFill0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				TimeBarBack:completeAnimation()
				self.TimeBarBack:setAlpha( 1 )
				self.clipFinished( TimeBarBack, {} )

				TimeBarFill:completeAnimation()
				self.TimeBarFill:setAlpha( 1 )
				self.TimeBarFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
				self.TimeBarFill:setShaderVector( 1, 0.01, 0, 0, 0 )
				self.TimeBarFill:setShaderVector( 2, 1, 0, 0, 0 )
				self.TimeBarFill:setShaderVector( 3, 0, 0, 0, 0 )
				self.clipFinished( TimeBarFill, {} )

				TimeBarFill0:completeAnimation()
				self.TimeBarFill0:setAlpha( 0 )
				self.clipFinished( TimeBarFill0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_ZOMBIE
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TimeBarFill:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
