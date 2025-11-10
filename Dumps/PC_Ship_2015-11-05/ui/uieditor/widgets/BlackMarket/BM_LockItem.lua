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
	self:setLeftRight( true, false, 0, 245 )
	self:setTopBottom( true, false, 0, 49 )
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( true, true, 0, 0 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.55 )
	self:addElement( black )
	self.black = black
	
	local desc = LUI.UIText.new()
	desc:setLeftRight( true, false, 47, 244 )
	desc:setTopBottom( true, false, 24.5, 43.5 )
	desc:setText( Engine.Localize( "Available at the Sergeant (level 10)" ) )
	desc:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( desc )
	self.desc = desc
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 47, 242 )
	title:setTopBottom( true, false, 6.5, 24.5 )
	title:setText( Engine.Localize( "BATTERY HELMET" ) )
	title:setTTF( "fonts/escom.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local lockedIcon0 = LUI.UIImage.new()
	lockedIcon0:setLeftRight( false, false, -116, -82.5 )
	lockedIcon0:setTopBottom( false, false, -16, 17.5 )
	lockedIcon0:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	self:addElement( lockedIcon0 )
	self.lockedIcon0 = lockedIcon0
	
	local lockedIcon = LUI.UIImage.new()
	lockedIcon:setLeftRight( false, false, -116, -82.5 )
	lockedIcon:setTopBottom( false, false, -16, 17.5 )
	lockedIcon:setAlpha( 0.47 )
	lockedIcon:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	lockedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 5 )
				black:completeAnimation()
				self.black:setAlpha( 0.55 )
				self.clipFinished( black, {} )
				desc:completeAnimation()
				self.desc:setAlpha( 1 )
				self.clipFinished( desc, {} )
				title:completeAnimation()
				self.title:setAlpha( 1 )
				self.clipFinished( title, {} )
				lockedIcon0:completeAnimation()
				self.lockedIcon0:setAlpha( 1 )
				self.clipFinished( lockedIcon0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.47 )
				self.clipFinished( lockedIcon, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

