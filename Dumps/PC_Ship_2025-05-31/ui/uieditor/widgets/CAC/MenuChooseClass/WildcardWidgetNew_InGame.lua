require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.WeaponItemModelWidgetWildcard_InGame" )

CoD.WildcardWidgetNew_InGame = InheritFrom( LUI.UIElement )
CoD.WildcardWidgetNew_InGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardWidgetNew_InGame )
	self.id = "WildcardWidgetNew_InGame"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 158 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local wildcard2 = CoD.WeaponItemModelWidgetWildcard_InGame.new( menu, controller )
	wildcard2:setLeftRight( false, false, 37.16, 111.5 )
	wildcard2:setTopBottom( false, true, -140, -28 )
	wildcard2:setZRot( -15 )
	wildcard2:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			wildcard2.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( wildcard2 )
	self.wildcard2 = wildcard2
	
	local wildcard3 = CoD.WeaponItemModelWidgetWildcard_InGame.new( menu, controller )
	wildcard3:setLeftRight( false, false, -112, -37.68 )
	wildcard3:setTopBottom( false, true, -140, -28 )
	wildcard3:setZRot( 15 )
	wildcard3:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			wildcard3.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( wildcard3 )
	self.wildcard3 = wildcard3
	
	local wildcard1 = CoD.WeaponItemModelWidgetWildcard_InGame.new( menu, controller )
	wildcard1:setLeftRight( false, false, -37.16, 37.16 )
	wildcard1:setTopBottom( false, true, -150, -38 )
	wildcard1:linkToElementModel( self, "image", true, function ( model )
		local image = Engine.GetModelValue( model )
		if image then
			wildcard1.itemImage:setImage( RegisterImage( image ) )
		end
	end )
	self:addElement( wildcard1 )
	self.wildcard1 = wildcard1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, 37.16, 111.5 )
				self.wildcard2:setTopBottom( false, true, -140, -28 )
				self.wildcard2:setZRot( -15 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -112, -37.68 )
				self.wildcard3:setTopBottom( false, true, -140, -28 )
				self.wildcard3:setZRot( 15 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard1:setTopBottom( false, true, -150, -38 )
				self.wildcard1:setZRot( 0 )
				self.clipFinished( wildcard1, {} )
			end,
			ToCard1 = function ()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 409, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( false, false, 47.16, 121.5 )
					wildcard2:setTopBottom( false, true, -140, -28 )
					wildcard2:setZRot( -15 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, 37.16, 111.5 )
				self.wildcard2:setTopBottom( false, true, -140, -28 )
				self.wildcard2:setZRot( -15 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 509, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( false, false, -122, -47.68 )
					wildcard3:setTopBottom( false, true, -140, -28 )
					wildcard3:setZRot( 15 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -112, -37.68 )
				self.wildcard3:setTopBottom( false, true, -140, -28 )
				self.wildcard3:setZRot( 15 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 310, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( false, false, -37.16, 37.16 )
					wildcard1:setTopBottom( false, true, -155, -43 )
					wildcard1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard1:setTopBottom( false, true, -150, -38 )
				self.wildcard1:setZRot( 0 )
				wildcard1Frame2( wildcard1, {} )
			end
		},
		Card1to2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard2:setTopBottom( false, true, -155, -43 )
				self.wildcard2:setZRot( 0 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -200, -125.68 )
				self.wildcard3:setTopBottom( false, true, -104, 8 )
				self.wildcard3:setZRot( 30 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -122, -47.68 )
				self.wildcard1:setTopBottom( false, true, -140, -28 )
				self.wildcard1:setZRot( 15 )
				self.clipFinished( wildcard1, {} )
			end,
			ToCard1 = function ()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 150, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( false, false, 47.16, 121.5 )
					wildcard2:setTopBottom( false, true, -140, -28 )
					wildcard2:setZRot( -15 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard2:setTopBottom( false, true, -155, -43 )
				self.wildcard2:setZRot( 0 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( false, false, -122, -47.68 )
					wildcard3:setTopBottom( false, true, -140, -28 )
					wildcard3:setZRot( 15 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -200, -125.68 )
				self.wildcard3:setTopBottom( false, true, -104, 8 )
				self.wildcard3:setZRot( 30 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 219, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( false, false, -37.16, 37.16 )
					wildcard1:setTopBottom( false, true, -155, -43 )
					wildcard1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -122, -47.68 )
				self.wildcard1:setTopBottom( false, true, -140, -28 )
				self.wildcard1:setZRot( 15 )
				wildcard1Frame2( wildcard1, {} )
			end
		},
		Card1to3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, 122.68, 197 )
				self.wildcard2:setTopBottom( false, true, -104, 8 )
				self.wildcard2:setZRot( -30 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard3:setTopBottom( false, true, -155, -43 )
				self.wildcard3:setZRot( 0 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, 47.16, 121.5 )
				self.wildcard1:setTopBottom( false, true, -140, -28 )
				self.wildcard1:setZRot( -15 )
				self.clipFinished( wildcard1, {} )
			end,
			ToCard1 = function ()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( false, false, 47.16, 121.5 )
					wildcard2:setTopBottom( false, true, -140, -28 )
					wildcard2:setZRot( -15 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, 122.68, 197 )
				self.wildcard2:setTopBottom( false, true, -104, 8 )
				self.wildcard2:setZRot( -30 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 289, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( false, false, -122, -47.68 )
					wildcard3:setTopBottom( false, true, -140, -28 )
					wildcard3:setZRot( 15 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard3:setTopBottom( false, true, -155, -43 )
				self.wildcard3:setZRot( 0 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 400, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( false, false, -37.16, 37.16 )
					wildcard1:setTopBottom( false, true, -155, -43 )
					wildcard1:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, 47.16, 121.5 )
				self.wildcard1:setTopBottom( false, true, -140, -28 )
				self.wildcard1:setZRot( -15 )
				wildcard1Frame2( wildcard1, {} )
			end
		},
		ToCard1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, 47.16, 121.5 )
				self.wildcard2:setTopBottom( false, true, -140, -28 )
				self.wildcard2:setZRot( -15 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -122, -47.68 )
				self.wildcard3:setTopBottom( false, true, -140, -28 )
				self.wildcard3:setZRot( 15 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard1:setTopBottom( false, true, -155, -43 )
				self.wildcard1:setZRot( 0 )
				self.clipFinished( wildcard1, {} )
			end,
			Card1to2 = function ()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 319, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( false, false, -37.16, 37.16 )
					wildcard2:setTopBottom( false, true, -155, -43 )
					wildcard2:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, 47.16, 121.5 )
				self.wildcard2:setTopBottom( false, true, -140, -28 )
				self.wildcard2:setZRot( -15 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 170, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( false, false, -200, -125.68 )
					wildcard3:setTopBottom( false, true, -104, 8 )
					wildcard3:setZRot( 30 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -122, -47.68 )
				self.wildcard3:setTopBottom( false, true, -140, -28 )
				self.wildcard3:setZRot( 15 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 230, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( false, false, -122, -47.68 )
					wildcard1:setTopBottom( false, true, -140, -28 )
					wildcard1:setZRot( 15 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard1:setTopBottom( false, true, -155, -43 )
				self.wildcard1:setZRot( 0 )
				wildcard1Frame2( wildcard1, {} )
			end,
			Card1to3 = function ()
				self:setupElementClipCounter( 3 )
				local wildcard2Frame2 = function ( wildcard2, event )
					if not event.interrupted then
						wildcard2:beginAnimation( "keyframe", 189, true, true, CoD.TweenType.Linear )
					end
					wildcard2:setLeftRight( false, false, 122.68, 197 )
					wildcard2:setTopBottom( false, true, -104, 8 )
					wildcard2:setZRot( -30 )
					if event.interrupted then
						self.clipFinished( wildcard2, event )
					else
						wildcard2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, 47.16, 121.5 )
				self.wildcard2:setTopBottom( false, true, -140, -28 )
				self.wildcard2:setZRot( -15 )
				wildcard2Frame2( wildcard2, {} )
				local wildcard3Frame2 = function ( wildcard3, event )
					if not event.interrupted then
						wildcard3:beginAnimation( "keyframe", 340, true, true, CoD.TweenType.Linear )
					end
					wildcard3:setLeftRight( false, false, -37.16, 37.16 )
					wildcard3:setTopBottom( false, true, -155, -43 )
					wildcard3:setZRot( 0 )
					if event.interrupted then
						self.clipFinished( wildcard3, event )
					else
						wildcard3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -121, -46.68 )
				self.wildcard3:setTopBottom( false, true, -140, -28 )
				self.wildcard3:setZRot( 15 )
				wildcard3Frame2( wildcard3, {} )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
					end
					wildcard1:setLeftRight( false, false, 47.16, 121.5 )
					wildcard1:setTopBottom( false, true, -140, -28 )
					wildcard1:setZRot( -15 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard1:setTopBottom( false, true, -155, -43 )
				self.wildcard1:setZRot( 0 )
				wildcard1Frame2( wildcard1, {} )
			end,
			Card1Selected = function ()
				self:setupElementClipCounter( 1 )
				local wildcard1Frame2 = function ( wildcard1, event )
					if not event.interrupted then
						wildcard1:beginAnimation( "keyframe", 600, true, true, CoD.TweenType.Back )
					end
					wildcard1:setLeftRight( false, false, -37.16, 37.16 )
					wildcard1:setTopBottom( false, true, -333, -221 )
					if event.interrupted then
						self.clipFinished( wildcard1, event )
					else
						wildcard1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard1:setTopBottom( false, true, -155, -43 )
				wildcard1Frame2( wildcard1, {} )
			end
		},
		Card1Selected = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, 52.5, 137.5 )
				self.wildcard2:setTopBottom( false, true, -136, -8 )
				self.wildcard2:setZRot( -5 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -137.5, -52.5 )
				self.wildcard3:setTopBottom( false, true, -136, -8 )
				self.wildcard3:setZRot( 5 )
				self.clipFinished( wildcard3, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -37.16, 37.16 )
				self.wildcard1:setTopBottom( false, true, -333, -221 )
				self.wildcard1:setZRot( 0 )
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
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.wildcard1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.wildcard2:close()
		element.wildcard3:close()
		element.wildcard1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

