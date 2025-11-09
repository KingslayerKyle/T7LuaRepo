require( "ui.uieditor.widgets.CPLevels.CPHostSkippingScene" )
require( "ui.uieditor.widgets.CPLevels.CPHoldToSkipSceneText" )

LUI.createMenu.CPSkipSceneMenu = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPSkipSceneMenu" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPSkipSceneMenu.buttonPrompts" )
	local f1_local1 = self
	
	local CPHostSkippingScene0 = CoD.CPHostSkippingScene.new( f1_local1, controller )
	CPHostSkippingScene0:setLeftRight( false, false, -93.5, 93.5 )
	CPHostSkippingScene0:setTopBottom( true, false, 64.86, 90.86 )
	CPHostSkippingScene0:setAlpha( 0 )
	CPHostSkippingScene0.Label0:setText( Engine.Localize( "MENU_HOST_SKIPPING_SCENE" ) )
	self:addElement( CPHostSkippingScene0 )
	self.CPHostSkippingScene0 = CPHostSkippingScene0
	
	local CPSkipSceneButton0 = CoD.CPHoldToSkipSceneText.new( f1_local1, controller )
	CPSkipSceneButton0:setLeftRight( false, true, -262.24, -75.24 )
	CPSkipSceneButton0:setTopBottom( false, true, -69.23, -44.23 )
	CPSkipSceneButton0:setAlpha( 0 )
	self:addElement( CPSkipSceneButton0 )
	self.CPSkipSceneButton0 = CPSkipSceneButton0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CPHostSkippingScene0:completeAnimation()
				self.CPHostSkippingScene0:setAlpha( 0 )
				self.clipFinished( CPHostSkippingScene0, {} )
				CPSkipSceneButton0:completeAnimation()
				self.CPSkipSceneButton0:setAlpha( 0 )
				self.clipFinished( CPSkipSceneButton0, {} )
			end
		},
		HostIsSkipping = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local CPHostSkippingScene0Frame2 = function ( CPHostSkippingScene0, event )
					if not event.interrupted then
						CPHostSkippingScene0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					CPHostSkippingScene0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CPHostSkippingScene0, event )
					else
						CPHostSkippingScene0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CPHostSkippingScene0:completeAnimation()
				self.CPHostSkippingScene0:setAlpha( 0 )
				CPHostSkippingScene0Frame2( CPHostSkippingScene0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local CPHostSkippingScene0Frame2 = function ( CPHostSkippingScene0, event )
					if not event.interrupted then
						CPHostSkippingScene0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					CPHostSkippingScene0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CPHostSkippingScene0, event )
					else
						CPHostSkippingScene0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CPHostSkippingScene0:completeAnimation()
				self.CPHostSkippingScene0:setAlpha( 1 )
				CPHostSkippingScene0Frame2( CPHostSkippingScene0, {} )
				CPSkipSceneButton0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				CPSkipSceneButton0:setAlpha( 0 )
				CPSkipSceneButton0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		},
		ShowSkipButton = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				CPHostSkippingScene0:completeAnimation()
				self.CPHostSkippingScene0:setAlpha( 0 )
				self.clipFinished( CPHostSkippingScene0, {} )
				local CPSkipSceneButton0Frame2 = function ( CPSkipSceneButton0, event )
					if not event.interrupted then
						CPSkipSceneButton0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					CPSkipSceneButton0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( CPSkipSceneButton0, event )
					else
						CPSkipSceneButton0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CPSkipSceneButton0:completeAnimation()
				self.CPSkipSceneButton0:setAlpha( 0 )
				CPSkipSceneButton0Frame2( CPSkipSceneButton0, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				CPHostSkippingScene0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				CPHostSkippingScene0:setAlpha( 0 )
				CPHostSkippingScene0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				local CPSkipSceneButton0Frame2 = function ( CPSkipSceneButton0, event )
					if not event.interrupted then
						CPSkipSceneButton0:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
					end
					CPSkipSceneButton0:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( CPSkipSceneButton0, event )
					else
						CPSkipSceneButton0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CPSkipSceneButton0:completeAnimation()
				self.CPSkipSceneButton0:setAlpha( 1 )
				CPSkipSceneButton0Frame2( CPSkipSceneButton0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HostIsSkipping",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "hostIsSkipping", 1 )
			end
		},
		{
			stateName = "ShowSkipButton",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "showSkipButton", 1 )
			end
		}
	} )
	self:linkToElementModel( self, "hostIsSkipping", true, function ( model )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hostIsSkipping"
		} )
	end )
	self:linkToElementModel( self, "showSkipButton", true, function ( model )
		f1_local1:updateElementState( self, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showSkipButton"
		} )
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPHostSkippingScene0:close()
		element.CPSkipSceneButton0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPSkipSceneMenu.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

