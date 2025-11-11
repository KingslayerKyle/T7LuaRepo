CoD.lobbyFlyout_GenericSelectionButton = InheritFrom( LUI.UIElement )
CoD.lobbyFlyout_GenericSelectionButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.lobbyFlyout_GenericSelectionButton )
	self.id = "lobbyFlyout_GenericSelectionButton"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 162 )
	self:setTopBottom( 0, 0, 0, 162 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 162 )
	BG:setTopBottom( 0, 0, 0, 162 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.3 )
	BG:setScale( 0.7 )
	self:addElement( BG )
	self.BG = BG
	
	local BG2 = LUI.UIImage.new()
	BG2:setLeftRight( 0, 0, 0, 162 )
	BG2:setTopBottom( 0, 0, 0, 162 )
	BG2:setRGB( 0.74, 1, 0.9 )
	BG2:setAlpha( 0 )
	BG2:setScale( 0.7 )
	BG2:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	BG2:setShaderVector( 0, 0, 1, 0, 0 )
	BG2:setShaderVector( 1, 0, 0, 0, 0 )
	BG2:setShaderVector( 2, 0, 1.11, 0, 0 )
	BG2:setShaderVector( 3, 0, 0.7, 0, 0 )
	self:addElement( BG2 )
	self.BG2 = BG2
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( 0, 1, 0, 0 )
	icon:setTopBottom( 0, 1, 0, 0 )
	icon:setScale( 0.7 )
	icon:linkToElementModel( self, "image", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	local BG22 = LUI.UIImage.new()
	BG22:setLeftRight( 0, 0, 24, 138 )
	BG22:setTopBottom( 0, 0, 24, 27 )
	BG22:setRGB( 0.33, 0.95, 0.71 )
	BG22:setAlpha( 0.2 )
	self:addElement( BG22 )
	self.BG22 = BG22
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( 0.5, 0.5, -23, 23 )
	lockedIcon:setTopBottom( 0.5, 0.5, -23, 23 )
	lockedIcon:setAlpha( 0 )
	lockedIcon:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.resetProperties = function ()
		BG22:completeAnimation()
		BG:completeAnimation()
		BG2:completeAnimation()
		icon:completeAnimation()
		BG22:setLeftRight( 0, 0, 24, 138 )
		BG22:setTopBottom( 0, 0, 24, 27 )
		BG22:setAlpha( 0.2 )
		BG22:setScale( 1 )
		BG:setAlpha( 0.3 )
		BG:setScale( 0.7 )
		BG2:setAlpha( 0 )
		BG2:setScale( 0.7 )
		icon:setRGB( 1, 1, 1 )
		icon:setScale( 0.7 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 24, 138 )
				self.BG22:setTopBottom( 0, 0, 24, 28 )
				self.BG22:setAlpha( 0 )
				self.BG22:setScale( 0.9 )
				self.clipFinished( BG22, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setScale( 0.7 )
				BGFrame2( BG, {} )
				local BG2Frame2 = function ( BG2, event )
					if not event.interrupted then
						BG2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG2:setAlpha( 0.03 )
					BG2:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( BG2, event )
					else
						BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0 )
				self.BG2:setScale( 0.7 )
				BG2Frame2( BG2, {} )
				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					icon:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setScale( 0.7 )
				iconFrame2( icon, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 16, 146 )
					BG22:setTopBottom( 0, 0, 16, 19 )
					BG22:setAlpha( 0.2 )
					BG22:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 24, 138 )
				self.BG22:setTopBottom( 0, 0, 24, 28 )
				self.BG22:setAlpha( 0 )
				self.BG22:setScale( 0.9 )
				BG22Frame2( BG22, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BG:completeAnimation()
				self.BG:setScale( 0.8 )
				self.clipFinished( BG, {} )
				BG2:completeAnimation()
				self.BG2:setAlpha( 0.03 )
				self.BG2:setScale( 0.8 )
				self.clipFinished( BG2, {} )
				icon:completeAnimation()
				self.icon:setScale( 0.8 )
				self.clipFinished( icon, {} )
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 16, 146 )
				self.BG22:setTopBottom( 0, 0, 16, 19 )
				self.clipFinished( BG22, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG:setAlpha( 0.3 )
					BG:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0.3 )
				self.BG:setScale( 0.8 )
				BGFrame2( BG, {} )
				local BG2Frame2 = function ( BG2, event )
					if not event.interrupted then
						BG2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG2:setAlpha( 0 )
					BG2:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( BG2, event )
					else
						BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0.03 )
				self.BG2:setScale( 0.8 )
				BG2Frame2( BG2, {} )
				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					icon:setRGB( 1, 1, 1 )
					icon:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setRGB( 1, 1, 1 )
				self.icon:setScale( 0.8 )
				iconFrame2( icon, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 24, 138 )
					BG22:setTopBottom( 0, 0, 24, 28 )
					BG22:setAlpha( 0 )
					BG22:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 16, 146 )
				self.BG22:setTopBottom( 0, 0, 16, 19 )
				self.BG22:setAlpha( 0.2 )
				self.BG22:setScale( 1 )
				BG22Frame2( BG22, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setRGB( 0.42, 0.42, 0.42 )
				self.clipFinished( icon, {} )
				BG22:completeAnimation()
				self.BG22:setAlpha( 0 )
				self.clipFinished( BG22, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				icon:completeAnimation()
				self.icon:setRGB( 0.42, 0.42, 0.42 )
				self.clipFinished( icon, {} )
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 24, 138 )
				self.BG22:setTopBottom( 0, 0, 24, 28 )
				self.BG22:setAlpha( 0 )
				self.BG22:setScale( 0.9 )
				self.clipFinished( BG22, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setScale( 0.7 )
				BGFrame2( BG, {} )
				local BG2Frame2 = function ( BG2, event )
					if not event.interrupted then
						BG2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG2:setAlpha( 0.03 )
					BG2:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( BG2, event )
					else
						BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0 )
				self.BG2:setScale( 0.7 )
				BG2Frame2( BG2, {} )
				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					icon:setRGB( 0.42, 0.42, 0.42 )
					icon:setScale( 0.8 )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setRGB( 0.42, 0.42, 0.42 )
				self.icon:setScale( 0.7 )
				iconFrame2( icon, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 16, 146 )
					BG22:setTopBottom( 0, 0, 16, 19 )
					BG22:setAlpha( 0.2 )
					BG22:setScale( 1 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 24, 138 )
				self.BG22:setTopBottom( 0, 0, 24, 28 )
				self.BG22:setAlpha( 0 )
				self.BG22:setScale( 0.9 )
				BG22Frame2( BG22, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				BG:completeAnimation()
				self.BG:setScale( 0.8 )
				self.clipFinished( BG, {} )
				BG2:completeAnimation()
				self.BG2:setAlpha( 0.03 )
				self.BG2:setScale( 0.8 )
				self.clipFinished( BG2, {} )
				icon:completeAnimation()
				self.icon:setRGB( 0.42, 0.42, 0.42 )
				self.icon:setScale( 0.8 )
				self.clipFinished( icon, {} )
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 16, 146 )
				self.BG22:setTopBottom( 0, 0, 16, 19 )
				self.clipFinished( BG22, {} )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG:setAlpha( 0.3 )
					BG:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setAlpha( 0.3 )
				self.BG:setScale( 0.8 )
				BGFrame2( BG, {} )
				local BG2Frame2 = function ( BG2, event )
					if not event.interrupted then
						BG2:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG2:setAlpha( 0 )
					BG2:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( BG2, event )
					else
						BG2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG2:completeAnimation()
				self.BG2:setAlpha( 0.03 )
				self.BG2:setScale( 0.8 )
				BG2Frame2( BG2, {} )
				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					icon:setRGB( 0.42, 0.42, 0.42 )
					icon:setScale( 0.7 )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setRGB( 0.42, 0.42, 0.42 )
				self.icon:setScale( 0.8 )
				iconFrame2( icon, {} )
				local BG22Frame2 = function ( BG22, event )
					if not event.interrupted then
						BG22:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					BG22:setLeftRight( 0, 0, 24, 138 )
					BG22:setTopBottom( 0, 0, 24, 28 )
					BG22:setAlpha( 0 )
					BG22:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( BG22, event )
					else
						BG22:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG22:completeAnimation()
				self.BG22:setLeftRight( 0, 0, 16, 146 )
				self.BG22:setTopBottom( 0, 0, 16, 19 )
				self.BG22:setAlpha( 0.2 )
				self.BG22:setScale( 1 )
				BG22Frame2( BG22, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return IsDisabled( self, controller )
			end
		},
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( self, controller, "locked" )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	self:linkToElementModel( self, "locked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "locked"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.icon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

