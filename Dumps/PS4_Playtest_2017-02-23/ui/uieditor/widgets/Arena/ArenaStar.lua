CoD.ArenaStar = InheritFrom( LUI.UIElement )
CoD.ArenaStar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.ArenaStar )
	self.id = "ArenaStar"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 36 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local outline = LUI.UIImage.new()
	outline:setLeftRight( 0, 0, 6, 30 )
	outline:setTopBottom( 0, 0, 6, 30 )
	outline:setImage( RegisterImage( "uie_t7_arena_star_petit_grey" ) )
	self:addElement( outline )
	self.outline = outline
	
	local active = LUI.UIImage.new()
	active:setLeftRight( 0, 0, 6, 30 )
	active:setTopBottom( 0, 0, 6, 30 )
	active:setImage( RegisterImage( "uie_t7_arena_star_petit_yellow" ) )
	self:addElement( active )
	self.active = active
	
	self.resetProperties = function ()
		active:completeAnimation()
		outline:completeAnimation()
		active:setRGB( 1, 1, 1 )
		active:setAlpha( 1 )
		active:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		outline:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				outline:completeAnimation()
				self.outline:setAlpha( 0 )
				self.clipFinished( outline, {} )
				active:completeAnimation()
				self.active:setAlpha( 0 )
				self.clipFinished( active, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				active:completeAnimation()
				self.active:setRGB( 1, 0.74, 0.01 )
				self.active:setAlpha( 0 )
				self.clipFinished( active, {} )
			end
		},
		Earned = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local activeFrame2 = function ( active, event )
					if not event.interrupted then
						active:beginAnimation( "keyframe", 2000, true, true, CoD.TweenType.Linear )
					end
					active:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint" ) )
					active:setShaderVector( 0, 1, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( active, event )
					else
						active:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				active:completeAnimation()
				self.active:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_glint" ) )
				self.active:setShaderVector( 0, 0, 0, 0, 0 )
				activeFrame2( active, {} )
			end
		},
		NewlyEarned = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local activeFrame2 = function ( active, event )
					local activeFrame3 = function ( active, event )
						if not event.interrupted then
							active:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Bounce )
						end
						active:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( active, event )
						else
							active:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						activeFrame3( active, event )
						return 
					else
						active:beginAnimation( "keyframe", 340, false, false, CoD.TweenType.Linear )
						active:registerEventHandler( "transition_complete_keyframe", activeFrame3 )
					end
				end
				
				active:completeAnimation()
				self.active:setAlpha( 0 )
				activeFrame2( active, {} )
			end
		},
		Lost = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local activeFrame2 = function ( active, event )
					local activeFrame3 = function ( active, event )
						if not event.interrupted then
							active:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Bounce )
						end
						active:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( active, event )
						else
							active:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						activeFrame3( active, event )
						return 
					else
						active:beginAnimation( "keyframe", 660, false, false, CoD.TweenType.Linear )
						active:registerEventHandler( "transition_complete_keyframe", activeFrame3 )
					end
				end
				
				active:completeAnimation()
				self.active:setAlpha( 1 )
				activeFrame2( active, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				local f15_local0
				if not IsSelfModelValueTrue( element, controller, "earned" ) then
					f15_local0 = not IsSelfModelValueTrue( element, controller, "lost" )
				else
					f15_local0 = false
				end
				return f15_local0
			end
		},
		{
			stateName = "Earned",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "earned" ) and not IsSelfModelValueTrue( element, controller, "new" )
			end
		},
		{
			stateName = "NewlyEarned",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "earned" ) and IsSelfModelValueTrue( element, controller, "new" )
			end
		},
		{
			stateName = "Lost",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "lost" )
			end
		}
	} )
	self:linkToElementModel( self, "earned", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "earned"
		} )
	end )
	self:linkToElementModel( self, "lost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lost"
		} )
	end )
	self:linkToElementModel( self, "new", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "new"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

