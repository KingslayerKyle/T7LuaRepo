-- 8dd4d05a2b92be3ba4e6dd3fb6311d0d
-- This hash is used for caching, delete to decompile the file again

CoD.GobbleGumCookbookDistillsBalance = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookbookDistillsBalance.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookbookDistillsBalance )
	self.id = "GobbleGumCookbookDistillsBalance"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 75 )
	self:setTopBottom( true, false, 0, 25 )
	
	local Icon = LUI.UIImage.new()
	Icon:setLeftRight( true, false, 0, 25 )
	Icon:setTopBottom( false, false, -12.5, 12.5 )
	Icon:setImage( RegisterImage( "uie_t7_zm_cookbook_distill_icon" ) )
	self:addElement( Icon )
	self.Icon = Icon
	
	local balance = LUI.UITightText.new()
	balance:setLeftRight( true, false, 25, 75 )
	balance:setTopBottom( false, false, -12.5, 12.5 )
	balance:setRGB( 0.3, 0.2, 0.14 )
	balance:setTTF( "fonts/default.ttf" )
	balance:subscribeToGlobalModel( controller, "GobbleGumDistills", "totalDistills", function ( model )
		local totalDistills = Engine.GetModelValue( model )
		if totalDistills then
			balance:setText( Engine.Localize( SetValueIfNumberIsLessThanOrEqualTo( 0, "0", totalDistills ) ) )
		end
	end )
	self:addElement( balance )
	self.balance = balance
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Icon:completeAnimation()
				self.Icon:setAlpha( 0 )
				self.clipFinished( Icon, {} )

				balance:completeAnimation()
				self.balance:setAlpha( 0 )
				self.clipFinished( balance, {} )
			end
		},
		VisiblePopup = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )

				balance:completeAnimation()
				self.balance:setRGB( 1, 1, 1 )
				self.balance:setAlpha( 1 )
				self.clipFinished( balance, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Icon:completeAnimation()
				self.Icon:setAlpha( 1 )
				self.clipFinished( Icon, {} )

				balance:completeAnimation()
				self.balance:setAlpha( 1 )
				self.clipFinished( balance, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "VisiblePopup",
			condition = function ( menu, element, event )
				return IsLootReady( controller ) and IsCurrentMenu( menu, "SystemOverlay_GobbleGumRecipe" )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsLootReady( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "CryptoKeyProgress.keyCount" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "CryptoKeyProgress.keyCount"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.balance:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
