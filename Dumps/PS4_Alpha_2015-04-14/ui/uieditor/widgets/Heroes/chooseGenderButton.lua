require( "ui.uieditor.widgets.Heroes.chooseGenderButton_Internal" )

CoD.chooseGenderButton = InheritFrom( LUI.UIElement )
CoD.chooseGenderButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.chooseGenderButton )
	self.id = "chooseGenderButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 500 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local internal = CoD.chooseGenderButton_Internal.new( menu, controller )
	internal:setLeftRight( true, true, 0, 0 )
	internal:setTopBottom( true, true, 0, 0 )
	internal:setRGB( 1, 1, 1 )
	internal.border:setRGB( 1, 1, 1 )
	internal:linkToElementModel( self, nil, false, function ( model )
		internal:setModel( model, controller )
	end )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				internal.border:completeAnimation()
				self.internal:setLeftRight( true, true, 0, 0 )
				self.internal:setTopBottom( true, true, 50, -50 )
				self.internal.border:setRGB( 1, 1, 1 )
				self.clipFinished( internal, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )
				local internalFrame2 = function ( internal, event )
					if not event.interrupted then
						internal:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						internal.border:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					internal:setLeftRight( true, true, 0, 0 )
					internal:setTopBottom( true, true, 0, 0 )
					internal.border:setRGB( 1, 0.41, 0 )
					if event.interrupted then
						self.clipFinished( internal, event )
					else
						internal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				internal:completeAnimation()
				internal.border:completeAnimation()
				self.internal:setLeftRight( true, true, 0, 0 )
				self.internal:setTopBottom( true, true, 50, -50 )
				self.internal.border:setRGB( 1, 1, 1 )
				internalFrame2( internal, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				internal.border:completeAnimation()
				self.internal:setLeftRight( true, true, 0, 0 )
				self.internal:setTopBottom( true, true, 0, 0 )
				self.internal.border:setRGB( 1, 0.41, 0 )
				self.clipFinished( internal, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )
				local internalFrame2 = function ( internal, event )
					if not event.interrupted then
						internal:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						internal.border:beginAnimation( "subkeyframe", 100, false, false, CoD.TweenType.Linear )
					end
					internal:setLeftRight( true, true, 0, 0 )
					internal:setTopBottom( true, true, 50, -50 )
					internal.border:setRGB( 1, 1, 1 )
					if event.interrupted then
						self.clipFinished( internal, event )
					else
						internal:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				internal:completeAnimation()
				internal.border:completeAnimation()
				self.internal:setLeftRight( true, true, 0, 0 )
				self.internal:setTopBottom( true, true, 0, 0 )
				self.internal.border:setRGB( 1, 0.41, 0 )
				internalFrame2( internal, {} )
			end
		}
	}
	internal.id = "internal"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.internal:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.internal:close()
		CoD.chooseGenderButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

