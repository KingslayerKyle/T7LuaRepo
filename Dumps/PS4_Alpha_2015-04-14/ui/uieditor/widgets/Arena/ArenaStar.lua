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
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local outline = LUI.UIImage.new()
	outline:setLeftRight( true, true, 0, 0 )
	outline:setTopBottom( true, true, 0, 0 )
	outline:setRGB( 0.21, 0.21, 0.21 )
	outline:setImage( RegisterImage( "uie_menu_mp_star_rating_empty" ) )
	outline:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( outline )
	self.outline = outline
	
	local active = LUI.UIImage.new()
	active:setLeftRight( true, true, 0, 0 )
	active:setTopBottom( true, true, 0, 0 )
	active:setRGB( 1, 0.74, 0.01 )
	active:setImage( RegisterImage( "uie_menu_mp_star_rating" ) )
	active:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_bitchin_glint" ) )
	active:setShaderVector( 0, 0, 0, 0, 0 )
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
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

