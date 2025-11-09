CoD.UnlockRewardWidget = InheritFrom( LUI.UIElement )
CoD.UnlockRewardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.UnlockRewardWidget )
	self.id = "UnlockRewardWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 150 )
	
	local unlockRewardImage = LUI.UIImage.new()
	unlockRewardImage:setLeftRight( true, false, 54.75, 95.25 )
	unlockRewardImage:setTopBottom( true, false, 27.5, 81.5 )
	unlockRewardImage:setImage( RegisterImage( "uie_t7_menu_cac_iconlock" ) )
	unlockRewardImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( unlockRewardImage )
	self.unlockRewardImage = unlockRewardImage
	
	local unlockRewardAmount = LUI.UIText.new()
	unlockRewardAmount:setLeftRight( true, false, 0, 148 )
	unlockRewardAmount:setTopBottom( true, false, 83, 108 )
	unlockRewardAmount:setText( Engine.Localize( "MENU_NEW" ) )
	unlockRewardAmount:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	unlockRewardAmount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	unlockRewardAmount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( unlockRewardAmount )
	self.unlockRewardAmount = unlockRewardAmount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				unlockRewardImage:completeAnimation()
				self.unlockRewardImage:setAlpha( 1 )
				self.clipFinished( unlockRewardImage, {} )
				unlockRewardAmount:completeAnimation()
				self.unlockRewardAmount:setAlpha( 1 )
				self.clipFinished( unlockRewardAmount, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				unlockRewardImage:completeAnimation()
				self.unlockRewardImage:setAlpha( 0 )
				self.clipFinished( unlockRewardImage, {} )
				unlockRewardAmount:completeAnimation()
				self.unlockRewardAmount:setAlpha( 0 )
				self.clipFinished( unlockRewardAmount, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

