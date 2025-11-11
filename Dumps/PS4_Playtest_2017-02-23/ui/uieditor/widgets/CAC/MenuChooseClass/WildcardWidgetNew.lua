require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetWildcard" )

CoD.WildcardWidgetNew = InheritFrom( LUI.UIElement )
CoD.WildcardWidgetNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardWidgetNew )
	self.id = "WildcardWidgetNew"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 675 )
	self:setTopBottom( 0, 0, 0, 237 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local wildcard2 = CoD.WeaponItemModelWidgetWildcard.new( menu, controller )
	wildcard2:setLeftRight( 0.5, 0.5, 55, 167 )
	wildcard2:setTopBottom( 1, 1, -210, -42 )
	wildcard2:setZRot( -15 )
	wildcard2.plusIcon:setRGB( 1, 0.41, 0 )
	wildcard2:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			wildcard2.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( wildcard2 )
	self.wildcard2 = wildcard2
	
	local wildcard3 = CoD.WeaponItemModelWidgetWildcard.new( menu, controller )
	wildcard3:setLeftRight( 0.5, 0.5, -167, -56 )
	wildcard3:setTopBottom( 1, 1, -210, -42 )
	wildcard3:setZRot( 15 )
	wildcard3.plusIcon:setRGB( 1, 0.41, 0 )
	wildcard3:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			wildcard3.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( wildcard3 )
	self.wildcard3 = wildcard3
	
	local wildcard1 = CoD.WeaponItemModelWidgetWildcard.new( menu, controller )
	wildcard1:setLeftRight( 0.5, 0.5, -55.5, 55.5 )
	wildcard1:setTopBottom( 1, 1, -225, -57 )
	wildcard1.plusIcon:setRGB( 1, 0.41, 0 )
	wildcard1:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			wildcard1.itemImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( wildcard1 )
	self.wildcard1 = wildcard1
	
	wildcard2.navigation = {
		left = wildcard1,
		up = wildcard1
	}
	wildcard3.navigation = {
		right = wildcard1
	}
	wildcard1.navigation = {
		left = wildcard3,
		right = wildcard2,
		down = wildcard2
	}
	self.resetProperties = function ()
		wildcard1:completeAnimation()
		wildcard3:completeAnimation()
		wildcard2:completeAnimation()
		wildcard1:setLeftRight( 0.5, 0.5, -55.5, 55.5 )
		wildcard1:setTopBottom( 1, 1, -225, -57 )
		wildcard1:setZRot( 0 )
		wildcard3:setLeftRight( 0.5, 0.5, -167, -56 )
		wildcard3:setTopBottom( 1, 1, -210, -42 )
		wildcard3:setZRot( 15 )
		wildcard2:setLeftRight( 0.5, 0.5, 55, 167 )
		wildcard2:setTopBottom( 1, 1, -210, -42 )
		wildcard2:setZRot( -15 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -168, -57 )
				self.wildcard3:setTopBottom( 1, 1, -210, -42 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard1:setTopBottom( 1, 1, -225, -57 )
				self.clipFinished( wildcard1, {} )
			end,
			ToCard1 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 409, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( 0.5, 0.5, 70, 182 )
					wildcard2:setTopBottom( 1, 1, -210, -42 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, 55, 167 )
				self.wildcard2:setTopBottom( 1, 1, -210, -42 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 509, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( 0.5, 0.5, -183, -72 )
					wildcard3:setTopBottom( 1, 1, -210, -42 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -168, -57 )
				self.wildcard3:setTopBottom( 1, 1, -210, -42 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 310, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
					wildcard1:setTopBottom( 1, 1, -232, -64 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard1:setTopBottom( 1, 1, -225, -57 )
				wildcard1Frame2( wildcard1, {} )
			end
		},
		Card1to2 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, -55.5, 55.5 )
				self.wildcard2:setTopBottom( 1, 1, -232, -64 )
				self.wildcard2:setZRot( 0 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -300, -189 )
				self.wildcard3:setTopBottom( 1, 1, -156, 12 )
				self.wildcard3:setZRot( 30 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -183, -72 )
				self.wildcard1:setTopBottom( 1, 1, -210, -42 )
				self.wildcard1:setZRot( 15 )
				self.clipFinished( wildcard1, {} )
			end,
			ToCard1 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( 0.5, 0.5, 70, 182 )
					wildcard2:setTopBottom( 1, 1, -210, -42 )
					wildcard2:setZRot( -15 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, -55.5, 55.5 )
				self.wildcard2:setTopBottom( 1, 1, -232, -64 )
				self.wildcard2:setZRot( 0 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( 0.5, 0.5, -183, -72 )
					wildcard3:setTopBottom( 1, 1, -210, -42 )
					wildcard3:setZRot( 15 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -300, -189 )
				self.wildcard3:setTopBottom( 1, 1, -156, 12 )
				self.wildcard3:setZRot( 30 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 219, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
					wildcard1:setTopBottom( 1, 1, -232, -64 )
					wildcard1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -183, -72 )
				self.wildcard1:setTopBottom( 1, 1, -210, -42 )
				self.wildcard1:setZRot( 15 )
				wildcard1Frame2( wildcard1, {} )
			end
		},
		Card1to3 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, 184.5, 295.5 )
				self.wildcard2:setTopBottom( 1, 1, -156, 12 )
				self.wildcard2:setZRot( -30 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard3:setTopBottom( 1, 1, -232, -64 )
				self.wildcard3:setZRot( 0 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, 70.5, 182.5 )
				self.wildcard1:setTopBottom( 1, 1, -210, -42 )
				self.wildcard1:setZRot( -15 )
				self.clipFinished( wildcard1, {} )
			end,
			ToCard1 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( 0.5, 0.5, 70, 182 )
					wildcard2:setTopBottom( 1, 1, -210, -42 )
					wildcard2:setZRot( -15 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, 184.5, 295.5 )
				self.wildcard2:setTopBottom( 1, 1, -156, 12 )
				self.wildcard2:setZRot( -30 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 289, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( 0.5, 0.5, -183, -72 )
					wildcard3:setTopBottom( 1, 1, -210, -42 )
					wildcard3:setZRot( 15 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard3:setTopBottom( 1, 1, -232, -64 )
				self.wildcard3:setZRot( 0 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
					wildcard1:setTopBottom( 1, 1, -232, -64 )
					wildcard1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, 70.5, 182.5 )
				self.wildcard1:setTopBottom( 1, 1, -210, -42 )
				self.wildcard1:setZRot( -15 )
				wildcard1Frame2( wildcard1, {} )
			end
		},
		ToCard1 = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, 70, 182 )
				self.wildcard2:setTopBottom( 1, 1, -210, -42 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -183, -72 )
				self.wildcard3:setTopBottom( 1, 1, -210, -42 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard1:setTopBottom( 1, 1, -232, -64 )
				self.clipFinished( wildcard1, {} )
			end,
			Card1to2 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 319, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( 0.5, 0.5, -55.5, 55.5 )
					wildcard2:setTopBottom( 1, 1, -232, -64 )
					wildcard2:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, 70, 182 )
				self.wildcard2:setTopBottom( 1, 1, -210, -42 )
				self.wildcard2:setZRot( -15 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 170, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( 0.5, 0.5, -300, -189 )
					wildcard3:setTopBottom( 1, 1, -156, 12 )
					wildcard3:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -183, -72 )
				self.wildcard3:setTopBottom( 1, 1, -210, -42 )
				self.wildcard3:setZRot( 15 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 230, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( 0.5, 0.5, -183, -72 )
					wildcard1:setTopBottom( 1, 1, -210, -42 )
					wildcard1:setZRot( 15 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard1:setTopBottom( 1, 1, -232, -64 )
				self.wildcard1:setZRot( 0 )
				wildcard1Frame2( wildcard1, {} )
			end,
			Card1to3 = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 189, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( 0.5, 0.5, 184.5, 295.5 )
					wildcard2:setTopBottom( 1, 1, -156, 12 )
					wildcard2:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, 70, 182 )
				self.wildcard2:setTopBottom( 1, 1, -210, -42 )
				self.wildcard2:setZRot( -15 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( 0.5, 0.5, -56, 55 )
					wildcard3:setTopBottom( 1, 1, -232, -64 )
					wildcard3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -181, -70 )
				self.wildcard3:setTopBottom( 1, 1, -210, -42 )
				self.wildcard3:setZRot( 15 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( 0.5, 0.5, 70.5, 182.5 )
					wildcard1:setTopBottom( 1, 1, -210, -42 )
					wildcard1:setZRot( -15 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard1:setTopBottom( 1, 1, -232, -64 )
				self.wildcard1:setZRot( 0 )
				wildcard1Frame2( wildcard1, {} )
			end,
			Card1Selected = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 600, true, true, CoD.TweenType.Back )
					end
					wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
					wildcard1:setTopBottom( 1, 1, -500, -332 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard1:setTopBottom( 1, 1, -232, -64 )
				wildcard1Frame2( wildcard1, {} )
			end
		},
		Card1Selected = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( 0.5, 0.5, 78, 206 )
				self.wildcard2:setTopBottom( 1, 1, -204, -12 )
				self.wildcard2:setZRot( -5 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( 0.5, 0.5, -206.5, -78.5 )
				self.wildcard3:setTopBottom( 1, 1, -204, -12 )
				self.wildcard3:setZRot( 5 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( 0.5, 0.5, -56, 55 )
				self.wildcard1:setTopBottom( 1, 1, -500, -332 )
				self.clipFinished( wildcard1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Card1to2",
			condition = function ( menu, element, event )
				return IsElementInState( element, "Card1to2" )
			end
		},
		{
			stateName = "Card1to3",
			condition = function ( menu, element, event )
				return IsElementInState( element, "Card1to3" )
			end
		},
		{
			stateName = "ToCard1",
			condition = function ( menu, element, event )
				return IsElementInState( element, "ToCard1" )
			end
		},
		{
			stateName = "Card1Selected",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	wildcard2.id = "wildcard2"
	wildcard3.id = "wildcard3"
	wildcard1.id = "wildcard1"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.wildcard1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.wildcard2:close()
		self.wildcard3:close()
		self.wildcard1:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

