require( "ui.uieditor.widgets.hintTextInternal" )

local PostLoadFunc = function ( self, controller )
	self:subscribeToGlobalModel( controller, "PerController", "hintText", function ( model )
		self:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end )
	local previousClose = self.close
	self.close = function ( self )
		self:unsubscribeFromAllModels()
		previousClose( self )
		DataSources.PerController.clearHintText( controller )
	end
	
end

CoD.hintText = InheritFrom( LUI.UIElement )
CoD.hintText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.hintText )
	self.id = "hintText"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 600 )
	self:setTopBottom( true, false, 0, 20 )
	self.anyChildUsesUpdateState = true
	
	local hintTextInternal = CoD.hintTextInternal.new( menu, controller )
	hintTextInternal:setLeftRight( true, true, 0, 0 )
	hintTextInternal:setTopBottom( true, false, 0, 20 )
	hintTextInternal:setRGB( 1, 1, 1 )
	hintTextInternal:setAlpha( 0 )
	hintTextInternal:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return not HasGlobalHintText( controller )
			end
		}
	} )
	self:addElement( hintTextInternal )
	self.hintTextInternal = hintTextInternal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				hintTextInternal:completeAnimation()
				self.hintTextInternal:setAlpha( 1 )
				self.clipFinished( hintTextInternal, {} )
			end
		}
	}
	self.close = function ( self )
		self.hintTextInternal:close()
		CoD.hintText.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

