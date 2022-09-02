-- 150cfa265cd2f23e364682399aad3c4d
-- This hash is used for caching, delete to decompile the file again

CoD.systemOverlay_alertStatusBar = InheritFrom( LUI.UIElement )
CoD.systemOverlay_alertStatusBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_alertStatusBar )
	self.id = "systemOverlay_alertStatusBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 4 )
	
	local alertStatus = LUI.UIImage.new()
	alertStatus:setLeftRight( true, true, 0, 0 )
	alertStatus:setTopBottom( true, true, 0, 0 )
	alertStatus:setRGB( 0.97, 0.58, 0.15 )
	self:addElement( alertStatus )
	self.alertStatus = alertStatus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				alertStatus:completeAnimation()
				self.alertStatus:setRGB( 0.97, 0.58, 0.15 )
				self.clipFinished( alertStatus, {} )
			end
		},
		Alert = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				alertStatus:completeAnimation()
				self.alertStatus:setRGB( 0.93, 0.11, 0.15 )
				self.clipFinished( alertStatus, {} )
			end
		},
		Blackmarket = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				alertStatus:completeAnimation()
				self.alertStatus:setRGB( 0.25, 0.38, 0.35 )
				self.clipFinished( alertStatus, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Alert",
			condition = function ( menu, element, event )
				return IsAlertOverlay( self, controller )
			end
		},
		{
			stateName = "Blackmarket",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	self:linkToElementModel( self, "categoryType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "categoryType"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

