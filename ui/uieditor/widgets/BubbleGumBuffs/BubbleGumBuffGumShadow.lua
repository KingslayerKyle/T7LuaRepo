-- 21ec1d28f11f141e592a3af184eecc78
-- This hash is used for caching, delete to decompile the file again

CoD.BubbleGumBuffGumShadow = InheritFrom( LUI.UIElement )
CoD.BubbleGumBuffGumShadow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumBuffGumShadow )
	self.id = "BubbleGumBuffGumShadow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 302 )
	self:setTopBottom( true, false, 0, 303 )
	
	local Shadow = LUI.UIImage.new()
	Shadow:setLeftRight( true, false, 2, 288.68 )
	Shadow:setTopBottom( true, false, 17.41, 303 )
	Shadow:setRGB( 0, 0, 0 )
	Shadow:setAlpha( 0.5 )
	Shadow:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelcircle" ) )
	self:addElement( Shadow )
	self.Shadow = Shadow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Shadow:completeAnimation()
				self.Shadow:setAlpha( 0 )
				self.clipFinished( Shadow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Shadow:completeAnimation()
				self.Shadow:setAlpha( 0.5 )
				self.clipFinished( Shadow, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Shadow:completeAnimation()
				self.Shadow:setAlpha( 0.5 )
				self.clipFinished( Shadow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCACItemFromDLC( menu, element, controller ) and not IsCACItemDLCPurchased( menu, element, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return true
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

