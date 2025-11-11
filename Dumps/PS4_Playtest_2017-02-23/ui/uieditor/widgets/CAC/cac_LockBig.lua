require( "ui.uieditor.widgets.CAC.cac_IconTokenXLarge" )
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
	self:setLeftRight( 0, 0, 0, 144 )
	self:setTopBottom( 0, 0, 0, 1005 )
	self.anyChildUsesUpdateState = true
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( 0.5, 0.5, -6, 6 )
	LineSide:setTopBottom( 0, 1, 0, 0 )
	LineSide:setZRot( 90 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local LineSide0 = LUI.UIImage.new()
	LineSide0:setLeftRight( 0.5, 0.5, -6, 6 )
	LineSide0:setTopBottom( 0, 1, 0, 0 )
	LineSide0:setZRot( 90 )
	LineSide0:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide0 )
	self.LineSide0 = LineSide0
	
	local LineSide00 = LUI.UIImage.new()
	LineSide00:setLeftRight( 0.5, 0.5, -6, 6 )
	LineSide00:setTopBottom( 0, 1, 0, 0 )
	LineSide00:setZRot( 90 )
	LineSide00:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide00 )
	self.LineSide00 = LineSide00
	
	local LineSide000 = LUI.UIImage.new()
	LineSide000:setLeftRight( 0.5, 0.5, -6, 6 )
	LineSide000:setTopBottom( 0, 1, 0, 0 )
	LineSide000:setZRot( 90 )
	LineSide000:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide000 )
	self.LineSide000 = LineSide000
	
	local circles = LUI.UIImage.new()
	circles:setLeftRight( 0.5, 0.5, -72, 72 )
	circles:setTopBottom( 0.5, 0.5, -70, 70 )
	circles:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles )
	self.circles = circles
	
	local circles0 = LUI.UIImage.new()
	circles0:setLeftRight( 0.5, 0.5, -72, 72 )
	circles0:setTopBottom( 0.5, 0.5, -70, 70 )
	circles0:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles0 )
	self.circles0 = circles0
	
	local circles00 = LUI.UIImage.new()
	circles00:setLeftRight( 0.5, 0.5, -72, 72 )
	circles00:setTopBottom( 0.5, 0.5, -70, 70 )
	circles00:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles00 )
	self.circles00 = circles00
	
	local lockedIcon0 = CoD.cac_lock.new( menu, controller )
	lockedIcon0:setLeftRight( 0.5, 0.5, -24, 22 )
	lockedIcon0:setTopBottom( 0.5, 0.5, -26, 22 )
	lockedIcon0:setScale( 2.3 )
	lockedIcon0.lockedIcon:setAlpha( 0 )
	self:addElement( lockedIcon0 )
	self.lockedIcon0 = lockedIcon0
	
	local cacIconTokenXLarge0 = CoD.cac_IconTokenXLarge.new( menu, controller )
	cacIconTokenXLarge0:setLeftRight( 0.5, 0.5, -49, 48 )
	cacIconTokenXLarge0:setTopBottom( 0.5, 0.5, -50, 47 )
	self:addElement( cacIconTokenXLarge0 )
	self.cacIconTokenXLarge0 = cacIconTokenXLarge0
	
	local circles000 = LUI.UIImage.new()
	circles000:setLeftRight( 0.5, 0.5, -72, 72 )
	circles000:setTopBottom( 0.5, 0.5, -70, 70 )
	circles000:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	circles000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( circles000 )
	self.circles000 = circles000
	
	self.resetProperties = function ()
		LineSide:completeAnimation()
		LineSide0:completeAnimation()
		LineSide00:completeAnimation()
		LineSide000:completeAnimation()
		circles:completeAnimation()
		circles0:completeAnimation()
		circles00:completeAnimation()
		lockedIcon0:completeAnimation()
		circles000:completeAnimation()
		cacIconTokenXLarge0:completeAnimation()
		LineSide:setAlpha( 1 )
		LineSide0:setAlpha( 1 )
		LineSide00:setAlpha( 1 )
		LineSide000:setAlpha( 1 )
		circles:setAlpha( 1 )
		circles0:setAlpha( 1 )
		circles00:setAlpha( 1 )
		lockedIcon0:setAlpha( 1 )
		circles000:setAlpha( 1 )
		cacIconTokenXLarge0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				cacIconTokenXLarge0:completeAnimation()
				self.cacIconTokenXLarge0:setAlpha( 0 )
				self.clipFinished( cacIconTokenXLarge0, {} )
				circles000:completeAnimation()
				self.circles000:setAlpha( 0 )
				self.clipFinished( circles000, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				cacIconTokenXLarge0:completeAnimation()
				self.cacIconTokenXLarge0:setAlpha( 0 )
				self.clipFinished( cacIconTokenXLarge0, {} )
			end
		},
		NotAvailable = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				lockedIcon0:completeAnimation()
				self.lockedIcon0:setAlpha( 0 )
				self.clipFinished( lockedIcon0, {} )
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
				local f7_local0
				if not IsCACItemPurchased( element, controller ) and not IsCurrentMenuAttachmentMenu( menu ) then
					f7_local0 = not IsInPermanentUnlockMenu( controller )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.lockedIcon0:close()
		self.cacIconTokenXLarge0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

