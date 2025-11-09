CoD.GobbleGumCookbookRemainingTime = InheritFrom( LUI.UIElement )
CoD.GobbleGumCookbookRemainingTime.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GobbleGumCookbookRemainingTime )
	self.id = "GobbleGumCookbookRemainingTime"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local remainingTime = LUI.UIText.new()
	remainingTime:setLeftRight( true, false, 0, 200 )
	remainingTime:setTopBottom( true, false, 0, 20 )
	remainingTime:setRGB( 0.3, 0.2, 0.14 )
	remainingTime:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	remainingTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	remainingTime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	remainingTime:subscribeToGlobalModel( controller, "GobbleGumRecipeInfo", "remainingTime", function ( model )
		local _remainingTime = Engine.GetModelValue( model )
		if _remainingTime then
			remainingTime:setText( Engine.Localize( SecondsAsHourMinutesSeconds( _remainingTime ) ) )
		end
	end )
	self:addElement( remainingTime )
	self.remainingTime = remainingTime
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Cooking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartCooking = function ()
				self:setupElementClipCounter( 0 )
			end,
			Cooking = function ()
				self:setupElementClipCounter( 0 )
				self.nextClip = "Cooking"
			end,
			EndCooking = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.remainingTime:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

