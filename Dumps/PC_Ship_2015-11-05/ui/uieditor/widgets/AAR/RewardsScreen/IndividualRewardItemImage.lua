CoD.IndividualRewardItemImage = InheritFrom( LUI.UIElement )
CoD.IndividualRewardItemImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.IndividualRewardItemImage )
	self.id = "IndividualRewardItemImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 50 )
	
	local RewardImage = LUI.UIImage.new()
	RewardImage:setLeftRight( true, false, 0, 50 )
	RewardImage:setTopBottom( true, false, 0, 50 )
	RewardImage:linkToElementModel( self, "rewardImage", true, function ( model )
		local rewardImage = Engine.GetModelValue( model )
		if rewardImage then
			RewardImage:setImage( RegisterImage( rewardImage ) )
		end
	end )
	self:addElement( RewardImage )
	self.RewardImage = RewardImage
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				RewardImage:completeAnimation()
				self.RewardImage:setLeftRight( true, false, 0, 50 )
				self.RewardImage:setTopBottom( true, false, 0, 50 )
				self.clipFinished( RewardImage, {} )
			end
		},
		CallingCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				RewardImage:completeAnimation()
				self.RewardImage:setLeftRight( true, false, -118, 85 )
				self.RewardImage:setTopBottom( true, false, 0, 50 )
				self.clipFinished( RewardImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CallingCard",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isCallingCard" )
			end
		}
	} )
	self:linkToElementModel( self, "isCallingCard", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isCallingCard"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RewardImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

