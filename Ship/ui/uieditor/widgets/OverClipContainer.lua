-- 4adf57c9103c33fe661819cbbf64ac0d
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
	self:registerEventHandler( "mouseenter", function ( element, event )
		element:playClip( "GainOver" )
		element.nextClip = "Over"
	end )
	self:registerEventHandler( "mouseleave", function ( element, event )
		element:playClip( "LoseOver" )
		element.nextClip = "DefaultClip"
	end )
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
	self:setLeftRight( true, false, 0, 306 )
	self:setTopBottom( true, false, 0, 87 )
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -94, 134 )
	Glow2:setTopBottom( true, true, -35.21, 45.21 )
	Glow2:setRGB( 0.91, 1, 0 )
	Glow2:setAlpha( 0.5 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
			end,
			GainOver = function ()
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
		local f4_local2 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f4_local2( element, event )
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
