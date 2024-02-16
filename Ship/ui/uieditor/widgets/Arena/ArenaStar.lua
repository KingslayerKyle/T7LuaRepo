-- 8c86eed3c5282ddee8724daf16fd2461
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	
	local outline = LUI.UIImage.new()
	outline:setLeftRight( true, false, 4, 20 )
	outline:setTopBottom( true, false, 4, 20 )
	outline:setImage( RegisterImage( "uie_t7_arena_star_petit_grey" ) )
	self:addElement( outline )
	self.outline = outline
	
	local active = LUI.UIImage.new()
	active:setLeftRight( true, false, 4, 20 )
	active:setTopBottom( true, false, 4, 20 )
	active:setImage( RegisterImage( "uie_t7_arena_star_petit_yellow" ) )
	self:addElement( active )
	self.active = active
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				outline:completeAnimation()
				self.outline:setAlpha( 1 )
				self.clipFinished( outline, {} )

				active:completeAnimation()
				self.active:setAlpha( 1 )
				self.clipFinished( active, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )

				outline:completeAnimation()
				self.outline:setAlpha( 1 )
				self.clipFinished( outline, {} )

				active:completeAnimation()
				self.active:setRGB( 1, 0.74, 0.01 )
				self.active:setAlpha( 0 )
				self.clipFinished( active, {} )
			end
		},
		Earned = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				outline:completeAnimation()
				self.outline:setAlpha( 1 )
				self.clipFinished( outline, {} )
				local activeFrame2 = function ( active, event )
					if not event.interrupted then
						active:beginAnimation( "keyframe", 2000, true, true, CoD.TweenType.Linear )
					end
					active:setAlpha( 1 )
					active:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
					active:setShaderVector( 0, 1, 0, 0, 0 )
					if event.interrupted then
						self.clipFinished( active, event )
					else
						active:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				active:completeAnimation()
				self.active:setAlpha( 1 )
				self.active:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
				self.active:setShaderVector( 0, 0, 0, 0, 0 )
				activeFrame2( active, {} )
			end
		},
		NewlyEarned = {
			DefaultClip = function ()
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
				local f14_local0
				if not IsSelfModelValueTrue( element, controller, "earned" ) then
					f14_local0 = not IsSelfModelValueTrue( element, controller, "lost" )
				else
					f14_local0 = false
				end
				return f14_local0
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
