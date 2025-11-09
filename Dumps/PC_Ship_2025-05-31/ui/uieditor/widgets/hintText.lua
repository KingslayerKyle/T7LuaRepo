require( "ui.uieditor.widgets.hintTextInternal" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:subscribeToGlobalModel( f1_arg1, "PerController", "hintText", function ( model )
		f1_arg0:processEvent( {
			name = "update_state",
			controller = f1_arg1
		} )
	end )
	local f1_local0 = f1_arg0.close
	f1_arg0.close = function ( f3_arg0 )
		f3_arg0:unsubscribeFromAllModels()
		f1_local0( f3_arg0 )
		DataSources.PerController.clearHintText( f1_arg1 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.hintTextInternal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

