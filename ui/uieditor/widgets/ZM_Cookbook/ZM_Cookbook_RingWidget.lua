-- 59a617ed1b8bcf99436ffeca1687b6a6
-- This hash is used for caching, delete to decompile the file again

CoD.ZM_Cookbook_RingWidget = InheritFrom( LUI.UIElement )
CoD.ZM_Cookbook_RingWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZM_Cookbook_RingWidget )
	self.id = "ZM_Cookbook_RingWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 209 )
	self:setTopBottom( true, false, 0, 209 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local ring = LUI.UIImage.new()
	ring:setLeftRight( true, false, 1, 210 )
	ring:setTopBottom( true, false, 0, 209 )
	ring:setRGB( 0.3, 0.2, 0.14 )
	ring:setAlpha( 0.8 )
	ring:setZRot( -112 )
	ring:setImage( RegisterImage( "uie_t7_zm_cookbook_fill_radial" ) )
	ring:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	ring:setShaderVector( 0, 0.7, 0, 0, 0 )
	ring:setShaderVector( 1, 0.5, 0, 0, 0 )
	ring:setShaderVector( 2, 0.5, 0, 0, 0 )
	ring:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ring )
	self.ring = ring
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ring:completeAnimation()
				self.ring:setAlpha( 0 )
				self.clipFinished( ring, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Yellow = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ring:completeAnimation()
				self.ring:setRGB( 1, 0.75, 0.16 )
				self.ring:setAlpha( 1 )
				self.clipFinished( ring, {} )
			end
		},
		Green = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ring:completeAnimation()
				self.ring:setRGB( 0.19, 0.6, 0.2 )
				self.ring:setAlpha( 1 )
				self.clipFinished( ring, {} )
			end
		},
		Blue = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ring:completeAnimation()
				self.ring:setRGB( 0.2, 0.53, 0.71 )
				self.ring:setAlpha( 1 )
				self.clipFinished( ring, {} )
			end
		},
		Purple = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				ring:completeAnimation()
				self.ring:setRGB( 0.42, 0.19, 0.6 )
				self.ring:setAlpha( 1 )
				self.clipFinished( ring, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Yellow",
			condition = function ( menu, element, event )
				return IsBubbleGumType( element, controller, "event" ) and IsCACItemConsumable( menu, element, controller )
			end
		},
		{
			stateName = "Green",
			condition = function ( menu, element, event )
				return IsBubbleGumType( element, controller, "time" ) and IsCACItemConsumable( menu, element, controller )
			end
		},
		{
			stateName = "Blue",
			condition = function ( menu, element, event )
				return IsBubbleGumType( element, controller, "round" ) and IsCACItemConsumable( menu, element, controller )
			end
		},
		{
			stateName = "Purple",
			condition = function ( menu, element, event )
				return IsBubbleGumType( element, controller, "activated" ) and IsCACItemConsumable( menu, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

