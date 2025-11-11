require( "ui.uieditor.widgets.FreeCursor.freeCursorInfoPanel" )

CoD.freeCursorInfoPanelContainer = InheritFrom( LUI.UIElement )
CoD.freeCursorInfoPanelContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorInfoPanelContainer )
	self.id = "freeCursorInfoPanelContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 400 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local infoPanel = CoD.freeCursorInfoPanel.new( menu, controller )
	infoPanel:setLeftRight( 1, 2, -400, -400 )
	infoPanel:setTopBottom( 1, 1, -1080, 0 )
	infoPanel:linkToElementModel( self, "contextualInfo", false, function ( model )
		infoPanel:setModel( model, controller )
	end )
	self:addElement( infoPanel )
	self.infoPanel = infoPanel
	
	self.resetProperties = function ()
		infoPanel:completeAnimation()
		infoPanel:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				infoPanel:completeAnimation()
				self.infoPanel:setAlpha( 0 )
				self.clipFinished( infoPanel, {} )
			end,
			HasFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local infoPanelFrame2 = function ( infoPanel, event )
					if not event.interrupted then
						infoPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					infoPanel:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( infoPanel, event )
					else
						infoPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				infoPanel:completeAnimation()
				self.infoPanel:setAlpha( 0 )
				infoPanelFrame2( infoPanel, {} )
			end
		},
		HasFocus = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			DefaultState = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local infoPanelFrame2 = function ( infoPanel, event )
					if not event.interrupted then
						infoPanel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					infoPanel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( infoPanel, event )
					else
						infoPanel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				infoPanel:completeAnimation()
				self.infoPanel:setAlpha( 1 )
				infoPanelFrame2( infoPanel, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HasFocus",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "hasFocus" )
			end
		}
	} )
	self:linkToElementModel( self, "hasFocus", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hasFocus"
		} )
	end )
	self:subscribeToGlobalModel( controller, "FreeCursor", "position", function ( model )
		local element = self
		if IsFreeCursorOnTopOfScreen( controller ) then
			CallCustomElementFunction_Element( self.infoPanel, "setAlignment", LUI.Alignment.Top )
		else
			CallCustomElementFunction_Element( self.infoPanel, "setAlignment", LUI.Alignment.Bottom )
		end
	end )
	infoPanel.id = "infoPanel"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.infoPanel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

