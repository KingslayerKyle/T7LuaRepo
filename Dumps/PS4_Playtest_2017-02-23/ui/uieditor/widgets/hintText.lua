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
	self:setLeftRight( 0, 0, 0, 900 )
	self:setTopBottom( 0, 0, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local hintTextInternal = CoD.hintTextInternal.new( menu, controller )
	hintTextInternal:mergeStateConditions( {
		{
			stateName = "NoHintText",
			condition = function ( menu, element, event )
				return not HasGlobalHintText( controller )
			end
		}
	} )
	hintTextInternal:setLeftRight( 0, 1, 0, 0 )
	hintTextInternal:setTopBottom( 0, 0, 0, 30 )
	hintTextInternal:setAlpha( 0 )
	self:addElement( hintTextInternal )
	self.hintTextInternal = hintTextInternal
	
	self.resetProperties = function ()
		hintTextInternal:completeAnimation()
		hintTextInternal:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				hintTextInternal:completeAnimation()
				self.hintTextInternal:setAlpha( 1 )
				self.clipFinished( hintTextInternal, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.hintTextInternal:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

