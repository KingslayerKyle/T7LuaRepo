local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
	local onMouseEnter = function ( self, event )
		self:playClip( "GainOver" )
		self.nextClip = "Over"
	end
	
	self:registerEventHandler( "mouseenter", onMouseEnter )
	local onMouseLeave = function ( self, event )
		self:playClip( "LoseOver" )
		self.nextClip = "DefaultClip"
	end
	
	self:registerEventHandler( "mouseleave", onMouseLeave )
end

CoD.OverClipContainer = InheritFrom( LUI.UIElement )
CoD.OverClipContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.OverClipContainer )
	self.id = "OverClipContainer"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( 0, 0, 0, 459 )
	self:setTopBottom( 0, 0, 0, 130 )
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -141, 201 )
	Glow2:setTopBottom( 0, 1, -52, 68 )
	Glow2:setRGB( 0.91, 1, 0 )
	Glow2:setAlpha( 0.5 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	self.resetProperties = function ()
		Glow2:completeAnimation()
		Glow2:setAlpha( 0.5 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end,
			Over = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
			end,
			GainOver = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				Glow2Frame2( Glow2, {} )
			end,
			LoseOver = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local Glow2Frame2 = function ( Glow2, event )
					if not event.interrupted then
						Glow2:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					Glow2:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Glow2, event )
					else
						Glow2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				Glow2Frame2( Glow2, {} )
			end
		},
		HIdden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "HIdden",
			condition = function ( menu, element, event )
				return IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

