require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.cac_LockBig = InheritFrom( LUI.UIElement )
CoD.cac_LockBig.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_LockBig )
	self.id = "cac_LockBig"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 670 )
	self.anyChildUsesUpdateState = true
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( false, false, -4, 4 )
	LineSide:setTopBottom( true, true, 0, 0 )
	LineSide:setZRot( 90 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( false, false, -4, 4 )
	LineSide0:setTopBottom( true, true, 0, 0 )
	LineSide0:setZRot( 90 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( false, false, -4, 4 )
	LineSide00:setTopBottom( true, true, 0, 0 )
	LineSide00:setZRot( 90 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local LineSide000 = LUI.UIImage.new()
	LineSide000:setLeftRight( false, false, -4, 4 )
	LineSide000:setTopBottom( true, true, 0, 0 )
	LineSide000:setZRot( 90 )
	LineSide000:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide000 )
	self.LineSide000 = LineSide000
	
	local circles = LUI.UIImage.new()
	circles:setLeftRight( false, false, -48, 48 )
	circles:setTopBottom( false, false, -46.67, 46.67 )
	circles:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles )
	self.circles = circles
	
	local circles0 = LUI.UIImage.new()
	circles0:setLeftRight( false, false, -48, 48 )
	circles0:setTopBottom( false, false, -46.67, 46.67 )
	circles0:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles0 )
	self.circles0 = circles0
	
	local circles00 = LUI.UIImage.new()
	circles00:setLeftRight( false, false, -48, 48 )
	circles00:setTopBottom( false, false, -46.67, 46.67 )
	circles00:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles00 )
	self.circles00 = circles00
	
	local lockedIcon0 = CoD.cac_lock.new( menu, controller )
	lockedIcon0:setLeftRight( false, false, -16, 15 )
	lockedIcon0:setTopBottom( false, false, -17, 15 )
	lockedIcon0:setScale( 2.3 )
	lockedIcon0.lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon0 )
	self.lockedIcon0 = lockedIcon0
	
	local Token = LUI.UIImage.new()
	Token:setLeftRight( false, false, -32.25, 32.25 )
	Token:setTopBottom( false, false, -33.25, 31.25 )
	Token:setAlpha( 0 )
	Token:setImage( RegisterImage( "uie_img_t7_menu_welcome_icontokenxlarge" ) )
	self:addElement( Token )
	self.Token = Token
	
	local circles000 = LUI.UIImage.new()
	circles000:setLeftRight( false, false, -48, 48 )
	circles000:setTopBottom( false, false, -46.67, 46.67 )
	circles000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles000 )
	self.circles000 = circles000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				LineSide:completeAnimation()
				self.LineSide:setAlpha( 0 )
				self.clipFinished( LineSide, {} )
				LineSide0:completeAnimation()
				self.LineSide0:setAlpha( 0 )
				self.clipFinished( LineSide0, {} )
				LineSide00:completeAnimation()
				self.LineSide00:setAlpha( 0 )
				self.clipFinished( LineSide00, {} )
				LineSide000:completeAnimation()
				self.LineSide000:setAlpha( 0 )
				self.clipFinished( LineSide000, {} )
				circles:completeAnimation()
				self.circles:setAlpha( 0 )
				self.clipFinished( circles, {} )
				circles0:completeAnimation()
				self.circles0:setAlpha( 0 )
				self.clipFinished( circles0, {} )
				circles00:completeAnimation()
				self.circles00:setAlpha( 0 )
				self.clipFinished( circles00, {} )
				lockedIcon0:completeAnimation()
				self.lockedIcon0:setAlpha( 0 )
				self.clipFinished( lockedIcon0, {} )
				Token:completeAnimation()
				self.Token:setAlpha( 0 )
				self.clipFinished( Token, {} )
				circles000:completeAnimation()
				self.circles000:setAlpha( 0 )
				self.clipFinished( circles000, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				LineSide:completeAnimation()
				self.LineSide:setAlpha( 1 )
				self.clipFinished( LineSide, {} )
				LineSide0:completeAnimation()
				self.LineSide0:setAlpha( 1 )
				self.clipFinished( LineSide0, {} )
				LineSide00:completeAnimation()
				self.LineSide00:setAlpha( 1 )
				self.clipFinished( LineSide00, {} )
				LineSide000:completeAnimation()
				self.LineSide000:setAlpha( 1 )
				self.clipFinished( LineSide000, {} )
				circles:completeAnimation()
				self.circles:setAlpha( 1 )
				self.clipFinished( circles, {} )
				circles0:completeAnimation()
				self.circles0:setAlpha( 1 )
				self.clipFinished( circles0, {} )
				circles00:completeAnimation()
				self.circles00:setAlpha( 1 )
				self.clipFinished( circles00, {} )
				local lockedIcon0Frame2 = function ( lockedIcon0, event )
					if not event.interrupted then
						lockedIcon0:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
					end
					lockedIcon0:setAlpha( 1 )
					lockedIcon0:setYRot( 360 )
					if event.interrupted then
						self.clipFinished( lockedIcon0, event )
					else
						lockedIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				lockedIcon0:completeAnimation()
				self.lockedIcon0:setAlpha( 1 )
				self.lockedIcon0:setYRot( 0 )
				lockedIcon0Frame2( lockedIcon0, {} )
				Token:completeAnimation()
				self.Token:setAlpha( 0 )
				self.clipFinished( Token, {} )
				circles000:completeAnimation()
				self.circles000:setAlpha( 1 )
				self.clipFinished( circles000, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				LineSide:completeAnimation()
				self.LineSide:setAlpha( 1 )
				self.clipFinished( LineSide, {} )
				LineSide0:completeAnimation()
				self.LineSide0:setAlpha( 1 )
				self.clipFinished( LineSide0, {} )
				LineSide00:completeAnimation()
				self.LineSide00:setAlpha( 1 )
				self.clipFinished( LineSide00, {} )
				LineSide000:completeAnimation()
				self.LineSide000:setAlpha( 1 )
				self.clipFinished( LineSide000, {} )
				circles:completeAnimation()
				self.circles:setAlpha( 1 )
				self.clipFinished( circles, {} )
				circles0:completeAnimation()
				self.circles0:setAlpha( 1 )
				self.clipFinished( circles0, {} )
				circles00:completeAnimation()
				self.circles00:setAlpha( 1 )
				self.clipFinished( circles00, {} )
				lockedIcon0:completeAnimation()
				self.lockedIcon0:setAlpha( 0 )
				self.clipFinished( lockedIcon0, {} )
				local TokenFrame2 = function ( Token, event )
					if not event.interrupted then
						Token:beginAnimation( "keyframe", 1200, false, false, CoD.TweenType.Linear )
					end
					Token:setAlpha( 1 )
					Token:setYRot( 360 )
					if event.interrupted then
						self.clipFinished( Token, event )
					else
						Token:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Token:completeAnimation()
				self.Token:setAlpha( 1 )
				self.Token:setYRot( 0 )
				TokenFrame2( Token, {} )
				circles000:completeAnimation()
				self.circles000:setAlpha( 1 )
				self.clipFinished( circles000, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsCACItemLocked( menu, element, controller )
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				local f8_local0
				if not IsCACItemPurchased( element, controller ) then
					f8_local0 = not IsCurrentMenuAttachmentMenu( menu )
				else
					f8_local0 = false
				end
				return f8_local0
			end
		}
	} )
	self:linkToElementModel( "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.lockedIcon0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

