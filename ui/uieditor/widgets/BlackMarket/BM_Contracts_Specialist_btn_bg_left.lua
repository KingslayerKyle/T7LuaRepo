-- cba467cebee5ff9c11694fce00d85eea
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Contracts_Specialist_btn_bg_left = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_Specialist_btn_bg_left.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_Specialist_btn_bg_left )
	self.id = "BM_Contracts_Specialist_btn_bg_left"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 40 )
	
	local left = LUI.UIImage.new()
	left:setLeftRight( true, true, 64, 0.36 )
	left:setTopBottom( true, false, 0, 40 )
	left:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_btn_center" ) )
	self:addElement( left )
	self.left = left
	
	local left0 = LUI.UIImage.new()
	left0:setLeftRight( true, false, 0, 64 )
	left0:setTopBottom( true, false, 0, 40 )
	left0:setImage( RegisterImage( "uie_t7_blackmarket_contracts_character_btn_bg_left" ) )
	self:addElement( left0 )
	self.left0 = left0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NoPersonalization = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoPersonalization",
			condition = function ( menu, element, event )
				return not CharacterHasAnyWeaponUnlocked( controller, element )
			end
		}
	} )
	self:linkToElementModel( self, "heroIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "heroIndex"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

