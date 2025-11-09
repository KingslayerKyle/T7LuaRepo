CoD.CommsWidget_CharacterImages = InheritFrom( LUI.UIElement )
CoD.CommsWidget_CharacterImages.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_CharacterImages )
	self.id = "CommsWidget_CharacterImages"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 187 )
	self:setTopBottom( true, false, 0, 152 )
	
	local ImgCharRachel = LUI.UIImage.new()
	ImgCharRachel:setLeftRight( true, true, 16.34, -18.66 )
	ImgCharRachel:setTopBottom( true, true, 0, 24 )
	ImgCharRachel:setRGB( 1, 1, 1 )
	ImgCharRachel:setAlpha( 0.7 )
	ImgCharRachel:setYRot( -15.2 )
	ImgCharRachel:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	ImgCharRachel:linkToElementModel( self, "characterImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImgCharRachel:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ImgCharRachel )
	self.ImgCharRachel = ImgCharRachel
	
	local ImgCharRachel0 = LUI.UIImage.new()
	ImgCharRachel0:setLeftRight( true, true, 16.34, -18.66 )
	ImgCharRachel0:setTopBottom( true, true, 0, 24 )
	ImgCharRachel0:setRGB( 0.51, 0.75, 1 )
	ImgCharRachel0:setAlpha( 0.2 )
	ImgCharRachel0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	ImgCharRachel0:setShaderVector( 0, 100, 0, 0, 0 )
	ImgCharRachel0:setShaderVector( 1, 0.5, 0, 0, 0 )
	ImgCharRachel0:setShaderVector( 2, 10, 0, 0, 0 )
	ImgCharRachel0:linkToElementModel( self, "characterImage", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImgCharRachel0:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( ImgCharRachel0 )
	self.ImgCharRachel0 = ImgCharRachel0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local ImgCharRachelFrame2 = function ( ImgCharRachel, event )
					local ImgCharRachelFrame3 = function ( ImgCharRachel, event )
						if not event.interrupted then
							ImgCharRachel:beginAnimation( "keyframe", 2380, true, true, CoD.TweenType.Linear )
						end
						ImgCharRachel:setAlpha( 0.7 )
						ImgCharRachel:setYRot( -15.2 )
						if event.interrupted then
							self.clipFinished( ImgCharRachel, event )
						else
							ImgCharRachel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						ImgCharRachelFrame3( ImgCharRachel, event )
						return 
					else
						ImgCharRachel:beginAnimation( "keyframe", 2400, true, true, CoD.TweenType.Linear )
						ImgCharRachel:setYRot( 6.8 )
						ImgCharRachel:registerEventHandler( "transition_complete_keyframe", ImgCharRachelFrame3 )
					end
				end
				
				ImgCharRachel:completeAnimation()
				self.ImgCharRachel:setAlpha( 0.7 )
				self.ImgCharRachel:setYRot( -15.2 )
				ImgCharRachelFrame2( ImgCharRachel, {} )
				ImgCharRachel0:completeAnimation()
				self.ImgCharRachel0:setRGB( 0.51, 0.75, 1 )
				self.ImgCharRachel0:setAlpha( 0.2 )
				self.clipFinished( ImgCharRachel0, {} )
				self.nextClip = "DefaultClip"
			end
		},
		CharRachel = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local ImgCharRachelFrame2 = function ( ImgCharRachel, event )
					if not event.interrupted then
						ImgCharRachel:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					ImgCharRachel:setAlpha( 0.7 )
					ImgCharRachel:setYRot( 20 )
					if event.interrupted then
						self.clipFinished( ImgCharRachel, event )
					else
						ImgCharRachel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ImgCharRachel:completeAnimation()
				self.ImgCharRachel:setAlpha( 0.7 )
				self.ImgCharRachel:setYRot( -20 )
				ImgCharRachelFrame2( ImgCharRachel, {} )
				ImgCharRachel0:completeAnimation()
				self.ImgCharRachel0:setAlpha( 0.2 )
				self.clipFinished( ImgCharRachel0, {} )
			end
		},
		CharEgypt = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ImgCharRachel:completeAnimation()
				self.ImgCharRachel:setAlpha( 0 )
				self.clipFinished( ImgCharRachel, {} )
				ImgCharRachel0:completeAnimation()
				self.ImgCharRachel0:setAlpha( 0 )
				self.clipFinished( ImgCharRachel0, {} )
			end
		}
	}
	self.close = function ( self )
		self.ImgCharRachel:close()
		self.ImgCharRachel0:close()
		CoD.CommsWidget_CharacterImages.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

