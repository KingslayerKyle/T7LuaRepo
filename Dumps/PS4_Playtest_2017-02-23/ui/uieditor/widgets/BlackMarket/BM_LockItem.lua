CoD.BM_LockItem = InheritFrom( LUI.UIElement )
CoD.BM_LockItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_LockItem )
	self.id = "BM_LockItem"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 367 )
	self:setTopBottom( 0, 0, 0, 73 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 1, 0, 0 )
	black:setTopBottom( 0, 1, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.55 )
	self:addElement( black )
	self.black = black
	
	local desc = LUI.UIText.new()
	desc:setLeftRight( 0, 0, 70, 366 )
	desc:setTopBottom( 0, 0, 37, 65 )
	desc:setText( Engine.Localize( "Available at the Sergeant (level 10)" ) )
	desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( desc )
	self.desc = desc
	
	local title = LUI.UIText.new()
	title:setLeftRight( 0, 0, 71, 363 )
	title:setTopBottom( 0, 0, 10, 37 )
	title:setText( Engine.Localize( "BATTERY HELMET" ) )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local lockedIcon0 = LUI.UIImage.new()
	lockedIcon0:setLeftRight( 0.5, 0.5, -174, -124 )
	lockedIcon0:setTopBottom( 0.5, 0.5, -24, 26 )
	lockedIcon0:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	self:addElement( lockedIcon0 )
	self.lockedIcon0 = lockedIcon0
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( 0.5, 0.5, -174, -124 )
	lockedIcon:setTopBottom( 0.5, 0.5, -24, 26 )
	lockedIcon:setAlpha( 0.47 )
	lockedIcon:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	lockedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.resetProperties = function ()
		lockedIcon:completeAnimation()
		lockedIcon0:completeAnimation()
		title:completeAnimation()
		desc:completeAnimation()
		black:completeAnimation()
		lockedIcon:setAlpha( 0.47 )
		lockedIcon0:setAlpha( 1 )
		title:setAlpha( 1 )
		desc:setAlpha( 1 )
		black:setAlpha( 0.55 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )
				desc:completeAnimation()
				self.desc:setAlpha( 0 )
				self.clipFinished( desc, {} )
				title:completeAnimation()
				self.title:setAlpha( 0 )
				self.clipFinished( title, {} )
				lockedIcon0:completeAnimation()
				self.lockedIcon0:setAlpha( 0 )
				self.clipFinished( lockedIcon0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

