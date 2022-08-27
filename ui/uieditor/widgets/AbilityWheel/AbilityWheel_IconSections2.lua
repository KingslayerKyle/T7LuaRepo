-- aa7cd37b0b96225f29438858edb2cd69
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_IconSections2 = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_IconSections2.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_IconSections2 )
	self.id = "AbilityWheel_IconSections2"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 124 )
	self:setTopBottom( true, false, 0, 81 )
	
	local img6 = LUI.UIImage.new()
	img6:setLeftRight( false, false, -42, 2 )
	img6:setTopBottom( false, false, -40.5, -28.5 )
	img6:setAlpha( RandomAddPercent( 40, 0 ) )
	img6:setZRot( 30 )
	img6:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_brackettop" ) )
	img6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img6 )
	self.img6 = img6
	
	local img1 = LUI.UIImage.new()
	img1:setLeftRight( false, false, -2, 42 )
	img1:setTopBottom( false, false, -40.5, -28.5 )
	img1:setAlpha( RandomAddPercent( 50, 0 ) )
	img1:setZRot( -30 )
	img1:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_brackettop" ) )
	img1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img1 )
	self.img1 = img1
	
	local img5 = LUI.UIImage.new()
	img5:setLeftRight( false, false, -62, -18 )
	img5:setTopBottom( false, false, -6.5, 5.5 )
	img5:setAlpha( RandomAddPercent( 40, 0 ) )
	img5:setZRot( 90 )
	img5:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_brackettop" ) )
	img5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img5 )
	self.img5 = img5
	
	local img2 = LUI.UIImage.new()
	img2:setLeftRight( false, false, 18, 62 )
	img2:setTopBottom( false, false, -6.5, 5.5 )
	img2:setAlpha( RandomAddPercent( 100, 0 ) )
	img2:setZRot( -90 )
	img2:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_brackettop" ) )
	img2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( img2 )
	self.img2 = img2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				local img6Frame2 = function ( img6, event )
					if not event.interrupted then
						img6:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					img6:setAlpha( RandomAddPercent( 40, 0.01 ) )
					if event.interrupted then
						self.clipFinished( img6, event )
					else
						img6:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				img6:completeAnimation()
				self.img6:setAlpha( RandomAddPercent( 40, 0 ) )
				img6Frame2( img6, {} )
				local img1Frame2 = function ( img1, event )
					if not event.interrupted then
						img1:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					img1:setAlpha( RandomAddPercent( 50, 0.01 ) )
					if event.interrupted then
						self.clipFinished( img1, event )
					else
						img1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				img1:completeAnimation()
				self.img1:setAlpha( RandomAddPercent( 50, 0 ) )
				img1Frame2( img1, {} )
				local img5Frame2 = function ( img5, event )
					if not event.interrupted then
						img5:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					img5:setAlpha( RandomAddPercent( 40, 0.01 ) )
					if event.interrupted then
						self.clipFinished( img5, event )
					else
						img5:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				img5:completeAnimation()
				self.img5:setAlpha( RandomAddPercent( 40, 0 ) )
				img5Frame2( img5, {} )
				local img2Frame2 = function ( img2, event )
					if not event.interrupted then
						img2:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
					end
					img2:setAlpha( RandomAddPercent( 100, 0.01 ) )
					if event.interrupted then
						self.clipFinished( img2, event )
					else
						img2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				img2:completeAnimation()
				self.img2:setAlpha( RandomAddPercent( 100, 0 ) )
				img2Frame2( img2, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Unused = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

